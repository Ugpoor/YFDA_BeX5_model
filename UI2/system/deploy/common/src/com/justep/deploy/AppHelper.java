package com.justep.deploy;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringEscapeUtils;

public class AppHelper {

	public static File createBuildXML(String justepHome, String antLibDir, String nativeDir, AppInfo appInfo, String session) throws IOException, IllegalAccessException {
		File buildTmplFile = new File(antLibDir + "/build.xml");
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(buildTmplFile), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String str = null;
		while ((str = br.readLine()) != null)
			sb.append(str + "\r\n");
		String content = sb.toString();
		// 文件中的占位标识为@value@，和ant的文本替换一致
		content = content.replace("@justepHome@", justepHome);
		content = content.replace("@antLibDir@", antLibDir);
		content = content.replace("@nativeDir@", nativeDir);
		content = content.replace("@session@", session);
		Class<? extends AppInfo> cls = appInfo.getClass();
		Field[] flds = cls.getFields();
		Object v;
		if (flds != null) {
			for (int i = 0; i < flds.length; i++) {
				v = flds[i].get(appInfo);
				content = content.replace("@" + flds[i].getName() + "@", v != null ? StringEscapeUtils.escapeXml(v.toString()) : "");
			}
		}

		File buildFile = File.createTempFile("x5app-build", ".xml");
		buildFile.deleteOnExit();
		FileOutputStream buildFileStream = new FileOutputStream(buildFile);
		buildFileStream.write(content.getBytes("UTF-8"));
		br.close();
		buildFileStream.close();

		return buildFile;
	}

	// 获取webPath，serverURL 形如：http://ip:port[/webAppName/otherPath]
	public static String getWebPath(String serverURL) {
		String[] paths = serverURL.split("/");
		String baseDir = "";
		if (paths.length > 3) {
			for (int i = 3; i < paths.length; i++) {
				baseDir = baseDir + "/" + paths[i];
			}
		}
		if ("".equals(baseDir)) {
			baseDir = "/";
		}
		return baseDir;
	}

	public static String getHttp(String url, Boolean all, Boolean post) throws HttpException, Exception {
		HttpClient client = new HttpClient();
		HttpMethodBase method = post ? new PostMethod(url) : new GetMethod(url);
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(0, false));
		try {
			int statusCode = client.executeMethod(method);
			if (statusCode != HttpStatus.SC_OK) {
				throw new HttpException("访问失败，错误原因：" + method.getStatusLine());
			}

			InputStream response = method.getResponseBodyAsStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(response, "UTF-8"));
			try {
				if (all) {
					StringBuffer sb = new StringBuffer();
					String str = null;
					while ((str = br.readLine()) != null) {
						sb.append(str);
						sb.append("\r\n");
					}

					return sb.toString();
				} else {
					return br.readLine();
				}
			} finally {
				br.close();
			}
		} finally {
			method.releaseConnection();
		}
	}

	public static String getStackTrace(Exception e) {

		StringBuilder sb = new StringBuilder();
		StackTraceElement[] trace = e.getStackTrace();
		for (int i = 0; i < trace.length; i++) {
			sb.append("\r\nat ");
			sb.append(trace[i]);
		}

		return sb.toString();
	}
}
