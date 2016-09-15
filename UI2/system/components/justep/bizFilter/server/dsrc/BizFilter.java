import java.util.Map;

import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import com.justep.ui.component.ComponentTemplate;

public class BizFilter implements ComponentTemplate {
	private Element eDef;
	private String xID;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events, Map<String, Object> context) {
		eDef = bound;
		xID = eDef.attributeValue("xid");
		try {
			createPopMenu();
		} catch (DocumentException e) {
			throw new RuntimeException(e);
		}
	}

	private void createPopMenu() throws DocumentException {
		String menuID = xID + "_menu";
		String popMenuID = xID + "_pop_menu";
		
		String popMenu = "<div component=\"$UI/system/components/justep/popMenu/popMenu\" class=\"x-popMenu\" direction=\"left-bottom\" opacity=\"0\" xid=\"" + popMenuID + "\"> "
		    	+ " <div class=\"x-popMenu-overlay\"/> "
	    	  	+ " <ul component=\"$UI/system/components/justep/menu/menu\" class=\"x-menu dropdown-menu x-popMenu-content\" xid=\"" + menuID + "\"> "
				+ " </ul> "
		    + " </div> ";
		eDef.add(DocumentHelper.parseText(popMenu).getRootElement());
	}

}
