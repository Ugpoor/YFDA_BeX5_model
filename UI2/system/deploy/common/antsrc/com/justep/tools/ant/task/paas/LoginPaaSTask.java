package com.justep.tools.ant.task.paas;

import org.apache.http.Header;
import org.apache.http.client.methods.CloseableHttpResponse;

import com.alibaba.fastjson.JSONObject;

public class LoginPaaSTask extends PaaSHttpTask {

	private String paasToken;

	protected String getURL() {
		return getPaasServer() + "/paas/login";
	}

	protected String getPostParams() {
		JSONObject jsonParams = new JSONObject();
		jsonParams.put("token", paasToken);
		return jsonParams.toJSONString();
	}

	protected void sucess(CloseableHttpResponse response, JSONObject obj) {
		String sessionID = "";
		Header[] cookies = response.getHeaders("Set-Cookie");
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Header cookie = cookies[i];
				if (cookie != null) {
					sessionID = cookie.getValue();
					if (sessionID.startsWith("JSESSIONID=")) {
						sessionID = sessionID.substring(sessionID.indexOf("=") + 1);
					}

					if (sessionID.contains(";")) {
						sessionID = sessionID.substring(0, sessionID.indexOf(";"));
					}

					if ((sessionID != null) && !sessionID.equals("")) {
						break;
					}
				}
			}
		}
		getProject().setProperty("paasSession", sessionID);
	}

	public void setPaasToken(String paasToken) {
		this.paasToken = paasToken;
	}

}