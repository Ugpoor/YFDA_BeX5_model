import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.XPath;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;

public class GetRegPlugins extends com.justep.ui.impl.JProcessorImpl {

	private static Logger log = Logger.getLogger("GetRegPlugins");

	private JSONArray getPluginParams(Element element) {
		if (element != null) {
			@SuppressWarnings("unchecked")
			List<Element> elements = element.elements("param");
			JSONArray params = new JSONArray();
			for (int i = 0; i < elements.size(); i++) {
				JSONObject param = new JSONObject();
				param.put("name", elements.get(i).attributeValue("name"));
				param.put("displayName", elements.get(i).attributeValue("displayName"));
				param.put("defaultValue", elements.get(i).attributeValue("defaultValue"));
				// type: string, number, boolean, enumerate 输入类型
				param.put("type", elements.get(i).attributeValue("type"));
				// 枚举值
				param.put("values", elements.get(i).attributeValue("values"));
				params.add(param);
			}
			return params;
		} else {
			return null;
		}
	}

	private JSONObject getPluginInfo(File pluginXML) throws UnsupportedEncodingException, FileNotFoundException, DocumentException {
		SAXReader xReader = new SAXReader();
		InputStreamReader isr = new InputStreamReader(new FileInputStream(pluginXML), "UTF-8");
		Document doc = xReader.read(isr);
		Element plugin = doc.getRootElement();
		JSONObject result = new JSONObject();
		result.put("id", plugin.attributeValue("id"));
		result.put("version", plugin.attributeValue("version"));
		result.put("name", plugin.element("name").getText());
		result.put("hide", plugin.attributeValue("hide"));
		if (plugin.element("description") != null) {
			result.put("description", plugin.element("description").getText());
		}

		String defaultNamespace = doc.getRootElement().getNamespaceURI();
		HashMap<String, String> nsMap = new HashMap<String, String>();
		nsMap.put("default", defaultNamespace);

		XPath x = doc.createXPath("default:dependency | default:platform[@name='ios' or @name='android']/default:dependency");
		x.setNamespaceURIs(nsMap);
		@SuppressWarnings("unchecked")
		List<Element> nodes = x.selectNodes(plugin);
		String dependency = "";
		for (int i = 0; i < nodes.size(); i++) {
			dependency += i == 0 ? "" : ",";
			dependency += nodes.get(i).attributeValue("id");
		}
		result.put("dependency", dependency);

		JSONObject params = new JSONObject();
		@SuppressWarnings("unchecked")
		List<Element> platforms = plugin.elements("platform");
		for (Element platform : platforms) {
			params.put(platform.attributeValue("name"), getPluginParams(platform));
		}
		result.put("params", params);

		return result;
	}

	private JSONObject getPluginInfo(String pluginPath) throws UnsupportedEncodingException, FileNotFoundException, DocumentException {
		File pluginXML = new File(pluginPath + "/plugin.xml");
		JSONObject result = getPluginInfo(pluginXML);
		pluginXML = new File(pluginPath + "/plugin-ex.xml");
		if (pluginXML.exists()) {
			JSONObject result2 = getPluginInfo(pluginXML);
			mergeResult(result, result2);
		}

		return result;
	}

	private void mergeResult(JSONObject result, JSONObject result2) {
		final String[] props = { "id", "version", "name", "hide", "description", "dependency", "params" };
		for (int i = 0; i < props.length; i++) {
			if (result2.get(props[i]) != null) {
				result.put(props[i], result2.get(props[i]));
			}
		}
	}

	private void appendPlugins(HashMap<String, JSONObject> pluginList, String pluginsDir) {
		File dir = new File(pluginsDir);
		if (dir.exists()) {
			JSONObject pluginInfo;
			String files[] = dir.list();
			for (String pluginDir : files) {
				File pluginXML = new File(pluginsDir + "/" + pluginDir + "/plugin.xml");
				if (pluginXML.exists()) {
					try {
						pluginInfo = getPluginInfo(pluginXML.getParent());
						if (!"true".equals(pluginInfo.getString("hide"))) {
							pluginList.put(pluginInfo.getString("id"), pluginInfo);
						}
					} catch (Exception e) {
						// 加载失败，忽略
						log.warn("加载cordova插件信息失败：" + pluginXML.getAbsolutePath());
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String projectName = request.getParameter("projectName");
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";
		String commonPluginsDir = nativeDir + "/plugins";

		HashMap<String, JSONObject> pluginsMap = new HashMap<String, JSONObject>();
		appendPlugins(pluginsMap, commonPluginsDir);
		appendPlugins(pluginsMap, nativeDir + "/" + projectName + "/plugins");

		List<Map.Entry<String, JSONObject>> pluginList = new LinkedList<Map.Entry<String, JSONObject>>();
		pluginList.addAll(pluginsMap.entrySet());
		Collections.sort(pluginList, new Comparator<Map.Entry<String, JSONObject>>() {
			public int compare(Map.Entry<String, JSONObject> o1, Map.Entry<String, JSONObject> o2) {
				return o1.getValue().getString("name").compareTo(o2.getValue().getString("name"));
			}
		});

		JSONArray plugins = new JSONArray();
		for (Map.Entry<String, JSONObject> plugin : pluginList) {
			plugins.add(plugin.getValue());
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(plugins.toJSONString().getBytes("UTF-8"));
		output.flush();
		output.close();
	}
}
