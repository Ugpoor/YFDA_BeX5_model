package com.justep.cache;

import java.util.concurrent.ConcurrentHashMap;

import com.alibaba.fastjson.JSONObject;

public class SystemCache {
	public static ConcurrentHashMap<String, String> cache = new ConcurrentHashMap<String, String>();
}