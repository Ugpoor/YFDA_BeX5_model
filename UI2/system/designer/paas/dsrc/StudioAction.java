import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.log4j.Logger;


enum StudioDatabaseProduct {
	ORACLE, MSSQL, HSQLDB, SYBASE, DB2;
	public static StudioDatabaseProduct getProduct(Connection conn) throws SQLException {
		if (null == conn)
			StudioAction.logger.error("获取数据库厂商信息时获得的连接为空!");
		if (StudioAction.logger.isDebugEnabled()) {
			StudioAction.logger.debug("Connection product name:" + conn.getMetaData().getDatabaseProductName());
			StudioAction.logger.debug("Connection product version:" + conn.getMetaData().getDatabaseProductVersion());
		}
		if (conn.getMetaData().getDatabaseProductName().equals("Oracle"))
			return StudioDatabaseProduct.ORACLE;
		if (conn.getMetaData().getDatabaseProductName().equals("Microsoft SQL Server"))
			return StudioDatabaseProduct.MSSQL;

		if (conn.getMetaData().getDatabaseProductName().equals("sql server"))
			return StudioDatabaseProduct.SYBASE;
		if (conn.getMetaData().getDatabaseProductName().equals("ASE"))
			return StudioDatabaseProduct.SYBASE;
		if (conn.getMetaData().getDatabaseProductName().startsWith("DB2"))
			return StudioDatabaseProduct.DB2;
		if (conn.getMetaData().getDatabaseProductName().equals("HSQL Database Engine"))
			return StudioDatabaseProduct.HSQLDB;
		StudioAction.logger.error("未找到对应的数据库产品：" + conn.getMetaData().getDatabaseProductName());
		throw new SQLException("目前不支持数据库产品：" + conn.getMetaData().getDatabaseProductName());
	}
}

public class StudioAction extends com.justep.ui.impl.JProcessorImpl  {
    static Logger logger = Logger.getLogger(StudioAction.class);
	 
	private static String DATA_SOURCE = "java:comp/env/pt";

	private static String TABLE = "studioProductTracking";
	private static String DETAIL_TABLE = "studioProductTrackingDetail";
 
	private static String INSERT_SQL_MS = "insert into "+TABLE+" (fID, OS, VERSIONNUM, MAC, LOGININFO, TOTALTIME,CLIENTIP,SETUPDIR,RECTIME,LASTTIME,CONCEPTNUMS,PROCESSNUMS,WINDOWNUMS,USERNAME) values (?,?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?)";
	private static String INSERT_SQL_ORCL = "insert into "+TABLE+" (fID, OS, VERSIONNUM, MAC, LOGININFO, TOTALTIME,CLIENTIP,SETUPDIR,RECTIME, TIMES,LASTTIME,CONCEPTNUMS,PROCESSNUMS,WINDOWNUMS,USERNAME) values (?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?)";
 
	private static String CREATE_SQL_MS = "create table " + TABLE
			+ "(fID VARCHAR(50) not null,OS VARCHAR(50),VERSIONNUM VARCHAR(50),MAC VARCHAR(128),LOGININFO VARCHAR(512),TOTALTIME INT,CLIENTIP VARCHAR(20),SETUPDIR VARCHAR(256),RECTIME datetime,LASTTIME datetime,CONCEPTNUMS VARCHAR(256),PROCESSNUMS VARCHAR(256),WINDOWNUMS VARCHAR(256),USERNAME VARCHAR(100))";
	private static String CREATE_DETAIL_SQL_MS = "create table " + DETAIL_TABLE+"(fID VARCHAR(50) not null,MAINID  VARCHAR(50) not null,STARTTIME datetime ,ENDTIME datetime )";
	
	//oracle
	private static String CREATE_SQL_ORCL = "create table " + TABLE
			+ "(fID VARCHAR2(50) not null,OS VARCHAR2(50),VERSIONNUM VARCHAR2(50),MAC VARCHAR2(128),LOGININFO VARCHAR2(512),TOTALTIME NUMBER,CLIENTIP VARCHAR2(20),SETUPDIR VARCHAR2(256),RECTIME DATE,TIMES NUMBER,LASTTIME DATE,CONCEPTNUMS VARCHAR2(256),PROCESSNUMS VARCHAR2(256),WINDOWNUMS VARCHAR2(256),USERNAME VARCHAR2(100))";
	private static String CREATE_DETAIL_SQL_ORCL = "create table " + DETAIL_TABLE+"(fID VARCHAR2(50) not null,MAINID  VARCHAR2(50) not null,STARTTIME DATE ,ENDTIME DATE )";
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Connection conn = getConn();
//		try {
//			Statement smt = conn.createStatement();
//			ResultSet rs = smt.executeQuery("select * from "+TABLE);
//			StringBuffer sbf = new StringBuffer();
//			while(rs.next()){
//				sbf.append(rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getTimestamp(9)+"<br/>");
//			}
//			response.getWriter().write(sbf.toString());
//			response.getWriter().flush();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

	private Connection getConn() {
		try {
			InitialContext initCtx = new InitialContext();
			DataSource ds = (DataSource) initCtx.lookup(DATA_SOURCE);
			return ds.getConnection();
		} catch (SQLException exSql) {
			logger.error("SQL Exception:" + exSql.getMessage() + "</br>", exSql);
			return null;
		} catch (NamingException exNam) {
			logger.error("Naming Exception:" + exNam.getMessage() + "</br>", exNam);
			return null;
		}
	}

	private String getCreateTableSQL(Connection conn) {
		StudioDatabaseProduct dp = StudioDatabaseProduct.ORACLE;
		try {
			dp = StudioDatabaseProduct.getProduct(conn);
		} catch (SQLException e) {
			dp = StudioDatabaseProduct.ORACLE;
		}
		if (StudioDatabaseProduct.MSSQL == dp)
			return CREATE_SQL_MS;
		else if (StudioDatabaseProduct.SYBASE == dp)
			return CREATE_SQL_MS;
		else if (StudioDatabaseProduct.ORACLE == dp)
			return CREATE_SQL_ORCL;
		else
			return CREATE_SQL_ORCL;
	}

	private String getCreateDetailTableSQL(Connection conn) {
		StudioDatabaseProduct dp = StudioDatabaseProduct.ORACLE;
		try {
			dp = StudioDatabaseProduct.getProduct(conn);
		} catch (SQLException e) {
			dp = StudioDatabaseProduct.ORACLE;
		}
		if (StudioDatabaseProduct.MSSQL == dp)
			return CREATE_DETAIL_SQL_MS;
		else if (StudioDatabaseProduct.SYBASE == dp)
			return CREATE_DETAIL_SQL_MS;
		else if (StudioDatabaseProduct.ORACLE == dp)
			return CREATE_DETAIL_SQL_ORCL;
		else
			return CREATE_DETAIL_SQL_ORCL;
	}
	
	private void createTable(Connection conn,String tableName,String createSql) {
		ResultSet rs;
		try {
			rs = conn.getMetaData().getTables(null, null, tableName.toUpperCase(), null);//TABLE
			if (!rs.next()) {
				PreparedStatement stmt = null;
				try {System.out.println(createSql);
					stmt = conn.prepareStatement(createSql);//
					stmt.executeUpdate();
				} finally {
					try {
						if (stmt != null)
							stmt.close();
					} catch (Exception e) {
					}
				}
			}
		} catch (SQLException e) {
			logger.error("创建表：" + TABLE + "出错！", e);
		}
	}
 

	private void update(HttpServletRequest request, Connection conn) throws IOException {
		StudioDatabaseProduct dp = StudioDatabaseProduct.ORACLE;
		try {
			dp = StudioDatabaseProduct.getProduct(conn);
		} catch (SQLException e) {
			dp = StudioDatabaseProduct.ORACLE;
		}
		
		//.randomUUID().toString().toUpperCase().replaceAll("-", "");
		 String clientIP = request.getRemoteAddr();
		 String os = request.getParameter("os");
		 String versionNum = request.getParameter("version");
		 String mac = request.getParameter("mac");
		 String loginInfo = request.getParameter("loginInfo");
		 String totalTime = request.getParameter("totalTime");
		 String setupDir = request.getParameter("setupDir");
		 String id = "FID"+(mac+setupDir).hashCode();
		 
		 String processNums = request.getParameter("processNums");
		 String conceptNums = request.getParameter("conceptNums");
		 String windowNums = request.getParameter("windowNums");
		 
		 String userName = request.getParameter("userName");
		 if(userName == null){
			 userName = "";
		 }
		 if(processNums!=null){
			 processNums = processNums.replace("$",":");
		 }
		 if(conceptNums!=null){
			 conceptNums = conceptNums.replace("$",":");
		 }
		 if(windowNums!=null){
			 windowNums = windowNums.replace("$",":");
		 }
		 int iTotalTime = Integer.parseInt(totalTime);
		 
		 logger.debug("studio产品追踪信息："+os+"=="+versionNum+"=="+mac+"=="+loginInfo+"="+totalTime+"==processNums:"+processNums+"==conceptNums:"+conceptNums+"==:windowNums"+windowNums+"==:userName:"+userName);
		 Timestamp now = new Timestamp((new java.util.Date()).getTime());
		 Timestamp startTime = null,endTime = null;
		 String[] infos = loginInfo.split("-");
		if(infos.length==2){
			startTime = new Timestamp(Long.parseLong(infos[0]));
			endTime = new Timestamp(Long.parseLong(infos[1]));
		}
		if (StudioDatabaseProduct.MSSQL == dp){
			this.update_ms(conn, id, os, versionNum, mac,startTime,endTime, iTotalTime, clientIP,setupDir, now,conceptNums,processNums,windowNums,userName);
		}
		else if (StudioDatabaseProduct.SYBASE == dp){
			this.update_ms(conn, id, os, versionNum, mac,startTime,endTime, iTotalTime, clientIP,setupDir, now,conceptNums,processNums,windowNums,userName);
		}
		else if (StudioDatabaseProduct.ORACLE == dp)
			this.update_orcl(conn, id, os, versionNum, mac,startTime,endTime, iTotalTime, clientIP,setupDir, now,conceptNums,processNums,windowNums,userName);
		else{
			this.update_orcl(conn, id, os, versionNum,mac,startTime,endTime, iTotalTime, clientIP,setupDir, now,conceptNums,processNums,windowNums,userName);
		}
	}
	
	private void update_ms(Connection conn, String id, String os,String versionNum,String mac,Timestamp startTime,Timestamp endTime,int totalTime, String clientIP,String setupDir, Timestamp now,String conceptNums,String processNums,String windowNums,String userName) {
		PreparedStatement stmt = null;
		try {
			ResultSet rs = conn.createStatement().executeQuery("select TOTALTIME from "+TABLE+" where fID='"+id+"'" );
			if(rs.next()){
				int oldTime = rs.getInt(1);
				rs.close();
				String userField = "";
				if(userName != null && !userName.equals("")){
					userField = ",USERNAME=?";
				}
				stmt = conn.prepareStatement("update "+TABLE+" set TOTALTIME=?,LASTTIME=?,VERSIONNUM=?,CONCEPTNUMS=?,PROCESSNUMS=?,WINDOWNUMS=?,CLIENTIP=? "+userField+" where fID='"+id+"'");
				stmt.setInt(1, oldTime+totalTime);
				stmt.setTimestamp(2, now);
				stmt.setString(3, versionNum);
				
				stmt.setString(4, conceptNums);
				stmt.setString(5, processNums);
				stmt.setString(6, windowNums);
				stmt.setString(7, userName);
				if(userName != null && !userName.equals("")){
					stmt.setString(8,userName);
				}
				stmt.executeUpdate();
				//System.out.println("===========update"+oldTime+"=="+totalTime+versionNum);
			}else{
				stmt = conn.prepareStatement(INSERT_SQL_MS);
				stmt.setString(1, id);
				stmt.setString(2, os);
				stmt.setString(3, versionNum);
				stmt.setString(4, mac);
				stmt.setString(5, "");
				stmt.setInt(6, totalTime);
				stmt.setString(7, clientIP);
				stmt.setString(8, setupDir);
				stmt.setTimestamp(9, now);
				stmt.setTimestamp(10, now);
				
				stmt.setString(11, conceptNums);
				stmt.setString(12, processNums);
				stmt.setString(13, windowNums);
				stmt.setString(14, userName);
				stmt.executeUpdate();
			}
			String detailId = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			stmt = conn.prepareStatement("insert into "+DETAIL_TABLE+"(fID,MAINID,STARTTIME,ENDTIME)values(?,?,?,?)");
			stmt.setString(1, detailId);
            stmt.setString(2, id);
            stmt.setTimestamp(3, startTime);
            stmt.setTimestamp(4, endTime);
            stmt.executeUpdate();
		} catch (Exception e) {
			logger.error("执行sql：" + INSERT_SQL_MS + "出错！", e);
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
	}
	
	private void update_orcl(Connection conn, String id, String os,String versionNum,String mac,Timestamp startTime,Timestamp endTime,int totalTime, String clientIP,String setupDir, Timestamp now,String conceptNums,String processNums,String windowNums,String userName) {
		PreparedStatement stmt = null;
 		try {
			ResultSet rs = conn.createStatement().executeQuery("select TOTALTIME from "+TABLE+" where fID='"+id+"'" );
			if(rs.next()){
				int oldTime = rs.getInt(1);
				rs.close();
				String userField = "";
				if(userName != null && !userName.equals("")){
					userField = ",USERNAME=?";
				}
				
				stmt = conn.prepareStatement("update "+TABLE+" set TOTALTIME=?,LASTTIME=?,VERSIONNUM=? ,CONCEPTNUMS=?,PROCESSNUMS=?,WINDOWNUMS=?,CLIENTIP=? "+userField+" where fID='"+id+"'");
				stmt.setInt(1, oldTime+totalTime);
				stmt.setTimestamp(2, now);
				stmt.setString(3, versionNum);
				stmt.setString(4, conceptNums);
				stmt.setString(5, processNums);
				stmt.setString(6, windowNums);
				stmt.setString(7, clientIP);
				if(userName != null && !userName.equals("")){
					stmt.setString(8,userName);
				}
				stmt.executeUpdate();
				//System.out.println("===========update"+oldTime+"=="+totalTime+versionNum);
			}else{
				stmt = conn.prepareStatement(INSERT_SQL_ORCL);
				stmt.setString(1, id);
				stmt.setString(2, os); 
				stmt.setString(3, versionNum);
				stmt.setString(4, mac);
				stmt.setString(5, "");
				stmt.setInt(6, totalTime);
				stmt.setString(7, clientIP);
				stmt.setString(8, setupDir);
				stmt.setTimestamp(9, now);
				stmt.setInt(10, 1);
				stmt.setTimestamp(11, now);
				stmt.setString(12, conceptNums);
				stmt.setString(13, processNums);
				stmt.setString(14, windowNums);
				stmt.setString(15, userName);
				stmt.executeUpdate();
			}
			String detailId = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			stmt = conn.prepareStatement("insert into "+DETAIL_TABLE+"(fID,MAINID,STARTTIME,ENDTIME)values(?,?,?,?)");
			stmt.setString(1, detailId);
            stmt.setString(2, id);
            stmt.setTimestamp(3, startTime);
            stmt.setTimestamp(4, endTime);
            stmt.executeUpdate();
           // System.out.println("===========insert detail"+startTime+"=="+endTime);
		} catch (Exception e) {
			logger.error("执行sql：" + INSERT_SQL_ORCL + "出错！", e);
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
	}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	System.out.println("产品追踪，Size:" + request.getContentLength()+ ",URI:"+request.getRequestURI()+",addr:"+request.getRemoteAddr());
			Connection conn = getConn();
			if (null != conn) {
				try {
					createTable(conn,TABLE,getCreateTableSQL(conn));
					createTable(conn,DETAIL_TABLE,getCreateDetailTableSQL(conn));
			    	update(request, conn);
				} catch (Exception e) {
					logger.error("记录信息出错！", e);
				} finally {
					try {
						conn.close();
					} catch (Exception e) {
					}
				}
			} else {
				logger.error("没有获得" + DATA_SOURCE);
			}
	}
}
