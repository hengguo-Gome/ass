package com.gome.ass.dao.message;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.common.page.Page;

@Repository("shGroupMessageDao")
public interface ShGroupMessageDao {
	
	public void insert(Map<String, Object> map);
	
	public List<Map<String, Object>> findGroupMessagePageList(Page page);
	

}
