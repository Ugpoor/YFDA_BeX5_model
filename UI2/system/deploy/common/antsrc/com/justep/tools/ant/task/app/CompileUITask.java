package com.justep.tools.ant.task.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;

import com.alibaba.fastjson.JSONObject;
import com.justep.tools.ant.common.Utils;
import com.justep.ui.AppVersion;
import com.justep.ui.PackageWindowCompiler;

public class CompileUITask extends Task {

	private String justepHome;
	private String dirs;
	private String targetDir;
	private String webPath;
	private String indexURL;
	// mode 1: native 2: http server 3: uiserver 4: web
	private String mode;
	private String UI2 = "UI2";

	private String arrayToString(String[] array) {
		StringBuilder result = new StringBuilder();
		for (String item : array) {
			if (result.length() > 0) {
				result.append(",");
			}
			result.append("/" + UI2 + "/" + item);
		}

		return result.toString();
	}

	private String listToString(Set<String> list) {
		StringBuilder result = new StringBuilder();
		Iterator<String> iterator = list.iterator();
		while (iterator.hasNext()) {
			if (result.length() > 0) {
				result.append(",");
			}
			result.append(iterator.next());
		}

		return result.toString();
	}

	private String getFixedIndexURL(String indexURL) {
		return "/" + UI2 + indexURL;
	}

	private void fixFiles(String path, String indexURL, String version) throws IOException {
		// appMetadata_in_server.json
		Project project = this.getProject();

		String url = getProject().getProperty("serverURL") + webPath;
		if ("3".equals(mode) || "4".equals(mode)) {
			if ((indexURL != null) && !"".equals(indexURL)) {
				String mainPath = indexURL.substring(0, indexURL.lastIndexOf("/"));
				if ((mainPath != null) && !"".equals(mainPath)) {
					url = url + mainPath;
				}
			}
		}

		JSONObject appMetadata = new JSONObject();
		JSONObject resourceInfo = new JSONObject();
		resourceInfo.put("indexURL", project.getProperty("indexURL"));
		resourceInfo.put("version", version);
		String resourceDownloadURL = project.getProperty("resourceDownloadURL");
		if ((resourceDownloadURL == null) || "".equals(resourceDownloadURL)) {
			resourceDownloadURL = url + "/www.zip";
		}
		resourceInfo.put("downloadURL", resourceDownloadURL);
		resourceInfo.put("mode", project.getProperty("mode"));
		resourceInfo.put("appVersion", project.getProperty("resourceAppVersion"));
		appMetadata.put("resourceInfo", resourceInfo);

		JSONObject appInfo = new JSONObject();
		JSONObject androidApp = new JSONObject();
		androidApp.put("version", project.getProperty("version"));
		androidApp.put("changeLog", project.getProperty("androidChangeLog"));
		String androidDownloadURL = project.getProperty("androidDownloadURL");
		if ((androidDownloadURL == null) || "".equals(androidDownloadURL)) {
			androidDownloadURL = url + "/app.apk";
		}
		androidApp.put("downloadURL", androidDownloadURL);
		appInfo.put("androidApp", androidApp);
		JSONObject iosApp = new JSONObject();
		iosApp.put("version", project.getProperty("version"));
		iosApp.put("changeLog", project.getProperty("iosChangeLog"));
		String iosDownloadURL = project.getProperty("iosDownloadURL");
		if ((iosDownloadURL == null) || "".equals(iosDownloadURL)) {
			iosDownloadURL = url + "/app.ipa";
		}
		iosApp.put("downloadURL", iosDownloadURL);
		appInfo.put("iosApp", iosApp);
		appMetadata.put("appInfo", appInfo);

		FileOutputStream buildFileStream = new FileOutputStream(path + "/appMetadata_in_server.json");
		buildFileStream.write(JSONObject.toJSONString(appMetadata, true).getBytes("UTF-8"));
		buildFileStream.close();

		// intro
		if (indexURL != null) {
			int pos = indexURL.indexOf("?");
			if (pos > 0) {
				indexURL = indexURL.substring(0, pos);
			}
		}

		File mainWFile = new File(path + "/" + (version != null ? version + "/" : "") + indexURL);
		String mainPath = mainWFile.getParent();
		String introHtmlFile = mainPath + "/intro.html";
		if (new File(introHtmlFile).exists()) {
			String srcStr = "<script intro=\\\"none\\\"></script>";
			String rpStr = "<script src=\"./intro.js\"></script>";
			Utils.replaceFileText(mainWFile.getAbsolutePath(), srcStr, rpStr);
		}
	}

	public void setJustepHome(String justepHome) {
		this.justepHome = justepHome;
	}

	public void setDirs(String dirs) {
		this.dirs = dirs;
	}

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void setIndexURL(String indexURL) {
		this.indexURL = indexURL;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public void execute() throws BuildException {
		String version = AppVersion.getVersion(mode, getProject().getProperty("resourceVersion"), "", "");
		try {
			String[] param = new String[] { justepHome + "/runtime/UIServer", (dirs == null || "".equals(dirs)) ? "" : arrayToString(dirs.split(",")), targetDir + webPath, "", "",
					getFixedIndexURL(indexURL), mode, version };
			List<String> fails = new ArrayList<String>();
			Set<String> plugins = new HashSet<String>();
			PackageWindowCompiler.compile(param, fails, plugins);
			fixFiles(targetDir + webPath, indexURL, version);
			getProject().setProperty("usedPlugins", listToString(plugins));
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}

}