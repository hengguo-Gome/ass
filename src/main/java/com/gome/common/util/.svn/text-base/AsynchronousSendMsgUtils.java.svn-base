package com.gome.common.util;

import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import net.sf.json.JSONObject;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.CustomizedPropertyPlaceholderConfigurer;
import com.gome.ass.dao.logistics.CrmInstallBillDao;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.ShDataRecord;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.jms.InstallBillInfoPushMQSender;
import com.gome.ass.jms.MessagePush;
import com.gome.ass.jms.ShMessagePushMQSender;
import com.gome.ass.service.permission.ShDeviceManageService;
import com.gome.ass.service.system.ShDataRecordService;
import com.gome.ass.util.BeanJsonUtils;
import com.gome.ass.util.UUIDUtil;
import com.gome.ass.util.XmlUtil;


public class AsynchronousSendMsgUtils {
	private static final Logger log = LoggerFactory.getLogger(AsynchronousSendMsgUtils.class);
	private ExecutorService service = Executors.newFixedThreadPool(10);
	private static CustomizedPropertyPlaceholderConfigurer sysConfig = null;
	private static ShDeviceManageService shDeviceManageService = null;
	private static ShMessagePushMQSender shMessagePushMQSender = null;
	private static InstallBillInfoPushMQSender installBillInfoPushMQSender = null;
	private static CrmInstallBillDao crmInstallBillDao = null;
	private static AsynchronousSendMsgUtils this$0 = null;
	private AsynchronousSendMsgUtils(){
		installBillInfoPushMQSender = (InstallBillInfoPushMQSender) SpringUtil.getBean("installBillInfoPushMQSender");
		shMessagePushMQSender = (ShMessagePushMQSender) SpringUtil.getBean("shMessagePushMQSender");
		shDeviceManageService = (ShDeviceManageService) SpringUtil.getBean("shDeviceManageService");
		sysConfig = (CustomizedPropertyPlaceholderConfigurer)SpringUtil.getBean("systemProperty");
		crmInstallBillDao = (CrmInstallBillDao)SpringUtil.getBean("crmInstallBillDao");
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
	
	private  Future  sendMsgToMobile(final String content, final String title, final List<String> workerIds, final String interfaceId){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				List<ShDeviceManage> deviceManageList = shDeviceManageService.findShDeviceManageList(workerIds);
                for (ShDeviceManage shDeviceManage : deviceManageList) {
	                if (StringUtils.isNotBlank(shDeviceManage.getBaiduId())) {// 安卓设备
	                	
	                	Map<String,Object> msgMap = new HashMap<String,Object>();
	                    msgMap.put("title", title);
	                    msgMap.put("content", content);
	                    msgMap.put("messageType", BusinessGlossary.MOBILE_MESSAGE_TYPE_ORDER);
	                	shMessagePushMQSender.send(shDeviceManage.getBaiduId(), msgMap);
	                } else if(StringUtils.isNotBlank(shDeviceManage.getAccessToken())){// 苹果设备
	                    String message = "<安装单提醒>:" + content;
	                    List<String> devicetokens = new ArrayList<String>();
	                    devicetokens.add(shDeviceManage.getAccessToken());
	                    MessagePush.sendMessageToAppleUser(devicetokens, message);
	                }
				}
                return null;
			}
		});
	}
	
	private  void  sendMsgToMobile(final String jlOrderNum, final String interfaceId){
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jlOrderNum", jlOrderNum);
		CrmInstallBill crmInstallBill = crmInstallBillDao.selectByPrimaryKey(map);
				List<String> workerIds = new ArrayList<String>();
				String orderWorkerBig = crmInstallBill.getOrderWorkerBig();
				String orderWorkerLitter = crmInstallBill.getOrderWorkerLitter();
				workerIds.add(orderWorkerBig);
				workerIds.add(orderWorkerLitter);
		            String title = "安装单提醒";
		            StringBuffer content = new StringBuffer();
		            
		            content.append("安装单：" + jlOrderNum+",");
		            String perfConent = null;
		            String billStatus = crmInstallBill.getBillStatus();
		            if(interfaceId != null && interfaceId.equals("CRM197")){
		            	perfConent = "信息修改";
		            }else{
		            	if(billStatus.equals(BusinessGlossary.BILL_STATUS_DISPATCHED)){
		            		perfConent = "已派工";
		            	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_REPEAT_DISPATCHED)){
		            		perfConent = "重新派工";
		            	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_CANCEL)){
		            		perfConent = "已取消";
		            	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
		            		perfConent = "已回执";
		            	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_COMPLETE)){
		            		perfConent = "已完成";
		            	}
		            }
		        content.append(perfConent);
				sendMsgToMobile(content.toString(), title, workerIds, interfaceId);
	}
	
	private  Future  sendMsgToMobile(final String content, final String title, final String workerId, final String interfaceId){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				List<ShDeviceManage> deviceManageList = shDeviceManageService.findShDeviceManageList(Arrays.asList(workerId));
                for (ShDeviceManage shDeviceManage : deviceManageList) {
                	Map<String,Object> msgMap = new HashMap<String,Object>();
	                if (StringUtils.isNotBlank(shDeviceManage.getBaiduId())) {// 安卓设备
	                	msgMap.put("title", title);
	                	msgMap.put("content", content);
	                	msgMap.put("messageType", BusinessGlossary.MOBILE_MESSAGE_TYPE_SYSTEM);	                	
	                	shMessagePushMQSender.send(shDeviceManage.getBaiduId(), msgMap);
	                } else if(StringUtils.isNotBlank(shDeviceManage.getAccessToken())){// 苹果设备
	                	String message = "<订单消息>:" + content;
	                    List<String> devicetokens = new ArrayList<String>();
	                    devicetokens.add(shDeviceManage.getAccessToken());
	                    MessagePush.sendMessageToAppleUser(devicetokens, message);
	                }
				}
                return null;
			}
		});
	}
	
	public static  void sendMessageToMobile(final String jlOrderNum,final String interfaceId){
		getInstnce().sendMsgToMobile(jlOrderNum, interfaceId);
	}
	
	/**
	 * 推送多个消息给设备
	 * @param content 消息内容
	 * @param title	消息标题
	 * @param workerIds 工人Code(s)
	 * @param interfaceId
	 */
	public static void sendMessageToMobile(String content, String title, List<String> workerIds, final String interfaceId) {
		getInstnce().sendMsgToMobile(content, title, workerIds, interfaceId);
	}
	
	/**
	 * 推送单个消息给设备
	 * @param content 消息内容
	 * @param title	消息标题
	 * @param workerId 工人Code
	 * @param interfaceId
	 */
	public static void sendMessageToMobile(String content, String title, String workerId, final String interfaceId) {
		getInstnce().sendMsgToMobile(content, title, workerId, interfaceId);
	}
	
	public static  void receiptCrmLegMessage(Map<String,? extends Object> paramMap){
			getInstnce().receiptCrmLegMsg(paramMap);
	}
	public static void sendInstallBillToMq(final String jlOrderNum,final String from) {
		
		getInstnce().sendInstallBillToMQ(jlOrderNum,from);
	}
	public  void sendInstallBillToMQ(final String jlOrderNum,final String from) {

		JSONObject sendLegJsonObject = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jlOrderNum", jlOrderNum);
		CrmInstallBill crmInstallBill = crmInstallBillDao.selectByPrimaryKey(map);
		CrmInstallBill sendInstallBill = new CrmInstallBill();
		sendInstallBill.setJlOrderNum(crmInstallBill.getJlOrderNum());
		sendInstallBill.setSalesOrgCode(crmInstallBill.getSalesOrgCode());
		sendInstallBill.setPoNumberSold(crmInstallBill.getPoNumberSold());
		sendInstallBill.setBillStatus(crmInstallBill.getBillStatus());
		sendInstallBill.setOrderWorkerBig(crmInstallBill.getOrderWorkerBig());
		sendInstallBill.setOrderWorkerLitter(crmInstallBill.getOrderWorkerLitter());
		String bz = null;
		String billStatus = crmInstallBill.getBillStatus();
    	 if(from.equals(BusinessGlossary.SYSTEM_NAME_CRM) || from.equals(BusinessGlossary.SYSTEM_NAME_JL) ){
    		 
    		 if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
    			 sendInstallBill.setReceiptDate(crmInstallBill.getReceiptDate());
    			 bz = "由"+from+"确认回执";
    		 }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_DISPATCHED)){
    			 bz = "由"+from+"派工";
    			 sendInstallBill = crmInstallBill;
    		 }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_CANCEL)){
    			 bz = "由"+from+"取消安装单";
    		 }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_COMPLETE)){
    			 bz = "由"+from+"确认完工";
    		 }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
    			 bz = "由"+from+"确认回执";
    		 }else if(billStatus.equals(BusinessGlossary.BILL_STATUS_REPEAT_DISPATCHED)){
    			 bz = "由"+from+"重新派工";
    			 sendInstallBill = crmInstallBill;
    		 }
    		
    	 }else{
    		 if(billStatus.equals(BusinessGlossary.BILL_STATUS_DISPATCHED) || billStatus.equals(BusinessGlossary.BILL_STATUS_REPEAT_DISPATCHED)){
    	    		Date planarriveSTime = crmInstallBill.getAppointStartDate();
    	    		Date planarriveETime = crmInstallBill.getAppointEndDate();
    	    		sendInstallBill.setAppointStartDate(planarriveSTime);
    	    		sendInstallBill.setAppointEndDate(planarriveETime);
    	    		SimpleDateFormat sdfS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	    		SimpleDateFormat sdfE = new SimpleDateFormat("HH:mm:ss");
    	    		bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+", 进行延期操作,延期至："+sdfS.format(planarriveSTime)+"-"+sdfE.format(planarriveETime);
    	    	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_CANCEL)){
    	    		bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+"取消安装单";
    	    	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_COMPLETE)){
    	    		sendInstallBill.setReceiptDate(crmInstallBill.getReceiptDate());
    	    		 bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+" 进行确认完工";
    	    	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
    	    		sendInstallBill.setReceiptDate(crmInstallBill.getReceiptDate());
   	    		    bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+" 进行确认回执";
       		    }
    	 }
    	
    	try {
    		sendLegJsonObject = BeanJsonUtils.convertBeanToJsonString(sendInstallBill);
    		sendLegJsonObject.put("bz", bz);
    		sendLegJsonObject.put("from", from);
			installBillInfoPushMQSender.send(sendLegJsonObject.toString());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		} 
		
	
	
	}
	
	private  Future  receiptCrmCompleteLegMsg(final Map paramMap){
		return service.submit(new Callable<String>() {
			@Override
			public String call() throws Exception {
				String MessageId = UUIDUtil.getUUID();
				paramMap.put("MessageID",MessageId);
				paramMap.put("Dtsend",new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
				String content = XmlUtil.getInstance().genXmlByTemplate("crm/CRM_LEG_RECEIPT.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("sendMessageToPI");
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
				dr.setDateSend(new Date());
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
				paramMap.put("MessageID",MessageId);
				paramMap.put("Dtsend",new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
				String content = XmlUtil.getInstance().genXmlByTemplate("jl/JL_LEG_RECEIPT.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("sendMessageToPI");
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("DIS");
		        dr.setInterfaceType("CRM274");
				dr.setMessageId(MessageId);
				dr.setDateSend(new Date());
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
				paramMap.put("MessageID",MessageId);
				paramMap.put("Dtsend",new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
				String content = XmlUtil.getInstance().genXmlByTemplate("jl/JL_LEG_RECEIPT.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("sendMessageToPI");
				
				ShDataRecordService shDataRecordService = (ShDataRecordService)SpringUtil.getBean("shDataRecordService");
		        ShDataRecord dr = new ShDataRecord();
		        dr.setCreateTime(new Date());
		        dr.setId(MessageId);
		        dr.setXmlContent(content);
		        dr.setDirection(BusinessGlossary.DATA_INTERACTION_OUT);
		        dr.setSender("ASS");
		        dr.setReceiver("DIS");
		        dr.setInterfaceType("CRM274");
				dr.setMessageId(MessageId);
				dr.setDateSend(new Date());
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
				paramMap.put("MessageID",MessageId);
				paramMap.put("Dtsend",new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
				String content = XmlUtil.getInstance().genXmlByTemplate("crm/CRM_LEG_RECEIPT.xml", paramMap);
				String url = (String)sysConfig.getContextProperty("sendMessageToPI");
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
				dr.setDateSend(new Date());
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
