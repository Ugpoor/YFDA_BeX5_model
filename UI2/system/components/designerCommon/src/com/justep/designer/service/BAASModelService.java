package com.justep.designer.service;

import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.studio.ui.editors.WebEditorPart;
import com.justep.studio.util.FileHelper;
import com.justep.studio.util.StudioConfig;

public class BAASModelService {
    /**
     * 获取数据源名称.
     * @param context
     * @return
     */
	@SuppressWarnings("unchecked")
	public static String getDsNames(Map<String,Object> context){
		 
		 try {
			Document dsCfg = FileHelper.readFileAsXML(StudioConfig.getStudioAppRootPath()+"/config/"+StudioConfig.getDsCfgFile());
			Element elem = dsCfg.getRootElement().element("datasource-instance");
			List<Element> list = elem.elements("datasource");
			StringBuffer sbf = new StringBuffer();
			 
			for (int i = 0, len = list.size(); i < len; i++) {
				Element e = (Element) list.get(i);
				sbf.append(","+e.attributeValue("dsName"));
			}
			if(sbf.length()>0){
				return sbf.toString().substring(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	 
	/**
	 *  .
	 * @param context
	 * @return
	 */
	public static String getContent(Map<String,Object> context){
		WebEditorPart webeditorPart = WebEditorPart.getInstance((String)context.get("filePath"));
		if(webeditorPart != null){
			return webeditorPart.getContent();
		}
		return "";
	}
	
	/**
	 *  
	 * @param context
	 * @return
	 */
	public static void setContent(Map<String,Object> context){
		WebEditorPart webeditorPart = WebEditorPart.getInstance((String)context.get("filePath"));
		if(webeditorPart != null){
			webeditorPart.setContent((String)context.get("content"));
		}
	}
 
}
