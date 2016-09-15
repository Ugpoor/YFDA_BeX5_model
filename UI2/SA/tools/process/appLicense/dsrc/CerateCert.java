import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.params.HttpClientParams;

import com.justep.biz.client.ActionException;
import com.justep.biz.client.Callback;
import com.justep.biz.client.StreamCallback;
import com.justep.biz.client.util.BizClientUtils;
import com.justep.message.ClientMessages;
import com.justep.ui.JavaServer;
import com.justep.ui.util.NetUtils;
import com.justep.useragent.Browser;
import com.justep.useragent.UserAgent;

class CertStreamCallback extends StreamCallback{
	private HttpServletResponse httpResponse;
	private HttpServletRequest httpRequest;
	public static final String JSON_CONTENT_TYPE = "application/json";
	public static final String XML_CONTENT_TYPE = "application/xml";
	public static final String BINARY_CONTENT_TYPE = "application/octet-stream";
	
	public CertStreamCallback(HttpServletRequest request, HttpServletResponse response) {
		super(response);
		httpResponse = response; 
		httpRequest = request;
	}
	
	public Object execute(InputStream in, String contentType, String bsessionID){
		try {
			if(BINARY_CONTENT_TYPE.equals(contentType)){
				httpResponse.setHeader("Pragma", "public");
				httpResponse.setHeader("Cache-Control", "pre-check=0, post-check=0, max-age=0");
				httpResponse.setHeader("Content-Transfer-Encoding", "binary");
				httpResponse.setDateHeader("Expires", 0);
				String filename = "developer.cert.xml";
				httpResponse.setHeader("Content-Type", "application/octet-stream");
				UserAgent ua = com.justep.ui.util.NetUtils.getUserAgent(httpRequest);
				if(!Browser.FIREFOX.equals(ua.getBrowser().getGroup())){//这种写法支持ie和chrome
					httpResponse.addHeader("Content-disposition", "attachment;filename=\""
							+ filename + "\";");
				}else{//firefox特殊处理
					httpResponse.addHeader("Content-disposition", "attachment;filename*=\""
							+ filename + "\";");
				}
			}

			OutputStream out = httpResponse.getOutputStream(); 
			byte[] bs = new byte[1024 * 8];
			int i = -1;
			while ((i = in.read(bs)) != -1) {
				out.write(bs, 0, i);
			}
			out.flush();
			return true;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}finally{
			if (in != null){
				try {
					in.close();
				} catch (IOException e) {
					
				}
			}
		}
	}
}

public class CerateCert extends com.justep.ui.impl.JProcessorImpl  {
	private static String URL = "http://reg.justep.com/x5/UI/reg/license/service/createCert.j";
	
	private static HttpMethod getHttpMethod(String url, String method) {
		if ("delete".equals(method)) {
			return new DeleteMethod(url);

		} else if ("get".equals(method)) {
			return new GetMethod(url);

		} else if ("post".equals(method)) {
			return new PostMethod(url);

		} else if ("put".equals(method)) {
			return new PutMethod(url);

		} else {
			throw ActionException.create(ClientMessages.NO_METHOD1, method);
		}
	}
	
	private static void invokeActions(String url, String params, byte[] data, Part[] parts, String accept, String contentType,
			String sessionID, String language, String method, Callback callback) {

		if (params != null && !"".equals(params)) {
			if (url.contains("?")) {
				url = url + "&" + params;
			} else {
				url = url + "?" + params;
			}
		}

		if (language != null && !"".equals(language)) {
			if (url.contains("?")) {
				url = url + "&language=" + language;
			} else {
				url = url + "?language=" + language;
			}
		}

		HttpMethod httpMethod = null;

		try {
			HttpClient httpClient = new HttpClient(new HttpClientParams(), new SimpleHttpConnectionManager(true)); 
			httpMethod = getHttpMethod(url, method);
			if ((httpMethod instanceof PostMethod) || (httpMethod instanceof PutMethod)) {
				if (null != data)
					((EntityEnclosingMethod) httpMethod).setRequestEntity(new ByteArrayRequestEntity(data));
				if (httpMethod instanceof PostMethod && null != parts)
					((PostMethod) httpMethod).setRequestEntity(new MultipartRequestEntity(parts, httpMethod.getParams()));
			}

			if (sessionID != null) {
				httpMethod.addRequestHeader("Cookie", "JSESSIONID=" + sessionID);
			}

			if (!(httpMethod instanceof PostMethod && null != parts)) {
				if (null != accept && !"".equals(accept))
					httpMethod.addRequestHeader("Accept", accept);
				if (null != contentType && !"".equals(contentType))
					httpMethod.addRequestHeader("Content-Type", contentType);
			}

			int statusCode = httpClient.executeMethod(httpMethod);
			if (statusCode != HttpStatus.SC_OK) {
				throw ActionException.create(ClientMessages.CON_ERROR1, httpMethod.getStatusLine());
			}

			contentType = null != httpMethod.getResponseHeader("Content-Type") ? httpMethod.getResponseHeader("Content-Type").getValue() : accept;

			InputStream o = httpMethod.getResponseBodyAsStream();
			if (callback != null){
				callback.execute(o, contentType, sessionID);
			}
			
		} catch (Exception e) {
			String result = BizClientUtils.doError(e, contentType);
			ByteArrayInputStream in = null;
			try {
				in = new ByteArrayInputStream(result.getBytes("UTF-8"));
				if (callback != null){
					callback.execute(in, contentType, null);
				}

			} catch (UnsupportedEncodingException e1) {
				throw new RuntimeException(e1.getMessage()+"", e1);
			} finally{
				if (in != null){
					try {
						in.close();
					} catch (IOException e1) {
					}
				}
			}
		} finally {
			// 释放连接
			if (httpMethod != null){
				httpMethod.releaseConnection();
			}
		}
	}
	
	public static void toJustepBiz(HttpServletRequest request, HttpServletResponse response, String url) throws FileUploadException, IOException{
		Callback callback = new CertStreamCallback(request, response);
		String accept = NetUtils.getAccept(request);
		String contentType = NetUtils.getContentType(request);
		String language = NetUtils.getLanguage(request);
		String sessionID = null;
		StringBuffer params = new StringBuffer();
		for(Object n : request.getParameterMap().keySet()){
			String p = URLEncoder.encode(request.getParameter((String)n),"UTF-8");
			if(0!=params.length()){
				params.append("&"+n+"="+p);
			}else{
				params.append(n+"="+p);
			}
		}
		if (NetUtils.isRequestMultipart(request)){
			Part[] parts = NetUtils.generateParts(request);
			invokeActions(url, params.toString(), null, parts, accept, contentType,
					sessionID, language, "post", callback);
		}else{
			String postData = JavaServer.getPostData(request);
			invokeActions(url, params.toString(), postData.getBytes("UTF-8"), null, accept, contentType,
					sessionID, language, "post", callback);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			toJustepBiz(request, response, URL);
		} catch (FileUploadException e) {
			throw new ServletException("创建开发商数字证书失败", e);
		}
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}	
}
