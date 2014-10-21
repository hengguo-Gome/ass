package com.gome.ass.dao.users;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.CrmWorker;
import com.gome.common.page.Page;

@Repository("crmWorkerDao")
public interface CrmWorkerDao {
	
	void deleteBatch(List<String> workerCodes);
	
	void insertBatch(List<CrmWorker> workers);
	
	/**
	 * 根据Phone或Userid查找安装工 
	 * @param map
	 * @return
	 */
	CrmWorker findWorkerByPhone(Map<String,Object> map);
	
	public List<Map<String, Object>> getWorkerPageList(Page page);
	
	/**
	 * 根据安装工人代码修改密码
	 * @param map
	 */
	public void updatePasswordByCode(Map<String, Object> map);

	List<Map<String, Object>> findWebCodeList(String webcode);

	List<String> findWorkerCodeByWebcode(String webcode);
	
}
