import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.justep.db.DBUtils;
import com.justep.db.DatabaseProduct;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.license.reg.LicenseUtils;
import com.justep.ui.util.Escape;

public class Reg extends com.justep.ui.impl.JProcessorImpl {
	static Logger logger = Logger.getLogger(Reg.class);
	private static String REG_HTML_FILENAME = "/UI/system/service/common/reg.html";
	private static String DATA_SOURCE = "java:comp/env/pt";
	private static String Query_License = "select FID,FSTATE,FGRANTTIME,FVALIDITYTIME,sysdate from PR_LICENCEINFOR where FLICENSEMD5=?";
	//指定需要执行的action
	private static String ACTION = "var __reg__={action:\"dataQueryAction\",params:{ksql:\"select SA_OPOrg.sName from SA_OPOrg SA_OPOrg where SA_OPOrg.sOrgKindID='ogn'\",dataModel:\"/system/data\"}}";
	private static String KILLACTION = "var __reg__={action:'__getName__',k:128,params:{p:{'@ac':'%s'}}}";
	//支持新的action __getName__ 参数P
	//private static String ACTION_NAME = "dataQueryAction";
	//private static String PROCESS = "/SA/OPM/system/systemProcess";
	//private static String ACTIVITY = "mainActivity";
	//private static String ACTION2 = "var __reg__={action:\"__getName__\",params:{@ac:\"\",@p:\"\",@ay:\"\",ksql:\"select SA_OPOrg,SA_OPOrg.sParent,SA_OPOrg.sName,SA_OPOrg.sOrgKindID from SA_OPOrg SA_OPOrg where not(SA_OPOrg.sOrgKindID='psm')\",dataModel:\"/system/data\"}}";
	
	private static String TABLE = "productTracking";
	//MS SQL
	//if exists(select 1 from T where T.SERVERIP=? and T.IP=? and T.KIND=?) update T set T.DATA=?,T.RECTIME=? Where T.SERVERIP=? and T.IP=? and T.KIND=? else insert into T (ID, DATA, IP, SERVERIP, KIND, RECTIME) values (?, ?, ?, ?, ?, ?);
	//oracle
	//MERGE INTO T T1 USING (SELECT ? AS IP,? AS SERVERIP, ? AS KIND FROM dual) T2 ON (T1.IP=T2.IP AND T1.SERVERIP=T2.SERVERIP AND T1.KIND=T2.KIND) WHEN MATCHED THEN UPDATE SET T1.DATA=?,T1.RECTIME=? WHEN NOT MATCHED THEN INSERT (ID, DATA, IP, SERVERIP, KIND, RECTIME) values (?, ?, ?, ?, ?, ?);
	
	private static String INSERT_SQL_MS = "if exists(select 1 from "+TABLE+" where SERVERIP=? and IP=? and KIND=?) update "+TABLE+" set TIMES=TIMES+1,DATA=?,RECTIME=?,CUSTOMERCODE=?,LICENSEID=? Where SERVERIP=? and IP=? and KIND=? else insert into "+TABLE+" (ID, DATA, IP, SERVERIP, KIND, RECTIME, CUSTOMERCODE, LICENSEID) values (?, ?, ?, ?, ?, ?, ?, ?);";
	private static String EXIST_SQL_ORCL = "SELECT count(ID) AS cnt FROM "+TABLE+" where SERVERIP=? and IP=? and KIND=?";
	private static String INSERT_SQL_ORCL = "insert into "+TABLE+" (ID, DATA, IP, SERVERIP, KIND, RECTIME, TIMES, CUSTOMERCODE, LICENSEID, DATA2, FAUTHORIZATIONCODE) values (?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?)";
	private static String UPDATE_SQL_ORCL = "update "+TABLE+" set TIMES=TIMES+1,DATA=?,RECTIME=sysdate,CUSTOMERCODE=?,LICENSEID=?,DATA2=?,FAUTHORIZATIONCODE=? Where SERVERIP=? and IP=? and KIND=?";
	private static String UPDATE_SQL_ORCL2 = "update "+TABLE+" set TIMES=TIMES+1,DATA=?,RECTIME=sysdate,DATA2=? Where SERVERIP=? and IP=? and KIND=?";
	//MS SQL
	private static String CREATE_SQL_MS = "create table " + TABLE
			+ "(ID VARCHAR(50) not null,DATA image,IP VARCHAR(256),SERVERIP VARCHAR(256),KIND VARCHAR(10),RECTIME datetime)";
	//oracle
	private static String CREATE_SQL_ORCL = "create table " + TABLE
			+ "(ID VARCHAR2(50) not null,DATA BLOB,IP VARCHAR2(256),SERVERIP VARCHAR2(256),KIND VARCHAR2(10),RECTIME DATE,TIMES NUMBER)";
	
	//private static String SELECT = "select ID, DATA, IP, SERVERIP, KIND, RECTIME from " + TABLE;
	//private static String DELETE = "drop table " + TABLE;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<?,?> Param = request.getParameterMap();
		
		if ("d".equals(request.getParameter("t"))) {
			logger.info("产品追踪:获取action");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-javascript");
			PrintWriter out = response.getWriter();
			out.write(ACTION);
		} else if ("a".equals(request.getParameter("t"))) {
			String k = request.getParameter("k");
			logger.info("激活确认:"+k);
			Connection conn = DBUtils.getConn(DATA_SOURCE);
			if (null != conn) {
				try {
					LicenseUtils.licenseActivationOK(k, conn);
				} finally {
					try {
						conn.close();
					} catch (Exception e) {
					}
				}
			}
		} else if ("d1".equals(request.getParameter("t"))) {			
				logger.info("产品追踪:获取加密action");
				String licenseMD5 = request.getParameter("@l");
				String key = request.getParameter("@d");
				boolean kill = false;
				if(null!=licenseMD5 && !"".equals(licenseMD5)
					&& null!=key && !"".equals(key)){
					//两次循环加密，增加破解难度
					key = Escape.decrypt(key, licenseMD5);
					licenseMD5 = Escape.decrypt(licenseMD5, key);
					Connection conn = DBUtils.getConn(DATA_SOURCE);
					if (null != conn) {
						try {
							PreparedStatement stmt = null;
							ResultSet rs=null;
							try {
								stmt = conn.prepareStatement(Query_License);
								stmt.setString(1, licenseMD5);
								rs=stmt.executeQuery();
								if(rs.next()){
									Timestamp validTime = rs.getTimestamp("FVALIDITYTIME");
									Timestamp nowTime = rs.getTimestamp("sysdate");
									int state = rs.getInt("FSTATE");
									
									long day = (nowTime.getTime()-validTime.getTime())/(24*60*60*1000);
									kill = (state==0||day>0);
								}else{
									kill = false;
									logger.info("license MD5["+licenseMD5+"]不存在的license信息");
								}
							} catch (Exception e) {
								logger.error("license MD5["+licenseMD5+"],执行sql：" + Query_License + "出错！", e);
							} finally {
								try {
									if (rs != null)
										rs.close();
									if (stmt != null)
										stmt.close();
								} catch (Exception e) {
								}
							}
						} catch (Exception e) {
							logger.error("license MD5["+licenseMD5+"],有效性检查出错！", e);
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
				String actionStr = !kill?ACTION:String.format(KILLACTION, Escape.encrypt("sys.kill",key));
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/x-javascript");
				PrintWriter out = response.getWriter();
				Random r = new Random();
				String pwd = ""+r.nextInt(999999);
				String code = "eval(justep.String.Decrypt('"+Escape.encrypt(actionStr, pwd)+"','"+pwd+"'))";
				out.write(code);
		} else if(Param.containsKey("@k") && Param.containsKey("@d") && Param.containsKey("@u")){
			//lincense激活请求
			logger.info("lincense激活请求");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-javascript");
			PrintWriter out = response.getWriter();
			String pwd = request.getParameter("@k");
			String postData = request.getParameter("@d");
			String UIServerIP = request.getParameter("@u");
			UIServerIP = Escape.decrypt(UIServerIP, pwd);
			String clientIP = request.getRemoteAddr();
			//特殊处理，将“ ”替换回"+",URL的编码规则
			postData = postData.replaceAll(" ", "+");
			
			String ret = "";
			Connection conn = DBUtils.getConn(DATA_SOURCE);
			if (null != conn) {
				try {
					String s = LicenseUtils.licenseActivation(postData, UIServerIP, clientIP, conn);
					if("".equals(s)) ret = "";
					else ret = "var __data__='"+Escape.encrypt(s, pwd)+"';";
				} catch (Exception e) {
					logger.error("license激活出错！", e);
				} finally {
					try {
						conn.close();
					} catch (Exception e) {
					}
				}
			} else {
				logger.error("没有获得" + DATA_SOURCE);
			}
			
			out.write(ret);
		} else {
			//返回页面，触发返回请求
			logger.info("产品追踪:返回页面");
			String fileName = FileSystemWrapper.instance().getRealPath(REG_HTML_FILENAME);
			File file = new File(fileName);
			try {
				FileInputStream fis = new FileInputStream(file);
				response.setContentType("text/html");
				OutputStream out = response.getOutputStream();
				byte[] bs = new byte[1024 * 4];
				int i = -1;
				while ((i = fis.read(bs)) != -1) {
					out.write(bs, 0, i);
				}
				out.flush();
				fis.close();
			} catch (FileNotFoundException e) {
				throw new ServletException("获取文件失败！", e);
			}
		}
	}

	private String getCreateTableSQL(Connection conn) {
		DatabaseProduct dp = DatabaseProduct.ORACLE;
		try {
			dp = DatabaseProduct.getProduct(conn);
		} catch (SQLException e) {
			dp = DatabaseProduct.ORACLE;
		}
		if (DatabaseProduct.MSSQL == dp)
			return CREATE_SQL_MS;
		else if (DatabaseProduct.SYBASE == dp)
			return CREATE_SQL_MS;
		else if (DatabaseProduct.ORACLE == dp)
			return CREATE_SQL_ORCL;
		else
			return CREATE_SQL_ORCL;
	}

	private void createTable(Connection conn) {
		ResultSet rs;
		try {
			rs = conn.getMetaData().getTables(null, null, TABLE.toUpperCase(), null);
			if (!rs.next()) {
				PreparedStatement stmt = null;
				try {
					stmt = conn.prepareStatement(getCreateTableSQL(conn));
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

	private String getValue(String data, String flag){
		if(!"".equals(data)){
			int ipos = data.indexOf(flag);
			if(ipos>-1){
				String s1 = data.substring(ipos+flag.length());
				ipos = s1.indexOf("\"");
				if(ipos>-1)
					return s1.substring(0, ipos);
			}
		}
		return "";
	}
	
	private void update(HttpServletRequest request, Connection conn) throws IOException {
		DatabaseProduct dp = DatabaseProduct.ORACLE;
		try {
			dp = DatabaseProduct.getProduct(conn);
		} catch (SQLException e) {
			dp = DatabaseProduct.ORACLE;
		}
		
		String id = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
		//InputStream in = request.getInputStream();
		int dataLen = request.getContentLength();
		byte[] dataOrigin = new byte[dataLen];
		
		DataInputStream in1 = new DataInputStream(request.getInputStream());
        in1.readFully(dataOrigin); // 根据长度，将消息实体的内容读入字节数组dataOrigin中
	    in1.close(); // 关闭数据流

	    String postData = new String(dataOrigin); // 从字节数组中得到表示实体的字符串
		String data = Escape.decrypt(postData, "justep2000");
		ByteArrayInputStream in = new ByteArrayInputStream(postData.getBytes());
		ByteArrayInputStream in2 = new ByteArrayInputStream(data.getBytes());
		
		String cCode = "";
		String licenseID = "";
		String authCode = "";

		licenseID = getValue(data, "guid\":\"");
		if(!"".equals(licenseID)){
			cCode = getValue(data, "customer\":\"");
			authCode = getValue(data, "aCode\":\"");
		}
		
		String serverIP = request.getParameter("ServerIP");
		String clientIP = request.getRemoteAddr();
		String kind = request.getParameter("k");
		if(null==kind || "".equals(kind)) kind = "w";
		Timestamp now = new Timestamp((new java.util.Date()).getTime());
		
		if (DatabaseProduct.MSSQL == dp)
			update_ms(conn, id, in, dataLen, serverIP, clientIP, kind, now, cCode, licenseID);
		else if (DatabaseProduct.SYBASE == dp)
			update_ms(conn, id, in, dataLen, serverIP, clientIP, kind, now, cCode, licenseID);
		else if (DatabaseProduct.ORACLE == dp)
			update_orcl(conn, id, in, in2, serverIP, clientIP, kind, now, cCode, licenseID, authCode);
		else
			update_orcl(conn, id, in, in2, serverIP, clientIP, kind, now, cCode, licenseID, authCode);
	}
	
	private void update_ms(Connection conn, String id, InputStream data, int size, String serverIP, String clientIP, String kind, Timestamp now, String Ccode, String lID) {
		String sql = INSERT_SQL_MS;
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, serverIP);
			stmt.setString(2, clientIP);
			stmt.setString(3, kind);
			stmt.setBinaryStream(4, data, size);
			stmt.setTimestamp(5, now);
			stmt.setString(6, Ccode);
			stmt.setString(7, lID);
			stmt.setString(8, serverIP);
			stmt.setString(9, clientIP);
			stmt.setString(10, kind);
			stmt.setString(11, id);
			stmt.setBinaryStream(12, data, size);
			stmt.setString(13, clientIP);
			stmt.setString(14, serverIP);
			stmt.setString(15, kind);
			stmt.setTimestamp(16, now);
			stmt.setString(17, Ccode);
			stmt.setString(18, lID);
			stmt.executeUpdate();
		} catch (Exception e) {
			logger.error("执行sql：" + sql + "出错！", e);
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
	}
	
	private void update_orcl(Connection conn, String id, InputStream data, InputStream data2, String serverIP, String clientIP, String kind, Timestamp now, String Ccode, String lID, String authCode) {
		PreparedStatement stmt = null;
		ResultSet rs=null;
		try {
			stmt = conn.prepareStatement(EXIST_SQL_ORCL);
			stmt.setString(1, serverIP);
			stmt.setString(2, clientIP);
			stmt.setString(3, kind);
			rs=stmt.executeQuery();
			rs.next();
			if(rs.getLong("cnt")>0){
				rs.close();
				stmt.close();
				if("".equals(lID)||"".equals(Ccode)){
					stmt = conn.prepareStatement(UPDATE_SQL_ORCL2);
					stmt.setBinaryStream(1, data, data.available());
					//stmt.setTimestamp(2, now);
					stmt.setBinaryStream(2, data2, data2.available());
					stmt.setString(3, serverIP);
					stmt.setString(4, clientIP);
					stmt.setString(5, kind);
				}else{
					stmt = conn.prepareStatement(UPDATE_SQL_ORCL);
					stmt.setBinaryStream(1, data, data.available());
					//stmt.setTimestamp(2, now);
					stmt.setString(2, Ccode);
					stmt.setString(3, lID);
					stmt.setBinaryStream(4, data2, data2.available());
					stmt.setString(5, authCode);
					stmt.setString(6, serverIP);
					stmt.setString(7, clientIP);
					stmt.setString(8, kind);
				}
				stmt.executeUpdate();
			}else{
				rs.close();
				stmt.close();
				stmt = conn.prepareStatement(INSERT_SQL_ORCL);
				stmt.setString(1, id);
				stmt.setBinaryStream(2, data, data.available());
				stmt.setString(3, clientIP);
				stmt.setString(4, serverIP);
				stmt.setString(5, kind);
				//stmt.setTimestamp(6, now);
				stmt.setInt(6, 1);
				stmt.setString(7, Ccode);
				stmt.setString(8, lID);
				stmt.setBinaryStream(9, data2, data2.available());
				stmt.setString(10, authCode);
				stmt.executeUpdate();
			}
		} catch (Exception e) {
			logger.error("执行sql：" + INSERT_SQL_ORCL + "出错！", e);
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("产品追踪，Size:" + request.getContentLength()+ ",URI:"+request.getRequestURI()+",addr:"+request.getRemoteAddr());
		logger.info("产品追踪，Size:" + request.getContentLength());
		
		Connection conn = DBUtils.getConn(DATA_SOURCE);
		if (null != conn) {
			try {
				createTable(conn);
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
