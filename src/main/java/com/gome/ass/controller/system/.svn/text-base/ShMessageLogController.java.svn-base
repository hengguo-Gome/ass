package com.gome.ass.controller.system;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.entity.ShDataRecord;
import com.gome.ass.service.system.ShDataRecordService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("/log")
public class ShMessageLogController {
    
    @Resource
    private ShDataRecordService shDataRecordService;
    
    @RequestMapping("/shMessageLogListView")
    public String shMessageLogListView(){
        return "system/dataRecordList";
    }
    
    @RequestMapping(value="/findMessageLogPageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String findMessageLogPageList(Page page, ShDataRecord shDataRecord) throws Exception {
        
        Map<String, Object> map = BeanMapUtils.convertBean(shDataRecord);
        page.setParam(map);
        List<Map<String, Object>> list = shDataRecordService.findMessageLogPageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    

}
