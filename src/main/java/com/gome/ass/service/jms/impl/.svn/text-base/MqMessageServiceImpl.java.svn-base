package com.gome.ass.service.jms.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.CustomizedPropertyPlaceholderConfigurer;
import com.gome.ass.dao.logistics.CrmInstallBillDao;
import com.gome.ass.dao.permission.ShDeviceManageDao;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.jms.InstallBillInfoPushMQSender;
import com.gome.ass.jms.MessagePush;
import com.gome.ass.jms.ShMessagePushMQSender;
import com.gome.ass.service.jms.MqMessageService;
import com.gome.ass.util.BeanJsonUtils;
import com.gome.ass.util.JsonUtil;

@Service("mqMessageService")
public class MqMessageServiceImpl implements MqMessageService {
	
	private static final Logger log = LoggerFactory.getLogger(MqMessageServiceImpl.class);
	
	@Resource
	private CrmInstallBillDao crmInstallBillDao;
	@Resource
	private ShDeviceManageDao shDeviceManageDao;
	@Resource
	private ShMessagePushMQSender shMessagePushMQSender;
	@Resource
	private InstallBillInfoPushMQSender installBillInfoPushMQSender;
	
	@Override
	public void sendInstallBillToMq(CrmInstallBill crmInstallBill,String from) {

		JSONObject sendLegJsonObject = null;
		CrmInstallBill sendInstallBill = new CrmInstallBill();
		sendInstallBill.setJlOrderNum(crmInstallBill.getJlOrderNum());
		sendInstallBill.setSalesOrgCode(crmInstallBill.getSalesOrgCode());
		sendInstallBill.setPoNumberSold(crmInstallBill.getPoNumberSold());
		sendInstallBill.setBillStatus(crmInstallBill.getBillStatus());
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
    		 }else{
    			 return;
    		 }
    		
    	 }else{
    		 if(billStatus.equals(BusinessGlossary.BILL_STATUS_DELAY)){
    			 
    	    		Date planarriveSTime = crmInstallBill.getAppointStartDate();
    	    		Date planarriveETime = crmInstallBill.getAppointEndDate();
    	    		sendInstallBill.setAppointStartDate(planarriveSTime);
    	    		sendInstallBill.setAppointEndDate(planarriveETime);
    	    		SimpleDateFormat sdfS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	    		SimpleDateFormat sdfE = new SimpleDateFormat("HH:mm:ss");
    	    		bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+", 进行延期操作,延期至："+sdfS.format(planarriveSTime)+"-"+sdfE.format(planarriveETime);
    	    	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_CANCEL)){
    	    		bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+"取消安装单";
    	    	}else if(billStatus.equals(BusinessGlossary.BILL_STATUS_SIGNED)){
    	    		sendInstallBill.setReceiptDate(crmInstallBill.getReceiptDate());
    	    		 bz = "安装工:"+crmInstallBill.getOrderWorkerBig()+" 进行确认回执";
    	    	}else{
    	    		return;
    	    	}
    	 }
    	
    	try {
    		sendLegJsonObject = BeanJsonUtils.convertBeanToJsonString(sendInstallBill);
    		sendLegJsonObject.put("bz", bz);
    		sendLegJsonObject.put("from", from);
			if(!StringUtils.isBlank(sendInstallBill.getPoNumberSold()) && !StringUtils.isBlank(sendInstallBill.getSalesOrgCode())){
				installBillInfoPushMQSender.send(sendLegJsonObject.toString());
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		} 
		
	
	}
	
	
	@Override
	public void processMqLegMessage(String jsonString) {
		Map<String, String> map = JsonUtil.convertJsonToMap(jsonString,
				"legInfo");
		String status = map.get("ydzt");
		String thd = map.get("thd");
		String gsdm = map.get("gsdm");

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("poNumberSold", thd);
		paramMap.put("salesOrgCode", gsdm);
		CrmInstallBill installBill = crmInstallBillDao
				.selectByPrimaryKey(paramMap);
		if (null != installBill) {
			List<String> workerIds = new ArrayList<String>();
			workerIds.add(installBill.getOrderWorkerBig());
			workerIds.add(installBill.getOrderWorkerLitter());
			List<ShDeviceManage> shDeviceManageList = shDeviceManageDao
					.findShDeviceManageList(workerIds);
			if (shDeviceManageList != null && shDeviceManageList.size() > 0) {
				String jlOrderNum = installBill.getJlOrderNum();
				String title = "安装单物流状态提醒";
				StringBuffer content = new StringBuffer();

				content.append("安装单：" + jlOrderNum + ",");
				String perfConent = null;
				if (status.equals(BusinessGlossary.LEG_TYPE_SIGNED)) {
					perfConent = "物流已回执";
				} else if (status.equals(BusinessGlossary.LEG_TYPE_DISPATCHED)) {
					perfConent = "物流已派工";
				} else if (status.equals(BusinessGlossary.LEG_TYPE_WAITPLAN)) {
					perfConent = "物流已取消";
				} else if (status.equals(BusinessGlossary.LEG_TYPE_DAMAGED)) {
					perfConent = "物流开箱残";
				}else if (status.equals(BusinessGlossary.LEG_TYPE_DELAY)) {
					perfConent = "物流已延期";
				} 
				content.append(perfConent);
				try {
					for (ShDeviceManage shDeviceManage : shDeviceManageList) {
						if (StringUtils.isNotBlank(shDeviceManage.getBaiduId())) {// 安卓设备
							
							Map<String, Object> msgMap = new HashMap<String, Object>();
							msgMap.put("title", title);
							msgMap.put("content", content.toString());
							msgMap.put("messageType", 0);
							Map<String, Object> sendMap = new HashMap<String, Object>();
							sendMap.put("deviceType", "android");
							sendMap.put("sendType", "single");
							sendMap.put("apiKey",
									CustomizedPropertyPlaceholderConfigurer
									.getContextProperty("APIKEY"));
							sendMap.put("secretKey",
									CustomizedPropertyPlaceholderConfigurer
									.getContextProperty("SECRETKEY"));
							sendMap.put("userId", shDeviceManage.getBaiduId());
							sendMap.put("message",
									JsonUtil.javaObjectToJsonString(msgMap));
							sendMap.put("messageType", 0);
							shMessagePushMQSender.send(sendMap);
						} else if (StringUtils.isNotBlank(shDeviceManage
								.getAccessToken())) {// 苹果设备
							String message = "<订单提醒(订单)>" + content.toString();
							List<String> devicetokens = new ArrayList<String>();
							devicetokens.add(shDeviceManage.getAccessToken());
							MessagePush.sendMessageToAppleUser(devicetokens,
									message);
						}
					}
					
				} catch (Exception e) {
					log.error(e.getMessage(),e);
				}
			}
		}

	}



}
