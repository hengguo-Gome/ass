package com.gome.ass.service.logistics.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gome.ass.common.APPErrorInfo;
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
	
	private static final Logger log = LoggerFactory.getLogger(CrmInstallBillServiceImpl.class);
	
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
	
	public JSONObject queryInstallBill(Map<String,Object> inMap){
		JSONObject result = new JSONObject();
		
		String userId = (String)inMap.get("userId");

		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		List<Object> removeBillIs = new ArrayList<Object>();
		Set<Object> keyZSet = redisCommonDao.keyZSetGet(BusinessGlossary.SH_WORKERS_INSTALLS+userId);
		Iterator<Object> iterator = keyZSet.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		boolean flag = true;
		while(iterator.hasNext()){
			String next = (String)iterator.next();
			Map<String, String> keyZMapGet = redisCommonDao.keyZMapGet(BusinessGlossary.SH_INSTALL_INFO+next);
			
			String status = keyZMapGet.get("azzt");
			String yysj = keyZMapGet.get("yysj");
			if(!status.equals(BusinessGlossary.BILL_STATUS_DISPATCHED)){
				if(StringUtils.isNotBlank(yysj)){
					String handle_date = sdf.format(new Date(Long.parseLong(yysj)));
					if(!handle_date.equals(sdf.format(new Date()))){
						removeBillIs.add(next);
						continue;
					}else{
						list.add(keyZMapGet);
					}
				}else{
					removeBillIs.add(next);
					continue;
				}
			}else{
				list.add(keyZMapGet);
			}
			if(flag){
				String order = keyZMapGet.get("order");
				String handle_date = sdf.format(new Date(Long.parseLong(yysj)));
				if(handle_date.equals(sdf.format(new Date())) && StringUtils.isBlank(order)){
					flag = false;
				}
			}
			
		}
		if(flag){
			result.put("needOrder", 0);
		}else{
			result.put("needOrder", 1);
		}
		result.put("installs", list);
		return result;
	
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

	@Override
	public List<Map<String, Object>> queryDelayInstalls(
			Map<String, Object> param) {
		return  this.crmInstallBillDao.queryDelayInstalls(param);
	}

	@Override
	public void updateInstallSuquence(Map<String, Object> param) {
		 String azdhs = (String) param.get("azdhs");
		 String gsdms = (String) param.get("gsdms");
		 String thds = (String) param.get("thds");
		 String workerId = (String) param.get("userId");
		 String[] azdhsArray = azdhs.split(",");
		 String[] gsdmsArray = gsdms.split(",");
		 String[] thdsArray = thds.split(",");
		 Integer order = crmInstallBillDao.getTodayOrderSuquence(workerId);
		 if(order == null){
			 order = 0;
		 }
		 for (int i = 1; i <= azdhsArray.length; i++) {
			 String azdh = azdhsArray[i-1];
			 String gsdm = gsdmsArray[i-1];
			 String thd = thdsArray[i-1];
			 order = order + 1;
			 CrmInstallBill crmInstallBill = new CrmInstallBill();
			 crmInstallBill.setJlOrderNum(azdh);
			 crmInstallBill.setPlanFinishSuquence(order);
			 this.crmInstallBillDao.updateByPrimaryKeySelective(crmInstallBill);
			 if(StringUtils.isNotBlank(gsdm) && StringUtils.isNotBlank(thd) ){
				 Map<String,String> orderMap = new HashMap<String, String>();
				 orderMap.put("order", String.valueOf(order));
				 redisCommonDao.keyMapAdd(BusinessGlossary.SH_INSTALL_INFO+thd+gsdm, orderMap, null);
			 }
		}
	}

	@Override
	public void updateWorkerLocation(Map<String, Object> param) {
		String workerId = (String) param.get("userId");
		String jd = (String) param.get("jd");
		String wd = (String) param.get("wd");
		String time = String.valueOf(new Date().getTime());
		JSONObject json = new JSONObject();
		json.put("workerId", workerId);
		json.put("jd", jd);
		json.put("wd", wd);
		json.put("time", time);
		redisCommonDao.keyZSetAdd(BusinessGlossary.SH_WORKERS_LOCATION+workerId, Double.valueOf(time), json.toString(), null);
	}

	@Override
	public JSONObject queryLegTrack(Map<String, Object> param) {
		JSONObject json = new JSONObject();
		String thd = (String) param.get("thd");
		String gsdm = (String) param.get("gsdm");
		Map<String, String> keyZMapGet = redisCommonDao.keyZMapGet(BusinessGlossary.WL_LEG_INFO+thd+"_"+gsdm);
		if(keyZMapGet != null){
			String yjddkssj = keyZMapGet.get("yjddkssj");
			String ydzt = keyZMapGet.get("ydzt");
			String sjdh = keyZMapGet.get("sjdh");
			String hzsj = keyZMapGet.get("hzsj");
			Date yjddkssjDate = new Date(Long.parseLong(yjddkssj));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Double startTime = null;
			Double endTime = null;
			try {
				if(ydzt.equals(BusinessGlossary.LEG_TYPE_DISPATCHED)){
					startTime = Double.valueOf(sdf.parse(sdf.format(yjddkssjDate)).getTime());
					endTime = Double.valueOf(new Date().getTime());
				}else if(ydzt.equals(BusinessGlossary.LEG_TYPE_SIGNED)){
					startTime = Double.valueOf(sdf.parse(sdf.format(yjddkssjDate)).getTime());
					endTime = Double.valueOf(sdf.parse(sdf.format(new Date(Long.parseLong(hzsj)))).getTime());
				}else{
					json.put(APPErrorInfo.ERRORCODE, "11111");
					json.put(APPErrorInfo.ERRORMSG, "暂无物流信息");
				}
				Set<Object> result = redisCommonDao.keyZSetRangeGet(BusinessGlossary.WL_WORKERS_LOCATION+sjdh,startTime, endTime);
				Iterator<Object> iterator = result.iterator();
				JSONArray ja = new JSONArray();
				while(iterator.hasNext()){
					ja.add(JSONObject.fromObject(iterator.next()));
				}
				json.put("result", ja);
			} catch (ParseException e) {
				log.error(e.getMessage(),e);
			}
		}else{
			json.put(APPErrorInfo.ERRORCODE, "11111");
			json.put(APPErrorInfo.ERRORMSG, "暂无物流信息");
		}
		return json;
	}
	

}
