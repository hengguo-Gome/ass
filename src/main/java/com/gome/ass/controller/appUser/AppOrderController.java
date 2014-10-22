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
import com.gome.ass.common.Constrants;
import com.gome.ass.service.appUser.JlOrderService;
import com.gome.ass.util.LogUtil;

@Controller
@RequestMapping("/appOrder")
public class AppOrderController {
    
    @Resource
    private JlOrderService jlOrderService;
    private static final Logger log = LoggerFactory.getLogger(AppOrderController.class);

    @RequestMapping(value = "/appSynch", produces="text/plain;charset=UTF-8")
    public @ResponseBody
    String appSynch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject result = null;
        Map<String, Object> map = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
        result = jlOrderService.findAvailableOrderDate(map);
        LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        return result.toString();
    }

    @RequestMapping(value = "/appOrderDelay", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String orderDelay(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject result = null;
        Map<String, Object> map = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
        result = jlOrderService.updateOrderAppoint(map);
        LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        return result.toString();
    }
    
    @RequestMapping(value = "/appComplete", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String  appComplete(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = new JSONObject();
        try {
            Map<String, Object> map = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
            result = jlOrderService.appComplete(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10013);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10013);
        }
        return result.toString();
    }
    
    @RequestMapping(value = "/appCancel", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String  appCancel(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = new JSONObject();
        try {
            Map<String, Object> map = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
            result = jlOrderService.appConcel(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10013);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10013);
        }
        
        return result.toString();
    }

}
