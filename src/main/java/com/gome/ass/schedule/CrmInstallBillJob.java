package com.gome.ass.schedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.gome.ass.jms.MessagePush;
import com.gome.ass.jms.ShMessagePushMQSender;
import com.gome.ass.service.logistics.CrmInstallBillService;

@Component
public class CrmInstallBillJob {
	
	private static final Logger log = LoggerFactory.getLogger(CrmInstallBillJob.class);
	@Resource
	private CrmInstallBillService crmInstallBillService;
	@Resource
	private ShMessagePushMQSender shMessagePushMQSender;
	
	public void sendMessageToDelayWoker(){
		
		Calendar cal = Calendar. getInstance ();
        cal.add(Calendar. HOUR ,  -1 ) ; //把时间设置为当前时间-1小时，同理，也可以设置其他时间
        Map<String, Object> queryMap = new HashMap<String, Object>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
        queryMap.put("qyeryTime", sdf.format(cal.getTime()));
        List<Map<String, Object>> installs = crmInstallBillService.queryDelayInstalls(queryMap);
        for (Map<String, Object> map : installs) {
			String azdh = (String) map.get("azdh");
			String baiduId = (String) map.get("baiduId");
			String accessToken = (String) map.get("accessToken");
			
            String title = "安装单超时提醒";
            String content = "安装单：" + azdh+",已超时";
            try {
            	if (StringUtils.isNotBlank(baiduId)) {// 安卓设备
            		Map<String,Object> msgMap = new HashMap<String,Object>();
            		msgMap.put("title", title);
            		msgMap.put("content", content);
            		msgMap.put("messageType", 0);
            		shMessagePushMQSender.send(baiduId, msgMap);
            	} else if(StringUtils.isNotBlank(accessToken)){// 苹果设备
            		String message = "<安单提醒>:" + content;
            		List<String> devicetokens = new ArrayList<String>();
            		devicetokens.add(accessToken);
            		MessagePush.sendMessageToAppleUser(devicetokens, message);
            	}
			} catch (Exception e) {
				log.error(e.getMessage(),e);
			}
			
		}

	}

}
