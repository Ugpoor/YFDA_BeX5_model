package com.justep.tools.ant.task.paas;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.tools.ant.BuildException;

import com.alibaba.fastjson.JSONObject;

public class PaaSServiceLogTask extends PaaSHttpTask {

	private String containerName;

	protected Boolean isPost() {
		return false;
	}

	protected String getURL() {
		return getPaasServer() + "/paas//apps/container/logs/" + paasServiceID + "/" + containerName;
	}

	protected void sucess(CloseableHttpResponse response, JSONObject obj) {
		String log = obj.getString("object");
		log("部署日志：\r\n" + log);
		if (log.indexOf("****ERROR****") >= 0) {
			throw new BuildException("部署失败，请检查上传的资源是否正确");
		}
	}

	public void setContainerName(String containerName) {
		this.containerName = containerName;
	}

}