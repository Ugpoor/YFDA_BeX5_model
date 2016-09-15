package com.justep.weixin.cp;

import java.util.List;

import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;

public class JustepCpServiceInstance {
	
	//static WeakHashMap<Integer,JustepCpServiceCache> cacheMap = new WeakHashMap<Integer,JustepCpServiceCache>();
	//static HashMap<Integer,JustepCpServiceCache> cacheMap = new HashMap<Integer,JustepCpServiceCache>();
	
	/*public static void init() {
		JustepCpServiceCache cache = new JustepCpServiceCache();
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		try {
			Thread.currentThread().setContextClassLoader(JustepCpServiceInstance.class.getClassLoader());
			List<WxCpInMemoryConfigStorage> corps = JustepCpConfigStorage.init();
			for (WxCpInMemoryConfigStorage corpConfig : corps) {
				WxCpServiceInstance instance = new WxCpServiceInstance(corpConfig);
				//cache.put(corpConfig.getCorpId() + corpConfig.getAgentId(),instance);
				cache.put("main",instance);
			}
			Integer cacheId = RandomUtils.nextInt();
			cacheMap.put(cacheId,cache);
			ActionUtils.getRequestContext().getSessionContext().put(JustepCpServiceCache.WEIXINCONFIGCACHEKEY,cacheId);
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
	}*/
	
	
	public static WxCpServiceInstance getInstance() {
		JustepCpServiceCache cache = new JustepCpServiceCache();
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		String configKey = WxCpHelper.getConfigKey();
		try {
			Thread.currentThread().setContextClassLoader(JustepCpServiceInstance.class.getClassLoader());
			List<WxCpInMemoryConfigStorage> corps = JustepCpConfigStorage.init();
			for (WxCpInMemoryConfigStorage corpConfig : corps) {
				WxCpServiceInstance instance = new WxCpServiceInstance(corpConfig);
				cache.put(corpConfig.getCorpId() + corpConfig.getAgentId(),instance);
				//cache.put("main",instance);
			}
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
		return cache.get(configKey);
	}
}
