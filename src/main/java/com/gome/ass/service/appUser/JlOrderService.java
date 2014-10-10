package com.gome.ass.service.appUser;

import java.util.Map;

import net.sf.json.JSONObject;

public interface JlOrderService {
    // 弹时间窗
    /**
     * 查找预能时间
     * @param inMap
     * @return
     * @throws Exception
     */
    public JSONObject findAvailableOrderDate(Map<String, Object> inMap) throws Exception;

    //订单延期修改预约时间
    /**
     * 更新安装订单预约时间
     * @param map
     * @return
     * @throws Exception
     */
    public JSONObject updateOrderAppoint(Map<String, Object> map) throws Exception;
    
    
	/**
	* @Title: appComplete
	* @Description: 订单回执
	* @param @param map
	* @auto liuchao
	* @throws
	*/
	public void appComplete(Map<String, Object> map);

	/**
	* @Title: appConcel
	* @Description: TODO 订单取消
	* @param @param map 设定文件
	* @return void 返回类型
	* @throws
	*/
	public void appConcel(Map<String, Object> map);
}
