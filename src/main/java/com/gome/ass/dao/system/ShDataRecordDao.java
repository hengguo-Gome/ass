package com.gome.ass.dao.system;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShDataRecord;
import com.gome.common.page.Page;

@Repository("shDataRecordDao")
public interface ShDataRecordDao {

    public void insertShDataRecord(ShDataRecord shDataRecord);

    public List<Map<String, Object>> findMessageLogPageList(Page page);
    
    public void updateShDataRecordFail(String messageId);

}