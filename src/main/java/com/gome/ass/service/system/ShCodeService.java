package com.gome.ass.service.system;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.ShCode;
import com.gome.common.page.Page;

public interface ShCodeService {
	List<Map<String, Object>> getShCodePageList(Page page);
	
	List<Map<String, Object>> getShCodeSettingByCodeId(String codeId);
	
	void insertSetting(String codeId, ShCode code);

}
