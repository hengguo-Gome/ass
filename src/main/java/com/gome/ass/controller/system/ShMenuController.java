package com.gome.ass.controller.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.entity.ShMenu;
import com.gome.ass.service.system.ShMenuService;
import com.gome.ass.util.JsonUtil;

@Controller
@RequestMapping("/menu")
public class ShMenuController {
	@Resource
	private ShMenuService menuService;
	
	@RequestMapping(value="/getMenuTree", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getMenuTree(){
		List<ShMenu> menuList = menuService.getMenuTree(null);
		return JsonUtil.toGJson(menuList);
	}
}
