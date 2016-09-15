package com.justep.license.reg;

import org.apache.log4j.Logger;

public abstract class BaseLoggerObject {
	public abstract Logger getLogger();
	
	public boolean isDebugEnabled(){
		Logger log = getLogger();
		return null!=log?log.isDebugEnabled():false;
	}
	
	public void logError(Object s){
		Logger log = getLogger();
		if(null!=log) log.error(s);
	}
	
	public void logInfo(Object s){
		Logger log = getLogger();
		if(null!=log) log.info(s);
	}

	public void logWarn(Object s){
		Logger log = getLogger();
		if(null!=log) log.warn(s);
	}

	public void logDebug(Object s){
		Logger log = getLogger();
		if(null!=log) log.debug(s);
	}
}
