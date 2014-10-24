package com.gome.ass.service.logistics;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.gome.ass.entity.CrmAccessoryBasicdata;

public interface CrmAccessoryBasicdataService {

	public void deleteBatch(List<String> codes);

	public void insertBatch(List<CrmAccessoryBasicdata> accessories);

	/**
	 * 根据配件名称,名称首字母模糊查找配件名称，编码
	 * @param appParam
	 * @return
	 */
	public JSONObject selectAccessoryByName(Map<String, Object> appParam);

	public void updateHeadchar(List<CrmAccessoryBasicdata> accessories);

}
