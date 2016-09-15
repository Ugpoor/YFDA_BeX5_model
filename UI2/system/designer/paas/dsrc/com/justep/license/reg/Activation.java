package com.justep.license.reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.justep.common.SystemUtils;
import com.justep.filesystem.FileSystemWrapper;

public class Activation {
	static Logger logger = Logger.getLogger(Activation.class);
	
	private static String JNI = "license-activation-jni";
	private static String Query_License = "select FID,FSTATE,FGRANTTIME,FVALIDITYTIME,sysdate from PR_LICENCEINFOR where FLICENSEMD5=?";
	private static String Query_ACT_License = "select max(FRECTIME) as FRECTIME from PR_LICENSEACTLOG where FLICENSEINFOID=? and fkind=?";
	private static String Save_License1 = "insert into PR_LICENSEACTLOG (FID,FRECTIME,FACTIVOK,FSTATE,FBIZSERVERTIME,FBIZSERVERHID,FACTPKG,FACTCODES,FSYSDBURL,FRESULT,FRESULTMD5,FLICENSEINFOID,FUISERVERIP,FIP,FLVALIDTIME,FLVERSION,FLTABLECOUNT,FLREGISTUSERCOUNT,FLONLINEUSERCOUNT,FTABLECOUNT,FLEGISTUSERCOUNT,FONLINEUSERCOUNT,FACTSTATE,FAUTHORIZATIONCODE,FKIND,FBIZSERVERSMD5,FRUNTIMEVER,FLCPUCOUNT,FCPUCOUNT) values (?,sysdate,0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static String Save_License2 = "insert into PR_LICENSEACTERROR (FID,FRECTIME,FSTATE,FPKG,FUISERVERIP,FIP,FLICENSEMD5,FSYSDBURL,fKIND) values (?,sysdate,?,?,?,?,?,?,?)";
	private static String Update_License_activation_OK = "update PR_LICENSEACTLOG set FACTIVOK=1 where FID=?";
	
	static {
		//加载dll
		String dll = SystemUtils.normalizeLib(FileSystemWrapper.instance().getRealPath("/UI/system/service/common/lib"), JNI);
		System.load(dll);
	}
	
	Activation(){
	}
	
	public String activation(String pkg, String UIP, String CIP, Connection conn, boolean isAuto){
		Package o = new Package(pkg,UIP,CIP, isAuto);
		check(o, conn);
		ResultPackage rpkg = new ResultPackage(o);
		String id = saveToDB(o, rpkg, conn);
		String ret = "";
		if(Package.License_Invalid==o.getState()||Package.License_OK==o.getState()||Package.License_Illegal==o.getState()){
			ret = rpkg.getResult();
			if(o.isAutoAct()) ret += (":::"+o.getState());
		}
		//530以后版本增加返回激活记录号
		if(o.getLicenseVersion()>527)
			ret += ("!!!"+id);
		return ret;
	}
	
	public void activationOK(String key, Connection conn){
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(Update_License_activation_OK);
			stmt.setString(1, key);
			stmt.executeUpdate();
		} catch (Exception e) {
			logger.error("执行sql：" + Update_License_activation_OK + "出错！", e);
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
	}
	
	public String activation(String pkg, String UIP, String CIP, Connection conn){
		return activation(pkg, UIP, CIP, conn, true);
	}
	
	private String saveToDB(Package o, ResultPackage rpkg, Connection conn){
		int state = o.getState();
		String id = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
		//Timestamp now = new Timestamp((new java.util.Date()).getTime());
		if(Package.License_Invalid==state||Package.License_OK==state){//正常激活保存
			PreparedStatement stmt = null;
			try {
				//FID,FRECTIME,FSTATE,FBIZSERVERTIME,FBIZSERVERHID,FACTPKG,FACTCODES,FSYSDBURL,FRESULT,FRESULTMD5,FLICENSEINFOID,FUISERVERIP,FIP,
				//FLVALIDTIME,FLVERSION,FLTABLECOUNT,FLREGISTUSERCOUNT,FLONLINEUSERCOUNT,FTABLECOUNT,FLEGISTUSERCOUNT,FONLINEUSERCOUNT
				stmt = conn.prepareStatement(Save_License1);
				stmt.setString(1, id);
				//stmt.setTimestamp(2, now);
				String s = o.getActivationCodes();
				int x = (s==null||"".equals(s))?0:1; 
				stmt.setInt(2, x);
				stmt.setTimestamp(3, new Timestamp(o.getBizServerTime().getTime()));
				stmt.setString(4, o.getBizServerHID());
				stmt.setString(5, o.getPkg());
				stmt.setString(6, o.getActivationCodes());
				stmt.setString(7, o.getDBSysUrl());
				stmt.setString(8, rpkg.getResult());
				stmt.setString(9, rpkg.getMd5());
				stmt.setString(10, o.getLicenseInfoID());
				stmt.setString(11, o.getUIServerIP());
				stmt.setString(12, o.getClientIP());
				stmt.setTimestamp(13, new Timestamp(o.getValidTime().getTime()));
				stmt.setInt(14, o.getLicenseVersion());
				stmt.setInt(15, o.getLicenseTableCount());
				stmt.setInt(16, o.getLicenseRegistUserCount());
				stmt.setInt(17, o.getLicenseOnlineUserCount());
				stmt.setInt(18, o.getTableCount());
				stmt.setInt(19, o.getRegistUserCount());
				stmt.setInt(20, o.getOnlineUserCount());
				stmt.setInt(21, state);
				stmt.setString(22, o.getAuthCode());
				stmt.setInt(23, o.isAutoAct()?0:1);
				stmt.setString(24, o.getBizServersMD5());
				stmt.setString(25, o.getRuntimeVer());
				stmt.setInt(26, o.getLicenseCpuCount());
				stmt.setInt(27, o.getCpuCount());
				stmt.executeUpdate();
			} catch (Exception e) {
				logger.error("执行sql：" + Save_License1 + "出错！", e);
				e.printStackTrace();
			} finally {
				try {
					if (stmt != null)
						stmt.close();
				} catch (Exception e) {
				}
			}
		}else{//非法的激活保存
			PreparedStatement stmt = null;
			try {
				//FID,FRECTIME,FSTATE,FPKG,FUISERVERIP,FIP,FLICENSEMD5,FSYSDBURL
				stmt = conn.prepareStatement(Save_License2);
				stmt.setString(1, id);
				//stmt.setTimestamp(2, now);
				stmt.setInt(2, o.getState());
				stmt.setString(3, o.getPkg());
				stmt.setString(4, o.getUIServerIP());
				stmt.setString(5, o.getClientIP());
				stmt.setString(6, o.getLicenseMD5());
				stmt.setString(7, o.getDBSysUrl());
				stmt.setInt(8, o.isAutoAct()?0:1);
				stmt.executeUpdate();
			} catch (Exception e) {
				logger.error("执行sql：" + Save_License2 + "出错！", e);
				e.printStackTrace();
			} finally {
				try {
					if (stmt != null)
						stmt.close();
				} catch (Exception e) {
				}
			}
		}
		return id;
	}

	//检查60内是不是有激活
	private boolean existActBy60days(String licenseID, Timestamp nowTime, Timestamp createTime, Connection conn, long days, int kind){
		boolean ret = true;
		PreparedStatement stmt = null;
		ResultSet rs=null;
		try {
			stmt = conn.prepareStatement(Query_ACT_License);
			stmt.setString(1, licenseID);
			stmt.setInt(2, kind);
			rs=stmt.executeQuery();
			if(rs.next()){
				String s = "";
				Timestamp recTime = rs.getTimestamp("FRECTIME");
				if(null==recTime){
					recTime = createTime;
					s = "初始化";
				}
				long day = (nowTime.getTime()-recTime.getTime())/(24*days*60*1000);
				if(day<0 || day>days){
					logger.info("license["+licenseID+"]"+days+"天没有"+s+"激活，天数："+day);
					ret = false;
				}
			}else{
				long day = (nowTime.getTime()-createTime.getTime())/(24*days*60*1000);
				if(day<0 || day>days){
					logger.info("license["+licenseID+"]"+days+"天没有初始化激活，天数："+day);
					ret = false;
				}
			}
		} catch (Exception e) {
			logger.error("license["+licenseID+"],执行sql：" + Query_ACT_License + "出错！", e);
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
		return ret;
	}
	
	private int check(Package o, Connection conn){
		int ret = o.getState();
		if(Package.License_NoInit>ret){
			PreparedStatement stmt = null;
			ResultSet rs=null;
			try {
				stmt = conn.prepareStatement(Query_License);
				stmt.setString(1, o.getLicenseMD5());
				rs=stmt.executeQuery();
				if(rs.next()){
					String licenseID = rs.getString("FID");

					Timestamp validTime = rs.getTimestamp("FVALIDITYTIME");
					Timestamp createTime = rs.getTimestamp("FGRANTTIME");
					Timestamp nowTime = rs.getTimestamp("sysdate");
					
					if(null!=validTime && null!=createTime &&null!=nowTime){
						long days = 365;//统一使用激活期限为365天
						int kind = 0;
						if(!o.isAutoAct()){
							days = 365;
							kind = 1;
						}
						long day = (nowTime.getTime()-validTime.getTime())/(24*days*60*1000);
						if(day<=0){
							//判断60天内是不是有激活
							if(existActBy60days(licenseID, nowTime, createTime, conn, days, kind)){
								ret = rs.getInt("FSTATE");
								logger.info("license["+licenseID+"],MD5["+o.getLicenseMD5()+"]激活状态："+ret);
							}
							else{
								ret = Package.License_Invalid;
								logger.info("license["+licenseID+"],MD5["+o.getLicenseMD5()+"]"+days+"天没有激活记录");
							}
						} else{
							ret = Package.License_Invalid;
							logger.info("license["+licenseID+"],MD5["+o.getLicenseMD5()+"]已经失效");
						}
					} else{
						ret = Package.License_Invalid;
						logger.info("license["+licenseID+"],MD5["+o.getLicenseMD5()+"]相关时间数据无效");
					}
					o.setLicenseInfoID(licenseID);
				}else{
					ret = Package.License_Illegal;//非法
					logger.info("license MD5["+o.getLicenseMD5()+"]不存在的license信息");
				}
			} catch (Exception e) {
				ret = Package.License_Unknown;//校验失败
				logger.error("license MD5["+o.getLicenseMD5()+"],执行sql：" + Query_License + "出错！", e);
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
				} catch (Exception e) {
				}
			}
			o.setState(ret);
		}
		logger.info("license MD5["+o.getLicenseMD5()+"]激活状态："+ret);
		return ret;
	}
}
