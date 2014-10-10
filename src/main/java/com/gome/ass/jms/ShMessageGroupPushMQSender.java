package com.gome.ass.jms;

import java.util.HashMap;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

/**
 * 物流经理群发消息或者管理员群发消息
 * @author Zhang.Mingji
 * @date 2014年6月24日上午11:29:52
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class ShMessageGroupPushMQSender {

	private static final Logger logger = LoggerFactory.getLogger(ShMessageGroupPushMQSender.class);
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
	 * @param map
	 */
	public void send(final HashMap<String,Object> map){
		this.jmsTemplate.send(queue, new MessageCreator() {
			
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createObjectMessage(map);
			}
		});
		logger.info("----------发送群发消息到MQ成功-----------");
	}
	
}
