package com.gome.ass.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;

import net.sf.json.JSONObject;

public class BeanJsonUtils {
    public static JSONObject convertBeanToJsonString(Object bean) 
    		throws IntrospectionException, IllegalAccessException, InvocationTargetException, InstantiationException { 
    	Class<?> type = bean.getClass(); 
    	JSONObject returnJSONObject = new JSONObject();
    	BeanInfo beanInfo = Introspector.getBeanInfo(type); 
    	
    	PropertyDescriptor[] propertyDescriptors =  beanInfo.getPropertyDescriptors(); 
    	for (int i = 0; i< propertyDescriptors.length; i++) { 
    		PropertyDescriptor descriptor = propertyDescriptors[i]; 
    		String propertyName = descriptor.getName(); 
    		if (!propertyName.equals("class")) { 
    			Method readMethod = descriptor.getReadMethod(); 
    			
    			Object result = readMethod.invoke(bean, new Object[0]); 
    			if (result != null ) { 
                    if(result instanceof Date){
                    	Date date = (Date)result;
                    	result = date.getTime()+"";
                    }else if(result instanceof Boolean){
                    	Boolean bo =(Boolean)result;
                    	if(bo == true){
                    		result = "1";
                    	}else{
                    		result = "0";
                    	}
                    }else{
                    	result = result +"";
                    }
                    returnJSONObject.put(propertyName, result); 
    			} 
    		} 
    	} 
    	return returnJSONObject; 
    } 
    
}
