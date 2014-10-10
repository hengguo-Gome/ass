package com.gome.ass.jms;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class InstallBillInfoPushMQSender {

	private static final Logger logger = LoggerFactory.getLogger(InstallBillInfoPushMQSender.class);
	private JmsTemplate jmsTemplate;
	private Queue queue;
	
	
	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public Queue getQueue() {
		return queue;
	}

	public void setQueue(Queue queue) {
		this.queue = queue;
	}


	/**
	 * 发送消息
	 * @param message
	 */
	public void send(final String crmInstallBillJsonString){
		this.jmsTemplate.send(queue, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				logger.info("安装单信息发送MQ成功");
				return session.createTextMessage(crmInstallBillJsonString);
			}
		});
	}
}
