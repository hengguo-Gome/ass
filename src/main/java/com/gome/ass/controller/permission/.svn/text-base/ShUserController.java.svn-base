package com.gome.ass.controller.permission;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.entity.ShUser;
import com.gome.ass.service.users.ShUserService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("urole")
public class ShUserController {
    
    @Resource
    private ShUserService shUserService;
    
    @RequestMapping("shUserListView")
    public String shDeviceListView(){
        return "permission/userList";
    }
    
    @RequestMapping(value="getUserPageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getUserPageList(Page page, ShUser User) throws Exception {
        Map<String, Object> map = BeanMapUtils.convertBean(User);
        page.setParam(map);
        List<Map<String, Object>> list = shUserService.getUserPageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    
    @RequestMapping(value="getUserResource", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getUserResource(String userId) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", userId);
        List<Map<String, Object>> list = shUserService.getUserRole(map);
        return JsonUtil.javaObjectToJsonString(list);
    }
    
    @RequestMapping(value = "/inOrUp", produces = "text/plain;charset=utf-8")
	public @ResponseBody
	String inOrUp(HttpServletRequest request, ShUser user) {
		String result = null;
		try {
			Map<String, Object> map = BeanMapUtils.convertBean(user);
			map.put("menuIds", request.getParameter("menuIds"));
			if(StringUtils.isNotBlank(user.getAccount())){
				this.shUserService.updateShUserRoles(map);
				result = "修改用户成功！";
			}else{
				this.shUserService.insertUserRole(map);
				result = "新增用户成功！";
			}
		} catch (Exception e) {
			result = "服务器异常";
		}
		return result;
	}
       
    @RequestMapping(value="/delete", produces="text/plain;charset=UTF-8")
    public @ResponseBody String delete(HttpServletRequest request) throws Exception{
        String result = null;
        try {
            String userIds = request.getParameter("userIds");
            Map<String,Object> inMap = new HashMap<String,Object>();
            if(null != userIds && !"".equals(userIds)){
                inMap.put("userIds", userIds.split(","));
            }else{
                inMap.put("userIds", null);
            }
            this.shUserService.deleteShUser(inMap);
            result = "删除数据成功";
        } catch (Exception e) {
            e.printStackTrace();
            result = "服务器异常";
        }
        return result;
    }
}
