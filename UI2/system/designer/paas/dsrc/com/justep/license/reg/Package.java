package com.justep.license.reg;

import java.util.Date;

import org.apache.log4j.Logger;

public class Package extends BaseLoggerObject {
	static Logger logger = Logger.getLogger(Package.class);
	//非法的license
	public static int License_Illegal = 2;
	//有效的
	public static int License_OK = 1;
	//合法的但是已经失效
	public static int License_Invalid = 0;
	//校验失败
	public static int License_Unknown = 3;
	//校验失败
	public static int License_NoInit = 100;
	
	@Override
	public Logger getLogger() {
		return logger;
	}

	Package(String pkg,String UIP, String CIP) {
		this.pkg = pkg;
		UIServerIP = UIP;
		clientIP = CIP;
		autoAct = true;
		init(pkg);
	}
	
	Package(String pkg,String UIP, String CIP, boolean isAuto) {
		this.pkg = pkg;
		UIServerIP = UIP;
		clientIP = CIP;
		autoAct = isAuto;
		init(pkg);
	}

	protected native void init(String pkg);
	
	//机器码+system数据源+当前时间(4byte)+lincense有效时间+版本+库表+注册+在线+实际的库表+实际的注册+实际的在线+licenseLog
	private String licenseMD5;
	private String bizServerHID;
	private String bizServersMD5;
	private String runtimeVer;
	private String DBSysUrl;
	private Date bizServerTime;
	private Date validTime;
	private int licenseVersion;
	private int licenseTableCount;
	private int licenseRegistUserCount;
	private int licenseOnlineUserCount;
	private int licenseCpuCount = 1;
	private int tableCount;
	private int registUserCount;
	private int onlineUserCount;
	private int cpuCount = 1;
	private String UUID;
	private String activationCodes;
	private String licenseInfoID;
	private String authCode;
	private int state = License_NoInit;
	private String pkg;
	private String UIServerIP;
	private String clientIP;
	private boolean autoAct;
	

	public String getLicenseMD5() {
		return licenseMD5;
	}

	public void setLicenseMD5(String licenseMD5) {
		this.licenseMD5 = licenseMD5;
	}

	public String getBizServerHID() {
		return bizServerHID;
	}

	public void setBizServerHID(String bizServerHID) {
		this.bizServerHID = bizServerHID;
	}

	public String getDBSysUrl() {
		return DBSysUrl;
	}

	public void setDBSysUrl(String dBSysUrl) {
		DBSysUrl = dBSysUrl;
	}

	public Date getBizServerTime() {
		return bizServerTime;
	}

	public void setBizServerTime(Date bizServerTime) {
		this.bizServerTime = bizServerTime;
	}

	public long getBizServerTimeValue() {
		return bizServerTime.getTime()/1000;
	}

	public void setBizServerTime(long bizServerTime) {
		this.bizServerTime = new Date(bizServerTime*1000);
	}

	public String getUUID() {
		return UUID;
	}

	public void setUUID(String uUID) {
		UUID = uUID;
	}

	public String getActivationCodes() {
		return activationCodes;
	}

	public void setActivationCodes(String activationCodes) {
		this.activationCodes = activationCodes;
	}

	public String getLicenseInfoID() {
		return licenseInfoID;
	}

	public void setLicenseInfoID(String licenseInfoID) {
		this.licenseInfoID = licenseInfoID;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPkg() {
		return pkg;
	}

	public String getUIServerIP() {
		return UIServerIP;
	}

	public String getClientIP() {
		return clientIP;
	}

	public Date getValidTime() {
		return validTime;
	}

	public long getValidTimeValue() {
		return validTime.getTime()/1000;
	}

	public void setValidTime(long validTime) {
		this.validTime =new Date(validTime*1000);
	}

	public int getLicenseVersion() {
		return licenseVersion;
	}

	public void setLicenseVersion(int licenseVersion) {
		this.licenseVersion = licenseVersion;
	}

	public int getLicenseTableCount() {
		return licenseTableCount;
	}

	public void setLicenseTableCount(int licenseTableCount) {
		this.licenseTableCount = licenseTableCount;
	}

	public int getLicenseRegistUserCount() {
		return licenseRegistUserCount;
	}

	public void setLicenseRegistUserCount(int licenseRegistUserCount) {
		this.licenseRegistUserCount = licenseRegistUserCount;
	}

	public int getLicenseOnlineUserCount() {
		return licenseOnlineUserCount;
	}

	public void setLicenseOnlineUserCount(int licenseOnlineUserCount) {
		this.licenseOnlineUserCount = licenseOnlineUserCount;
	}

	public int getTableCount() {
		return tableCount;
	}

	public void setTableCount(int tableCount) {
		this.tableCount = tableCount;
	}

	public int getRegistUserCount() {
		return registUserCount;
	}

	public void setRegistUserCount(int registUserCount) {
		this.registUserCount = registUserCount;
	}

	public int getOnlineUserCount() {
		return onlineUserCount;
	}

	public void setOnlineUserCount(int onlineUserCount) {
		this.onlineUserCount = onlineUserCount;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public boolean isAutoAct() {
		return autoAct;
	}

	public String getBizServersMD5() {
		return bizServersMD5;
	}

	public void setBizServersMD5(String bizServersMD5) {
		this.bizServersMD5 = bizServersMD5;
	}

	public String getRuntimeVer() {
		return runtimeVer;
	}

	public void setRuntimeVer(String runtimeVer) {
		this.runtimeVer = runtimeVer;
	}

	public int getCpuCount() {
		return cpuCount;
	}

	public void setCpuCount(int cpuCount) {
		this.cpuCount = cpuCount;
	}

	public int getLicenseCpuCount() {
		return licenseCpuCount;
	}

	public void setLicenseCpuCount(int licenseCpuCount) {
		this.licenseCpuCount = licenseCpuCount;
	}
}
