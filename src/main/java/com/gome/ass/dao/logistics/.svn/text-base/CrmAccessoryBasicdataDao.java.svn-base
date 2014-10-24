package com.gome.ass.dao.logistics;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.CrmAccessoryBasicdata;

@Repository("crmAccessoryBasicdataDao")
public interface CrmAccessoryBasicdataDao {

	public int deleteByPrimaryKey(String id);

	public int insert(CrmAccessoryBasicdata record);

	public int insertSelective(CrmAccessoryBasicdata record);

	/**
	 * 根据id或accessoryCode查询记录
	 * @param id
	 * @return 
	 */
	public CrmAccessoryBasicdata selectByPrimaryKey(Map<String, Object> map);
	
	/**
	 * 根据name{accessory_code}模糊查询记录
	 *  @return accessory_code<p>
	 *  short_text
	 */
	public List<Map<String, Object>> selectByAccessoryCode(Map<String, Object> map);
	
	/**
	 * 根据accessoryCode模糊查询accessory_headchar记录
	 * @param accessoryCode
	 * @return accessory_code<p>
	 *  	short_text
	 */
	public List<Map<String, Object>> selectHeadchar(String accessoryCode);

	public int updateByPrimaryKeySelective(CrmAccessoryBasicdata record);

	public int updateByPrimaryKey(CrmAccessoryBasicdata record);
	
	/**
	 * 根据accessoryCode更新accessory_headchar记录
	 * @param map
	 * @return
	 */
	public int updateHeadchar(Map<String, Object> map);

	public void deleteBatch(List<String> codes);

	public void insertBatch(List<CrmAccessoryBasicdata> accessories);
	
	public void insertHeadchar(Map<String, Object> map);

	/**
	 * 据short_text模糊查询记录
	 * @param appParam
	 * @return
	 */
	public List<Map<String, Object>> selectAccessoryByName(Map<String, Object> appParam);

	/**
	 * 根据首字母返回accessory_code和short_text
	 * @param appParam
	 * @return accessory_code<p>
	 *  	short_text
	 */
	public List<Map<String, Object>> selectAccessoryByNameHeadChar(Map<String, Object> appParam);
	
}