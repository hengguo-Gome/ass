package com.gome.ass.dao.logistics;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.CrmInstallBill;

public interface CrmInstallBillDao {
    int deleteByPrimaryKey(String billId);

    int insert(CrmInstallBill record);

    CrmInstallBill selectByPrimaryKey(Map<String,Object> map);

    int updateByPrimaryKeySelective(CrmInstallBill record);

    int updateByPrimaryKey(CrmInstallBill record);
    
    void insertBatch(List<CrmInstallBill> cmServices);
    
    public void delBatch(List<String> jlorderCodes);
    
    public List<Map<String,Object>> queryInstallBill(Map<String,Object> param);

    /**
     * 修改预约时间，预约开始，结束时间
     * @param map
     */
    void updateApointDate(Map<String, Object> map);
}