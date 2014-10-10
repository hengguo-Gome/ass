package com.gome.ass.service.jms;

import com.gome.ass.entity.CrmInstallBill;




public interface MqMessageService {
	/**
	 * 处理mq的物流订单信息
	 * @param message
	 */
	void processMqLegMessage(String message);
	
	void sendInstallBillToMq(CrmInstallBill crmInstallBill,String from);
}
