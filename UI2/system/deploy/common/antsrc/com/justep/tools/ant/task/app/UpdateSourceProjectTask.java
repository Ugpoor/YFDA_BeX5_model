package com.justep.tools.ant.task.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.UUID;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

import com.alibaba.fastjson.JSONObject;

public class UpdateSourceProjectTask extends Task {

	private String targetDir;

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void execute() throws BuildException {
		try {
			updateAppProject();
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}

	private void updateAppProject() throws IOException {
		String appProjectPath = this.targetDir + "/app.project";
		JSONObject appProject;
		File srcFile = new File(appProjectPath);
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(srcFile), "UTF-8"));
		StringBuilder sb = new StringBuilder();
		String str = null;
		while ((str = br.readLine()) != null) {
			sb.append(str);
			sb.append('\r');
			sb.append('\n');
		}
		br.close();

		appProject = JSONObject.parseObject(sb.toString());
		appProject.put("appID", UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		appProject.put("sourceMode", true);

		FileOutputStream buildFileStream = new FileOutputStream(srcFile);
		buildFileStream.write(appProject.toJSONString().getBytes("UTF-8"));
		buildFileStream.close();
	}

}