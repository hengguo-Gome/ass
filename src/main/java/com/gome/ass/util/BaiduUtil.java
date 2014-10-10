package com.gome.ass.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 * 百度位置工具
 * @author Zhang.Mingji
 * @date 2014年6月6日上午10:06:07
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class BaiduUtil {

	private static final String APPKEY = "q6Ye1b5Q8hjBzGsXN3cVSmBo";
	
	/**
	 * 将地址转换成经纬度
	 * @param detailAddress
	 * @return
	 */
	public static Map<String,Double> convertDetailAddress2LongitudeAndLatitude(String detailAddress){
		HttpClient client = null;
		Map<String,Double> result = new HashMap<String,Double>();
		try {
			client = new DefaultHttpClient();
			if(detailAddress.lastIndexOf(",")!= -1){
				detailAddress = detailAddress.substring(0,detailAddress.lastIndexOf(","));
			}else if(detailAddress.lastIndexOf("，")!= -1){
				detailAddress = detailAddress.substring(0,detailAddress.lastIndexOf("，"));
			}
			detailAddress = detailAddress.replace(" ", "");
			HttpGet httpGet = new HttpGet("http://api.map.baidu.com/geocoder/v2/?address=" + detailAddress + "&output=json&ak=" + APPKEY);
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			String response = client.execute(httpGet, responseHandler);
			//System.out.println(response);
			Map map = JsonUtil.jsonStringToMap(response);
			map = (Map) map.get("result");
			map = (Map) map.get("location");
			double longitude = (Double) map.get("lng");
			double latitude = (Double) map.get("lat");
			result.put("longitude", longitude);
			result.put("latitude", latitude);
			System.out.println(longitude + " " + latitude);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			client.getConnectionManager().shutdown();
		}
		return result;
	}
	
	/**
	 * 将经纬度转换为地址
	 * @param longitude 纬度
	 * @param latitude 经度
	 * @return
	 */
	public static String convertLongitudeAndLatitude2DetailAddress(String longitude, String latitude){
		HttpClient client = null;
		String result = null;
		try {
			client = new DefaultHttpClient();
			HttpGet httpGet = new HttpGet("http://api.map.baidu.com/geocoder?location=" + latitude + "," + longitude + "&output=json&ak=" + APPKEY);
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			String response = client.execute(httpGet, responseHandler);
			//System.out.println(response);
			Map map = JsonUtil.jsonStringToMap(response);
			map = (Map) map.get("result");
			result = (String) map.get("formatted_address");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			client.getConnectionManager().shutdown();
		}
		return result;
	}
	
	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		Map<String, Double> map = convertDetailAddress2LongitudeAndLatitude("北京市");
		System.out.println(map);
		System.out.println(System.currentTimeMillis()-start);
		/*//convertDetailAddress2LongitudeAndLatitude("2502 天狮集团all-legend测试用地址一二三四五六七八九一二");
		System.out.println(getDistatce(113.849145,34.721918,113.834907,34.705203 ));
		System.out.println(getDistatce(113.849145,34.721918,113.834118,34.70755 ));
		String s = "dsacxczxcxzA，dsadsa";
		if(s.lastIndexOf("，")!= -1){
			s = s.substring(0,s.lastIndexOf("，"));
		}
		System.out.println(s);
		String a = "39.964578";
		double parseDouble = Double.parseDouble(a);
		System.out.println(parseDouble>0.5);*/
	}
	/**
	 * 计算两点之间的距离
	 * @param lon1
	 * @param lat1
	 * @param lon2
	 * @param lat2
	 * @return
	 */
	public static double getDistatce(double lon1,double lat1, double lon2,double lat2) {
        double R = 6371;
        double distance = 0.0;
        double dLat = (lat2 - lat1) * Math.PI / 180;
        double dLon = (lon2 - lon1) * Math.PI / 180;
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(lat1 * Math.PI / 180)
                * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2)
                * Math.sin(dLon / 2);
        distance = (2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))) * R;
        return distance;
    }
	
	
	
}
