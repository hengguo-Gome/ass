package com.gome.ass.service.message.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.Constrants;
import com.gome.ass.dao.message.ShGroupMessageDao;
import com.gome.ass.entity.ShGroupMessage;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.message.ShGroupMessageService;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.ass.util.UUIDUtil;
import com.gome.common.page.Page;
import com.gome.common.util.AsynchronousSendMsgUtils;


@Service("shGroupMessageService")
public class ShGroupMessageServiceImpl implements ShGroupMessageService {

	@Resource
	private ShGroupMessageDao shGroupMessageDao;
	@Resource
	private CrmWorkerService crmWorkerService;
	
	@Override
	public void saveGroupMessage(ShUser user, String content, String title, String workerIds, String webcode, String type){
		List<String> workers = new ArrayList<String>();
		String scope = null;
		if(Constrants.SEND_GROUP_MESSAGE.equals(type)){//选组
			workers = this.crmWorkerService.findWorkerCodeByWebcode(webcode);
			scope = "网点";
		}else if(Constrants.SEND_PERSON_MESSAGE.equals(type)){//选人
			if(null != workerIds){//指定了人员
				String[] ids = workerIds.split(",");
				workers = Arrays.asList(ids);
				scope = "工人";
			}
		}
		for(String workerId: workers){
			ShGroupMessage message = new ShGroupMessage();
			//保存消息
			message.setId(UUIDUtil.getUUID());
			message.setTitle(title);
			message.setContent(content);
			message.setWorkerId(workerId);
			message.setSendtime(new Date());
//			message.setMsgtime(msgtime);
			message.setScope(scope);
			message.setType(BusinessGlossary.MOBILE_MESSAGE_TYPE_SYSTEM);
			message.setSendUserId(user.getAccount());
			message.setSendUserType(user.getFromType());
			this.shGroupMessageDao.insertShGroupMessage(message);
			
			AsynchronousSendMsgUtils.sendMessageToMobile(content, title, workerId, null);
		}
	}

	@Override
	public List<Map<String, Object>> findGroupMessagePageList(Page page) {
		return this.shGroupMessageDao.findGroupMessagePageList(page);
	}

}
