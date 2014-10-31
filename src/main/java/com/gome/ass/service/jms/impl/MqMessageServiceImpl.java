package com.gome.ass.service.jms.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.dao.logistics.CrmInstallBillDao;
import com.gome.ass.dao.permission.ShDeviceManageDao;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.jms.MessagePush;
import com.gome.ass.jms.ShMessagePushMQSender;
import com.gome.ass.service.jms.MqMessageService;
import com.gome.ass.util.JsonUtil;

@Service("mqMessageService")
public class MqMessageServiceImpl implements MqMessageService {

	private static final Logger log = LoggerFactory
			.getLogger(MqMessageServiceImpl.class);

	@Resource
	private CrmInstallBillDao crmInstallBillDao;
	@Resource
	private ShDeviceManageDao shDeviceManageDao;
	@Resource
	private ShMessagePushMQSender shMessagePushMQSender;

	@Override
	public void processMqLegMessage(String jsonString) {
		Map<String, String> map = JsonUtil.convertJsonToMap(jsonString,
				"legInfo");
		String status = map.get("ydzt");
		String thd = map.get("thd");
		String gsdm = map.get("gsdm");
		String needinstall = map.get("needinstall");
		if ("1".equals(needinstall) && StringUtils.isNotBlank(thd) && StringUtils.isNotBlank(gsdm)) {

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
					} else if (status
							.equals(BusinessGlossary.LEG_TYPE_DISPATCHED)) {
						perfConent = "物流已派工";
					} else if (status
							.equals(BusinessGlossary.LEG_TYPE_WAITPLAN)) {
						perfConent = "物流已取消";
					} else if (status.equals(BusinessGlossary.LEG_TYPE_DAMAGED)) {
						perfConent = "物流开箱残";
					} else if (status.equals(BusinessGlossary.LEG_TYPE_DELAY)) {
						perfConent = "物流已延期";
					}
					content.append(perfConent);
					try {
						for (ShDeviceManage shDeviceManage : shDeviceManageList) {
							if (StringUtils.isNotBlank(shDeviceManage
									.getBaiduId())) {// 安卓设备

								Map<String, Object> msgMap = new HashMap<String, Object>();
								msgMap.put("title", title);
								msgMap.put("content", content.toString());
								msgMap.put("messageType", 0);
								shMessagePushMQSender.send(
										shDeviceManage.getBaiduId(), msgMap);
							} else if (StringUtils.isNotBlank(shDeviceManage
									.getAccessToken())) {// 苹果设备
								String message = "<安装单提醒>:"
										+ content.toString();
								List<String> devicetokens = new ArrayList<String>();
								devicetokens.add(shDeviceManage
										.getAccessToken());
								MessagePush.sendMessageToAppleUser(
										devicetokens, message);
							}
						}

					} catch (Exception e) {
						log.error(e.getMessage(), e);
					}
				}
			}
		}

	}

	@Override
	public void processMqLegPlanMessage(String message) {
		try {
			String[] split = message.split(",");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

}
