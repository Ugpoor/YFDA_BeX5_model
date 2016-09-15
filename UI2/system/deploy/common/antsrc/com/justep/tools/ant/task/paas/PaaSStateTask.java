package com.justep.tools.ant.task.paas;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.tools.ant.BuildException;

import com.alibaba.fastjson.JSONObject;

public class PaaSStateTask extends PaaSHttpTask {

	private String waittingState;
	private String containerName;

	private Boolean finished;

	static Integer MAX_CHECK_COUNT = 20;

	private void watingForState() {
		finished = false;
		int count = 0;
		while (!finished) {
			count++;
			super.execute();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				finished = true;
			}
			if (!finished && (count >= MAX_CHECK_COUNT)) {
				throw new BuildException("监测状态“" + waittingState + "”超时，请通过管理控制台查看具体错误信息！");
			}
		}
	}

	protected Boolean isPost() {
		return false;
	}

	protected String getURL() {
		// 有容器名称，查看容器状态，否则查看servcie状态
		if ((containerName == null) || "".equals(containerName)) {
			return getPaasServer() + "/paas/apps/service/state/" + paasServiceID;
		} else {
			return getPaasServer() + "/paas/apps/container/state/" + paasServiceID + "/" + containerName;
		}
	}

	protected void sucess(CloseableHttpResponse response, JSONObject obj) {
		obj = obj.getJSONObject("object");
		String state = "未返回";
		if (obj != null) {
			state = obj.getString("state");
			finished = (waittingState != null) && (waittingState.indexOf(state) >= 0);
		}
		if (!finished) {
			log("等待服务状态：" + waittingState + " 当前状态：" + state + " 5秒后重新检查......");
		}
	}

	protected void error(CloseableHttpResponse response, JSONObject obj) {
	}

	public void setWaittingState(String waittingState) {
		this.waittingState = waittingState;
	}

	public void setContainerName(String containerName) {
		this.containerName = containerName;
	}

	public void execute() throws BuildException {
		if ((waittingState != null) && !"".equals(waittingState)) {
			watingForState();
		} else {
			super.execute();
		}

	}
}