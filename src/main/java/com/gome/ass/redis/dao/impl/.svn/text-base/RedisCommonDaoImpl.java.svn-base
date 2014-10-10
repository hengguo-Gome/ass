package com.gome.ass.redis.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.BoundZSetOperations;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import com.gome.ass.redis.dao.RedisCommonDao;
@Repository("redisCommonDao")
public  class RedisCommonDaoImpl implements RedisCommonDao{
	@Resource
	private RedisTemplate<Object, Object> redisTemplate;
	
	@Override
	public Set<Object> keyZSetGet(final String key) {
		
		Set<Object> execute = redisTemplate.execute(new RedisCallback<Set<Object>>() {
			public Set<Object> doInRedis(RedisConnection connection)
					throws DataAccessException {
				BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
				Set<Object> set = boundZSetOps.range(0, -1);
				return set;
			}
		});
		return execute;
	}
	@Override
	public void keyZSetRemove(final String key, final Object value) {
		redisTemplate.execute(new RedisCallback<Object>() {
			public Object doInRedis(RedisConnection connection)
					throws DataAccessException {
				BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
				boundZSetOps.remove(value);
				return null;
			}
		});
		
	}
	@Override
	public void keyZSetRemoveList(final String key, final List<Object> values) {
		redisTemplate.execute(new RedisCallback<Object>() {
			public Object doInRedis(RedisConnection connection)
					throws DataAccessException {
				BoundZSetOperations<Object, Object> boundZSetOps = redisTemplate.boundZSetOps(key);
				for (Object value:values) {
					boundZSetOps.remove(value);
				}
				return null;
			}
		});
		
	}
	@Override
	public Map<String, String> keyZMapGet(final String key) {
		Map<String, String> execute = redisTemplate.execute(new RedisCallback<Map<String, String>>() {
			public Map<String, String> doInRedis(RedisConnection connection)
					throws DataAccessException {
				BoundHashOperations<Object, String, String> boundHashOps = redisTemplate.boundHashOps(key);
				Map<String, String> entries = boundHashOps.entries();
				return entries;
			}
		});
		return execute;
	}
	
	
}
