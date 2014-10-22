package com.gome.ass.jms;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javapns.devices.Device;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.AppleNotificationServerBasicImpl;
import javapns.notification.PushNotificationManager;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotifications;

import org.junit.Assert;
import org.springframework.core.io.ClassPathResource;

import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushBroadcastMessageRequest;
import com.baidu.yun.channel.model.PushBroadcastMessageResponse;
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
	 * @throws Exception
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
			pushManager.initializeConnection(new AppleNotificationServerBasicImpl(in, certificatePassword, false));
			
			//发给多个设备
			List<Device> devices = new ArrayList<Device>();
			for(int i=0;i<devicetokens.size();i++){
				String devicetoken = devicetokens.get(i);
				devicetoken = devicetoken.replace(" ", "");
				BasicDevice device = new BasicDevice();
				device.setToken(devicetoken);
				devices.add(device);
			}
			PushedNotifications sendNotifications = pushManager.sendNotifications(payLoad, devices);
			System.out.println(sendNotifications);
			pushManager.stopConnection();
		} catch (Exception e) {
			throw new Exception(e);
		}
	}
	
	/**
	 * 发送消息给某个安卓用户
	 * @param ucInfo
	 * @param message
	 * @throws Exception
	 
	public static void sendMessageToAndroidUser(ChanelUserIdVO ucInfo, String message)
			throws Exception {
		message = AESAPPUtils.encryptAES(message);
		// 1. 设置developer平台的ApiKey/SecretKey
		String apiKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("APIKEY");
        String secretKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("SECRETKEY");
		ChannelKeyPair pair = new ChannelKeyPair(apiKey, secretKey);

		// 2. 创建BaiduChannelClient对象实例
		BaiduChannelClient channelClient = new BaiduChannelClient(pair);

		// 3. 若要了解交互细节，请注册YunLogHandler类
		channelClient.setChannelLogHandler(new YunLogHandler() {
			@Override
			public void onHandle(YunLogEvent event) {
				System.out.println(event.getMessage());
			}
		});

		try {

			// 4. 创建请求类对象
			PushUnicastMessageRequest request = new PushUnicastMessageRequest();
			request.setDeviceType(3);
			request.setChannelId(ucInfo.getChanelId());
			request.setUserId(ucInfo.getUserId());

			request.setMessageType(1);
			request.setMessage(message);

			// 5. 调用pushMessage接口
			PushUnicastMessageResponse response = channelClient
					.pushUnicastMessage(request);

			Assert.assertEquals(1, response.getSuccessAmount());

		} catch (ChannelClientException e) {
			// 处理客户端错误异常
			e.printStackTrace();
		} catch (ChannelServerException e) {
			// 处理服务端错误异常
			System.out.println(String.format(
					"request_id: %d, error_code: %d, error_message: %s",
					e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
		}

	}
	*/
	/**
	 * 发送消息给某个安卓用户
	 * @param ucInfo
	 * @param message
	 * @throws Exception
	 */
	public static void sendMessageToAndroidUser(String userId, String message, int messageType)
			throws Exception {
		message = AESAPPUtils.encryptAES(message);
		
		// 1. 设置developer平台的ApiKey/SecretKey
		String apiKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("APIKEY");
		String secretKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("SECRETKEY");
		ChannelKeyPair pair = new ChannelKeyPair(apiKey, secretKey);
		
		// 2. 创建BaiduChannelClient对象实例 
		BaiduChannelClient channelClient = new BaiduChannelClient(pair);
		
		// 3. 若要了解交互细节，请注册YunLogHandler类
		channelClient.setChannelLogHandler(new YunLogHandler() {
			@Override
			public void onHandle(YunLogEvent event) {
				System.out.println(event.getMessage());
			}
		});
		
		try {
			
			// 4. 创建请求类对象
			PushUnicastMessageRequest request = new PushUnicastMessageRequest();
			request.setDeviceType(3);
			request.setUserId(userId);
			
			request.setMessageType(messageType);
			request.setMessage(message);
			
			// 5. 调用pushMessage接口
			PushUnicastMessageResponse response = channelClient
					.pushUnicastMessage(request);
			
			Assert.assertEquals(1, response.getSuccessAmount());
			
		} catch (ChannelClientException e) {
			// 处理客户端错误异常
			e.printStackTrace();
		} catch (ChannelServerException e) {
			// 处理服务端错误异常
			System.out.println(String.format(
					"request_id: %d, error_code: %d, error_message: %s",
					e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
		}
		
	}
	
	
	
	/**
	 * 发送广播消息给安卓用户
	 * @param message
	 */
	public static void sendAndroidBroadcastMessage(String message){
		message = AESAPPUtils.encryptAES(message);
		// 1. 设置developer平台的ApiKey/SecretKey
        String apiKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("APIKEY");
        String secretKey = (String)CustomizedPropertyPlaceholderConfigurer.getContextProperty("SECRETKEY");
        ChannelKeyPair pair = new ChannelKeyPair(apiKey, secretKey);

        // 2. 创建BaiduChannelClient对象实例
        BaiduChannelClient channelClient = new BaiduChannelClient(pair);

        // 3. 若要了解交互细节，请注册YunLogHandler类
        channelClient.setChannelLogHandler(new YunLogHandler() {
            @Override
            public void onHandle(YunLogEvent event) {
                System.out.println(event.getMessage());
            }
        });

        try {

            // 4. 创建请求类对象
            PushBroadcastMessageRequest request = new PushBroadcastMessageRequest();
            request.setDeviceType(Integer.valueOf(BusinessGlossary.BAIDU_NOTIFICATION_DEVICE_TYPE_ANDROID)); 
            // device_type => 1: web 2: pc 3:android
                                      // 4:ios 5:wp

            request.setMessage(message);

            // 5. 调用pushMessage接口
            PushBroadcastMessageResponse response = channelClient
                    .pushBroadcastMessage(request);

            // 6. 认证推送成功
            System.out.println("push amount : " + response.getSuccessAmount());

        } catch (ChannelClientException e) {
            // 处理客户端错误异常
            e.printStackTrace();
        } catch (ChannelServerException e) {
            // 处理服务端错误异常
            System.out.println(String.format(
                    "request_id: %d, error_code: %d, error_message: %s",
                    e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
        }

	}
	
	
}
