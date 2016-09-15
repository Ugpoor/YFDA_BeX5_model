package com.justep.chart.validate;

public class ValidateResult {

	private String name;  //属性或节点名
	private String path;  //检索path
	private String level; //级别
	private String info;  //错误或警告信息
	private String source; //分析字符串
	private String rule;   //验证规则
	private String scope;  //验证逻辑
	
	public String toString() {
		return "Name:" + this.name + " Level:" + this.level +" Source:" + source+ " Rule:"+ rule+ " Scope:" + scope +" Path:" + this.path + " Info:" +this.info ;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
}
