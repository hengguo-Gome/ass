package com.gome.ass.controller.permission;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gome.ass.entity.ShRole;
import com.gome.ass.entity.ShRoleMenu;
import com.gome.ass.service.permission.ShRoleService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("role")
public class ShRoleController {
    
    @Resource
    private ShRoleService shRoleService;
    
    @RequestMapping("shRoleListView")
    public String shDeviceListView(){
        return "permission/roleList";
    }
    
    @RequestMapping("importRoleView")
    public String importRoleView(){
    	return "permission/roleImport";
    }
    
    @RequestMapping(value="getRolePageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getRolePageList(Page page, ShRoleMenu role) throws Exception {
        Map<String, Object> map = BeanMapUtils.convertBean(role);
        page.setParam(map);
        List<Map<String, Object>> list = shRoleService.getRolePageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    
    @RequestMapping(value="getRoleResource", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String getRoleResource(String roleId) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("roleId", roleId);
        List<Map<String, Object>> list = shRoleService.getRoleResource(map);
        return JsonUtil.javaObjectToJsonString(list);
    }
    
    @RequestMapping(value = "/inOrUp", produces = "text/plain;charset=utf-8")
	public @ResponseBody
	String inOrUp(HttpServletRequest request, ShRole role) throws Exception {
    	Map<String,Object> result = new HashMap<String,Object>();
		try {
			Map<String, Object> map = BeanMapUtils.convertBean(role);
			map.put("menuIds", request.getParameter("menuIds"));
			String action = request.getParameter("action");
			return this.shRoleService.updateRoles(role, map, action);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			result.put("result", "服务器异常");
		}
		 return JsonUtil.javaObjectToJsonString(result);
	}
       
    @RequestMapping(value="/delete", produces="text/plain;charset=UTF-8")
    public @ResponseBody String delete(HttpServletRequest request) throws Exception{
        String result = null;
        try {
            String roleIds = request.getParameter("roleIds");
            String roleTypes = request.getParameter("roleTypes");
            List<String> roleList = new ArrayList<String>();
            List<String> poList = new ArrayList<String>();

            if(null != roleIds && !"".equals(roleIds)){
            	String []types = roleTypes.split(",");
            	String []ids = roleIds.split(",");
            	for(int i=0; i<ids.length; i++){
            		if("岗位角色".equals(types[i])){
            			poList.add(ids[i]);
            		}else{
            			roleList.add(ids[i]);
            		}
            	}
            }
            this.shRoleService.deleteRoles(roleList, poList);
            result = "删除数据成功";
        } catch (Exception e) {
            e.printStackTrace();
            result = "服务器异常";
        }
        return result;
    }
    

	@RequestMapping(value = "/importExcel")
	@ResponseBody
	public String importExcel(HttpServletRequest request,HttpServletResponse response) {
		String result = null;
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = mulRequest.getFile("file");
		String filename = file.getOriginalFilename();
		if (filename == null || "".equals(filename)) {
			return null;
		}
		try {
			Map<String, String> MapResult = shRoleService.insertShPositions(file);
			result = JsonUtil.toJson(MapResult);
		} catch (Exception e) {
			e.printStackTrace();
			StringBuffer sb = new StringBuffer("{\"flag\" : \"failure\",");
			sb.append("\"msg\":"+e.getMessage());
			sb.append("}");
		}
		return result;
	}
	
	@RequestMapping(value="getType")
	@ResponseBody
	public String getRoleTypeByRoleId(String roleId){
		return this.shRoleService.getRoleTypeByRoleId(roleId);
		
	}

}
