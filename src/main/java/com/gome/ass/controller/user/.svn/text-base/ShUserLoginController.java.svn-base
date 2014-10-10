package com.gome.ass.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.Constrants;
import com.gome.ass.entity.ShUser;
import com.gome.ass.entity.ShUserPwdInfo;
import com.gome.ass.service.users.ShUserPwdInfoService;
import com.gome.ass.service.users.ShUserService;
import com.gome.common.page.Page;


@Controller
public class ShUserLoginController {
	
    @Resource
    private ShUserService shUserService;
    @Resource
    private ShUserPwdInfoService shUserPwdInfoService;
    
	@RequestMapping(value="/toLogin")
	public String toLogin(){
		return "login";
	}
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String login(Page page, HttpServletRequest request){
	    Map<String, Object> map = new HashMap<String, Object>();
	    String account = request.getParameter("account");
	    String password = request.getParameter("password");
	    String fromType = request.getParameter("fromType");
	    if(StringUtils.isBlank(account)) return "{\"flag\" : \"loginIdNull\"}";
        if(StringUtils.isBlank(password)) return "{\"flag\" : \"loginPwdNull\"}";
        
        map.put("account", account);
	    map.put("password", password);
	    map.put("fromType", fromType);
	    page.setParam(map);
		ShUser shUser = shUserService.getUserSelective(page);
		if(shUser == null){
		    return "{\"flag\" : \"accountNull\"}";
		}else {
		    ShUserPwdInfo shUserPwdInfo = shUserPwdInfoService.findUserByUserId(map);
		    if(!password.equals(shUserPwdInfo.getPassword())){
		        return "{\"flag\" : \"loginPwdError\"}";
		    }else{
		        request.getSession().setAttribute(Constrants.USER_INFO, shUser);
		        return "{\"flag\" : \"success\"}";
		    }
		}
	}
	
	@RequestMapping(value="/index")
	public String index(){
		return "index";
	}
	
}
