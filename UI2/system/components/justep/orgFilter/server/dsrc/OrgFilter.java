import java.util.Map;

import org.dom4j.Element;
import com.justep.ui.component.ComponentTemplate;

public class OrgFilter implements ComponentTemplate {
	private Element eDef;
	private String xID;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events, Map<String, Object> context) {
		eDef = bound;
		xID = eDef.attributeValue("xid");
		processOrgSelect();
	}

	private void processOrgSelect() {
		Element gridSelect = (Element) eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/org/orgSelectPC')]");
		gridSelect.addAttribute("bind-ref", "$model.comp($element.parentElement).selectedValue");
		gridSelect.addAttribute("bind-labelRef", "$model.comp($element.parentElement).selectedLabel");
		gridSelect.addAttribute("defaultLabel", "$model.comp('" + xID + "')._getDefaultLabel()");
		gridSelect.addAttribute("onShowOption", "comp('" + xID + "')._onShowOption");
		Element option = gridSelect.element("option");
		option.addAttribute("value", "sFID");
		option.addAttribute("label", "sName");
	}
	
}

