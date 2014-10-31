package com.gome.ass.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.http.security.Constraint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.Constrants;
import com.gome.ass.entity.CrmWorker;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("/worker")
public class CrmWorkerController {
    
    @Resource
    private CrmWorkerService crmWorkerService;
    
    @RequestMapping("workerView")
    public String userView(){
        return "users/worker/workerList";
    }
    
    @RequestMapping(value="/getWorkerPageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getUserPageList(Page page, CrmWorker user, HttpServletRequest request) throws Exception{
        Map<String, Object> map = BeanMapUtils.convertBean(user);
        ShUser shUser = (ShUser)request.getSession().getAttribute(Constrants.USER_INFO);
        map.put("webCode", shUser.getWebcode());//当前登录用户所属网点
        page.setParam(map);
        List<Map<String, Object>> list = crmWorkerService.getWorkerPageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
}
