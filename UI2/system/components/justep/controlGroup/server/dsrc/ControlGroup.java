import java.util.Map;

import org.dom4j.Element;

import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;


public class ControlGroup implements ComponentTemplate {

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		String collapsible = bound.attributeValue("collapsible");
		String collapsed = bound.attributeValue("collapsed");
		if(null!=collapsible && "true".equalsIgnoreCase(collapsible) && null!=collapsed && "true".equalsIgnoreCase(collapsed)){
			for(Object o : bound.elements()){
				Element ele = (Element)o;
				String sClass = ele.attributeValue("class");
				if(null==sClass){
					ele.addAttribute("class", "hide");
				}else if(0>sClass.indexOf("x-control-group-title")){
					ele.addAttribute("class", sClass + " hide");
				}
			}
		}		
	}

}
