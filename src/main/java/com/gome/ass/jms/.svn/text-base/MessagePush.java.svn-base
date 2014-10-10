package com.gome.ass.jms;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javapns.devices.Device;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.AppleNotificationServerBasicImpl;
import javapns.notification.PushNotificationManager;
import javapns.notification.PushNotificationPayload;

import org.junit.Assert;
import org.springframework.core.io.ClassPathResource;

import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushBroadcastMessageRequest;
import com.baidu.yun.channel.model.PushBroadcastMessageResponse;
import com.baidu.yun.channel.model.PushTagMessageRequest;
import com.baidu.yun.channel.model.PushTagMessageResponse;
import com.baidu.yun.channel.model.PushUnicastMessageRequest;
import com.baidu.yun.channel.model.PushUnicastMessageResponse;
import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.CustomizedPropertyPlaceholderConfigurer;
import com.gome.ass.util.AESAPPUtils;

/**
 * 消息推送
 * @author Zhang.Mingji
 * @date 2014年5月29日上午9:56:39
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class MessagePush {

	/**
	 * 发送消息给苹果用户
	 * @param devicetokens 设备token值
	 * @param message 系统json字符串
	 * @throws BaseException
	 */
	public static void sendMessageToAppleUser(List<String> devicetokens, String message) throws Exception{
		try {
			String certificatePath = (String) CustomizedPropertyPlaceholderConfigurer.getContextProperty("certificatePath");
			String certificatePassword = (String) CustomizedPropertyPlaceholderConfigurer.getContextProperty("certificatePassword");
			
//			InputStream in = ClassLoader.getSystemResourceAsStream("authentication/" + certificatePath);
			InputStream in = new ClassPathResource("authentication/" + certificatePath).getInputStream();
			
			PushNotificationPayload  payLoad = new PushNotificationPayload();
			payLoad.addAlert(message);
			payLoad.addBadge(BusinessGlossary.APPLE_NOTIFICATION_BADGE);
			payLoad.addSound(BusinessGlossary.APPLE_NOTIFICATION_SOUND);
			
			PushNotificationManager pushManager = new PushNotificationManager();
			pushManager.initializeConnection(new AppleNotificationServerBasicImpl(in, certificatePassword, true));
			
			//发给多个设备
			List<Device> devices = new ArrayList<Device>();
			for(int i=0;i<devicetokens.size();i++){
				String devicetoken = devicetokens.get(i);
				devicetoken = devicetoken.replace(" ", "");
				BasicDevice device = new BasicDevice();
				device.setToken(devicetoken);
				devices.add(device);
			}
			pushManager.sendNotifications(payLoad, devices);
			
			pushManager.stopConnection();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
}
