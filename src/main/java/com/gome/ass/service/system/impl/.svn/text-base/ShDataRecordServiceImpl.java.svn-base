package com.gome.ass.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.system.ShDataRecordDao;
import com.gome.ass.entity.ShDataRecord;
import com.gome.ass.service.system.ShDataRecordService;
import com.gome.common.page.Page;

@Service("shDataRecordService")
public class ShDataRecordServiceImpl implements ShDataRecordService {

    @Resource
    private ShDataRecordDao shDataRecordDao;

    @Override
    public void insertShDataRecord(ShDataRecord shDataRecord) {
        shDataRecordDao.insertShDataRecord(shDataRecord);
    }

    public List<Map<String, Object>> findMessageLogPageList(Page page) {
        return shDataRecordDao.findMessageLogPageList(page);
    }

	@Override
	public void updateShDataRecordFail(String messageId) {
		this.shDataRecordDao.updateShDataRecordFail(messageId);
		
	}

}