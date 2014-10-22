package com.gome.ass.controller.appUser;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.Constrants;
import com.gome.ass.service.appUser.AppUserService;

@Controller
@RequestMapping("/appUser")
public class AppUserController {
	
	@Resource
	private AppUserService appUserService;
	
	@RequestMapping(value="/appRegister", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appRegister(HttpServletRequest request, HttpServletResponse response) throws Exception{
        JSONObject result =  new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
        result = appUserService.appRegister(appParam);
        return result.toString();
	}
	
	@RequestMapping(value="/appLogin", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        JSONObject result =  new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
        result = appUserService.appLogin(appParam);
        return result.toString();
	}
	
	@RequestMapping(value="/appAlterPwd", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appAlterPwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject result =  new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = appUserService.appAlterPwd(appParam);
		return result.toString();
	}
	@RequestMapping(value="/appLogout", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appLogout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject result =  new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = appUserService.appLogout(appParam);
		return result.toString();
	}
	
	@RequestMapping(value="/appCheckVersion ", produces="text/plain;charset=UTF-8")
	public @ResponseBody String appCheckVersion (HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject result =  new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = appUserService.appCheckVersion(appParam);
		return result.toString();
	}

}
