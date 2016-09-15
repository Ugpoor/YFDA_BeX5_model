package com.justep.system.component;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Attribute;
import org.dom4j.Element;
import org.dom4j.DocumentHelper;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.system.transform.Mate;
import com.justep.system.transform.Transform;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;

public class Grid implements ComponentTemplate {
	public static String xml2jsonCfg = "{\"attrs\":{"
			+"            \"columns\":{"
		    +"                     \"type\":'List',"
		    +"                     \"target\":'colModel',"
			+"                     \"itemName\":'column',"
		    +"                     \"itemType\":'Map'"
		    +"                     },"
			+"            \"sopt\":{"
		    +"                     \"type\":'List'"
		    +"                     },"
			+"            \"editor\":{"
		    +"                     \"ignore\":true"
		    +"                     },"
			+"            \"editable\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"multiRowEditor\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"directEdit\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"disableEditorDisplay\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"		    
			+"            \"useVirtualRoot\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"cascade\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"  
			+"            \"sortable\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"frozenColumnCount\":{"      
		    +"                     \"type\":'Integer'"
		    +"                     },"
			+"            \"decimalPlaces\":{"      
		    +"                     \"type\":'Integer'"
		    +"                     },"
			+"            \"hidden\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"resizable\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"groupHeaders\":{"
		    +"                     \"type\":'List',"
			+"                     \"itemName\":'groupHeader',"
		    +"                     \"itemType\":'List'"
		    +"                     },"
			+"            \"groupHeader\":{"
		    +"                     \"type\":'List',"
		    +"                     \"itemType\":'Map'"
		    +"                     },"
			+"            \"useColSpanStyle\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"		    
			+"            \"columnCount\":{"
		    +"                     \"type\":'Integer'"
		    +"                     },"		    
			+"            \"rowNum\":{"
		    +"                     \"type\":'Integer'"
		    +"                     },"
			+"            \"showRowNumber\":{"
		    +"                     \"target\":'rownumbers',"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"rowNumberWidth\":{"
		    +"                     \"target\":'rownumWidth',"
		    +"                     \"type\":'Integer'"
		    +"                     },"
			+"            \"serverSort\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"altRows\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"useFilterBar\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"treeGrid\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"grouping\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"useGroupbar\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"useFooter\":{"
		    +"                     \"type\":'Boolean',"
		    +"                     \"target\":'footerrow'"
		    +"                     },"
			+"            \"multiselect\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"multiboxonly\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"hiddenPager\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"hiddenCaptionbar\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"groupCollapse\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"groupSummary\":{"
		    +"                     \"type\":'List',"
		    +"                     \"itemType\":'Boolean'"
		    +"                     },"
			+"            \"groupColumnShow\":{"
		    +"                     \"type\":'List',"
		    +"                     \"itemType\":'Boolean'"
		    +"                     },"
			+"            \"moveColumn\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"summary\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"columnShow\":{"
		    +"                     \"type\":'Boolean'"
		    +"                     },"
			+"            \"groupField\":{"
		    +"                     \"type\":'List'"
		    +"                     },"
			+"            \"groupText\":{"
		    +"                     \"type\":'List'"
		    +"                     },"
			+"            \"groupOrder\":{"
		    +"                     \"type\":'List'"
		    +"                     }"
			+"           }"
		    +"}";

	private Element eGridDef;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		this.eGridDef = bound;
		this.eGridDef.setQName(XMLConstants.XHTML_TABLE_QNAME);
		
		//产生xid
		if(null==eGridDef.attribute("xid")) eGridDef.addAttribute("xid", createXID());
		//生成grid的配置
		JSONObject cfg = processGridConfig();
		if(null!=cfg)
			bound.addAttribute("data-config", cfg.toJSONString());
	}

	private JSONObject processGridConfig(){
		Mate mate = new Mate(xml2jsonCfg);
		JSONObject ret = (JSONObject)Transform.asJSON(eGridDef, mate);
		//列编辑器处理,删除前先处理
		String editorsXID = createEditor(ret);
		ret.put("editors", editorsXID);
		//删除定义节点
		eGridDef.clearContent();
		//删除宽高属性，影响运行时逻辑
		Attribute dattr = eGridDef.attribute("width");
		if(null!=dattr)eGridDef.remove(dattr);
		dattr = eGridDef.attribute("height");
		if(null!=dattr)eGridDef.remove(dattr);
		//去除多余的属性
		java.util.List<String> removeAttrs = new ArrayList<String>();
		for(String key : ret.keySet()){
			if(key.startsWith("on")
				||key.startsWith("bind-")
				||"xid".equals(key)
				||"component".equals(key)
				||"style".equals(key)
				||"class".equals(key))
				removeAttrs.add(key);
		}
		for(String attr : removeAttrs){
			ret.remove(attr);
		}

		//分页导航条
		//boolean hiddenPager = ret.containsKey("hiddenPager") && ret.getBooleanValue("hiddenPager");
		boolean hiddenPager = true;//lzg 2014.12.8目前暂时不支持使用grid的导航，使用data的相关导航实现
		String appearance = ret.getString("appearance");
		if(!hiddenPager && !"treeGrid".equalsIgnoreCase(appearance) && !"tree".equalsIgnoreCase(appearance)){
			String pagerXID = createPager();
			ret.put("pager", pagerXID);
		}
		
		return ret;
	}
	
	private String createXID(){
		return UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
	}
	
	private String createPager(){
		String xid = createXID();
		eGridDef.getParent().addElement(XMLConstants.XHTML_DIV_QNAME).addAttribute("xid", xid);
		return xid;
	}
	
	private Element createEditorByType(String type, String name, JSONObject cfg){
		Element comp = null;
		
		if("input".equals(type)){
			comp = createInputEditor(name, cfg);
		}else if("checkbox".equals(type)){
			comp = createCheckboxEditor(name, cfg);
		}else if("textarea".equals(type)){
			comp = createTextareaEditor(name, cfg);
		}
		
		if(null!=comp){
			addBindRef(name, comp);
			Element ret = DocumentHelper.createElement(XMLConstants.XHTML_DIV_QNAME);
			ret.addAttribute("col", name);
			ret.add(comp);
			return ret;
		}else return null;
	}
	
	//<input component="$UI/system/components/justep/input/input" {0} class="form-control x-edit-focusin"/>
	private Element createInputEditor(String name, JSONObject cfg){
		Element input = DocumentHelper.createElement(XMLConstants.XHTML_INPUT_QNAME);
		input.addAttribute("component", "$model/UI2/system/components/justep/input/input");
		input.addAttribute("class", "form-control x-edit-focusin");
		return input;
	}
	
	//<textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit-focusin" {0}/>
	private Element createTextareaEditor(String name, JSONObject cfg){
		Element textarea = DocumentHelper.createElement(XMLConstants.XHTML_TEXTAREA_QNAME);
		textarea.addAttribute("component", "$model/UI2/system/components/justep/textarea/textarea");
		textarea.addAttribute("class", "form-control x-edit-focusin");
		return textarea;
	}
	
	//<span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" {0}></span>
	private Element createCheckboxEditor(String name, JSONObject cfg){
		//默认支持行全部显示
		JSONObject col = getColCfg(name, cfg);
		if(null!=col) col.put("multiRowEditor", true);
		
		Element checkbox = DocumentHelper.createElement(XMLConstants.XHTML_SPAN_QNAME);
		checkbox.addAttribute("component", "$model/UI2/system/components/justep/button/checkbox");
		checkbox.addAttribute("class", "x-checkbox");
		return checkbox;
	}
	
	private JSONObject getColCfg(String name, JSONObject cfg){
		if(null!=cfg && cfg.containsKey("colModel")){
			JSONArray cols = cfg.getJSONArray("colModel");
			int size = cols.size();
			for(int i=0; i<size; i++){
				JSONObject col = cols.getJSONObject(i);
				if(col!=null && col.containsKey("name") && name.equals(col.get("name"))) return col;
			}
		}
		return null;
	}
	
	private void addBindRef(String name, Element comp){
		if(null!=comp)
			comp.addAttribute("bind-ref", "ref('"+name+"')");
	}
	
	private String createEditor(JSONObject cfg){
		Element cols = eGridDef.element("columns");
		if(null!=cols){
			String xid = createXID();
			Element editors = DocumentHelper.createElement(XMLConstants.XHTML_DIV_QNAME);
			editors.addAttribute("xid", xid);
			editors.addAttribute("class", "x-grid-editors");
			editors.addAttribute("bind-with", "comp('"+eGridDef.attributeValue("xid")+"').getCellEditorsBindingObject()");
			boolean hasEditor = false;
			java.util.List<?> columns = cols.elements("column");
			for(Object col : columns){
				Element eleCol = (Element)col;
				String colName = eleCol.attributeValue("name");
				String strEditor = eleCol.attributeValue("editor");
				Element editor = eleCol.element("editor");
				if(null!=editor && editor.hasContent()){
					hasEditor = true;
					Element colEditor = (Element)editor.clone();
					colEditor.setQName(XMLConstants.XHTML_DIV_QNAME);
					colEditor.addAttribute("col", colName);
					editors.add(colEditor);
				}else if(null!=strEditor&&!"".equals(strEditor)){
					Element colEditor = createEditorByType(strEditor,colName,cfg);
					if(null!=colEditor){
						hasEditor = true;
						editors.add(colEditor);
					}
				}
			}
			if(hasEditor){
				eGridDef.getParent().add(editors);
				return xid;
			}
		}
		return null;
	}
	
}