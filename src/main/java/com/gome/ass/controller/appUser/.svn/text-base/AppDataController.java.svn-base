package com.gome.ass.controller.appUser;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gome.ass.common.APPErrorInfo;
import com.gome.ass.common.Constrants;
import com.gome.ass.service.logistics.CrmAccessoryBasicdataService;
import com.gome.ass.service.logistics.CrmInstallBillService;

@Controller
@RequestMapping("/appdata")
public class AppDataController {
	private static final Logger log = LoggerFactory.getLogger(AppDataController.class);

	@Resource
	private CrmInstallBillService crmInstallBillService;
	@Resource(name="crmAccessoryBasicdataService")
	private CrmAccessoryBasicdataService accessoryService;

	@RequestMapping(value = "/queryInstallBillData", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String queryInstallBillData(HttpServletRequest request) {
		JSONObject result = new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = crmInstallBillService.queryInstallBill(appParam);
		return result.toString();
	}
	
	@RequestMapping(value = "/updateInstallSuquence", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String updateInstallSuquence(HttpServletRequest request) {
		JSONObject result = new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		crmInstallBillService.updateInstallSuquence(appParam);
        result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00000);
        result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00000);
		return result.toString();
	}
	
	@RequestMapping(value = "/updateWorkerLocation", produces = "text/plain;charset=UTF-8")
	public void updateWorkerLocation(HttpServletRequest request) {
		try {
            Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
			crmInstallBillService.updateWorkerLocation(appParam);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}
	
	@RequestMapping(value = "/queryLegTrack", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String queryLegTrack(HttpServletRequest request) {
		JSONObject result = new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = crmInstallBillService.queryLegTrack(appParam);
		return result.toString();
	}
	
	@RequestMapping(value = "/queryAccessory", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String queryAccessory(HttpServletRequest request) {
		JSONObject result = new JSONObject();
        Map<String, Object> appParam = (Map<String, Object>) request.getAttribute(Constrants.APP_MESSAGE_KEY);
		result = accessoryService.selectAccessoryByName(appParam);
		return result.toString();
	}

}
