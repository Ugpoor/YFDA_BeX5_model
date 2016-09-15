import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.component.Grid;
import com.justep.system.transform.Mate;
import com.justep.system.transform.Transform;
import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.component.common.BaseContainer;
import com.justep.ui.xml.XMLConstants;
import com.justep.ui2.system.component.data.BaseDataDef;

public class CodeSelect implements ComponentTemplate {
	public static final QName READER_QNAME = new QName("reader", XMLConstants.XHTML_NAMESPACE);
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		// 内置的bizData
		Element codeDataE = (Element)bound.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
		if (null == codeDataE) {
			codeDataE = bound.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
			codeDataE.addAttribute("component", "$UI/system/components/justep/data/bizData");
		}

		setAttributeDefaultValue(codeDataE, "concept", "SA_Code");
		setAttributeDefaultValue(codeDataE, "limit", "-1");

		Element readerE = codeDataE.element(READER_QNAME);
		if (null == readerE)
			readerE = codeDataE.addElement(READER_QNAME);
		setAttributeDefaultValue(readerE, "action", "/system/logic/action/querySA_CodeAction");

		String dataXid = codeDataE.attributeValue("xid");
		if (null == dataXid || "".equals(dataXid)) {
			dataXid = "D" + UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			codeDataE.addAttribute("xid", dataXid);
		}
		
		bound.addAttribute("_data_", dataXid);

		setAttributeDefaultValue(bound, "bind-optionsLabel", "sName");
		String optionLabel = bound.attributeValue("bind-optionsLabel");
		if(null!=optionLabel && !"".equals(optionLabel)){
			bound.addAttribute("bind-optionsText", "'"+optionLabel+"'");
			bound.remove(bound.attribute("bind-optionsLabel"));
		}
		
		setAttributeDefaultValue(bound, "bind-optionsValue", "sCode");
		String optionValue = bound.attributeValue("bind-optionsValue");
		if(null!=optionValue && !"".equals(optionValue)){
			bound.addAttribute("bind-optionsValue", "'"+optionValue+"'");
		}

		String optionCaption = bound.attributeValue("bind-optionsCaption");
		if(null!=optionCaption && !"".equals(optionCaption)){
			bound.addAttribute("bind-optionsCaption", "'"+optionCaption+"'");
		}
		
		setAttributeDefaultValue(bound, "bind-options", dataXid + ".datas");
		String options = bound.attributeValue("bind-options");
		if(null!=options && !"".equals(options)){
			String str = options.replaceAll("\\$model.", "").replaceAll("\\$parent.", "");
			//支持data的特殊处理，支持直接写data的xid
			Object dataDef = context.get("data." + str);
			if(dataDef instanceof BaseDataDef || "sys.data".equals(dataDef)) options = options+".datas";
			bound.addAttribute("bind-options", options);

			//生成select组件的selectOptionsAfterRender
			@SuppressWarnings("unchecked")
			List<String> init = (List<String>) context.get(ComponentContext.INIT);
			String js = "var justep = require('$UI/system/lib/justep');"
						+"if(!this['__justep__']) this['__justep__'] = {};"
						+"if(!this['__justep__'].selectOptionsAfterRender)"
						+"	this['__justep__'].selectOptionsAfterRender = function($element) {"
						+"		var comp = justep.Component.getComponent($element);"
						+"		if(comp) comp._addDefaultOption();"
						+"	};"
						+"if(!this['__justep__'].selectOptionsBeforeRender)"
						+"	this['__justep__'].selectOptionsBeforeRender = function($element) {"
						+"		var comp = justep.Component.getComponent($element);"
						+"		if(comp) comp._optionsBeforeRender();"
						+"	};";
			init.add(js);			
			bound.addAttribute("bind-optionsAfterRender2", "$model.__justep__.selectOptionsAfterRender.bind($model,$element)");
			bound.addAttribute("bind-optionsBeforeRender", "$model.__justep__.selectOptionsBeforeRender.bind($model,$element)");
		}
	}

	private void setAttributeDefaultValue(Element e, String name, String value) {
		String v = e.attributeValue(name);
		if (null == v || "".equals(v)) {
			e.addAttribute(name, value);
		}
	}
}
