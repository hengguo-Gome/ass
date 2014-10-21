package com.gome.ass.service.logistics;


import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.gome.ass.entity.CrmAccessories;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.CrmService;

public interface CrmInstallBillService {
    public void insertBatch(List<CrmInstallBill> installBills);
    
    public void insertServiceBatch(List<CrmService> crmServices);
    
    public void insertAccessoriesBatch(List<CrmAccessories> crmAccessorieses);
    
    public JSONObject queryInstallBill(Map<String,Object> param);
    
    public JSONObject queryLegTrack(Map<String,Object> param);
    
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
    /**
     * 提交排成
     * @param param
     */
    public void updateInstallSuquence(Map<String,Object> param);
    
    /**
     * 提交经纬度
     * @param param
     */
    public void updateWorkerLocation(Map<String,Object> param);
    
    List<Map<String,Object>> queryDelayInstalls(Map<String,Object> param);

}
