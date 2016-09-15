package com.justep.weixin.cp;

import org.apache.commons.lang.StringUtils;

import com.justep.system.context.ContextHelper;

public class WxCpHelper {
	public static String getConfigKey(){
		String executeContext = ContextHelper.getActionContext().getExecuteContext();
		if(StringUtils.isNotEmpty(executeContext)){
			String[] params = executeContext.split(";");
			for(String param : params){
				if(param.startsWith("configKey=")){
					return param.split("=")[1];
				}
			}
		}
		throw new RuntimeException("请求参数configKey不存在，请检查url配置");
	}
	
	public static <T> T exec(WxCpExecContext<T> context) {
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		try {
			Thread.currentThread().setContextClassLoader(JustepCpServiceInstance.class.getClassLoader());
			WxCpServiceInstance instance =  JustepCpServiceInstance.getInstance();
			return context.run(instance);
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
	}
}
