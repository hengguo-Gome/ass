package com.gome.ass.dao.system;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShMenu;
import com.gome.common.page.Page;

@Repository("menuDao")
public interface ShMenuDao {
	List<ShMenu> getEmpMenuTree(String account);

	List<Map<String, Object>> selectMenuPageList(Page page);

	List<ShMenu> getMenuTree(Map<String, Object> map);

	List<ShMenu> getMenusByRoleName(Map<String, Object> map);
	
	ShMenu getMenuById(String id);
}
