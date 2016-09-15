package com.justep.desinger.report.mapping;

import java.util.HashMap;

public class DatasetInfo {
	
	private String datasetType;
	private String datasetID;
	private String datasetPath;
	
	private HashMap<String,String> paramMap = new HashMap<String,String>();
	
	public String getDatasetID() {
		return datasetID;
	}
	public void setDatasetID(String datasetID) {
		this.datasetID = datasetID;
	}
	public String getDatasetPath() {
		return datasetPath;
	}
	public void setDatasetPath(String datasetPath) {
		this.datasetPath = datasetPath;
	}
	public String getDatasetType() {
		return datasetType;
	}
	public void setDatasetType(String datasetType) {
		this.datasetType = datasetType;
	}
	public HashMap<String, String> getParamMap() {
		return paramMap;
	}
	public void setParamMap(HashMap<String, String> paramMap) {
		this.paramMap = paramMap;
	}
	
	
}
