package com.gome.ass.redis.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;


public interface RedisCommonDao {
	
	public Set<Object> keyZSetGet(final String key);
	
	public void keyZSetRemove(final String key,final Object value);
	
	public void keyZSetRemoveList(final String key,final List<Object> values);
	
	public Map<String,String> keyZMapGet(final String key);
	
}
