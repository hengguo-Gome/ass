package com.gome.ass.aop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gome.ass.common.APPErrorInfo;
import com.gome.ass.common.Constrants;
import com.gome.ass.util.AESAPPUtils;
import com.gome.ass.util.GzipAESUtil;
import com.gome.ass.util.JsonUtil;
/**
 * 使用此AOP的几个条件：
 * 1
 *
 */
@Aspect
@Component
public class AppAccessInteceptor {
	
	public static Logger LOG = LoggerFactory.getLogger(AppAccessInteceptor.class);

	@Pointcut("execution(* com.gome.ass.controller.appUser.*.*(..))")
	public void app() {
	}
	
	@SuppressWarnings("unchecked")
	@Around("app()")
	public Object log(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		LOG.info("拦截到路径: " + request.getRequestURI());
		String parameter = request.getParameter(Constrants.APP_MESSAGE_KEY);
        String recive = AESAPPUtils.decryptAES(parameter);
        LOG.info("recive message:\t"+recive);
        
        Map<String, Object> map = JsonUtil.jsonStringToMap(recive);
        request.setAttribute(Constrants.APP_MESSAGE_KEY, map);//set the parameter to request attribute.
		String result = null;
		long beginTime = System.currentTimeMillis();//开始时间
		try {
			Object obj = joinPoint.proceed();
			long endTime = System.currentTimeMillis();//2、结束时间  
	        long consumeTime = endTime - beginTime;//3、消耗的时间  
	        if(consumeTime > 1000) {//此处认为处理时间超过1000毫秒的请求为慢请求  
	            LOG.warn(String.format("%s 请求耗费  %d millis", request.getRequestURI(), consumeTime));
	        }
			if(obj != null){//对于返回null值和不返回值的方法进行判断
				result = (String) obj;
				LOG.info("reply message:\t" + result);
			}else{
				return null;
			}
		} catch (Exception e) {
			LOG.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			obj.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			obj.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
			result = obj.toString();
		}
		return GzipAESUtil.compressThenEncryptAES(result);
	}

}
