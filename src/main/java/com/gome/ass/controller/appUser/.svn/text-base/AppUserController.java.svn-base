package com.gome.ass.controller.appUser;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.APPErrorInfo;
import com.gome.ass.service.appUser.AppUserService;
import com.gome.ass.util.GzipAESUtil;
import com.gome.ass.util.ReciveMessageConvert;

@Controller
@RequestMapping("/appUser")
public class AppUserController {
	
	@Resource
	private AppUserService appUserService;
	
	private static final Logger log = LoggerFactory.getLogger(AppUserController.class);
	
	@RequestMapping(value="/appRegister", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appRegister(HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> appParam = null;
        JSONObject result =  new JSONObject();
        try {
        	appParam = ReciveMessageConvert.requestToMap(request);
            result = appUserService.appRegister(appParam);
        } catch (Exception e) {
        	log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
        }
        log.info("reply message :\t"+result.toString());
        return GzipAESUtil.compressThenEncryptAES(result.toString());
	}
	
	@RequestMapping(value="/appLogin", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appLogin(HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> appParam = null;
        JSONObject result =  new JSONObject();
        try {
        	appParam = ReciveMessageConvert.requestToMap(request);
            result = appUserService.appLogin(appParam);
        } catch (Exception e) {
        	log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
        }
        log.info("reply message :\t"+result.toString());
        return GzipAESUtil.compressThenEncryptAES(result.toString());
	}
	
	@RequestMapping(value="/appAlterPwd", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appAlterPwd(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> appParam = null;
		JSONObject result =  new JSONObject();
		try {
			appParam = ReciveMessageConvert.requestToMap(request);
			result = appUserService.appAlterPwd(appParam);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
		}
		log.info("reply message :\t"+result.toString());
		return GzipAESUtil.compressThenEncryptAES(result.toString());
	}
	@RequestMapping(value="/appLogout", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appLogout(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> appParam = null;
		JSONObject result =  new JSONObject();
		try {
			appParam = ReciveMessageConvert.requestToMap(request);
			result = appUserService.appLogout(appParam);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
		}
		log.info("reply message :\t"+result.toString());
		return GzipAESUtil.compressThenEncryptAES(result.toString());
	}
	
	@RequestMapping(value="/appCheckVersion ", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appCheckVersion (HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> appParam = null;
		JSONObject result =  new JSONObject();
		try {
			appParam = ReciveMessageConvert.requestToMap(request);
			result = appUserService.appCheckVersion(appParam);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
		}
		log.info("reply message :\t"+result.toString());
		return GzipAESUtil.compressThenEncryptAES(result.toString());
	}

}
