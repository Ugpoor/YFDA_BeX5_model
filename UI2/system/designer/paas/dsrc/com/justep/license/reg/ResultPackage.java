package com.justep.license.reg;

import org.apache.log4j.Logger;

public class ResultPackage extends BaseLoggerObject{
	static Logger logger = Logger.getLogger(ResultPackage.class);
	private Package pkg;
	private String result;
	private String md5;

	@Override
	public Logger getLogger() {
		return logger;
	}

	ResultPackage(Package pkg){
		this.pkg = pkg;
		generateResultPackage();
	}
	
	private native void generateResultPackage();

	public Package getPkg() {
		return pkg;
	}

	public String getResult() {
		return result;
	}

	public String getMd5() {
		return md5;
	}
}
