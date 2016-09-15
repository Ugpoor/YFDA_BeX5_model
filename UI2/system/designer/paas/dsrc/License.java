import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.justep.db.DBUtils;
import com.justep.license.reg.LicenseUtils;
import com.justep.ui.JavaServer;

public class License extends com.justep.ui.impl.JProcessorImpl  {
	static Logger logger = Logger.getLogger(License.class);
	private static String DATA_SOURCE = "java:comp/env/pt";
	
	private String licenseActivation(String pkg, String UIP, String CIP, Connection conn){
		return LicenseUtils.licenseManualActivation(pkg, UIP, CIP, conn);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("安全版激活，获取激活码，Size:" + request.getContentLength()+ ",URI:"+request.getRequestURI()+",addr:"+request.getRemoteAddr());
		
		Connection conn = DBUtils.getConn(DATA_SOURCE);
		if (null != conn) {
			try {
				String postData = JavaServer.getPostData(request);
				String serverIP = request.getParameter("ServerIP");
				String clientIP = request.getRemoteAddr();
				String ret = licenseActivation(postData, serverIP, clientIP, conn);
				PrintWriter out = response.getWriter();
				out.write(ret);
				out.flush();
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
	}
	
}
