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
import com.gome.ass.service.appUser.JlOrderService;
import com.gome.ass.util.GzipAESUtil;
import com.gome.ass.util.LogUtil;
import com.gome.ass.util.ReciveMessageConvert;

@Controller
@RequestMapping("/appOrder")
public class AppOrderController {
    
    @Resource
    private JlOrderService jlOrderService;
    private static final Logger log = LoggerFactory.getLogger(AppOrderController.class);

    @RequestMapping(value = "/appSynch", produces="text/plain;charset=UTF-8")
    public @ResponseBody
    String appSynch(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = null;
        try {
            Map<String, Object> map = ReciveMessageConvert.requestToMap(request);
            result = jlOrderService.findAvailableOrderDate(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
        }
        log.info("reply message :\t"+result.toString());
        return GzipAESUtil.compressThenEncryptAES(result.toString());
    }

    @RequestMapping(value = "/appOrderDelay", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String orderDelay(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = null;
        try {
            Map<String, Object> map = ReciveMessageConvert.requestToMap(request);
            result = jlOrderService.updateOrderAppoint(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
        }
        return GzipAESUtil.compressThenEncryptAES(result.toString());
    }
    
    @RequestMapping(value = "/appComplete", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String  appComplete(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = new JSONObject();
        try {
            Map<String, Object> map = ReciveMessageConvert.requestToMap(request);
            jlOrderService.appComplete(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00000);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10013);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10013);
        }
        return GzipAESUtil.compressThenEncryptAES(result.toString());
    }
    
    @RequestMapping(value = "/appCancel", produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String  appCancel(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = new JSONObject();
        try {
            Map<String, Object> map = ReciveMessageConvert.requestToMap(request);
            jlOrderService.appConcel(map);
            LogUtil.getLogJsonString(map, this.getClass().getName(), result.toString());
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00000);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10013);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10013);
        }
        
        return GzipAESUtil.compressThenEncryptAES(result.toString());
    }

}
