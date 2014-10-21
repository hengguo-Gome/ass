package com.gome.ass.service.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;

public class CopyOfCrmMessageClientTest {

    public static void main(String[] args) throws ClientProtocolException, IOException {
        
        HttpPost httppost = new HttpPost("http://localhost:8080/ass/message/processCrmMessage");
        	System.out.println(1);
        InputStream inputStream = null;
        Document read = null;
        try {
            inputStream = new ClassPathResource("crmMessage.xml").getInputStream();
            
            SAXReader sax = new SAXReader();
            read = sax.read(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }

        StringEntity entity = new StringEntity(read.asXML(), "UTF-8");
        httppost.setEntity(entity);
        HttpResponse httpResponse = new DefaultHttpClient().execute(httppost);
        HttpEntity entity2 = httpResponse.getEntity();
        String result = EntityUtils.toString(entity2);
        System.out.println(result);
    }
}
