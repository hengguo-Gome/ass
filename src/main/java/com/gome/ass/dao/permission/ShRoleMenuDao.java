package com.gome.ass.dao.permission;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShMenu;
import com.gome.ass.entity.ShRoleMenu;
import com.gome.common.page.Page;

@Repository("shRoleMenuDao")
public interface ShRoleMenuDao {

	/**
	 * 从v_role_menu里查询相关信息
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> getRolePageList(Page page);

	public List<Map<String, Object>> getRoleResource(Map<String, Object> inMap);

	/**
	 * 根据role的名字糊糊查询角色包含菜单信息
	 * @param map
	 * @return
	 */
	public List<ShMenu> getRoleResourceByName(Map<String, Object> map);
	
	/**
	 * 根据role_id查询角色类型
	 * @param roleId
	 * @return
	 */
	public String getByRoleId(String roleId);


}
