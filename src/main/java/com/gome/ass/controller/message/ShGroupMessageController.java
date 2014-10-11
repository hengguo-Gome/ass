package com.gome.ass.controller.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.Constrants;
import com.gome.ass.controller.crm.MessageController;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.message.ShGroupMessageService;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.ass.util.JsonUtil;
import com.gome.common.page.Page;


@Controller
@RequestMapping("/groupMessage")
public class ShGroupMessageController {

	private static Logger log = LoggerFactory.getLogger(MessageController.class);
	@Resource
	private ShGroupMessageService shGroupMessageService;
	@Resource
	private CrmWorkerService crmWorkerService;
	
	/**
	 * 保存用户百度消息UserId和chanelId
	 * @return
	 * @throws Exception
	 
	@RequestMapping(value="/saveUserIdAndChanelId")
	public @ResponseBody String saveUserIdAndChanelId(HttpServletRequest request, HttpServletResponse response, String mtms) throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String jsonString = AESAPPUtils.decryptAES(mtms);
			Map<String,Object> pmap = JsonUtil.jsonStringToMap(jsonString);
			String driverId = (String) pmap.get("driverId");
			String userId = (String) pmap.get("userId") == null ? "" :(String) pmap.get("userId");
			String chanelId = (String) pmap.get("chanelId");
			String devicetoken = (String) pmap.get("devicetoken") == null ? "" : (String) pmap.get("devicetoken");
			String ryType = (String) pmap.get("ryType");
			
			String jkId = (String) pmap.get("jkId");
            String mkId = (String) pmap.get("mkId");
            String sjId = (String) pmap.get("sjId");
            String snId = (String) pmap.get("snId");
            String btnId = (String) pmap.get("btnId");
            
            Date date = new Date(Long.parseLong(sjId));
			
            log.info("driverId=" + driverId + " userId=" + userId + " chanelId=" + chanelId + " devicetoken=" + devicetoken);
			
            
            Map<String, Object> inMap = new HashMap<String, Object>();
            inMap.put("userId", driverId);
            inMap.put("userType", ryType);
			DeviceManage dm = deviceManageService.findDeviceManageById(inMap);
            
			if(dm != null){
				dm.setAccessToken(devicetoken);
				dm.setBaiduId(userId);
				deviceManageService.updateDeviceManage(dm);
			}else{
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
				result.put(APPErrorInfo.ERRORMSG, "未查找到改人员");
			}
			String jsonStr = LogUtil.getLogJsonString(new Date(), this.getClass().getName(), jkId, mkId, date, snId, JsonUtil.javaObjectToJsonString(result), btnId, null);
			
			logMessageSender.send(jsonStr);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10001);
		}
		return GzipAESUtil.compressThenEncryptAES(JsonUtil.javaObjectToJsonString(result));
	}
	*/
	/**
	 * 查找CRM客诉消息
	 * @param request
	 * @param response
	 * @param mtms
	 * @return
	 * @throws Exception
	 
	@RequestMapping(value="/findCRMMessage")
	public @ResponseBody String findMessageByType(HttpServletRequest request, HttpServletResponse response, String mtms) throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		
		try {
			String jsonString = AESAPPUtils.decryptAES(mtms);
			
			Map<String,Object> pmap = JsonUtil.jsonStringToMap(jsonString);
			
			Map<String,Object> inMap = new HashMap<String,Object>();
			int preLoad = Integer.parseInt((String)pmap.get("currentItemNo"));
			int pageSize = Integer.parseInt((String)pmap.get("loadCount"));
			int currentPageNumber = (preLoad / pageSize) + 1;
			
			String jkId = (String) pmap.get("jkId");
			String mkId = (String) pmap.get("mkId");
			String sjId = (String) pmap.get("sjId");
			String snId = (String) pmap.get("snId");
			String btnId = (String) pmap.get("btnId");
			Date date = new Date(Long.parseLong(sjId));

			PaginationParameters pagParam = new PaginationParameters();
			pagParam.setCurrentPageNumber(currentPageNumber);
			pagParam.setPageMaxSize(pageSize);
			pagParam.setAlreadyLoadCount(preLoad);
			
			String spbm = (String) pmap.get("SPBM");
			String csmc = (String) pmap.get("CSMC");
			String splx = (String) pmap.get("SPLX");
			String sppp = (String) pmap.get("SPPP");
			String orderBy = (String) pmap.get("orderBy");
			inMap.put("SPBM", spbm);
			inMap.put("CSMC", csmc);
			inMap.put("SPLX", splx);
			inMap.put("SPPP", sppp);
			
			pagParam.setOrderBy(orderBy);
			
			Page page = this.crmMessageService.findCRMMessageByPage(inMap, pagParam);
			//result.put("page", page);
			if(null == page){
				result.put("dataList", new ArrayList());
			}else{
				result.put("dataList", page.getDataList());
			}
			String jsonStr = LogUtil.getLogJsonString(new Date(), this.getClass().getName(), jkId, mkId, date, snId, JsonUtil.javaObjectToJsonString(result), btnId, null);
			
			logMessageSender.send(jsonStr);
			
			log.info(jsonStr);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10001);
		}
		
		return GzipAESUtil.compressThenEncryptAES(JsonUtil.javaObjectToJsonString(result));
	}
	*/
	
	/**
	 * 去消息列表界面
	 * @param request
	 * @param response
	 * @param mtms
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/groupMessageListView")
	public String groupMessageListView(HttpServletRequest request, HttpServletResponse response, String mtms) throws Exception{
		return "message/groupMessageList";
	}
	
	/**
	 * 查找物流经理发送的消息
	 * @param request
	 * @param response
	 * @param mtms
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findGroupMessagePageList", produces="text/plain;charset=UTF-8")
	public @ResponseBody String  findGroupMessagePageList(HttpServletRequest request,  Page page,  HttpServletResponse response, String mtms) throws Exception{
		ShUser user = (ShUser)request.getSession().getAttribute(Constrants.USER_INFO);
		Map<String, Object> inMap = new HashMap<String, Object>();
    	inMap.put("type", request.getParameter("type"));
    	inMap.put("content", request.getParameter("content"));
    	inMap.put("webcode", user.getWebcode());
    	page.setParam(inMap);
    	List<Map<String,Object>> result = this.shGroupMessageService.findGroupMessagePageList(page);
		return JsonUtil.writeListToDataGrid(page.getTotalResult(),result);
	}
	
	/**
	 * 保存并发送物流经理群发的消息
	 * @param request
	 * @param response
	 * @param mtms
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveWuliuManagerMessage", produces="text/plain;charset=UTF-8")
	public @ResponseBody String saveWuliuManagerMessage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
//		Message msg = new Message();
//		
//		Map<String, Object> userInfo = (Map<String, Object>) request.getSession().getAttribute("userInfo");
//		
//		msg.setContent(request.getParameter("content"));
//		msg.setTitle(request.getParameter("title"));
//		String driverIds = request.getParameter("driverIds");
//		String groupId = request.getParameter("groupId");
//		String type = request.getParameter("type");
//		this.messageService.transSendMessage(userInfo, msg, driverIds, groupId, type);
		return JsonUtil.javaObjectToJsonString(result);
	}
	
	@RequestMapping(value="/findWebcodeList", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String findWebcodeList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ShUser user = (ShUser)request.getSession().getAttribute(Constrants.USER_INFO);
		
		List<Map<String, Object>> result = this.crmWorkerService.findWebcodeList(user.getFromType(), user.getWebcode());
		return JsonUtil.javaObjectToJsonString(result);
	}
}
