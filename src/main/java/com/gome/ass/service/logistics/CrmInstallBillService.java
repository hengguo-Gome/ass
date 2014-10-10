package com.gome.ass.service.logistics;


import java.util.List;
import java.util.Map;

import com.gome.ass.entity.CrmAccessories;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.CrmService;

public interface CrmInstallBillService {
    public void insertBatch(List<CrmInstallBill> installBills);
    
    public void insertServiceBatch(List<CrmService> crmServices);
    
    public void insertAccessoriesBatch(List<CrmAccessories> crmAccessorieses);
    
    public List<Map<String,String>> queryInstallBill(Map<String,Object> param);
    
    public void delBatch(List<String> jlorderCodes);
    
    public void delServiceByJlorderCode(String jlorderCode);
    
    public void delAccessoriesByJlorderCode(String jlorderCode);
    
    public void insertOrUpdate(CrmInstallBill crmInstallBill);

    public void updateByPrimaryKeySelective(CrmInstallBill crmInstallBill);
    
    public CrmInstallBill queryCrmInstallBillByJlOrderNum(String jlOrderNum);
    /**
     * 更新安装单预约时间及预约安装开始，结束时间
     * @param map
     */
    public void updateApointDate(Map<String, Object> map);
    
    /**
     * 更新经纬度
     * @param crmInstallBill
     * @return
     */
    public void updateLatAndLon(CrmInstallBill crmInstallBill);

}
