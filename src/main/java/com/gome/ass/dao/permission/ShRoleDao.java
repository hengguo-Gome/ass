package com.gome.ass.dao.permission;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShPosition;

@Repository("shRoleDao")
public interface ShRoleDao {

	public void updateShRoleResources(Map<String, Object> inMap);

	/**
	 * 根据role_id {roleIds} 批量删除sh_role 表数据
	 * 
	 * @param roleList
	 */
	public void deleteShRoleBatch(List<String> roleList);

	/**
	 * 批量插入sh_role_resource数据
	 * 
	 * @param inMap
	 */
	public void insertRoleResourceBatch(Map<String, Object> inMap);

	/**
	 * 根据role_id {roleIds}批量删除sh_role_resource 表数据
	 * 
	 * @param list
	 */
	public void delRoleResourceBatch(List<String> roleList);

	/**
	 * 根据roleId删除sh_role_resouce
	 * 
	 * @param roleId
	 */
	public void deleteShRoleResource(String roleId);

	public void insertShRole(Map<String, Object> inMap);

	/**
	 * 根据职务编码查找所有的职务
	 * 
	 * @param code
	 * @return
	 */
	public List<ShPosition> getShPositions(String code);

	public void insertShPosition(ShPosition position);
	public void insertShPositions(List<ShPosition> list);

	/**
	 * 根据code批量删除positions
	 * 
	 * @param set
	 */
	public void deleteShPositions(List<String> list);
	
	/**
	 * 根据roleId批量删除positions
	 * 
	 * @param set
	 */
	public void delShPositions(List<String> list);

	public void updateShRole(Map<String, Object> map);

}
