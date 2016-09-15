package com.justep.tools.ant.task.app;

import java.io.UnsupportedEncodingException;

import org.apache.http.client.methods.HttpPost;

import com.justep.tools.ant.task.HttpTask;

public class PackTask extends HttpTask {

	private String appID;
	private String appBuilderServer;
	private String session;

	protected String getURL() {
		return appBuilderServer + "/app/pack";
	}

	protected String getParams() throws UnsupportedEncodingException {
		return "appID=" + appID + "&session=" + session;
	}

	protected void preparePost(HttpPost httppost) {
	}

	public void setAppID(String appID) {
		this.appID = appID;
	}

	public void setAppBuilderServer(String appBuilderServer) {
		this.appBuilderServer = appBuilderServer;
	}

	public void setSession(String session) {
		this.session = session;
	}

}