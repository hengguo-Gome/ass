package com.gome.ass.service.permission;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gome.ass.entity.ShMenu;
import com.gome.ass.entity.ShPosition;
import com.gome.ass.entity.ShRole;
import com.gome.common.page.Page;

public interface ShRoleService {


	List<Map<String, Object>> getRolePageList(Page page);

	/**
	 * 根据roleId查询v_role_menu表数据
	 * @param inMap
	 * @return
	 */
	List<Map<String, Object>> getRoleResource(Map<String, Object> inMap);
	

	/**
	 * 导入岗位Excel表数据
	 * @param file
	 * @return
	 * @throws IOException
	 */
	Map<String, String> insertShPositions(MultipartFile file) throws IOException;




	String updateRoles(ShRole role, Map<String, Object> map, String action) throws Exception;

	void deleteRoles(List<String> roleList, List<String> poList);
	
	public String getRoleTypeByRoleId(String roleId);
}
