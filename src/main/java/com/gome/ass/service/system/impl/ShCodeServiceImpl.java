package com.gome.ass.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.common.annotation.MaintenanceCode;
import com.gome.ass.dao.system.ShCodeDao;
import com.gome.ass.entity.ShCode;
import com.gome.ass.service.system.ShCodeService;
import com.gome.common.page.Page;



@Service("shCodeService")
public class ShCodeServiceImpl implements ShCodeService {
    @Resource
    private ShCodeDao shCodeDao;

    @Override
    public List<Map<String, Object>> getShCodePageList(Page page) {
        return shCodeDao.getShCodePageList(page);
    }

    @Override
    public List<Map<String, Object>> getShCodeSettingByCodeId(String codeId) {
        return shCodeDao.getShCodeSettingByCodeId(codeId);
    }

    @Override
    @MaintenanceCode
    public void insertSetting(String codeId, ShCode hxCode) {
        shCodeDao.insertSetting(hxCode);
    }



}