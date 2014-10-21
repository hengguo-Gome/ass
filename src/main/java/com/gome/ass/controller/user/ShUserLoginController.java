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
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/alterPwd",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
    @ResponseBody
    public String alterPwd(Page page, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");
        if(StringUtils.isBlank(oldPwd)) return "{\"flag\" : \"oldPwdNull\"}";
        if(StringUtils.isBlank(newPwd)) return "{\"flag\" : \"newPwdNull\"}";
        ShUser shUser = (ShUser) request.getSession().getAttribute(Constrants.USER_INFO);
        map.put("account", shUser.getAccount());
        map.put("password", oldPwd);
        map.put("fromType", shUser.getFromType());
        
        page.setParam(map);
        ShUserPwdInfo shUserPwdInfo = shUserPwdInfoService.findUserByUserId(map);
        if(shUserPwdInfo == null){
            return "{\"flag\" : \"accountNull\"}";
        }else {
            if(!oldPwd.equals(shUserPwdInfo.getPassword())){
                return "{\"flag\" : \"oldPwdError\"}";
            }else{
                map.put("userId", shUser.getAccount());
                map.put("password", newPwd);
                map.put("userType", shUser.getFromType());
                shUserPwdInfoService.updateByPrimaryKey(map);
                return "{\"flag\" : \"success\"}";
            }
        }
    }
	
	@RequestMapping(value="/index")
	public String index(){
		return "index";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET,produces="text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView logout(Page page, HttpServletRequest request){
    	ModelAndView mv = new ModelAndView("../jsp/login");
        request.getSession().removeAttribute(Constrants.USER_INFO);
        return mv;
	}
}
