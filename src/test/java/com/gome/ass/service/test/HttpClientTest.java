package com.gome.ass.service.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import com.gome.ass.util.GzipAESUtil;

public class HttpClientTest {

	@Test
	public void http() {
//		String pre = "appUser/appLogin";
//		String pre = "appUser/appAlterPwd";
//		String pre = "appUser/appLogout";
//		String pre = "appUser/appCheckVersion";
		String pre = "appUser/appRegister";
		String url = "http://localhost:8080/ass/" + pre;
		JSONObject jo = new JSONObject();
		jo.put("sjId", "" + new Date().getTime());
		jo.put("jkId", "ass001");
		jo.put("mkId", "1001");

		jo.put("phone", "13681239343");
//		jo.put("password", "123456");
//		jo.put("snNo", "99000550356133");
//		jo.put("osInfo", "android 4.3");
//		jo.put("deviceInfo", "HM 1SC");
//		jo.put("isRoot", "0");
//		jo.put("isDouble", "0");
		
		jo.put("userId", "0004019153");
		jo.put("baiduId", "4dasxc");
		jo.put("appType", "android");
		jo.put("appVersion", "1.0.1");
//		jo.put("password", "797110");
//		jo.put("newPassword", "123456");

		try {
			HttpPost httppost = new HttpPost(url);
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			params.add(new BasicNameValuePair("ass", GzipAESUtil.compressThenEncryptAES(jo.toString())));
			httppost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			HttpResponse httpResponse = new DefaultHttpClient().execute(httppost);
			HttpEntity entity2 = httpResponse.getEntity();
			String result = EntityUtils.toString(entity2);
			System.out.println(GzipAESUtil.decryptAESThenUnCompress(result));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
