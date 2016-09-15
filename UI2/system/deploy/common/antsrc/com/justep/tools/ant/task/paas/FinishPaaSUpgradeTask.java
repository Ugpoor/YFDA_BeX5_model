package com.justep.tools.ant.task.paas;

public class FinishPaaSUpgradeTask extends PaaSHttpTask {

	protected Boolean isPost() {
		return false;
	}

	protected String getURL() {
		return getPaasServer() + "/paas/app/upgrade/finish/" + paasServiceID;
	}

}