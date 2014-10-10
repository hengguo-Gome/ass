package com.gome.ass.service.system.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.system.CrmWebBasicdataDao;
import com.gome.ass.entity.CrmWebBasicdata;
import com.gome.ass.service.system.CrmWebBasicdataService;

@Service("crmWebBasicdataService")
public class CrmWebBasicdataServiceImpl implements CrmWebBasicdataService {

    @Resource
    private CrmWebBasicdataDao crmWebBasicdataDao;
    
    @Override
    public void deleteBatch(List<String> codes) {
        crmWebBasicdataDao.deleteBatch(codes);
    }

    @Override
    public void insertBatch(List<CrmWebBasicdata> basicdatas) {
        crmWebBasicdataDao.insertBatch(basicdatas);
    }

    @Override
    public CrmWebBasicdata findByCode(String code) {
        return crmWebBasicdataDao.findByCode(code);
    }

}
