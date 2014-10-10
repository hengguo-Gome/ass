package com.gome.ass.common;
/**
 * 业务字典常量
 * @author Zhang.Mingji
 * @date 2014年8月8日上午10:28:33
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public interface BusinessGlossary {
public static final String MQ_MESSAGE_TYPE_HUIZHI = "NOTE_REPLY";
	
	public static final String MQ_MESSAGE_STATUS_READY = "READY";
	
	public static final String MQ_MESSAGE_STATUS_SUCCESS = "SUCCESS";
	
	public static final String MQ_MESSAGE_STATUS_FAIL = "FAIL";
	
	/**
	 * 苹果消息推送默认声音
	 */
	public static final String APPLE_NOTIFICATION_SOUND = "default";
	/**
	 * 苹果消息推送默认标识
	 */
	public static final Integer APPLE_NOTIFICATION_BADGE = 1;
	
	//百度推送设备类型
	/**
	 * web
	 */
	public static final Integer BAIDU_NOTIFICATION_DEVICE_TYPE_WEB = 1;
	/**
	 * pc
	 */
	public static final Integer BAIDU_NOTIFICATION_DEVICE_TYPE_PC = 2;
	/**
	 * android
	 */
	public static final Integer BAIDU_NOTIFICATION_DEVICE_TYPE_ANDROID = 3;
	/**
	 * ios
	 */
	public static final Integer BAIDU_NOTIFICATION_DEVICE_TYPE_IOS = 4;
	/**
	 * wp
	 */
	public static final Integer BAIDU_NOTIFICATION_DEVICE_TYPE_WP = 5;
	
	String CRM_INTERFACE_WORKER = "CRM078";
	String CRM_INTERFACE_WEBBASIC = "CRM076";
	String CRM_INTERFACE_INSTALLBILL = "CRM0..";
	
	String FALSE_INFO = "0";
	String TRUE_INFO = "1";
	
	String DATA_INTERACTION_IN = "in";
	String DATA_INTERACTION_OUT = "out";
	
	String BILL_STATUS_DISPATCHED = "E0010";
	String BILL_STATUS_REPEAT_DISPATCHED = "E0012";
	String BILL_STATUS_COMPLETE = "E0013";
	String BILL_STATUS_SIGNED = "E0014";
	String BILL_STATUS_CANCEL = "E0021";
	String BILL_STATUS_DELAY = "DELAY";
	
	//TMS运单状态
	/** 待派工 */
	public static final String LEG_TYPE_WAITPLAN = "WAITPLAN";

	/** 已派工 */
	public static final String LEG_TYPE_DISPATCHED = "DISPATCHED";

	/** 已回执 */
	public static final String LEG_TYPE_SIGNED = "SIGNED";

	/** 延期非同天 */
	public static final String LEG_TYPE_DELAY = "DELAY";
	/** 残缺 */
	public static final String LEG_TYPE_DAMAGED = "DAMAGED";
	
	public static final String SYSTEM_NAME_CRM = "CRM";
	public static final String SYSTEM_NAME_JL = "JL";
	public static final String SYSTEM_NAME_APP = "APP";
	
	public static final String WL_DRIVER_LEGS = "wlsjdd_";
	public static final String WL_LEG_INFO = "wlddxx_";
	public static final String WL_LEG_STATUS = "wlddzt_";
	public static final String SH_INSTALL_INFO = "shazxx_";
	public static final String SH_INSTALL_STATUS = "shanzt_";
	public static final String SH_WORKERS_INSTALLS = "shsjan_";
	
	//发送消息设备类型
	/**
	 * 安卓设备
	 */
	public static final String DEVICE_TYPE_ANDROID = "android";
	/**
	 * IOS设备
	 */
	public static final String DEVICE_TYPE_IOS = "ios";
	
	public static final Integer USER_GOME = 0;
	public static final Integer USER_THIRD_PART = 1;
	public static final Integer USER_ADMIN = 2;
}
