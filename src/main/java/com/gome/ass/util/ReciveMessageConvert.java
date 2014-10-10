package com.gome.ass.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class ReciveMessageConvert {
    
    private static Logger log = LoggerFactory.getLogger(ReciveMessageConvert.class);
    private static final String APP_MESSAGE_KEY = "ass";
    
    @SuppressWarnings("unchecked")
	public static Map<String, Object> requestToMap(HttpServletRequest request) throws Exception{
        String parameter = request.getParameter(APP_MESSAGE_KEY);
        String recive = AESAPPUtils.decryptAES(parameter);
        Map<String, Object> map = JsonUtil.jsonStringToMap(recive);
        log.info("recive message:\t"+recive);
        return map;
    }
}
