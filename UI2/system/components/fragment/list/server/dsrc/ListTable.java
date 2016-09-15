import java.util.List;
import java.util.Map;

import org.dom4j.Element;

import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;


public class ListTable implements ComponentTemplate {
	public static final String URL = "$UI/system/components/fragment/list/listTable";
	
	protected Map<String, Object> context;

	public static boolean isStringEmpty(String s) {
		return (s == null || "".equals(s));
	}

	@SuppressWarnings("unchecked")
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		this.context = context;

		String js = bindDataEvent(bound);
		if(!"".equals(js)){
			List<String> init = (List<String>) context.get(ComponentContext.INIT);
			init.add(js);
		}
		
		processListFilter(bound);
	}

	protected String getURl() {
		return URL;
	}

	protected String getClassName() {
		return "__ListTable__";
	}

	protected String bindDataEvent(Element bound){
		String masterData = bound.attributeValue("masterData");
		String filterCol = bound.attributeValue("masterCol");
		String data = bound.attributeValue("data");
		if(isStringEmpty(masterData) || isStringEmpty(data) || isStringEmpty(filterCol)) return "";
		String Url = getURl();
		String require = "";
		if(!this.context.containsKey(Url)){
			this.context.put(Url, Url);
			require = "var "+getClassName()+" = require(\""+Url+"\");";
		}
		return require + getClassName()+".dataEventBind(this," + "'"+masterData+"'" +  ",'"+data+"'" +  ",'"+filterCol+"'" + ");";
	}

	protected void processListFilter(Element bound){
		String filterCol = bound.attributeValue("masterCol");
		String masterData = bound.attributeValue("masterData");
		String data = bound.attributeValue("data");
		if(isStringEmpty(masterData) || isStringEmpty(data) || isStringEmpty(filterCol)) return;
		Element list = bound.element("div");
		String compUrl = list.attributeValue("component");
		if(null!=compUrl && compUrl.endsWith("/system/components/justep/list/list")){
			String listFilter = list.attributeValue("filter");
			if(isStringEmpty(listFilter)) list.addAttribute("filter", "$object.getID() == $row.val('"+filterCol+"')");		
		}		
	}
}
