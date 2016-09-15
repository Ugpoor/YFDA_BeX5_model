import java.util.Map;
import java.util.UUID;

import org.dom4j.Attribute;
import org.dom4j.Element;

import com.justep.ui.component.ComponentTemplate;

public class Panel implements ComponentTemplate {

	private Element eDef;

	// 固定常量
	private int iosStatusBarHeight = 20;
	private int defaultTopHeight = 48;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events, Map<String, Object> context) {
		this.eDef = bound;

		String thValue = null;
		String bhValue = null;
		int oValueInt = 0;
		int thValueInt = 0;
		
		// 生成class
		String xid = "p" + UUID.randomUUID().toString().replace("-", "");
		String className = xid + "-iosstatusbar";
		Element styleElement = eDef.addElement("style");

		Element top = (Element) eDef.selectSingleNode("*[contains(@class, 'x-panel-top')]");
		if (top != null) {
			top.addAttribute("component", "$model/UI2/system/components/justep/panel/child");
			thValue = top.attributeValue("height");
			if (thValue != null)
				oValueInt = Integer.parseInt(thValue);
			else
				oValueInt = defaultTopHeight;
			thValueInt = oValueInt + iosStatusBarHeight;
		}

		Element bottom = (Element) eDef.selectSingleNode("*[contains(@class, 'x-panel-bottom')]");
		if (bottom != null) {
			bottom.addAttribute("component", "$model/UI2/system/components/justep/panel/child");
			bhValue = bottom.attributeValue("height");
		}

		Element content = (Element) eDef.selectSingleNode("*[contains(@class, 'x-panel-content')]");
		if(content != null){
			content.addAttribute("component", "$model/UI2/system/components/justep/panel/child");
		}
		
		if (eDef.attribute("class") != null) {
			Attribute styleAttr = eDef.attribute("class");
			String style = styleAttr.getValue();
			style = style + " " + className;
			styleAttr.setValue(style);
		} else {
			eDef.addAttribute("class", className);
		}
		
		String tStyle = ".x-panel.%s >.x-panel-top {" + 
					"height: %dpx;" + 
				"}" + 
				".x-panel.%s >.x-panel-content {	" + 
					"top: %dpx;" +
					"bottom: %spx;" +
				"}" +
				".x-panel.%s >.x-panel-bottom {" + 
					"height: %spx;" + 
				"}" +
				".iosstatusbar .x-panel.%s >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.%s >.x-panel-top {" + 
					"height: %dpx;" + 
				"}" + 
				".iosstatusbar .x-panel.%s >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.%s >.x-panel-content {	" + 
					"top: %dpx;" +
				"}" + 
				".iosstatusbar .x-panel .x-panel-content .x-panel.%s >.x-panel-top {" + 
					"height: %dpx;" + 
				"}" + 
				".iosstatusbar .x-panel .x-panel-content .x-panel.%s >.x-panel-content {" + 
					"top: %dpx;" + 
				"}";
		
		styleElement.addText(String.format(tStyle, 
			className, oValueInt, className, oValueInt, bhValue, className, bhValue,
			className, className, thValueInt, className, className, thValueInt, className, oValueInt, className, oValueInt));
		
	}

}
