package com.justep.desinger.chart.runtime.data;

public class DataFeild {

	private String feildName;
	private String feildType;
	
	public DataFeild(String feildName ,String feildType){
		this.feildName = feildName;
		this.feildType = feildType;
	}
	
	public String getFeildName() {
		return feildName;
	}
	public void setFeildName(String feildName) {
		this.feildName = feildName;
	}
	public String getFeildType() {
		return feildType;
	}
	public void setFeildType(String feildType) {
		this.feildType = feildType;
	}
	
	
}
