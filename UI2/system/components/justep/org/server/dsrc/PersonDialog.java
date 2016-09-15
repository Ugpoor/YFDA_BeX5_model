import java.util.Map;

import org.dom4j.Element;
import org.dom4j.QName;

import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;




public class PersonDialog implements ComponentTemplate {

	private Element eDef;
	Map<String, Object> context;

	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		eDef = bound;
		this.context = context;
		
		processElement();
	}

	/*
    		return	'<span component="' + url + '" showTitle="'+!!cfg.showTitle+'">'
		        	+	'<div class="x-dialog-overlay"></div>'
		        	+	'<div class="x-dialog">'
		        	+ 		'<div class="x-dialog-title">'
		        	+			'<div class="x-dialog-title-text">'
		        	+			(cfg.title?cfg.title:'')
		        	+			'</div>'
		        	+			'<div class="x-dialog-title-close"/>'
		        	+		'</div>'
		        	+ 		'<div class="x-dialog-body">'+(cfg.content?cfg.content:'')+'</div>'
		        	+	'</div>'
		        	+'</span>';
	 */
	private void processElement(){

		QName divQName = new QName("div", XMLConstants.XHTML_NAMESPACE);
		eDef.addElement(divQName).addAttribute("class", "x-dialog-overlay");
		Element eDialog = eDef.addElement(divQName);
		eDialog.addAttribute("class", "x-dialog");
		
		Element eTitle = eDialog.addElement(divQName);
		eTitle.addAttribute("class", "x-dialog-title");

		Element eText = eTitle.addElement(divQName);
		eText.addAttribute("class", "x-dialog-title-text");
		String t = eDef.attributeValue("title");
		if(null!=t) eText.setText(t);

		Element eInput = eTitle.addElement(divQName);
		eInput.addAttribute("class", "x-dialog-title-close");

		Element eBody = eDialog.addElement(divQName);
		eBody.addAttribute("class", "x-dialog-body");
	}
}
