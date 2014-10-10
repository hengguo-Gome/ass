package com.gome.ass.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.entity.CrmWorker;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.ass.service.users.ShUserService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("/user")
public class ShSystemAdminController {
    
    @Resource
    private CrmWorkerService crmWorkerService;
    @Resource
    private ShUserService shUserService;
    
    @RequestMapping("/userListView")
    public String userView(){
        return "system/userList";
    }
    
    @RequestMapping(value="/getUserPageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getUserPageList(Page page, ShUser user) throws Exception{
        Map<String, Object> map = BeanMapUtils.convertBean(user);
        page.setParam(map);
        List<Map<String, Object>> list = shUserService.getUserPageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
}
