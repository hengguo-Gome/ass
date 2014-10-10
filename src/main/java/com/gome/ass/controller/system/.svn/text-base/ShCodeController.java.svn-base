package com.gome.ass.controller.system;

import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gome.ass.common.Constrants;
import com.gome.ass.entity.ShCode;
import com.gome.ass.service.system.ShCodeService;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;



@Controller
@RequestMapping(value="/code")
public class ShCodeController {
    @Resource
    private ShCodeService shCodeService;
    
    /*
     * 获取码表下拉框内容{codeKey}
     */
    @RequestMapping(value="/getCombobox/{codeKey}", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getCombobox(@PathVariable String codeKey, String value){
        if("true".equalsIgnoreCase(value)) value = "1";
        if("false".equalsIgnoreCase(value)) value = "0";
        Map<String, String> map = Constrants.CODEMAP.get(codeKey);
        Set<Entry<String, String>> set = map.entrySet();
        Iterator<Entry<String, String>> iter = set.iterator();
        JSONArray array = new JSONArray();
        JSONObject empty = new JSONObject();
        empty.put("text", "　");
        array.add(empty);
        
        while(iter.hasNext()){
            Entry<String, String> entry = iter.next();
            JSONObject object = new JSONObject();
            object.put("value", entry.getKey());
            object.put("text", entry.getValue());
            if(entry.getKey().equals(value)){
                object.put("selected", true);
            }
            array.add(object);
        }
        return array.toString();
    }
    
    @RequestMapping(value="/hxCodeView")
    public String hxCodeView(){
        //TODO
        return "basicData/hxCode/hxCodeList";
    }
    
    @RequestMapping(value="/getShCodePageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getHxCodePageList(HttpServletResponse response, Page page) throws Exception{
        List<Map<String, Object>> list = shCodeService.getShCodePageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    
    @RequestMapping(value="/updateView")
    public ModelAndView updateView(ShCode hxCode) throws Exception{
        //TODO
        ModelAndView mav = new ModelAndView("basicData/hxCode/hxCodeUpdate");
        hxCode.setCodeName(URLDecoder.decode(hxCode.getCodeName(), "UTF-8"));
        mav.addObject(hxCode);
        return mav;
    }
    
    @RequestMapping(value="/getShCodeSettingByCodeId/{codeId}", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getHxCodeSettingByCodeId(@PathVariable String codeId) throws Exception{
        List<Map<String, Object>> list = shCodeService.getShCodeSettingByCodeId(codeId);
        return JsonUtil.writeListToDataGrid(list.size(), list);
    }
    
    @RequestMapping(value="/insertSetting", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String insertSetting(ShCode hxCode) throws Exception{
        try{
            shCodeService.insertSetting(hxCode.getCodeId(),hxCode);
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return "failure";
        }
    }
    
}