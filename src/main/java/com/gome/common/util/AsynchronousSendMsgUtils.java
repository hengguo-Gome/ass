package com.gome.common.util;

import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.mina.core.future.ConnectFuture;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.transport.socket.nio.NioSocketConnector;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.CustomizedPropertyPlaceholderConfigurer;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.ShDataRecord;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.jms.MessagePush;
import com.gome.ass.jms.ShMessagePushMQSender;
import com.gome.ass.service.permission.ShDeviceManageService;
import com.gome.ass.service.system.ShDataRecordService;
import com.gome.ass.util.JsonUtil;
import com.gome.ass.util.UUIDUtil;
import com.gome.ass.util.XmlUtil;


public class AsynchronousSendMsgUtils {
	private ExecutorService service = Executors.newFixedThreadPool(10);
	private static CustomizedPropertyPlaceholderConfigurer sysConfig = null;
	private static ShDeviceManageService shDeviceManageService = null;
	private static ShMessagePushMQSender shMessagePushMQSender = null;
	private static AsynchronousSendMsgUtils this$0 = null;
	private AsynchronousSendMsgUtils(){
		shMessagePushMQSender = (ShMessagePushMQSender) SpringUtil.getBean("shMessagePushMQSender");
		shDeviceManageService = (ShDeviceManageService) SpringUtil.getBean("shDeviceManageService");
		sysConfig = (CustomizedPropertyPlaceholderConfigurer)SpringUtil.getBean("systemProperty");
	};
	
	private static AsynchronousSendMsgUtils getInstnce(){
		if(this$0==null){
			this$0 = new AsynchronousSendMsgUtils();
		}
		return this$0;
	}  
	
	static class SendMsgUtil{
		public static String sendHttpMsg(String url,String content){
			try{
				HttpClient client = new HttpClient();
				PostMethod post = new PostMethod(url);
				RequestEntity re = new StringRequestEntity(content,"text/XML","UTF-8");
				post.setRequestEntity(re);
				client.executeMethod(post);
				return post.getResponseBodyAsString();
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
		public  static Object sendWSMsg(Object sib,String methodName,Object[] params){
			try {
				Class[] types =null;
				if(params!=null&params.length>0){
					types = new Class[params.length];
					for(int i=0;i<params.length;i++){
						types[i]=params[i].getClass();
					}
				}
				Method m = sib.getClass().getDeclaredMethod(methodName, types);
				return m.invoke(sib, params);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public  static Object sendWSMsg(final String endpoint,final String operationName,final Object[] params){
			try {
				JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory.newInstance();
				Client client = clientFactory.createClient(endpoint);
				Object[] result = client.invoke(operationName, params); 
				return result;
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		@SuppressWarnings(value="unchecked")
		public  static String sendSocketMsg(String addr,int port,String content,boolean isReturn){
			String returnMsg = null;
			try{
				Socket socket = new Socket(addr,port);
				OutputStream out = socket.getOutputStream();
				IOUtils.write(content.getBytes(), out);
				if(isReturn){
					returnMsg = IOUtils.toString(socket.getInputStream());
				}
				socket.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return returnMsg;
		}
		
		@SuppressWarnings(value="unchecked")
		public  static Object sendSocketChannelMsg(final String addr,final int port,final Object content,final boolean isReturn){
			 NioSocketConnector connector = new NioSocketConnector();
			 connector.getFilterChain().addLast( "logger", new LoggingFilter() ); 
			 connector.getFilterChain().addLast( "codec", new ProtocolCodecFilter( new TextLineCodecFactory( Charset.forName( "UTF-8" )))); //设置编码过滤器 
			 connector.getSessionConfig().setReadBufferSize(2048);
			 connector.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 10);
			 connector.setConnectTimeoutMillis(30000);
			 ConnectFuture cf= connector.connect(new InetSocketAddress(addr,port));
			 cf.awaitUninterruptibly();
			 cf.getSession().write(content);
			 Object returnMsg = null;
			 if(isReturn){
				 returnMsg = cf.getSession().read().getMessage();
		     }
			 cf.getSession().getCloseFuture().awaitUninterruptibly();
			 connector.dispose();
			 return returnMsg;
		}
	}

	private  Future  receiptCrmLegMsg(final Map<String,? extends Object> paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String content = XmlUtil.getInstance().genXmlByTemplate("crm/CRM_SEND.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("receiptCrmLeg");
				return SendMsgUtil.sendHttpMsg(url, content);
			}
		});
	}
	
	
	private  Future  sendMsgToMobile(final CrmInstallBill crmInstallBill){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				List<String> workerIds = new ArrayList<String>();
				String orderWorkerBig = crmInstallBill.getOrderWorkerBig();
				String orderWorkerLitter = crmInstallBill.getOrderWorkerLitter();
				workerIds.add(orderWorkerBig);
				workerIds.add(orderWorkerLitter);
				
				List<ShDeviceManage> deviceManageList = shDeviceManageService.findShDeviceManageList(workerIds);
				if(deviceManageList != null && deviceManageList.size()>0){
					String jlOrderNum = crmInstallBill.getJlOrderNum();
	                String title = "安装单提醒";
	                StringBuffer content = new StringBuffer();
	                
	                content.append("安装单：" + jlOrderNum+",");
	                String perfConent = null;
	                String billStatus = crmInstallBill.getBillStatus();
	                if(billStatus.equals(BusinessGlossary.BILL_STATUS_DISPATCHED)){
	                	perfConent = "已派工";
	                }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_CANCEL)){
	                	perfConent = "已取消";
	                }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
	                	perfConent = "已回执";
	                }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_COMPLETE)){
	                	perfConent = "已完成";
	                }
	                content.append(perfConent);
	                for (ShDeviceManage shDeviceManage : deviceManageList) {
		                if (StringUtils.isNotBlank(shDeviceManage.getBaiduId())) {// 安卓设备
		                	
		                	Map<String,Object> msgMap = new HashMap<String,Object>();
		                    msgMap.put("title", title);
		                    msgMap.put("content", content.toString());
		                    msgMap.put("messageType", 0);
		                	Map<String,Object> sendMap = new HashMap<String,Object>();
		                	sendMap.put("deviceType", "android");
		                	sendMap.put("sendType", "single");
		                	sendMap.put("apiKey", CustomizedPropertyPlaceholderConfigurer.getContextProperty("APIKEY"));
		                	sendMap.put("secretKey",  CustomizedPropertyPlaceholderConfigurer.getContextProperty("SECRETKEY"));
		                	sendMap.put("userId", shDeviceManage.getBaiduId());
		                	sendMap.put("message", JsonUtil.javaObjectToJsonString(msgMap));
		                	sendMap.put("messageType", 0);
		                	shMessagePushMQSender.send(sendMap);
		                } else if(StringUtils.isNotBlank(shDeviceManage.getAccessToken())){// 苹果设备
		                    String message = "<订单提醒(订单)>" + content.toString();
		                    List<String> devicetokens = new ArrayList<String>();
		                    devicetokens.add(shDeviceManage.getAccessToken());
		                    MessagePush.sendMessageToAppleUser(devicetokens, message);
		                }
					}
				}
				return null;
			}
		});
	}
	
	public static  void sendMessageToMobile(final CrmInstallBill crmInstallBill){
		getInstnce().sendMsgToMobile(crmInstallBill);
	}
	
	public static  void receiptCrmLegMessage(Map<String,? extends Object> paramMap){
			getInstnce().receiptCrmLegMsg(paramMap);
	}
	
	private  Future  receiptCrmCompleteLegMsg(final Map paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String MessageId = UUIDUtil.getUUID();
				paramMap.put("MessageId",MessageId);
				String content = XmlUtil.getInstance().genXmlByTemplate("crm/CRM_SEND.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("receiptCrmLeg");
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("CRM");
		        dr.setInterfaceType("CRM271");
				dr.setMessageId(MessageId);
				shDataRecordService.insertShDataRecord(dr);
			    return SendMsgUtil.sendHttpMsg(url, content);
			}
		});
	}
	
	public static  void receiptCrmCompleteLegMessage(Map paramMap){
		try{
			getInstnce().receiptCrmCompleteLegMsg(paramMap);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private  Future  receiptJLCompleteLegMsg(final Map paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String MessageId = UUIDUtil.getUUID();
				paramMap.put("MessageId",MessageId);
				String content = XmlUtil.getInstance().genXmlByTemplate("jl/JL_LEG_RECEIPT.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("receiptCrmLeg");
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("CRM");
		        dr.setInterfaceType("CRM271");
				dr.setMessageId(MessageId);
				shDataRecordService.insertShDataRecord(dr);
			    return SendMsgUtil.sendHttpMsg(url, content);
			}
		});
	}
	
	public static  void receiptJLCompleteLegMessage(Map paramMap){
		try{
			getInstnce().receiptJLCompleteLegMsg(paramMap);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	private  Future  receiptJLConcelLegMsg(final Map paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String MessageId = UUIDUtil.getUUID();
				paramMap.put("MessageId",MessageId);
				String content = XmlUtil.getInstance().genXmlByTemplate("jl/JL_LEG_CONCEL.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("receiptCrmLeg");
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("CRM");
		        dr.setInterfaceType("CRM271");
				dr.setMessageId(MessageId);
				shDataRecordService.insertShDataRecord(dr);
			    return SendMsgUtil.sendHttpMsg(url, content);
			}
		});
	}
	
	public static  void receiptJLConcelLegMessage(Map paramMap){
		try{
			getInstnce().receiptJLConcelLegMsg(paramMap);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private  Future  receiptCrmConcelLegMsg(final Map paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String MessageId = UUIDUtil.getUUID();
				paramMap.put("MessageId",MessageId);
				String content = XmlUtil.getInstance().genXmlByTemplate("crm/CRM_SEND.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("receiptCrmLeg");
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("CRM");
		        dr.setInterfaceType("CRM271");
				dr.setMessageId(MessageId);
				shDataRecordService.insertShDataRecord(dr);
			    return SendMsgUtil.sendHttpMsg(url, content);
			}
		});
	}
	
	public static  void receiptCrmConcelLegMessage(Map paramMap){
		try{
			getInstnce().receiptCrmConcelLegMsg(paramMap);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}