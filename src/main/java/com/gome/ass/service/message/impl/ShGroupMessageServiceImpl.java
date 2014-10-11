package com.gome.ass.service.message.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.message.ShGroupMessageDao;
import com.gome.ass.jms.ShMessageGroupPushMQSender;
import com.gome.ass.service.message.ShGroupMessageService;
import com.gome.common.page.Page;

@Service("shGroupMessageService")
public class ShGroupMessageServiceImpl implements ShGroupMessageService {

	@Resource(name="shMessageGroupPushMQSender")
	private ShMessageGroupPushMQSender mqSender;
	@Resource
	private ShGroupMessageDao shGroupMessageDao;
	@Override
	public void sendMessage(Map<String, Object> map) {
		

	}

	@Override
	public List<Map<String, Object>> findGroupMessagePageList(Page page) {
		return this.shGroupMessageDao.findGroupMessagePageList(page);
	}

}
