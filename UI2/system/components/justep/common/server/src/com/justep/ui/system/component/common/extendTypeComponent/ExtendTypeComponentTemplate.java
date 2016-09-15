package com.justep.ui.system.component.common.extendTypeComponent;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Element;

import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.component.ComponentUtils;

public class ExtendTypeComponentTemplate implements ComponentTemplate {
	public static final String SYS_EXTEND_TYPE = "sys.extend.type";
	public static final String SYS_REQUIRE_EDITOR_CLASSES = "sys.require.editor.classes";
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		loadExtendTypes(bound);
		processRequireEditorClass(context);
	}

	private void loadExtendTypes(Element element){
		String component = element.attributeValue(ComponentUtils.COMPONENT);
		ExtendTypeRegConfig.loadExtendTypeRegConfig(component);
	}
	
	private void processRequireEditorClass(Map<String, Object> context){
		@SuppressWarnings("unchecked")
		List<String> extendTypes = (List<String>)context.get(SYS_EXTEND_TYPE);
		if(null!=extendTypes && extendTypes.size()>0){
			for(int i=extendTypes.size()-1; i>=0; i--){
				if(processRequireEditorClass(extendTypes.get(i),context)){
					extendTypes.remove(i);//生成引入代码后删除
				}
			}
		}
	}

	public static boolean processRequireEditorClass(String extendType, Map<String, Object> context){
		ExtendTypeDef etd = ExtendTypeRegConfig.getExtendTypeDef(extendType);
		if(null!=etd){
			createRequireEditorClassJS(etd.getEditor(), context);
			return true;
		}
		return false;
	}

	private static Set<String> getRequireEditorClasses(Map<String, Object> context){
		@SuppressWarnings("unchecked")
		Set<String> requireEditorClasses = (Set<String>)context.get(SYS_REQUIRE_EDITOR_CLASSES);
		if(null==requireEditorClasses){
			requireEditorClasses = new HashSet<String>();
			context.put(SYS_REQUIRE_EDITOR_CLASSES, requireEditorClasses);
		}
		return requireEditorClasses;
	}
	
	public static List<String> getExtendTypes(Map<String, Object> context){
		@SuppressWarnings("unchecked")
		List<String> extendTypes = (List<String>)context.get(SYS_EXTEND_TYPE);
		if(null==extendTypes){
			extendTypes = new ArrayList<String>();
			context.put(SYS_EXTEND_TYPE, extendTypes);
		}
		return extendTypes;
	}

	private static void createRequireEditorClassJS(String editorClassUrl, Map<String, Object> context){
		addEditorClass(editorClassUrl, context);
	}

	private static String getRequireEditorClassJS(String editorClassUrl){
		String ret = "this.addEditorClass('"+editorClassUrl+"',require('"+editorClassUrl+"'))";
		return ret;
	}
	
	public static void addEditorClass(String editorClassUrl, Map<String, Object> context){
		if(null==editorClassUrl || "".equals(editorClassUrl)) return;
		Set<String> requireEditorClasses = getRequireEditorClasses(context);
		if(requireEditorClasses.contains(editorClassUrl)) return;
		@SuppressWarnings("unchecked")
		List<String> init = (List<String>) context.get(ComponentContext.INIT);
		String js = getRequireEditorClassJS(editorClassUrl);
		init.add(js);
		requireEditorClasses.add(editorClassUrl);//添加成功后记录在context
	}
}
