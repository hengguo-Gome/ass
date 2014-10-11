package com.gome.ass.service.jms;





public interface MqMessageService {
	/**
	 * 处理mq的物流订单信息
	 * @param message
	 */
	void processMqLegMessage(String message);
	
}
