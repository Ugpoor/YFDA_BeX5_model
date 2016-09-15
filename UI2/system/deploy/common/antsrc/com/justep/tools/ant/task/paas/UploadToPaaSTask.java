package com.justep.tools.ant.task.paas;

import java.io.File;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.tools.ant.BuildException;

public class UploadToPaaSTask extends PaaSHttpTask {

	private String distDir;
	private String distFiles;

	protected String getURL() {
		return getPaasServer() + "/paas/file/uploads/" + paasServiceID;
	}

	protected void preparePost(HttpPost httpReq) {
		httpReq.addHeader("Cookie", "JSESSIONID=" + paasSession);

		if ("".equals(distFiles) && null == distFiles) {
			throw new BuildException("未选择需要更新的文件，请选择文件！");
		}
		String[] filenames = distFiles.split(",");
		MultipartEntityBuilder builder = MultipartEntityBuilder.create();
		for (String filename : filenames) {
			File file;
			try {
				file = new File(distDir + "/" + filename);
				FileBody body = new FileBody(file);
				builder = builder.addPart(body.getFilename(), body);
			} catch (Exception e) {
				throw new BuildException(distDir + "/" + filename + "文件不存在");
			}
		}
		HttpEntity reqEntity = builder.build();
		httpReq.setEntity(reqEntity);
	}

	public void setDistDir(String distDir) {
		this.distDir = distDir;
	}

	public void setDistFiles(String distFiles) {
		this.distFiles = distFiles;
	}

}