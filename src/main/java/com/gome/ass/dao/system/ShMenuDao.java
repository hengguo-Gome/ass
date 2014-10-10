package com.gome.ass.dao.system;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShMenu;

@Repository("menuDao")
public interface ShMenuDao {
	List<ShMenu> getMenuTree(Map<String,Object> map);
}
