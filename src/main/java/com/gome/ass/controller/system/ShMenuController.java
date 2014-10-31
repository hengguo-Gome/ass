package com.gome.ass.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.Constrants;
import com.gome.ass.entity.ShMenu;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.permission.ShRoleService;
import com.gome.ass.service.system.ShMenuService;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;

@Controller
@RequestMapping("/menu")
public class ShMenuController {
	@Resource
	private ShMenuService menuService;
	@Resource
	private ShRoleService shRoleService;
	
	@RequestMapping("/shMenuListView")
    public String shMessageLogListView(){
        return "permission/menuList";
    }
	
	@RequestMapping(value="/getMenuTree", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getMenuTree(HttpServletRequest request){
		ShUser user = (ShUser)request.getSession().getAttribute(Constrants.USER_INFO);
		List<ShMenu> menuList = new ArrayList<ShMenu>();
//		if(Constrants.GOME_USER.toString().equals(user.getFromType())){
//			menuList = menuService.getEmpMenuTree(user.getAccount());
//		}else if(Constrants.THIRD_NETWORK_USER.toString().equals(user.getFromType())){
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("roleName", "金立");
//			menuList = menuService.getMenusByRoleName(map);
//		}if(Constrants.SYS_DEFINE_USER.toString().equals(user.getFromType())){
			menuList = menuService.getMenuTree(null);
//		}
		return JsonUtil.toGJson(menuList);
	}
	
	@RequestMapping(value="/getMenus", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getMenus(HttpServletRequest request){
		List<ShMenu> menuList = menuService.getMenuTree(null);
		return JsonUtil.toGJson(menuList);
	}
	
	@RequestMapping(value="selectMenuPageList", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String selectMenuPageList(Page page, HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuName", request.getParameter("menuName"));
		map.put("menuId", request.getParameter("menuId"));
		page.setParam(map);
		List<Map<String, Object>> list =  menuService.selectMenuPageList(page);
		return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
	}
}
