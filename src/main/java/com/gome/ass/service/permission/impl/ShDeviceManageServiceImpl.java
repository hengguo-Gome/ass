package com.gome.ass.service.permission.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.permission.ShDeviceManageDao;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.service.permission.ShDeviceManageService;
import com.gome.common.page.Page;
@Service("shDeviceManageService")
public class ShDeviceManageServiceImpl implements ShDeviceManageService{
	
	@Resource
	private ShDeviceManageDao shDeviceManageDao;
	
	@Override
	public void insertShDeviceManageByMap(Map<String,Object> inMap) {
		this.shDeviceManageDao.insertShDeviceManageByMap(inMap);
	}

	@Override
	public void updateWlDeviceManage(ShDeviceManage wlDeviceManage) {
		this.shDeviceManageDao.updateShDeviceManage(wlDeviceManage);
	}


	@Override
	public ShDeviceManage findShDeviceManageById(Map<String, Object> inMap) {
		return this.shDeviceManageDao.findShDeviceManageById(inMap);
	}

    @Override
    public List<Map<String, Object>> getShDevicePageList(Page page) {
        return this.shDeviceManageDao.getShDevicePageList(page);
    }

    @Override
    public void updateDeviceManageStatus(Map<String, Object> inMap) {
        this.shDeviceManageDao.updateDeviceManageStatus(inMap);
    }

    @Override
    public void deleteDeviceManageSn(Map<String, Object> inMap) {
        this.shDeviceManageDao.deleteDeviceManageSn(inMap);
    }

	@Override
	public List<ShDeviceManage> findShDeviceManageList(List<String> workIds) {
		return this.shDeviceManageDao.findShDeviceManageList(workIds);
	}

}
