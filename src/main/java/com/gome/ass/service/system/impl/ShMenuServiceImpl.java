package com.gome.ass.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.system.ShMenuDao;
import com.gome.ass.entity.ShMenu;
import com.gome.ass.service.system.ShMenuService;
@Service("menuService")
public class ShMenuServiceImpl implements ShMenuService{
	
	@Resource
	private ShMenuDao menuDao;
	
	@Override
	public List<ShMenu> getMenuTree(Map<String, Object> map) {
		return menuDao.getMenuTree(map);
	}

}
