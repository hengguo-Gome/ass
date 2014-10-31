package com.gome.ass.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.system.ShMenuDao;
import com.gome.ass.entity.ShMenu;
import com.gome.ass.service.system.ShMenuService;
import com.gome.common.page.Page;
@Service("menuService")
public class ShMenuServiceImpl implements ShMenuService{
	
	@Resource
	private ShMenuDao menuDao;
	
	@Override
	public List<ShMenu> getEmpMenuTree(String account) {
		return menuDao.getEmpMenuTree(account);
	}

	@Override
	public List<Map<String, Object>> selectMenuPageList(Page page) {
		return menuDao.selectMenuPageList(page);
	}

	@Override
	public List<ShMenu> getMenuTree(Map<String, Object> map) {
		return this.menuDao.getMenuTree(map);
	}

	@Override
	public List<ShMenu> getMenusByRoleName(Map<String, Object> map) {
		return this.menuDao.getMenusByRoleName(map);
	}

}
