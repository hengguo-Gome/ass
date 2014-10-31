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

import com.gome.ass.util.AESAPPUtils;
import com.gome.ass.util.GzipAESUtil;

public class AppDataTest {
    
    
    @Test
    public void queryAccessory(){
        String pre = "appdata/queryAccessory";
        String url = "http://localhost:8080/ass/" + pre;
        JSONObject jo = new JSONObject();
        jo.put("sjId", "" + new Date().getTime());
        jo.put("jkId", "ass002");
        jo.put("mkId", "1004");
        jo.put("phone", "13263180885");
        jo.put("name", "a");
        try {
            HttpPost httppost = new HttpPost(url);
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("ass", AESAPPUtils.encryptAES(jo
                    .toString())));
            httppost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            HttpResponse httpResponse = new DefaultHttpClient()
                    .execute(httppost);
            HttpEntity entity2 = httpResponse.getEntity();
            String result = EntityUtils.toString(entity2);
            System.out.println(GzipAESUtil.decryptAESThenUnCompress(result));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
