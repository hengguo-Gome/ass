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

    /**
     * 根据自身网点代码值查找所属网点的所有安装工网点代码<br>
     * 如果 是系统人员，返回所有网点，否则返回自身网点代码
     * @param webcode
     * @return
     */
	List<Map<String, Object>> findWebcodeList(String userType, String webcode);
}
