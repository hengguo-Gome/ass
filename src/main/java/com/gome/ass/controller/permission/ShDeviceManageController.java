package com.gome.ass.controller.permission;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.service.permission.ShDeviceManageService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("shDeviceManage")
public class ShDeviceManageController {
    
    @Resource
    private ShDeviceManageService shDeviceManageService;
    
    @RequestMapping("shDeviceListView")
    public String shDeviceListView(){
        return "permission/deviceManage/deviceManageList";
    }
    
    @RequestMapping(value="getShDevicePageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getShDevicePageList(Page page, ShDeviceManage device) throws Exception {
        Map<String, Object> map = BeanMapUtils.convertBean(device);
        page.setParam(map);
        List<Map<String, Object>> list = shDeviceManageService.getShDevicePageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    
    @RequestMapping(value="/updateDeviceStatus", produces="text/plain;charset=UTF-8")
    public @ResponseBody String updateDeviceManageStatus(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            String phones = request.getParameter("phones");
            String status = request.getParameter("status");
            Map<String,Object> inMap = new HashMap<String,Object>();
            if(null != phones && !"".equals(phones)){
                inMap.put("phones", phones.split(","));
            }else{
                inMap.put("phones", null);
            }
            inMap.put("status", status);
            this.shDeviceManageService.updateDeviceManageStatus(inMap);
            result.put("result", "success");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", "fail");
        }
        
        return JsonUtil.javaObjectToJsonString(result);
    }
    
    @RequestMapping(value="/resetSn", produces="text/plain;charset=UTF-8")
    public @ResponseBody String resetSn(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            String phones = request.getParameter("phones");
            Map<String,Object> inMap = new HashMap<String,Object>();
            if(null != phones && !"".equals(phones)){
                inMap.put("phones", phones.split(","));
            }else{
                inMap.put("phones", null);
            }
            this.shDeviceManageService.deleteDeviceManageSn(inMap);
            result.put("result", "success");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", "fail");
        }
        
        return JsonUtil.javaObjectToJsonString(result);
    }
}
