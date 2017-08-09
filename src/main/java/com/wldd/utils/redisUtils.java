package com.wldd.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import redis.clients.jedis.Jedis;

import com.wldd.entity.Seller;

public class redisUtils {

	private static Logger logger = Logger.getLogger(Logger.class);

	/*
	 * 实例化一个jedis客户端
	 */
	private static Jedis getJedis() {
		logger.info("connect to redis at local");
		return new Jedis("127.0.0.1", 6379);
	}

	/*
	 * 注册时创建账号，先保存到redis
	 */
	public static void setAccount(String key, String value) {
		HashMap<String, String> userMap = new HashMap<String, String>();
		userMap.put("loginName", key);
		userMap.put("loginPassword", value);
		userMap.put("useTimeStamp", Long.toString(System.currentTimeMillis()));
		Jedis jedis = getJedis();
		jedis.hmset(key, userMap);
		logger.info("set account : " + key + " into redis..");
	}

	/*
	 * 注册时判断账号在redis中是否存在
	 */
	public static boolean accountIsExits(String key) {
		logger.info("accountIsExits:" + key);
		Jedis jedis = getJedis();
		List<String> userInfo = jedis.hmget(key, "loginName");// 没有则返回一个含有null的list
		jedis.hset(key, "useTimeStamp",
				Long.toString(System.currentTimeMillis()));
		if (userInfo.get(0) == null) {
			logger.info("this account is not exits");
			return true;
		} else {
			logger.info("this account is exits");
			return false;
		}
	}

	/*
	 * 注册时卖家用户信息保存
	 */
	public static void setUserInfo(String key, String name, String phone) {
		Jedis jedis = getJedis();
		jedis.hset(key, "sellerName", name);
		jedis.hset(key, "sellerPhone", phone);
		jedis.hset(key, "useTimeStamp",
				Long.toString(System.currentTimeMillis()));
		logger.info("add name and phone to account " + key);
	}

	/*
	 * 注册时个人用户信息保存
	 */
	public static void setPUserInfo(String key, String name, String phone) {
		Jedis jedis = getJedis();
		jedis.hset(key, "userName", name);
		jedis.hset(key, "userPhone", phone);
		jedis.hset(key, "useTimeStamp",
				Long.toString(System.currentTimeMillis()));
		logger.info("add name and phone to account " + key);
	}

	/*
	 * 注册时保存网店信息
	 */
	public static void setShopInfo(Seller seller) {
		Jedis jedis = getJedis();
		jedis.hset(seller.getLoginName(), "shopName", seller.getShopName());
		jedis.hset(seller.getLoginName(), "shopAddress",
				seller.getShopAddress());
		jedis.hset(seller.getLoginName(), "cardJY", seller.getCardJY());
		jedis.hset(seller.getLoginName(), "cardYY", seller.getCardYY());
		jedis.hset(seller.getLoginName(), "status", "0");
		jedis.hset(seller.getLoginName(), "useTimeStamp",
				Long.toString(System.currentTimeMillis()));
		logger.info("add shopinfo into account:" + seller.getLoginName());
	}

	/*
	 * 将数据放入redis
	 */
	public static void hset(String key, Map<String, String> map) {
		Jedis jedis = getJedis();
		map.put("useTimeStamp", System.currentTimeMillis() + "");
		jedis.hmset(key, map);
		logger.info("put data into redis--key:" + key);
	}

	/*
	 * 通过key获取对象信息 hash 将希望获取的param封装成list传入
	 */
	public static Map<String, String> hget(String key, List<String> paramList) {
		Jedis jedis = getJedis();
		jedis.hset(key, "useTimeStamp",
				Long.toString(System.currentTimeMillis()));
		Map<String, String> paramMap = new HashMap<String, String>();
		if (paramList != null) {
			for (String param : paramList) {
				paramMap.put(param, jedis.hget(key, param));
			}
			return paramMap;
		} else {
			logger.info("get all files in key : " + key);
			return jedis.hgetAll(key);
		}
	}

	/*
	 * 通过key获取对象信息 hash
	 */
	public static String hsget(String key, String field) {
		Jedis jedis = getJedis();
		return jedis.hget(key, field);
	}

	/*
	 * 删除长时间未用的key
	 */
	public static void clean() {
		Jedis jedis = getJedis();
		Set keys = jedis.keys("*");
		Iterator it = keys.iterator();

		long nowLong = System.currentTimeMillis();

		while (it.hasNext()) {
			String key = (String) it.next();
			String timeStamp = jedis.hget(key, "useTimeStamp");
			if (StringUtils.isEmpty(timeStamp)) {
				logger.info("resource:'" + key + "' no timestamp.");
				continue;
			}
			long useLong = Long.parseLong(timeStamp);
			long resultLong = (nowLong - useLong) / (1000 * 60);
			if (resultLong > 15) {
				logger.info("resource:'" + key + "' out of timestamp.");
				jedis.del(key);
			}
		}
		logger.info("redis clean down.");
	}

}
