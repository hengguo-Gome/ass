package com.gome.ass.service.logistics.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.dao.logistics.CrmAccessoriesDao;
import com.gome.ass.dao.logistics.CrmInstallBillDao;
import com.gome.ass.dao.logistics.CrmServiceDao;
import com.gome.ass.entity.CrmAccessories;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.CrmService;
import com.gome.ass.redis.dao.RedisCommonDao;
import com.gome.ass.service.logistics.CrmInstallBillService;
import com.gome.ass.util.BaiduUtil;
import com.gome.ass.util.DateUtils;

@Service("crmInstallBillService")
public class CrmInstallBillServiceImpl implements CrmInstallBillService {
	
	@Resource
	private CrmInstallBillDao crmInstallBillDao;
	@Resource
	private CrmAccessoriesDao crmAccessoriesDao;
	@Resource
	private CrmServiceDao crmServiceDao;
	@Resource
	private RedisCommonDao redisCommonDao;
	@Override
	public void insertBatch(List<CrmInstallBill> installBills) {
		this.crmInstallBillDao.insertBatch(installBills);
	}

	@Override
	public void insertServiceBatch(List<CrmService> crmServices) {
		this.crmServiceDao.insertBatch(crmServices);
	}

	@Override
	public void insertAccessoriesBatch(List<CrmAccessories> crmAccessorieses) {
		this.crmAccessoriesDao.insertBatch(crmAccessorieses);
	}
	
	public List<Map<String,String>> queryInstallBill(Map<String,Object> inMap){

		String userId = (String)inMap.get("userId");

		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		List<Object> removeBillIs = new ArrayList<Object>();
		Set<Object> keyZSet = redisCommonDao.keyZSetGet(BusinessGlossary.SH_WORKERS_INSTALLS+userId);
		Iterator<Object> iterator = keyZSet.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		while(iterator.hasNext()){
			String next = (String)iterator.next();
			Map<String, String> keyZMapGet = redisCommonDao.keyZMapGet(BusinessGlossary.SH_INSTALL_INFO+next);
			list.add(keyZMapGet);
		}
		return list;
	
	}

	@Override
	public void delBatch(List<String> jlorderCodes) {
		this.crmInstallBillDao.delBatch(jlorderCodes);
		
	}

	@Override
	public void delServiceByJlorderCode(String jlorderCode) {
		this.crmServiceDao.deleteByJlorderCode(jlorderCode);
		
	}

	@Override
	public void delAccessoriesByJlorderCode(String jlorderCode) {
		this.crmAccessoriesDao.deleteByJlorderCode(jlorderCode);
		
	}

	@Override
	public void insertOrUpdate(CrmInstallBill crmInstallBill) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("billId", crmInstallBill.getBillId());
		map.put("jlOrderNum", crmInstallBill.getJlOrderNum());
		CrmInstallBill installBill = this.crmInstallBillDao.selectByPrimaryKey(map);
		
		if(null == installBill){
			this.crmInstallBillDao.insert(crmInstallBill);
		}else{
			this.crmInstallBillDao.updateByPrimaryKeySelective(crmInstallBill);
		}
	}

    @Override
    public void updateByPrimaryKeySelective(CrmInstallBill crmInstallBill) {
        this.crmInstallBillDao.updateByPrimaryKeySelective(crmInstallBill);
    }

	@Override
	public CrmInstallBill queryCrmInstallBillByJlOrderNum(String jlOrderNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jlOrderNum", jlOrderNum);
		return crmInstallBillDao.selectByPrimaryKey(map);
	}


    @Override
    public void updateApointDate(Map<String, Object> map) {
        String yysj_s = (String) map.get("yysj_s");
        String yysj_e = (String) map.get("yysj_e");
        String day = (String) map.get("yysj");
        Date appointStartDate = DateUtils.toDate(day + " " + yysj_s + ":00:00");
        Date appointEndDate = DateUtils.toDate(day + " " + yysj_e + ":00:00");
        map.put("appointStartDate", appointStartDate);
        map.put("appointEndDate", appointEndDate);
        this.crmInstallBillDao.updateApointDate(map);
    }

	@Override
	public void updateLatAndLon(CrmInstallBill crmInstallBill) {
		String customerAddress = crmInstallBill.getClientAddr();
        Map<String, Double> addressMap = BaiduUtil.convertDetailAddress2LongitudeAndLatitude(customerAddress);
        if(addressMap != null){
        	crmInstallBill.setLatitude(addressMap.get("latitude"));
        	crmInstallBill.setLongitude(addressMap.get("longitude"));
        }
	}

}
