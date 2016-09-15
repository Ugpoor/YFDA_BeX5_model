import java.util.Map;

import org.dom4j.Element;

import com.justep.common.SystemUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;


public class ImportExcel implements ComponentTemplate{

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		String strMappings = bound.attributeValue("mappings");
		if(null!=strMappings && !"".equals(strMappings)){
			String[] mappings = strMappings.split(",");
			StringBuffer strTemp = new StringBuffer();
			strTemp.append("");
			String WUrl = (String)context.get(ComponentContext.WINDOW_URL);
			for(int i=0; i<mappings.length; i++){
				if(i>0) strTemp.append(",");
				strTemp.append(SystemUtils.processUIVar(mappings[i], JustepConfig.getUIValue(WUrl)));
			}
			bound.addAttribute("mappings", strTemp.toString());
		}
	}

}
