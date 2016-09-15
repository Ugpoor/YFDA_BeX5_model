package com.justep.ui.system.component.common.extendTypeComponent;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.common.SystemUtils;
import com.justep.filesystem.FileSystem;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.message.UIMessages;
import com.justep.ui.component.ComponentUtils;
import com.justep.ui.exception.UIException;
import com.justep.ui.util.NetUtils;

public class ExtendTypeRegConfig {
	public static final String CONFIG_EXT = ".reg.js";
	
	public static String STR_NAME = "name";
	public static String STR_EDITOR = "editor";
	
	private static Map<String, ExtendTypeDef> extendTypeDefs = Collections.synchronizedMap(new HashMap<String, ExtendTypeDef>());
	private static Set<String> regLoadeds = Collections.synchronizedSet(new HashSet<String>());

	public static boolean hasRegConfig(String component) {
		if (component == null || component.trim().equals("")) {
			return false;
		}
		return ComponentUtils.hasFile(component + CONFIG_EXT);
	}
	
	public static void loadExtendTypeRegConfig(String component){
		if (SystemUtils.isDebug() || !regLoadeds.contains(component)){
			if (hasRegConfig(component)){
				if (readConfig(component)) regLoadeds.add(component);
			}
		}
	}
	
	public static ExtendTypeDef getExtendTypeDef(String name){
		if(extendTypeDefs.containsKey(name)) return extendTypeDefs.get(name);
		else return null;
	}
	
	private static boolean readConfig(String component){
		FileSystem fs = FileSystemWrapper.instance();
		String path = fs.getRealPath(component + CONFIG_EXT);
		FileReader fr = null;
		boolean ret = false;
		try{
			fr = new FileReader(new File(path));
			String content = NetUtils.readStreamAsString(fr);
			int start = content.indexOf("{");
			int end = content.lastIndexOf("}");
			if ((start!=-1) && (end!=-1) && (end>start+1)){
				String body = content.substring(start+1, end);
				if (SystemUtils.isNotEmptyString(body)){
					start = body.indexOf("[");
					end = body.indexOf("]");
					if ((start!=-1) && (end!=-1)){
						String config = body.substring(start, end+1);
						JSONArray defs = JSONArray.parseArray(config);
						int len = defs.size();
						for(int i=0; i<len; i++){
							JSONObject o = defs.getJSONObject(i);
							String name = o.containsKey(STR_NAME)?o.getString(STR_NAME):null;
							if(null!=name && !"".equals(name)){
								ExtendTypeDef etd = new ExtendTypeDef(name, o.containsKey(STR_EDITOR)?o.getString(STR_EDITOR):null);
								extendTypeDefs.put(name, etd);
							}
						}
						
						ret = true;
					}
				}
			}
			return ret;
		}catch(Exception e){
			throw UIException.create(e, UIMessages.READ_COMPONENT_CONFIG_ERROR2, component, path);
		}finally{
			try {
				if (fr != null)
					fr.close();
			} catch (IOException e) {}
		}
	}
	
}
