package com.gome.ass.redis.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.BoundZSetOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import com.gome.ass.redis.dao.RedisCommonDao;
@Repository("redisCommonDao")
public  class RedisCommonDaoImpl implements RedisCommonDao{
	@Resource
	private RedisTemplate<Object, Object> redisTemplate;
	
	
	
	@Override
	public void keyMapAdd(final String key,final Map<String,String> map,final Long expireSeconds) {
		BoundHashOperations<Object, Object, Object> boundHashOps = redisTemplate.boundHashOps(key);
		boundHashOps.putAll(map);
		if(null != expireSeconds){
			redisTemplate.expire(key, expireSeconds, TimeUnit.MILLISECONDS);
		}
	}
	
	@Override
	public Set<Object> keyZSetGet(final String key) {
		BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
		Set<Object> set = boundZSetOps.range(0, -1);
		return set;
	}
	@Override
	public void keyZSetRemove(final String key, final Object value) {
		BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
		boundZSetOps.remove(value);;
	}
	@Override
	public void keyZSetRemoveList(final String key, final List<Object> values) {
		BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
		for (Object value:values) {
			boundZSetOps.remove(value);
		}
	}
	@Override
	public Map<String, String> keyMapGet(final String key) {
		BoundHashOperations<Object, String, String> boundHashOps = redisTemplate.boundHashOps(key);
		Map<String, String> entries = boundHashOps.entries();
		return entries;
	}
	
	@Override
	public void keyZSetAdd(final String key,final Double time,final Object value,final Date expireTime) {
		BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
		boundZSetOps.add(value, time);
		if(null != expireTime){
			redisTemplate.expireAt(key, expireTime);
		}
	}

	@Override
	public Set<Object> keyZSetRangeGet(final String key,final Double start,final Double end) {
		BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
		Set<Object> set = boundZSetOps.rangeByScore(start, end);
		return set;
	}

	@Override
	public void multi() {
		redisTemplate.multi();
	}

	@Override
	public void discard() {
		redisTemplate.discard();
	}

	@Override
	public void exec() {
		redisTemplate.exec();
	}
	
	
}
