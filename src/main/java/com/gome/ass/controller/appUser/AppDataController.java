package com.gome.ass.controller.appUser;

import java.util.HashMap;
import java.util.List;
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
import com.gome.ass.service.logistics.impl.CrmInstallBillServiceImpl;
import com.gome.ass.util.GzipAESUtil;
import com.gome.ass.util.ReciveMessageConvert;

@Controller
@RequestMapping("/appdata")
public class AppDataController {
	private static final Logger log = LoggerFactory
			.getLogger(AppDataController.class);

	@Resource
	private CrmInstallBillServiceImpl crmInstallBillServiceImpl;

	@RequestMapping(value = "/queryInstallBillData", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String queryInstallBillData(HttpServletRequest request) {
		Map<String, Object> appParam = null;
		JSONObject result = new JSONObject();
		try {
			appParam = new HashMap<String, Object>();
			appParam = ReciveMessageConvert.requestToMap(request);
			List<Map<String, String>> list = crmInstallBillServiceImpl.queryInstallBill(appParam);
			result.put("installs", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
		}
		return GzipAESUtil.compressThenEncryptAES(result.toString());
	}

}
