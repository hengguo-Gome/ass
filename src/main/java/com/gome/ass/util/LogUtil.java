package com.gome.ass.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Zhang.Mingji
 * @date 2014年6月5日下午7:37:23
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class LogUtil {

	private static final String LOG_SYSTEM_APP_NAME = "ass";
	/**
	 * 返回日志json字符串
	 * @param log 已经拼接好的字符串
	 * @return
	 * @throws Exception
	 */
	public static String getLogJsonString(String log) throws Exception{
		Map map = new HashMap();
		map.put("clientID", LOG_SYSTEM_APP_NAME);
		map.put("fileName", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		map.put("message", log);
		String jsonStr = JsonUtil.javaObjectToJsonString(map);
		return jsonStr;
	}
	
	/**
	 * 构造发送给日志队列的json字符串
	 * @param currentDate 服务器端的当前时间
	 * @param className 服务器端的当前类
	 * @param interfaceID 接口ID
	 * @param moduleID 模块ID
	 * @param fromMobileDate 手机端调用传来的时间
	 * @param SN 手机SN号
	 * @param result 请求处理结果
	 * @param btnId 手机端按钮号
	 * @param mobileNo 手机号
	 * @return
	 * @throws Exception
	 */
	public static String getLogJsonString(Date currentDate, String className, 
			String interfaceID, String moduleID, Date fromMobileDate, String SN, String result, String btnId, String mobileNo) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String log = sdf.format(currentDate) + " " + className + " interfaceID:" + interfaceID + ",moduleID：" + moduleID + ",time：" + sdf.format(fromMobileDate) + ",SN：" + SN 
				+ ",result:" + result + ",buttonID:" + btnId + ",mobileNo:" + mobileNo;
		return getLogJsonString(log);
	}
	
	   public static String getLogJsonString(Map<String, Object> pmap,String className,String result) throws Exception {
           String interfaceID = (String) pmap.get("jkId");
           String moduleID = (String) pmap.get("mkId");
           String sjId = (String) pmap.get("sjId");
           String SN = (String) pmap.get("snId");
           String btnId = (String) pmap.get("btnId");
           String mobileNo = (String) pmap.get("driverPhone");
           
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           Date currentDate = new Date(Long.parseLong(sjId));
	       
	        String log = sdf.format(new Date()) + " " + className + " interfaceID:" + interfaceID + ",moduleID：" + moduleID + ",time：" + sdf.format(currentDate) + ",SN：" + SN 
	                + ",result:" + result + ",buttonID:" + btnId + ",mobileNo:" + mobileNo;
	        return getLogJsonString(log);
	    }
}
