package com.gome.ass.service.system;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.ShMenu;

public interface ShMenuService {
	List<ShMenu> getMenuTree(Map<String,Object> map);
}
