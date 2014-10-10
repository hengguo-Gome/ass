package com.gome.ass.common;

import java.util.HashMap;
import java.util.Map;

public class Constrants {
	//码表map
	public static final Map<String, Map<String, String>> CODEMAP = new HashMap<String, Map<String, String>>();
	//物料标题map
	public static final Map<String, String> FITTING_TITLE_MAP = new HashMap<String, String>();
	//用户session
	public static final String USER_INFO = "user";
	//用户登录方式
	public static final Integer GOME_USER = 0;	//EMP 
	public static final Integer THIRD_NETWORK_USER = 1;	//JL..
	public static final Integer SYS_DEFINE_USER = 2;	//ADMIN
	public static final Integer CRM_WORKER = 3;	//CRM 
}
