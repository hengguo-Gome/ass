package com.gome.ass.service.system;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.ShMenu;
import com.gome.common.page.Page;

public interface ShMenuService {
	/**
	 * 根据Emp Account返回菜单信息
	 * @param account
	 * @return
	 */
	List<ShMenu> getEmpMenuTree(String account);
	
	/**
	 * 返回所有 的菜单信息
	 * @param map
	 * @return
	 */
	List<ShMenu> getMenuTree(Map<String, Object> map);

	/**
	 * 查询所有菜单及父级菜单详细信息
	 * @param page
	 * @return
	 */
	List<Map<String, Object>> selectMenuPageList(Page page);

	/**
	 * 根据roleName返回菜单信息
	 * @param object
	 * @return
	 */
	List<ShMenu> getMenusByRoleName(Map<String, Object> map);
}
