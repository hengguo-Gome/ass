package com.gome.ass.common.bean;

import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.springframework.aop.AfterReturningAdvice;

import com.gome.ass.common.Constrants;
import com.gome.ass.common.annotation.MaintenanceCode;
import com.gome.ass.dao.system.ShCodeDao;
import com.gome.ass.entity.ShCode;


public class MaintenanceCodeAdvice implements AfterReturningAdvice{
	@Resource
	private ShCodeDao shCodeDao;

	@Override
	public void afterReturning(Object returnObj, Method method, Object[] obj, Object target) throws Throwable {
		MaintenanceCode annotation = method.getAnnotation(MaintenanceCode.class);
		if(annotation == null) return;
		String codeKey = annotation.codeKey();
		if("".endsWith(codeKey)){
			codeKey = String.valueOf(obj[0]);
		}
		if(Constrants.CODEMAP.get(codeKey) == null || Constrants.CODEMAP.get(codeKey).isEmpty()){
			throw new Exception("维护代码map的值不存在:" + codeKey);
		}else{
			Map<String, String> map = new TreeMap<String, String>(new Comparator<String>() {
				 public int compare(String o1, String o2) {  
		                return o1.compareTo(o2);  
		         }     
				
			});
			Constrants.CODEMAP.remove(codeKey);
			List<ShCode> list = shCodeDao.getCodeByKey(codeKey);
			for(ShCode hxCode : list){
				map.put(hxCode.getCodeKey(), hxCode.getCodeValue());
			}
			Constrants.CODEMAP.put(codeKey, map);
		}
	}

}
