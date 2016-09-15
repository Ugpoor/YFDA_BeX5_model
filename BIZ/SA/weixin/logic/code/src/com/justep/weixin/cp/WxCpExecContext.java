package com.justep.weixin.cp;

public interface WxCpExecContext<T>{
	public T run(WxCpServiceInstance instance);
}
