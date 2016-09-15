package com.justep.tools.ant.task.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;

import com.justep.tools.ant.task.HttpTask;

public class DownloadTask extends HttpTask {

	private String appID;
	private String appBuilderServer;
	private String dir;
	private String fileName;

	protected String getURL() {
		return appBuilderServer + "/app/download";
	}

	protected String getParams() throws UnsupportedEncodingException {
		return "appID=" + appID;
	}

	protected void preparePost(HttpPost httppost) {
	}

	protected void processResponse(CloseableHttpResponse response) throws IOException {
		(new File(dir)).mkdirs();
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream is = entity.getContent();
			OutputStream os = new FileOutputStream(dir + "/" + ((fileName == null) || "".equals(fileName) ? "app.zip" : fileName));
			try {
				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
					os.write(buffer, 0, bytesRead);
				}
			} finally {
				os.close();
				is.close();
			}
		}
		this.getProject().executeTarget("unZipAppBuilderServerPackage");
	}

	public void setAppID(String appID) {
		this.appID = appID;
	}

	public void setAppBuilderServer(String appBuilderServer) {
		this.appBuilderServer = appBuilderServer;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}