package com.gome.ass.service.logistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.logistics.CrmCompanyDao;
import com.gome.ass.entity.CrmCompany;
import com.gome.ass.service.logistics.CrmCompanyService;

@Service
public class CrmCompanyServiceImpl implements CrmCompanyService {
	
	@Resource
	private CrmCompanyDao crmCompanyDao;

	@Override
	public void deleteBatch(List<String> ids) {
	}

	@Override
	public void insertBatch(List<CrmCompany> crmCompanies) {
		// TODO Auto-generated method stub

	}

}
