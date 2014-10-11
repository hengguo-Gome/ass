package com.gome.ass.service.message;

import java.util.List;
import java.util.Map;

import com.gome.common.page.Page;

public interface ShGroupMessageService {
	public void sendMessage(Map<String, Object> map);

	public List<Map<String, Object>> findGroupMessagePageList(Page page);

}
