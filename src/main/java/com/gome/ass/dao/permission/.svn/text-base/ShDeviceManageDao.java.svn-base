package com.gome.ass.dao.permission;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShDeviceManage;
import com.gome.common.page.Page;
@Repository("shDeviceManageDao")
public interface ShDeviceManageDao {

	public void insertShDeviceManage(Map<String,Object> inMap);

	/**
	 * APP版本检测更新
	 * @param wlDeviceManage
	 */
	public void updateShDeviceManage(ShDeviceManage shDeviceManage);
	
	public void deleteShDeviceManage(Map<String,Object> inMap);
	
	public ShDeviceManage findShDeviceManageById(Map<String,Object> inMap);
	
	public List<ShDeviceManage> findShDeviceManageList(List<String> workIds);

    public List<Map<String, Object>> getShDevicePageList(Page page);

    public void deleteDeviceManageSn(Map<String, Object> inMap);

    public void updateDeviceManageStatus(Map<String, Object> inMap);
	
}
