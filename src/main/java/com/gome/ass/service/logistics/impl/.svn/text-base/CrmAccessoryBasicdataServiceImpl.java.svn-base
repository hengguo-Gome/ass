package com.gome.ass.service.logistics.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.gome.ass.dao.logistics.CrmAccessoryBasicdataDao;
import com.gome.ass.entity.CrmAccessoryBasicdata;
import com.gome.ass.service.logistics.CrmAccessoryBasicdataService;
import com.gome.common.util.SysUtils;

@Service("crmAccessoryBasicdataService")
public class CrmAccessoryBasicdataServiceImpl implements CrmAccessoryBasicdataService {

	@Resource
	private CrmAccessoryBasicdataDao crmAccessoryBasicdataDao;
	@Override
	public void deleteBatch(List<String> codes) {
		this.crmAccessoryBasicdataDao.deleteBatch(codes);
	}

	@Override
	public void insertBatch(List<CrmAccessoryBasicdata> accessories) {
		this.crmAccessoryBasicdataDao.insertBatch(accessories);
	}

	@Override
	public JSONObject selectAccessoryByName(Map<String, Object> appParam) {
		JSONObject result = new JSONObject();
		String name = ((String)appParam.get("name")).trim();
		appParam.put("name", name);//对空值消除
		if (StringUtils.isBlank(name)) {
			return result;//不允许空值查询
		}
		List<Map<String, Object>> lists = new ArrayList<Map<String,Object>>();
		if(SysUtils.isContainChinese(name)){
			lists = this.crmAccessoryBasicdataDao.selectAccessoryByName(appParam);
		} else{
			lists = this.crmAccessoryBasicdataDao.selectAccessoryByNameHeadChar(appParam);
		}
		lists.addAll(this.crmAccessoryBasicdataDao.selectByAccessoryCode(appParam));
		Set<CrmAccessoryBasicdata> set = this.removeSamekey(lists);
		for(CrmAccessoryBasicdata data : set){
			result.accumulate(data.getAccessoryCode(), data.getShortText());
		}
		return result;
	}

	@Override
	public void updateHeadchar(List<CrmAccessoryBasicdata> accessories) {
		for(CrmAccessoryBasicdata data : accessories){
			Map<String, Object> map = new HashMap<String, Object>();
			 
			String headchar = SysUtils.getPinYinHeadChar(data.getShortText());
			String allchar = SysUtils.getPinYin(data.getShortText());
			map.put("accessoryCode", data.getAccessoryCode());
			map.put("head_char", headchar);
			map.put("all_char", allchar);
			
			List<Map<String, Object>>  headcharList = this.crmAccessoryBasicdataDao.selectHeadchar(data.getAccessoryCode());
			if(headcharList != null && headcharList.size() == 1){
				this.crmAccessoryBasicdataDao.updateHeadchar(map);
			} else{
				this.crmAccessoryBasicdataDao.insertHeadchar(map);
			}
		}
	}
	
	/**
	 * 移除相同的accessory_code结果
	 * @param lists
	 * @return
	 */
	public Set<CrmAccessoryBasicdata> removeSamekey(List<Map<String,Object>> lists){
		Set<CrmAccessoryBasicdata> set = new HashSet<CrmAccessoryBasicdata>();
		for(Map<String,Object> map : lists){
			CrmAccessoryBasicdata data = new CrmAccessoryBasicdata();
			data.setAccessoryCode((String)map.get("accessory_code"));
			data.setShortText((String)map.get("short_text"));
			set.add(data);
		}
		return set;
	}

}
