package com.justep.tools.ant.task.paas;

public class RestartPaaSServiceTask extends PaaSHttpTask {

	protected Boolean isPost() {
		return false;
	}

	protected String getURL() {
		return getPaasServer() + "/paas/apps/" + paasServiceID + "/start";
	}
}