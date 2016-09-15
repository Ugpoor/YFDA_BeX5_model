package com.justep.weixin.cp;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Set;

public class JustepCpServiceCache implements Serializable{
	
	private static final long serialVersionUID = -2534159934736110562L;

	final static String WEIXINCONFIGCACHEKEY = "weixin_config_cache_key";
	
	private HashMap<String,WxCpServiceInstance> serviceInstances;
	
	public JustepCpServiceCache() {
		serviceInstances = new HashMap<String,WxCpServiceInstance>();
	}
	
	public int size() {
		return serviceInstances.size();
	}

	public void put(String key, WxCpServiceInstance instance) {
		serviceInstances.put(key, instance);
	}

	public WxCpServiceInstance get(String key) {
		return serviceInstances.get(key);
	}

	public Set<String> keySet() {
		return serviceInstances.keySet();
	}
	
}
