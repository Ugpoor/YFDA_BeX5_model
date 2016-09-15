package com.justep.tools.ant.task.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.ui.util.Base64;

public class SaveProjectTask extends Task {

	private String targetDir;

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void execute() throws BuildException {
		try {
			updateAppProject();
			updateConfig();
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}

	private void updateAppProject() throws IOException {
		String appProjectPath = this.targetDir + "/app.project";
		JSONObject appProject;
		File srcFile = new File(appProjectPath);
		if (srcFile.exists()) {
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
		} else {
			appProject = new JSONObject();
		}

		final String[] strProperties = { "appID", "mode", "serverURL", "webPath", "indexURL", "uiResDirs", "plugins", "province", "area", "company", "author", "email", "homePage", "androidPassword",
				"iosDevloperPassword", "iosDistributionPassword", "resourceVersion", "resourceDownloadURL", "resourceAppVersion", "androidChangeLog", "androidDownloadURL", "iosChangeLog",
				"iosDownloadURL", "paasServiceID", "paasDistFiles" };
		for (String propertie : strProperties) {
			appProject.put(propertie, getProject().getProperty(propertie));
		}

		final String[] boolProperties = { "sourceMode", "extBrowser", "autoSelectPlugins", "resEncryption", "genAndroid", "genIOSDev", "genIOSDis" };
		for (String propertie : boolProperties) {
			appProject.put(propertie, Boolean.parseBoolean(getProject().getProperty(propertie)));
		}
		final String[] objProperties = { "pluginsConfig" };
		for (String propertie : objProperties) {
			appProject.put(propertie, JSONArray.parseArray(new String(Base64.decode(getProject().getProperty(propertie)), "UTF-8")));
		}

		FileOutputStream buildFileStream = new FileOutputStream(srcFile);
		buildFileStream.write(JSONObject.toJSONString(appProject, true).getBytes("UTF-8"));
		buildFileStream.close();
	}

	private void updateConfig() throws UnsupportedEncodingException, FileNotFoundException, DocumentException, IOException {
		SAXReader xReader = new SAXReader();
		String configXMLPath = this.targetDir + "/config.xml";
		InputStreamReader isr = new InputStreamReader(new FileInputStream(configXMLPath), "UTF-8");
		Document config = xReader.read(isr);
		Element e = (Element) config.selectSingleNode("//widget");
		// 设置默认打开的页面
		Boolean includeUIRes = "true".equals(getProject().getProperty("includeUIRes"));
		String mode = getProject().getProperty("mode");
		Boolean isWWWRes = "1".equals(mode) || "2".equals(mode) || (includeUIRes && "3".equals(mode));
		String url = getProject().getProperty("serverURL") + getProject().getProperty("webPath");
		e.element("content").attribute("src").setValue(url + (isWWWRes ? "/index.html" : getProject().getProperty("indexURL")));
		// 设置应用名
		e.element("name").setText(getProject().getProperty("appName"));
		// 设置版本号
		e.attribute("version").setValue(getProject().getProperty("version"));
		// 设置名空间，唯一标识app
		e.attribute("id").setValue(getProject().getProperty("packageName"));
		// 应用描述
		e.element("description").setText(getProject().getProperty("description"));
		// 浏览器版本标识
		Element appendUserAgent = (Element) e.selectSingleNode(("//*[local-name()='preference'][@name='AppendUserAgent']"));
		if (appendUserAgent == null) {
			appendUserAgent = e.addElement("preference");
			appendUserAgent.addAttribute("name", "AppendUserAgent");
		}
		appendUserAgent.addAttribute("value", "x5app/" + getProject().getProperty("version"));
		// 屏幕方向
		Element orientation = (Element) e.selectSingleNode(("//*[local-name()='preference'][@name='Orientation']"));
		if (orientation == null) {
			orientation = e.addElement("preference");
			orientation.addAttribute("name", "Orientation");
		}
		orientation.addAttribute("value", getProject().getProperty("orientation"));
		// 开发者
		e.element("author").setText(getProject().getProperty("author"));
		// 开发者主页
		e.element("author").attribute("href").setValue(getProject().getProperty("homePage"));
		// 开发者Email
		e.element("author").attribute("email").setValue(getProject().getProperty("email"));

		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(configXMLPath), "UTF-8");
		XMLWriter writer = new XMLWriter(osw, OutputFormat.createPrettyPrint());
		writer.write(config);
		writer.close();
	}

}