import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.dom4j.QName;

import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;



public class DataOperation implements ComponentTemplate {
	public static final String URL = "$UI/system/components/justep/dataOperation/dataOperation";
	protected Element eDef;
	protected Map<String, Object> context;
	protected String xid;

	@SuppressWarnings("unchecked")
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		bound.addAttribute(new QName("__delete_node__"), "true");

		this.eDef = bound;
		this.xid = eDef.attributeValue("xid");
		this.context = context;

		List<String> init = (List<String>) context.get(ComponentContext.INIT);
		String js = processJS();
		init.add(js);
	}

	protected String getURl() {
		return URL;
	}

	protected String getClassName() {
		return "__DataOP__";
	}

	protected String processJS() {
		String require = "";
		String Url = getURl();
		if(!this.context.containsKey(Url)){
			this.context.put(Url, Url);
			require = "var "+getClassName()+" = require(\""+Url+"\");";
		}
		return require + "new "+getClassName()+"(this,'"+this.xid+"');";
	}

}
