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

public class PIHttpClientTest {

    public static void main(String[] args) throws ClientProtocolException, IOException {
        
        HttpPost httppost = new HttpPost("http://10.128.11.6:50000/sap/xi/adapter_plain?namespace=http://gome.com/DIS/COMMON/Outbound&interface=SI_FEEDBACK_Out&service=BC_MDIS&party=&agency=&scheme=&QOS=EO&sap-user=JLUSER&sap-password=JLUSER&sap-client=001&sap-language=EN");

        InputStream inputStream = null;
        Document read = null;
        try {
            inputStream = new ClassPathResource("PIMessage.xml").getInputStream();
            
            SAXReader sax = new SAXReader();
            read = sax.read(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
        StringEntity entity = new StringEntity(read.asXML(), "UTF-8");
        entity.setContentType("text/XML");
        httppost.setEntity(entity);
        HttpResponse httpResponse = new DefaultHttpClient().execute(httppost);
        HttpEntity entity2 = httpResponse.getEntity();
        String result = EntityUtils.toString(entity2);
        System.out.println(result);
    }
}
