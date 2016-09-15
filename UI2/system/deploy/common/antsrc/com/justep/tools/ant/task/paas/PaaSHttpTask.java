package com.justep.tools.ant.task.paas;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.tools.ant.BuildException;

import com.alibaba.fastjson.JSONObject;
import com.justep.tools.ant.task.HttpTask;

public abstract class PaaSHttpTask extends HttpTask {

	protected String paasServiceID;
	protected String paasSession;

	protected String getPaasServer() {
		return getProject().getProperty("paasConsoleURL");
	}

	protected String getParams() throws UnsupportedEncodingException {
		return "";
	}

	protected String getPostParams() {
		return "";
	}

	protected void preparePost(HttpPost httpReq) {
		httpReq.setHeader("Accept-Encoding", "UTF-8");
		httpReq.setHeader("content-type", "application/json");
		httpReq.addHeader("Cookie", "JSESSIONID=" + paasSession);

		HttpEntity reqEntity;
		reqEntity = new StringEntity(getPostParams(), "UTF-8");
		httpReq.setEntity(reqEntity);
	}

	protected void prepareGet(HttpGet httpReq) {
		httpReq.setHeader("Accept-Encoding", "UTF-8");
		httpReq.setHeader("content-type", "application/json");
		httpReq.addHeader("Cookie", "JSESSIONID=" + paasSession);
	}

	protected void processResponse(CloseableHttpResponse response) throws IOException {
		String message = paserResponse(response);
		if (!("".equals(message))) {
			JSONObject obj = JSONObject.parseObject(message);
			if ("false".equals(obj.getString("success"))) {
				error(response, obj);
				return;
			} else {
				sucess(response, obj);
			}
		} else {
			error(response, null);
		}
	}

	protected void sucess(CloseableHttpResponse response, JSONObject obj) {
	}

	protected void error(CloseableHttpResponse response, JSONObject obj) {
		StringBuffer sb = new StringBuffer();
		sb.append("执行HTTP请求失败，错误信息：");
		if (obj != null) {
			// TODO: 最好和appbuild的返回值统一，包括提供错误栈
			sb.append(obj.getString("msg"));
		} else {
			sb.append("\r\n无返回值：");
		}
		throw new BuildException(sb.toString());
	}

	public void setPaasServiceID(String paasServiceID) {
		this.paasServiceID = paasServiceID;
	}

	public void setPaasSession(String paasSession) {
		this.paasSession = paasSession;
	}

}