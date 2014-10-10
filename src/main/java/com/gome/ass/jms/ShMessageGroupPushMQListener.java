package com.gome.ass.jms;

import java.util.List;
import java.util.Map;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gome.ass.common.BusinessGlossary;


/**
 * @author Zhang.Mingji
 * @date 2014年6月24日上午11:33:38
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class ShMessageGroupPushMQListener implements MessageListener{

	private static final Logger logger = LoggerFactory.getLogger(ShMessageGroupPushMQListener.class);
	
	@Override
	public void onMessage(Message message) {
		logger.info("-----------接收到MQ群发消息成功--------------");
		try {
			if(message instanceof ObjectMessage){
				ObjectMessage receiveMessage = (ObjectMessage) message;
				Map<String,Object> map = (Map<String, Object>) receiveMessage.getObject();
				String deviceType = (String) map.get("deviceType");
				if(BusinessGlossary.DEVICE_TYPE_ANDROID.equals(deviceType)){
					String userId = (String) map.get("userId");
					String msg = (String) map.get("message");
					Integer messageType = (Integer) map.get("messageType");
					MessagePush.sendMessageToAndroidUser(userId, msg, messageType);
				}else if(BusinessGlossary.DEVICE_TYPE_IOS.equals(deviceType)){
					List<String> iosDevicetokenList = (List<String>) map.get("iosDevicetokenList");
					String msg = (String) map.get("message");
					MessagePush.sendMessageToAppleUser(iosDevicetokenList, msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
