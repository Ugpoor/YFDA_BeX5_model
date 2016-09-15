package com.justep.tools.ant.task.paas;

import com.alibaba.fastjson.JSONObject;

public class UpgradePaaSServiceTask extends PaaSHttpTask {

	protected String getURL() {
		return getPaasServer() + "/paas/app/upgrade/url/" + paasServiceID;
	}

	protected String getPostParams() {
		String mode = getProject().getProperty("mode");
		String webPath = getProject().getProperty("webPath");
		String indexURL;
		if ("1".equals(mode) || "2".equals(mode)) {
			indexURL = "".equals(webPath) ? "" : webPath + "/index.html";
		} else {
			indexURL = webPath + getProject().getProperty("indexURL");
		}

		JSONObject jsonParams = new JSONObject();
		jsonParams.put("indexUrl", indexURL);
		return jsonParams.toJSONString();
	}

}