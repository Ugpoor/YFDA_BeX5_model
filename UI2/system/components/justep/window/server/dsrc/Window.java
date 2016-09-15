import java.util.List;
import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Element;

import com.justep.common.SystemUtils;
import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.component.ComponentUtils;

public class Window implements ComponentTemplate {
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events, Map<String, Object> context) {
		List<?> resources = bound.elements("resource");
		for (Object resource : resources) {
			Element resourceE = (Element) resource;
			for (Object require : resourceE.elements("require")) {
				Element element = (Element) require;
				Attribute attr = element.attribute("url");
				if (attr != null) {
					String requireValue = attr.getValue();
					if (SystemUtils.isNotEmptyString(requireValue))
						ComponentUtils.require((ComponentContext) context, requireValue);
					element.remove(attr);
				}
			}
			bound.remove(resourceE);
		}
	}
}
