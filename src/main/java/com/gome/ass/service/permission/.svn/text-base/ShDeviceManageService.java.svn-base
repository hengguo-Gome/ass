package com.gome.ass.service.permission;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.ShDeviceManage;
import com.gome.common.page.Page;
public interface ShDeviceManageService {

	public void insertWlDeviceManage(Map<String,Object> inMap);
	/**
	 * APP版本检测更新
	 * @param wlDeviceManage
	 */
	public void updateWlDeviceManage(ShDeviceManage wlDeviceManage);
	
	public ShDeviceManage findWlDeviceManageById(Map<String,Object> inMap);
	
	/**
	 * 按大小工查找设备信息
	 * @param workIds
	 * @return
	 */
	public List<ShDeviceManage> findShDeviceManageList(List<String> workIds);
	
	/**
	 * 查找设置管理列表
	 */
    public List<Map<String, Object>> getShDevicePageList(Page page);
    
    /**
     * 更新设备状态
     * @param inMap
     */
    public void updateDeviceManageStatus(Map<String, Object> inMap);
    
    /**
     * 重置sn号
     * @param inMap
     */
    public void deleteDeviceManageSn(Map<String, Object> inMap);
	
}
