package com.gome.ass.service.users.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.common.Constrants;
import com.gome.ass.dao.users.CrmWorkerDao;
import com.gome.ass.entity.CrmWorker;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.common.page.Page;

@Service("crmWorkerService")
public class CrmWorkerServiceImpl implements CrmWorkerService {

	@Resource
	private CrmWorkerDao crmWorkerDao;

	@Override
	public void deleteBatch(List<String> workerCodes) {
		crmWorkerDao.deleteBatch(workerCodes);
	}

	@Override
	public void insertBatch(List<CrmWorker> workers) {
		crmWorkerDao.insertBatch(workers);
	}

	@Override
	public List<Map<String, Object>> getWorkerPageList(Page page) {
		return crmWorkerDao.getWorkerPageList(page);
	}

	@Override
	public void updatePasswordByCode(Map<String, Object> userInfoMap) {
		this.crmWorkerDao.updatePasswordByCode(userInfoMap);
	}

	@Override
	public CrmWorker findWorkerByPhone(Map<String, Object> map) {
		return this.crmWorkerDao.findWorkerByPhone(map);
	}

	@Override
	public List<Map<String, Object>> findWebcodeList(String userType,
			String webcode) {
		if (Constrants.SYS_DEFINE_USER.equals(userType)) {
			return this.crmWorkerDao.findWebCodeList("");
		} else {
			return this.crmWorkerDao.findWebCodeList(webcode);
		}
	}

	@Override
	public List<String> findWorkerCodeByWebcode(String webcode) {
		return this.crmWorkerDao.findWorkerCodeByWebcode(webcode);
	}

}
