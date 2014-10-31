package com.gome.ass.jms;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gome.ass.service.jms.MqMessageService;

public class WlPlanSuquenceListener implements MessageListener {

	private static final Logger logger = LoggerFactory
			.getLogger(WlPlanSuquenceListener.class);

	@Resource
	private MqMessageService mqMessageService;

	@Override
	public void onMessage(Message message) {
		try {
			logger.info("-----------接收到物流订单MQ消息--------------");
			if (message instanceof TextMessage) {
				String receiveMessage = ((TextMessage) message).getText();
				mqMessageService.processMqLegPlanMessage(receiveMessage);
			}
		} catch (JMSException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
