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
	public static final String GOME_USER = "emp";
	public static final String THIRD_NETWORK_USER = "jl";
	public static final String SYS_DEFINE_USER = "...";
}
