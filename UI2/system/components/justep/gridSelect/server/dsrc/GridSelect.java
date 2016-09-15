import java.util.Map;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.component.common.BaseContainer;
import com.justep.ui.xml.XMLConstants;
import com.justep.system.component.Grid;
import com.justep.system.transform.Mate;
import com.justep.system.transform.Transform;


public class GridSelect implements ComponentTemplate {
	private Element eSelectDef;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		eSelectDef = bound;
		BaseContainer baseContainer = new BaseContainer();

		JSONObject cfg = processConfig(baseContainer);
		bound.addAttribute("data-config", cfg.toJSONString());

		QName inputQName = new QName("input", XMLConstants.XHTML_NAMESPACE);
		Element input = bound.addElement(inputQName);
		input.addAttribute("class", "form-control x-gridSelect-input");
		if(baseContainer.attributeBoolValue(eSelectDef, "disabled", false))
			input.addAttribute("disabled", "disabled");
		QName spanQName = new QName("span", XMLConstants.XHTML_NAMESPACE);
		Element span = bound.addElement(spanQName);
		String clearButtonClass = "x-gridSelect-clear icon-close-circled ";
		if(!"true".equalsIgnoreCase(eSelectDef.attributeValue("clearButton")))
			clearButtonClass = clearButtonClass + "hide";
		span.addAttribute("class", clearButtonClass);
	}

	private JSONObject processConfig(BaseContainer baseContainer){
		JSONObject cfg = new JSONObject();
		cfg.put("optionCfg", processOptionConfig());
		if(null!=eSelectDef.attribute("valueSeparator"))
			cfg.put("valueSeparator", eSelectDef.attributeValue("valueSeparator"));
		if(null!=eSelectDef.attribute("labelSeparator"))
			cfg.put("labelSeparator", eSelectDef.attributeValue("labelSeparator"));
		if(null!=eSelectDef.attribute("extSeparator"))
			cfg.put("extSeparator", eSelectDef.attributeValue("extSeparator"));
		if("true".equalsIgnoreCase(eSelectDef.attributeValue("multiselect")))
			cfg.put("multiselect", true);
		if("true".equalsIgnoreCase(eSelectDef.attributeValue("clearButton")))
			cfg.put("clearButton", true);
		cfg.put("optionHeight",baseContainer.attributeIntValue(eSelectDef, "optionHeight", 300));
		cfg.put("autoOptionWidth",baseContainer.attributeBoolValue(eSelectDef, "autoOptionWidth", false));
		cfg.put("disabled",baseContainer.attributeBoolValue(eSelectDef, "disabled", false));
		cfg.put("defaultLabel",baseContainer.attributeValue(eSelectDef, "defaultLabel", null));
		cfg.put("selectFilter",baseContainer.attributeValue(eSelectDef, "selectFilter", null));
		cfg.put("inputChangeable",baseContainer.attributeBoolValue(eSelectDef, "inputChangeable", false));
		cfg.put("inputFilterable",baseContainer.attributeBoolValue(eSelectDef, "inputFilterable", false));
		return cfg;
	}

	private JSONObject processOptionConfig(){
		Element eleOp = eSelectDef.element("option");
		if(null!=eleOp){
			//处理cols
			processOptionCols(eleOp);
			
			Mate mate = new Mate(Grid.xml2jsonCfg);
			JSONObject cfg = (JSONObject)Transform.asJSON(eleOp, mate);
			eSelectDef.remove(eleOp);
			
			//生成option节点
			//<div class="x-gridSelect-option"/>
			QName divQName = new QName("div", XMLConstants.XHTML_NAMESPACE);
			eSelectDef.addElement(divQName).addAttribute("class", "x-gridSelect-option");
			return cfg;
		}
		return null;
	}
	
	private void processOptionCols(Element eleOp){
		Element colsE = eleOp.element("columns");
		if(null==colsE)
			colsE = eleOp.addElement("columns");
		java.util.List<?> colList = colsE.elements("column");
		if(null!=colList && colList.size()<=0){
			Element colE = colsE.addElement("column");
			colE.addAttribute("name", (null!=eleOp.attribute("label"))?eleOp.attributeValue("label"):eleOp.attributeValue("value"));
		}
	}
}
