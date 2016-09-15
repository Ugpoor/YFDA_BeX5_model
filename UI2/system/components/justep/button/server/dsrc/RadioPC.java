import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;


public class RadioPC implements ComponentTemplate {

	protected Element eButtonDef;

	public String getFlag(){
		return "radio";
	}
	
	public Element processInput(Element eLabel){
		Element eInput = eLabel.addElement(new QName("input", XMLConstants.XHTML_NAMESPACE));
		eInput.addAttribute("type", getFlag());
		Attribute attr = eButtonDef.attribute("bind-checked");
		if(null != attr){
			String s1 = attr.getValue();
			eInput.addAttribute("bind-checked", s1);
			eButtonDef.remove(attr);
		}
		attr = eButtonDef.attribute("bind-enable");
		if(null != attr){
			String s1 = attr.getValue();
			eInput.addAttribute("bind-enable", s1);
			eButtonDef.remove(attr);
		}
		attr = eButtonDef.attribute("bind-disable");
		if(null != attr){
			String s1 = attr.getValue();
			eInput.addAttribute("bind-disable", s1);
			eButtonDef.remove(attr);
		}
		String name = eButtonDef.attributeValue("name");
		if(null!=name && !"".equals(name)) eInput.addAttribute("name", name);
		String value = eButtonDef.attributeValue("value");
		if(null!=value && !"".equals(value)) eInput.addAttribute("value", value);
		return eInput;
	}
	
	public Element processLabel(){
		Element eLabel = eButtonDef.addElement(new QName("label", XMLConstants.XHTML_NAMESPACE));
		processInput(eLabel);
		Element eSpan = eLabel.addElement(new QName("span", XMLConstants.XHTML_NAMESPACE));
		String label = eButtonDef.attributeValue("label");
		if(null!=label && !"".equals(label)) eSpan.setText(label);
		return eLabel;
	}
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		this.eButtonDef = bound;
		JSONObject cfg = processConfig();
		bound.addAttribute("data-config", cfg.toJSONString());
		
		processLabel();
	}

	protected JSONObject processConfig(){
		JSONObject cfg = new JSONObject();
		cfg.put("label", eButtonDef.attributeValue("label"));
		cfg.put("name", eButtonDef.attributeValue("name"));
		cfg.put("value", eButtonDef.attributeValue("value"));
		cfg.put("checkedValue", eButtonDef.attributeValue("checkedValue"));
		cfg.put("uncheckedValue", eButtonDef.attributeValue("uncheckedValue"));
		cfg.put("checked", "true".equalsIgnoreCase(eButtonDef.attributeValue("checked")));
		cfg.put("disabled", "true".equalsIgnoreCase(eButtonDef.attributeValue("disabled")));
		
		return cfg;
	}
}
