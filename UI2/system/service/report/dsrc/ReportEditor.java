import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.ui.impl.JProcessorImpl;
import com.justep.ui.util.NetUtils;

/**
 * 
 * 根据请求JSON信息 组合模版信息 发送报表服务器请求
 * 
 */
public class ReportEditor extends JProcessorImpl {

	private static final String BSESSIONID = "bsessionid";
	public static String REPORT_SERVER = null;
	private Object businessCookie;
	//private Document errorDoc;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			// 初始化报表服务器地址(UIServer/justep.xml)
			init(request);
			// Thread.sleep(3000);
			businessCookie = getBusinessSessionID(request).toString();

			String tempUrl = request.getRequestURL().toString();
			String uiServerURL = tempUrl.substring(0, tempUrl.indexOf("/UI/"));
			String jsonString = getRequestJSONString(request);
			String url = createReportURL(REPORT_SERVER,businessCookie);
			//请求报表服务器
			byte[] cacheByte = call(url,jsonString);
			String tmp = jsonString.substring(jsonString.indexOf("output-type=\""));
			tmp = tmp.substring(0,tmp.indexOf("\">"));
			String outputType = tmp.substring(tmp.indexOf("=\"")+2);
			String reportName = "report";
			if("xhtml".equals(outputType)){
				BufferedReader br = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(cacheByte),"UTF-8"));
				StringBuffer htmlBuffer = new StringBuffer();
				String line = "";
				while ((line = br.readLine()) != null) {
					htmlBuffer.append(line);
				}				
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				
				PrintWriter pw = response.getWriter();
				pw.print(htmlBuffer.toString().replace("xhtml:", ""));
				pw.flush();		
				pw.close();
			}else if("print".equals(outputType)){
				String filename = "com.justep.report.print.StreamCache."+UUID.randomUUID().toString();
				File reportFile = new File(System.getProperty("java.io.tmpdir") + "/" + filename);
				FileOutputStream fileOutputStream = new FileOutputStream(reportFile, false);
				ByteArrayInputStream in = new ByteArrayInputStream(cacheByte);
	        	byte[] bs = new byte[1024];
	        	int i = -1;
	        	while ((i = in.read(bs)) != -1) {
	        		fileOutputStream.write(bs, 0, i);
	        	}
	        	fileOutputStream.flush();
	        	fileOutputStream.close();
				
				PrintWriter pw = response.getWriter();
				pw.print("<object id='pdf' type='application/pdf' width='100' height='100'>" +
						"<param name='src' fmt:url-type='action' value='"+uiServerURL+"/UI/system/service/report/printGetFile.j?filename="+filename+"' />" +
						"</object>" +
						"<script type='text/javascript'>" +
						"document.pdf.printWithDialog();" +
						"document.pdf.focus();" +
						"</script>" +
						"");
				pw.flush();	
				pw.close();
			}else{
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);
				response.setCharacterEncoding("UTF-8");
				String filename = ("".equals(reportName)||reportName == null)?"report":reportName;
				if("doc".equals(outputType)){
					response.setHeader("Content-Type", "application/ms-word");						
					response.addHeader("Content-disposition", "attachment;filename=\""+ filename + ".doc\"");			
				}else if("xls".equals(outputType)){
					response.setHeader("Content-Type", "application/ms-excel");
					response.addHeader("Content-disposition", "attachment;filename=\""+ filename + ".xls\"");			
				}else if("preview".equals(outputType)){
					response.setHeader("Content-Type", "application/pdf");
					response.addHeader("Content-disposition", "inline;filename=\""+ filename + ".pdf\"");
				}else{
					response.setHeader("Cache-Control", "no-cache");
					response.setHeader("Content-Type", "application/pdf");
					response.addHeader("Content-disposition", "attachment;filename=\""+ filename + ".pdf\"");			
				}
				
				ByteArrayInputStream in = new ByteArrayInputStream(cacheByte);
				OutputStream out = response.getOutputStream();
	        	byte[] bs = new byte[1024];
	        	int i = -1;
	        	while ((i = in.read(bs)) != -1) {
	        		out.write(bs, 0, i);
	        	}
	        	out.flush();
	        	out.close();
			}			
		} catch (IOException e) {
		} catch (Exception e) {
			//throw new ServletException("报表服务请求失败", e);
			e.printStackTrace();
		}
		
	}

	/**
	 * 获取请求JSON串
	 * 
	 * @param request
	 * @return
	 */
	private String getRequestJSONString(HttpServletRequest request)
			throws ServletException, IOException {
		final int BUFFER_SIZE = 1024;
		byte[] buffer = new byte[BUFFER_SIZE];
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int bLen = 0;
		InputStream in = request.getInputStream();
		while ((bLen = in.read(buffer)) > 0) {
			baos.write(buffer, 0, bLen);
		}
		String jsonString = new String(baos.toByteArray(), "UTF-8");
		if("".equals(jsonString)){
			String xml = "";
			for(Object k : request.getParameterMap().keySet()){
				String name = (String)k;
				if(name.indexOf("xml-data") >= 0) {
					xml = request.getParameter(name) + xml;
				}
			}
			jsonString = java.net.URLDecoder.decode(xml,"UTF-8");			
		}
		return jsonString;
	}

	public Object getBusinessSessionID(HttpServletRequest request) {
		Object bid = NetUtils.getBSessionID(request);
		if (null == bid) {
			String path = request.getRequestURI();
			String message = "URL: [" + path + "]必须有" + BSESSIONID + "参数!";
			throw new RuntimeException(message);
		}
		return bid;
	}

	private byte[] call(String reportServerURL, String params){
		HttpClient httpClient = new HttpClient();
		HttpMethod httpMethod = null;
		ByteArrayOutputStream out = null;
		try {
			//url
			httpMethod = new PostMethod(reportServerURL);
			if (businessCookie != null){
				httpMethod.addRequestHeader("Cookie", "JSESSIONID=" + (String) businessCookie);
			}
			//params
			byte[] bytes = params.getBytes("UTF-8");			
			((EntityEnclosingMethod) httpMethod).setRequestEntity(new ByteArrayRequestEntity(bytes));
			//execute
			int statusCode = httpClient.executeMethod(httpMethod);
			if (statusCode != HttpStatus.SC_OK) {
				throw new UnsupportedOperationException("请求报表服务器失败: " + httpMethod.getStatusLine());
			}
			
			InputStream in = httpMethod.getResponseBodyAsStream();			
			out = new ByteArrayOutputStream();
        	byte[] bs = new byte[1024];
        	int i = -1;
        	while ((i = in.read(bs)) != -1) {
        		out.write(bs, 0, i);
        	}
        	out.flush();
		} catch (Exception e) { 
			//errorDoc = generateErrorDoc("报表服务器请求失败,请检查报表服务器相关配置是否正确!<br/>报表请求URL:" + reportServerURL);
			e.printStackTrace();
		} finally {
			httpMethod.releaseConnection();
		}
		
		return out.toByteArray();			
	}

	private String createReportURL(String reportServerURL, Object session){
		String url = reportServerURL;
		if (url.indexOf("?") != -1) {
			url += "&bsessionid=" + (String) session;
		} else {
			url += "?bsessionid=" + (String) session;
		}
		
		return reportServerURL;		
	}
	
	/*
	private Document generateErrorDoc(String errorInfo) {
		Document errorDoc = org.dom4j.DocumentHelper.createDocument();
		StringBuffer sb = new StringBuffer();
		sb.append("<xhtml:html xmlns:xhtml=\"http://www.w3.org/1999/xhtml\" >");
		sb.append("<xhtml:body>");
		sb.append("<div style=\"font-size:12px;\" >" + errorInfo + "</div>");// color:red;
		sb.append("</xhtml:body></xhtml:html>");
		try {
			errorDoc = org.dom4j.DocumentHelper.parseText(sb.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return errorDoc;
	}
	*/
	
	private void init(HttpServletRequest request) {
		if (REPORT_SERVER == null) {
			String fileName = request.getSession(true).getServletContext().getRealPath("/WEB-INF/justep.xml");
			File fl = new File(fileName);
			if (fl.exists()) {
				SAXReader reader = new SAXReader();
				try {
					Document doc = reader.read(fl);

					Element e = doc.getRootElement().element("report-server");
					if (e != null) {
						REPORT_SERVER = e.getText().trim();
					} else {
						REPORT_SERVER = "http://localhost:8080/ReportServer/reportservice";
					}
				} catch (DocumentException e) {
					throw new UnsupportedOperationException();
				}
			} else {
				REPORT_SERVER = "http://localhost:8080/ReportServer/reportservice";
			}
		}
	}
	
}