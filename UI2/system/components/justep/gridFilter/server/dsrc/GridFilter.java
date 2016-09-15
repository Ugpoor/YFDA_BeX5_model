import java.util.Map;

import org.dom4j.Element;
import com.justep.ui.component.ComponentTemplate;

public class GridFilter implements ComponentTemplate {
	private Element eDef;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events, Map<String, Object> context) {
		eDef = bound;
		processGridSelect();
	}

	private void processGridSelect() {
		Element gridSelect = (Element) eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/gridSelect/gridSelect')]");
		gridSelect.addAttribute("bind-ref", "$model.comp($element.parentElement).selectedValue");
		gridSelect.addAttribute("bind-labelRef", "$model.comp($element.parentElement).selectedLabel");
	}

}
