package com.gome.ass.service.users;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.CrmWorker;
import com.gome.common.page.Page;

public interface CrmWorkerService {
	
	void deleteBatch(List<String> workerCodes);
	
	void insertBatch(List<CrmWorker> workers);
	
	public CrmWorker findWorkerByPhone(Map<String,Object> map);

    public List<Map<String, Object>> getWorkerPageList(Page page);

    void updatePasswordByCode(Map<String, Object> userInfoMap);
}
