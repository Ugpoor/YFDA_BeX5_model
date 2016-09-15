import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.component.Grid;
import com.justep.system.transform.Mate;
import com.justep.system.transform.Transform;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.component.common.BaseContainer;
import com.justep.ui.xml.XMLConstants;

public class CodeSelectPC implements ComponentTemplate {
	public static final QName READER_QNAME = new QName("reader", XMLConstants.XHTML_NAMESPACE);

	private Element eDef;
	Map<String, Object> context;
	String dataXid = null;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		// TODO 自动生成的方法存根
		eDef = bound;
		this.context = context;

		processCodeData();
		processCodeOption();
		JSONObject cfg = processConfig();
		bound.addAttribute("data-config", cfg.toJSONString());
	}

	protected JSONObject processOptionConfig() {
		Element eleOp = eDef.element("option");
		if (null != eleOp) {
			Mate mate = new Mate(Grid.xml2jsonCfg);
			JSONObject cfg = (JSONObject) Transform.asJSON(eleOp, mate);
			eDef.remove(eleOp);

			//生成option节点
			//<div class="x-gridSelect-option"/>
			QName divQName = new QName("div", XMLConstants.XHTML_NAMESPACE);
			eDef.addElement(divQName).addAttribute("class", "x-gridSelect-option");
			return cfg;
		}
		return null;
	}

	private JSONObject processConfig() {
		JSONObject cfg = new JSONObject();
		BaseContainer baseContainer = new BaseContainer();
		cfg.put("optionCfg", processOptionConfig());
		if (null != eDef.attribute("valueSeparator"))
			cfg.put("valueSeparator", eDef.attributeValue("valueSeparator"));
		if (null != eDef.attribute("labelSeparator"))
			cfg.put("labelSeparator", eDef.attributeValue("labelSeparator"));
		if (null != eDef.attribute("extSeparator"))
			cfg.put("extSeparator", eDef.attributeValue("extSeparator"));
		if ("true".equalsIgnoreCase(eDef.attributeValue("multiselect")))
			cfg.put("multiselect", true);
		cfg.put("optionHeight", baseContainer.attributeIntValue(eDef, "optionHeight", 300));
		cfg.put("autoOptionWidth",baseContainer.attributeBoolValue(eDef, "autoOptionWidth", false));
		cfg.put("defaultLabel",baseContainer.attributeValue(eDef, "defaultLabel", null));
		cfg.put("codeType", baseContainer.attributeValue(eDef, "codeType"));
		cfg.put("selectFilter",baseContainer.attributeValue(eDef, "selectFilter", null));
		
		return cfg;
	}

	/*
	    <div component="$UI/system/components/justep/data/bizData" xid="codeData" concept="SA_Code"
	      offset="0" limit="-1"> 
	      <reader action="/system/logic/action/querySA_CodeAction"/>  
	    </div> 
	*/
	protected void processCodeData() {
		Element codeDataE = (Element)eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
		if (null == codeDataE) {
			codeDataE = eDef.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
			codeDataE.addAttribute("component", "$UI/system/components/justep/data/bizData");
		}

		setAttributeDefaultValue(codeDataE, "concept", "SA_Code");
		setAttributeDefaultValue(codeDataE, "limit", "-1");

		Element readerE = codeDataE.element(READER_QNAME);
		if (null == readerE)
			readerE = codeDataE.addElement(READER_QNAME);
		setAttributeDefaultValue(readerE, "action", "/system/logic/action/querySA_CodeAction");

		dataXid = codeDataE.attributeValue("xid");
		if (null == dataXid || "".equals(dataXid)) {
			dataXid = "D" + UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			codeDataE.addAttribute("xid", dataXid);
		}
	}

	/*
	<option data="codeData" value="sCode" label="sName" ext="sType"> 
	  <columns xid="columns1">
	    <column name="sName" xid="column1"/>
	  </columns>
	</option>
	*/
	protected void processCodeOption() {
		Element optionE = eDef.element("option");;
		if (null == optionE) {
			optionE = eDef.addElement(new QName("option", XMLConstants.XHTML_NAMESPACE));
		}

		optionE.addAttribute("data", dataXid);
		setAttributeDefaultValue(optionE, "value", "sCode");
		setAttributeDefaultValue(optionE, "label", "sName");
		setAttributeDefaultValue(optionE, "ext", "sType");

		Element colsE = optionE.element("columns");
		if (null == colsE)
			colsE = optionE.addElement(new QName("columns", XMLConstants.XHTML_NAMESPACE));
		Element colE = colsE.element("column");
		if (null == colE)
			colE = optionE.addElement(new QName("column", XMLConstants.XHTML_NAMESPACE));
		colE.addAttribute("name", "sName");
	}
	
	private void setAttributeDefaultValue(Element e, String name, String value) {
		String v = e.attributeValue(name);
		if (null == v || "".equals(v)) {
			e.addAttribute(name, value);
		}
	}
}
