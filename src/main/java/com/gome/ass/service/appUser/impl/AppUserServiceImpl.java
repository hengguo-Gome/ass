package com.gome.ass.service.appUser.impl;

import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.gome.ass.common.APPErrorInfo;
import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.common.Constrants;
import com.gome.ass.dao.permission.ShDeviceManageDao;
import com.gome.ass.entity.CrmWorker;
import com.gome.ass.entity.ShDeviceManage;
import com.gome.ass.entity.ShUserPwdInfo;
import com.gome.ass.jms.ShPasswordNoteMQSender;
import com.gome.ass.service.appUser.AppUserService;
import com.gome.ass.service.system.CommonMessageService;
import com.gome.ass.service.users.CrmWorkerService;
import com.gome.ass.service.users.ShUserPwdInfoService;
import com.gome.ass.util.MD5EncryptUtils;
import com.gome.ass.util.RandomPasswordUtil;

@Service("appUserService")
public class AppUserServiceImpl implements AppUserService {
	
	 private static final String APPPROPERTIES = "/app_sh.properties";
	 private static final String APPTYPE = "appType";
	
	@Resource
	private CrmWorkerService crmWorkerService;
	@Resource
	private CommonMessageService commonMessageService;
	@Resource
	private ShUserPwdInfoService shUserPwdInfoService;
	@Resource
	private ShDeviceManageDao shDeviceManageDao;
	@Resource
	private ShPasswordNoteMQSender shPasswordNoteMQSender;

	@Override
	public JSONObject appRegister(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		String phone = (String) map.get("phone");
		if (StringUtils.isBlank(phone)) {
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10001);
		} else {
			CrmWorker crmWorker = crmWorkerService.findWorkerByPhone(map);
			if (null == crmWorker) {
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10002);
			} else {
				String randomPassword = RandomPasswordUtil.genRandomPassword(6);
//				shPasswordNoteMQSender.send(map);
//				commonMessageService.sendMessageToMobile(phone,
//						"您登陆售后APP的随机密码为:" + randomPassword);
				
				ShUserPwdInfo shUser = new ShUserPwdInfo();
				shUser.setUserId(crmWorker.getWorkerCode());
				shUser.setPassword(MD5EncryptUtils.MD5Encode(randomPassword));
				shUser.setUserType(Constrants.CRM_WORKER);
    			this.shUserPwdInfoService.insertOrUpdate(shUser);
    			//成功更新密码后，调用短信接口发送随机密码
    			Map<String,Object> messageMap = new HashMap<String,Object>();
    			messageMap.put("mobileNo", phone);
    			messageMap.put("message", "您登陆售后APP的随机密码为:" + randomPassword);
    			shPasswordNoteMQSender.send(messageMap);
				result.put("result", 0);
			}
		}
		return result;
	}

	@Override
	public JSONObject appLogin(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		String phone = (String) map.get("phone");
		if (StringUtils.isBlank(phone)) {
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10001);
		} else {
			CrmWorker crmWorker = crmWorkerService.findWorkerByPhone(map);
			if (null == crmWorker) {
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10002);
			} else {
				if(crmWorker.getLogoutFlag().equals(BusinessGlossary.TRUE_INFO)){
					result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10005);
					result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10005);
				}else{
					String realPassword = crmWorker.getPassword();
					if (StringUtils.isBlank(crmWorker.getPassword())) {
						result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10004);
						result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10004);
					} else {
						String password = (String) map.get("password");
						if (MD5EncryptUtils.MD5Encode(password).equals(realPassword)) {
							Map<String, Object> inMap = new HashMap<String, Object>();
							inMap.put("userId", crmWorker.getWorkerCode());
							ShDeviceManage shDeviceManage = shDeviceManageDao.findShDeviceManageById(inMap);
							String snNo = (String) map.get("snNo");
							if(null == shDeviceManage){
								map.put("userId", crmWorker.getWorkerCode());
								map.put("status", BusinessGlossary.TRUE_INFO);
								shDeviceManageDao.insertShDeviceManage(map);
								result.put("userId", crmWorker.getWorkerCode());
								result.put("userName", crmWorker.getWorkerName());
							}else{
								if(shDeviceManage.getStatus().equals(BusinessGlossary.FALSE_INFO)){
									result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10008);
									result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10008);
								}else if(StringUtils.isNotBlank(snNo) && snNo.equals(shDeviceManage.getSnNo())){
									result.put("userId", crmWorker.getWorkerCode());
									result.put("userName", crmWorker.getWorkerName());
								}else{
									result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10006);
									result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10006);
								}
							}
						} else {
							result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10003);
							result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10003);
						}
					}
				}
			}
		}
		return result;
	}

	@Override
	public JSONObject appAlterPwd(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		String userId = (String) map.get("userId");
		if (StringUtils.isBlank(userId)) {
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, "用户id为空");
		} else {
			CrmWorker crmWorker = crmWorkerService.findWorkerByPhone(map);
			if (null == crmWorker) {
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10002);
			} else {
				String passwrod = (String) map.get("password");
				String newPassword = (String) map.get("newPassword");
				if(StringUtils.isNotBlank(passwrod) && StringUtils.isNotBlank(newPassword) && MD5EncryptUtils.MD5Encode(passwrod).equals(crmWorker.getPassword())){
				    
					Map<String, Object> userInfoMap = new HashMap<String, Object>();
					userInfoMap.put("userId", crmWorker.getWorkerCode());
					userInfoMap.put("password", MD5EncryptUtils.MD5Encode(newPassword));
					userInfoMap.put("userType", "crm");
					this.shUserPwdInfoService.updateByPrimaryKey(userInfoMap);
					result.put("result", 0);
				}else{
					result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10003);
					result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10003);
				}
			}
		}
		return result;
	}

	@Override
	public JSONObject appLogout(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		String userId = (String) map.get("userId");
		if (StringUtils.isBlank(userId)) {
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, "用户id为空");
		} else {
			CrmWorker crmWorker = this.crmWorkerService.findWorkerByPhone(map);
			if (null == crmWorker) {
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10002);
			} else {
				shDeviceManageDao.deleteShDeviceManage(map);
				result.put("result", 0);
			}
		}
		return result;
	}

	@Override
	public JSONObject appCheckVersion(Map<String, Object> map) throws Exception {
		JSONObject result = new JSONObject();
		String userId = (String) map.get("userId");
		if (StringUtils.isBlank(userId)) {
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10001);
			result.put(APPErrorInfo.ERRORMSG, "用户id为空");
		} else {
		 	Properties pro = new Properties();
	        Object obj = null;
	        File file = new ClassPathResource( APPPROPERTIES).getFile();
	        pro.load(new FileReader(file));
	        String appType = (String) map.get(APPTYPE);
	        
	        String baiduId = (String) map.get("baiduId") == null ? "": (String) map.get("baiduId");
	        String accessToken = (String) map.get("accessToken") == null ? "": (String) map.get("accessToken");
	        String clientVersion = (String)map.get("appVersion");
	        
	        ShDeviceManage shDeviceManage = new ShDeviceManage();
	        shDeviceManage.setUserId(userId);
	        shDeviceManage.setAccessToken(accessToken);
	        shDeviceManage.setBaiduId(baiduId);
	        shDeviceManage.setClientVersion(clientVersion);
	        shDeviceManageDao.updateShDeviceManage(shDeviceManage);
	        obj = pro.get(appType);
	        result = JSONObject.fromObject(obj);
		}
		
		return result;
	}

}
