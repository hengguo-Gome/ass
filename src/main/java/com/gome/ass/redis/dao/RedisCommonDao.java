package com.gome.ass.redis.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;


public interface RedisCommonDao {
	/**
	 * 开启redis事务
	 */
	public void multi();
	/**
	 * 事务回滚
	 */
	public void discard();
	/**
	 * 事务提交
	 */
	public void exec();
	
	public Set<Object> keyZSetGet(final String key);
	
	public Set<Object> keyZSetRangeGet(final String key,final Double start,final Double end);
	
	public void keyZSetRemove(final String key,final Object value);
	
	public void keyZSetRemoveList(final String key,final List<Object> values);
	
	public Map<String,String> keyMapGet(final String key);
	
	public void keyMapAdd(final String key,final Map<String,String> map,final Long expireSeconds) ;
	
	public void keyZSetAdd(final String key,final Double time,final Object value,final Date expireTime) ;
	
}
