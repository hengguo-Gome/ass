package com.gome.ass.dao.system;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.CrmWebBasicdata;

@Repository("crmWebBasicdataDao")
public interface CrmWebBasicdataDao {
    
    /**
     * 根据唯一的网点编码批量删除
     * @param code
     */
    public void deleteBatch(List<String> code);

    public void insertBatch(List<CrmWebBasicdata> basicdatas);

    int deleteByPrimaryKey(String dataId);

    int insert(CrmWebBasicdata record);

    int insertSelective(CrmWebBasicdata record);

    CrmWebBasicdata selectByPrimaryKey(String dataId);

    int updateByPrimaryKeySelective(CrmWebBasicdata record);

    int updateByPrimaryKey(CrmWebBasicdata record);

    /**
     * 根据网点编码查找CRM 网点主数据
     */
    public CrmWebBasicdata findByCode(String code);
}