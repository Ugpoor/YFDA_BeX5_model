import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.log4j.Logger;

import com.justep.biz.client.ActionUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.ResourceServer;
import com.justep.ui.exception.UIException;
import com.justep.ui.resources.ResourceNotFoundException;
import com.justep.ui.resources.URLFactory;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.util.NetUtils;


public class View extends com.justep.ui.impl.JProcessorImpl  {
	private static Logger logger = Logger.getLogger(View.class);
	private static String DEFAULT_DOC_SERVER_URL = "sys.default.doc.server.url";		
	
	private String getDocServerUrl(HttpServletRequest request){
		String ret = (String)request.getSession().getAttribute(DEFAULT_DOC_SERVER_URL);
		
		if(null==ret || "".equals(ret)){
			String url = String.format("%s/getDocServerUrl", 
					JustepConfig.getBusinessServer());
			HttpClient httpClient = new HttpClient(new HttpClientParams(), new SimpleHttpConnectionManager(true));
			HttpMethod httpMethod = new PostMethod(url);
			try {
				httpMethod.addRequestHeader("Accept", ActionUtils.JSON_CONTENT_TYPE);
				httpMethod.addRequestHeader("Content-Type", ActionUtils.JSON_CONTENT_TYPE);
				int statusCode = httpClient.executeMethod(httpMethod);
				if (statusCode != HttpStatus.SC_OK) {
					String s = "Method failed: " + httpMethod.getStatusLine();
					logger.error(s);
					throw UIException.create(UISystemMessages.XBL_UEDITOR_REQUEST_DOCSERVER_ERROR, s);
				}
				ret = httpMethod.getResponseBodyAsString();
			} catch (HttpException e) {
				UIException ue = UIException.create(e, UISystemMessages.XBL_UEDITOR_GET_URL_ERROR);
				logger.error(ue.getMessage(), e);
				throw ue;
			} catch (IOException e) {
				UIException ue = UIException.create(e, UISystemMessages.XBL_UEDITOR_GET_URL_ERROR);
				logger.error(ue.getMessage(), e);
				throw ue;
			} finally {
				httpMethod.releaseConnection();
			}
		}
		return ret;
	}
	
	private String getFileUrl(HttpServletRequest request, String fileID){
		return String.format("%s/repository/publicFile/view/%s/last/content",getDocServerUrl(request),fileID);//publicFile
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("file");
		String urlString = "";
		if (null==path||"".equals(path)) {
			//String rootpath = request.getParameter("root");
			//String subPath = request.getParameter("sub");
			String fileID = request.getParameter("fileid");
			//String docID = request.getParameter("docid");
			if(null!=fileID && !"".equals(fileID)){
				urlString = getFileUrl(request, fileID);
			}else{
				response.setStatus(ResourceServer.SC_NOT_FOUND);
				return;
			}
		}else{
			String dataDir = JustepConfig.getUeditorDataDir();
			File dir = new File(dataDir);
			File f = new File(dataDir + path);
			String fPath = f.getCanonicalPath();
			//限制只能访问指定目录下的数据
			if(fPath.startsWith(dir.getCanonicalPath())) urlString = f.toURL().toString();
			else {
				response.setStatus(ResourceServer.SC_NOT_FOUND);
				return;
			}
		}

		InputStream urlConnectionInputStream = null;
		try {
			try {
				URL newURL = URLFactory.createURL(urlString);
				URLConnection urlConnection = null;

				if (urlConnection == null) {
					urlConnection = newURL.openConnection();
					urlConnectionInputStream = urlConnection.getInputStream();
				}
				
				final long lastModified = NetUtils.getLastModified(urlConnection);

				NetUtils.setCaching(request, response, lastModified, false, false);

				if (!NetUtils.checkIfModifiedSince(request, lastModified, false)) {
					response.setStatus(ResourceServer.SC_NOT_MODIFIED);
					return;
				}

				// Lookup and set the content type
				//final String contentType = mimeTypeConfig.getMimeType(urlString);
				//if (contentType != null)
				//	response.setContentType(contentType);
				final int length = urlConnection.getContentLength();
				if (length > 0)
					response.setContentLength(length);

			} catch (IOException e) {
				response.setStatus(ResourceServer.SC_NOT_FOUND);
				return;
			} catch (ResourceNotFoundException e) {
				response.setStatus(ResourceServer.SC_NOT_FOUND);
				return;
			}

			try {
				NetUtils.copyStream(urlConnectionInputStream, response.getOutputStream());
			} catch (IOException e) {
				response.setStatus(ResourceServer.SC_NOT_FOUND);
				return;
			}
		}catch (Exception e){
			response.setStatus(ResourceServer.SC_NOT_FOUND);
			
		} finally {
			if (urlConnectionInputStream != null) {
				try {
					urlConnectionInputStream.close();
				} catch (IOException e) {
					throw new UIException(e);
				}
			}
		}
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}	
}
