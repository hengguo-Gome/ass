package com.gome.ass.service.system;

import java.util.List;

import com.gome.ass.entity.CrmWebBasicdata;

public interface CrmWebBasicdataService {
    public void deleteBatch(List<String> dataIds);

    public void insertBatch(List<CrmWebBasicdata> basicdatas);
    
    /**
     * 根据网点编码查找CRM 网点主数据
     * @param code
     * @return 
     */
    public CrmWebBasicdata findByCode(String code);

}
