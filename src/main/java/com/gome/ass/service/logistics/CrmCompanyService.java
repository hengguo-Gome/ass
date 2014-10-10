package com.gome.ass.service.logistics;

import java.util.List;

import com.gome.ass.entity.CrmCompany;

public interface CrmCompanyService {
	
    public void deleteBatch(List<String> ids);

    public void insertBatch(List<CrmCompany> crmCompanies);

}
