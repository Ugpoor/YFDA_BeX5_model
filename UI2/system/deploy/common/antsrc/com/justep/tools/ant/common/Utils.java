package com.justep.tools.ant.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.XPath;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class Utils {

	static public void replaceFileText(final String filePath, String srcStr, String replaceStr) throws FileNotFoundException, IOException {
		replaceFileText(new File(filePath), srcStr, replaceStr);
	}

	static public void replaceFileText(File file, String srcStr, String replaceStr) throws FileNotFoundException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String str = null;
		while ((str = br.readLine()) != null)
			sb.append(str + "\r\n");
		br.close();

		FileOutputStream fileOutStream = new FileOutputStream(file);
		fileOutStream.write(sb.toString().replaceAll(srcStr, replaceStr).getBytes("UTF-8"));
		fileOutStream.close();
	}

	public static Boolean isMacOSX() {
		return (System.getProperty("os.name").toLowerCase().indexOf("mac os x") != -1);
	}

	public static String getUrlVersion(String path) throws IOException {
		File appMetaFile = new File(path + "/appMetadata_in_server.json");
		if (appMetaFile.exists()) {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(appMetaFile), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			String str = null;
			while ((str = br.readLine()) != null) {
				sb.append(str);
			}
			br.close();
			JSONObject appMeta = JSONObject.parseObject(sb.toString());
			JSONObject resourceInfo = appMeta.getJSONObject("resourceInfo");
			if (resourceInfo != null) {
				return resourceInfo.getString("version");
			}
		}
		return null;
	}

	static private JSONArray getPluginParams(Element element) {
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

	static private JSONObject getPluginInfo(File pluginXML) throws UnsupportedEncodingException, FileNotFoundException, DocumentException {
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

	static private void mergeResult(JSONObject result, JSONObject result2) {
		final String[] props = { "id", "version", "name", "hide", "description", "dependency", "params" };
		for (int i = 0; i < props.length; i++) {
			if (result2.get(props[i]) != null) {
				result.put(props[i], result2.get(props[i]));
			}
		}
	}

	static public JSONObject getPluginInfo(String pluginPath) throws UnsupportedEncodingException, FileNotFoundException, DocumentException {
		File pluginXML = new File(pluginPath + "/plugin.xml");
		JSONObject result = getPluginInfo(pluginXML);
		pluginXML = new File(pluginPath + "/plugin-ex.xml");
		if (pluginXML.exists()) {
			JSONObject result2 = getPluginInfo(pluginXML);
			mergeResult(result, result2);
		}

		return result;
	}

	
}
