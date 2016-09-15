import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;

public class GetAppConfig extends com.justep.ui.impl.JProcessorImpl {

	private JSONObject createConfigByFile(String appProjectFile) throws IOException {
		File srcFile = new File(appProjectFile);
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(srcFile), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String str = null;
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		br.close();
		return JSONObject.parseObject(sb.toString());
	}

	private void appendConfig(JSONObject config, String appConfigFile) throws ServletException {
		try {
			InputStreamReader isr = new InputStreamReader(new FileInputStream(appConfigFile), "UTF-8");
			SAXReader xReader = new SAXReader();
			Document configDoc = xReader.read(isr);
			Element e = (Element) configDoc.selectSingleNode("//widget");

			// 应用名
			config.put("appName", e.element("name").getText());
			// 版本号
			config.put("version", e.attribute("version").getValue());
			// 设置名空间，唯一标识app
			config.put("packageName", e.attribute("id").getValue());
			// 应用描述
			config.put("description", e.element("description").getText());
			// 屏幕方向
			Element orientation = (Element) e.selectSingleNode(("//*[local-name()='preference'][@name='Orientation']"));
			if (orientation != null) {
				config.put("orientation", orientation.attribute("value").getValue());
			}
			// 开发者
			config.put("author", e.element("author").getText());
			// 开发者主页
			config.put("homePage", e.element("author").attribute("href").getValue());
			// 开发者Email
			config.put("email", e.element("author").attribute("email").getValue());
		} catch (Exception E) {
			E.printStackTrace();
			throw new ServletException("读取配置文件“" + appConfigFile + "”失败");
		}
	}

	private void appendBuildProp(JSONObject config, String appBuildPropFile) throws IOException {
		File srcFile = new File(appBuildPropFile);
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(srcFile), "UTF-8"));
		HashMap<String, String> values = new HashMap<String, String>();
		String str = null;
		while ((str = br.readLine()) != null) {
			String[] value = str.split("=");
			if (value.length == 2) {
				values.put(value[0], value[1]);
			}
		}
		br.close();

		config.put("platform", values.get("platform"));
		config.put("includeUIRes", "true".equals(values.get("includeUIRes")));
		config.put("compileUI", "true".equals(values.get("compileUI")));
		config.put("releaseMode", values.get("releaseMode"));
		config.put("useProxyBuilderServer", "true".equals(values.get("useProxyBuilderServer")));
		String appBuilderServer = values.get("appBuilderServer");
		if (appBuilderServer != null) {
			// 去掉属性文件中\转义的字符
			appBuilderServer = appBuilderServer.replaceAll("\\\\", "");
			config.put("appBuilderServer", appBuilderServer);
		}
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";
		String projectName = request.getParameter("projectName");
		String appProjectFile = nativeDir + "/" + projectName + "/app.project";
		String appConfigFile = nativeDir + "/" + projectName + "/config.xml";
		String appBuildPropFile = nativeDir + "/" + projectName + "/build.properties";

		JSONObject config = createConfigByFile(appProjectFile);
		appendConfig(config, appConfigFile);
		appendBuildProp(config, appBuildPropFile);
		config.put("projectName", projectName);

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(config.toJSONString().getBytes("UTF-8"));
		output.flush();
		output.close();
	}

}
