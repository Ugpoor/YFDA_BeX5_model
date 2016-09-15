import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;


public class DataEdit implements ComponentTemplate {

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		JSONObject cfg = processConfig(bound);
		bound.addAttribute("data-config", cfg.toJSONString());
	}

	protected JSONObject processConfig(Element bound){
		JSONObject cfg = new JSONObject();
		cfg.put("bindRef", bound.attributeValue("bind-ref"));//为了保存原始的ref串
		
		return cfg;
	}
}
