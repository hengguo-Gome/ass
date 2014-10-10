package com.gome.common.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;

public class HttpClientUtils {
	
	public static String postData(String url,String content){
		try{
			HttpClient client = new HttpClient();
			PostMethod post = new PostMethod(url);
			RequestEntity re = new StringRequestEntity(content,"text/XML","UTF-8");
			post.setRequestEntity(re);
			client.executeMethod(post);
			return post.getResponseBodyAsString();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
