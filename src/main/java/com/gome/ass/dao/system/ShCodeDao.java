package com.gome.ass.dao.system;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShCode;
import com.gome.common.page.Page;


@Repository("shCodeDao")
public interface ShCodeDao {
	List<ShCode> getAll();
	
	List<ShCode> getCodeByKey(String codeKey);
	
	List<Map<String, Object>> getShCodePageList(Page page);
	
	List<Map<String, Object>> getShCodeSettingByCodeId(String codeId);
	
	void insertSetting(ShCode shCode);
}
