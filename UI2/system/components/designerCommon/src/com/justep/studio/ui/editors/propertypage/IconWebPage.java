package com.justep.studio.ui.editors.propertypage;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.w3c.dom.Element;

import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.util.FileHelper;
import com.justep.studio.util.StudioConfig;
import com.justep.studio.util.XPathUtil;

public class IconWebPage {
	private static String getIconList(String filePath, String prefix) {
		Set<String> set = new HashSet<String>();
		//
		String cssContent = FileHelper.readFileAsStr(filePath, "\n", false, "UTF-8");
		if (cssContent == null) {
			return "";
		}

		StringBuffer sbf = new StringBuffer();
		for (int i = 0, l = cssContent.length(); i < l; i += 1) {
			char c = cssContent.charAt(i);
			// 去掉注释
			if (c == '/' && (i + 1) < l && cssContent.charAt(i + 1) == '*') {
				i += 2;
				while ((i += 1) < l) {
					if (cssContent.charAt(i) == '*' && (i + 1) < l && cssContent.charAt(i + 1) == '/') {
						break;
					}
				}
			} else if (c == '.') {
				// 获取样式名称
				StringBuffer iconBuf = new StringBuffer();
				while ((i += 1) < l) {
					c = cssContent.charAt(i);
					if (c == ' ' || c == ',' || c == '{' || c == '\n' || c == '\r' || c == '[') {
						break;
					}
					iconBuf.append(c);
				}
				String iconCls = iconBuf.toString().trim();
				if (iconCls.startsWith(prefix) && iconCls.endsWith(":before")) {
					iconCls = iconCls.substring(0, iconCls.length()-7);
					if(!set.contains(iconCls)){
						sbf.append("," + iconCls);
						set.add(iconCls);
					}
				}
			}
		}
		if (sbf.length() > 0) {
			return sbf.substring(1);
		}
		return "";
	}

	public void setPropertyItem(PropertyItem prop) {
		requires = new ArrayList<String>();
		XuiElement root = (XuiElement) prop.getOwerElement().getXuiDataModel().getRootElement();
		Element element = root.getOriginElement();

		List<Element> eList = XPathUtil.selectElementNodes(element, "*[local-name(.)='resource']/*[local-name(.)='require']");
		for (Element e : eList) {
			String url = e.getAttribute("url");
			if (url.startsWith("css!")) {
				url = url.substring(4);
			}
			if (iconsFileR.matcher(url).matches()) {
				requires.add(url);
			}else if(iconsFileR.matcher(url + ".css").matches()){
				requires.add(url + ".css");
			}
		}
	}

	private Pattern iconsFileR = Pattern.compile(".*\\.icons\\.css$");
	private Pattern iconPrefixR = Pattern.compile("(.*)\\.icons\\.css$");

	private String names = "";
	private String paths = "";
	private String content = "";
	List<String> requires = null;

	public Map<String, Object> buildIconList() {
		// 系统默认
		String rootDir = StudioConfig.getUIPath();
		
		names = "linear,round,e-commerce,dataControl,icon,glyphicon";
		paths = "$UI/system/components/justep/lib/css1/linear.icons.css,$UI/system/components/justep/lib/css3/round.icons.css,$UI/system/components/justep/lib/css4/e-commerce.icons.css,$UI/system/components/justep/lib/css2/dataControl.icons.css,$UI/system/components/justep/lib/css/icons.css,$UI/system/components/bootstrap/lib/css/bootstrap.min.css";


		String prefixs[] = names.split(",");
		String sysPaths[] = paths.split(",");
		for (int i = 0; i < prefixs.length; i++) {
			sysPaths[i] = sysPaths[i].replace("$UI", rootDir).replace("/", File.separator);
			content += ";" + getIconList(sysPaths[i], prefixs[i] + "-");
		}

		for (String url : this.requires) {
			String filePath = url.replace("$UI", rootDir).replace("/", File.separator);
			String parts[];
			if(File.separator.equals("\\"))
				parts = filePath.split("\\\\");
			else
				parts = filePath.split("/");
			String name = "icon";
			Matcher m = iconPrefixR.matcher(parts[parts.length-1]);
			if (m.find()) {
				name = m.group(1);
			}
			String sList = getIconList(filePath, name + "-");
			names += "," + name;
			paths += "," + url;
			content += ";" + sList;
		}
		content = content.substring(1);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("names", names);
		map.put("icons", content);

		map.put("paths", paths);
		return map;
	}

}
