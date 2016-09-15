import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;
import org.dom4j.io.SAXReader;

import com.justep.common.SystemUtils;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;


public class RelativeOrg implements ComponentTemplate{
	private String titleTemplate = "" +
			"		<div class='x-ro-title' xmlns='http://www.w3.org/1999/xhtml'>" +
			"			<span class='x-ro-title-content pull-left'></span>" +
			"			<span class='x-ro-title-status' />" +
			"			<div style='clear:both;' />" +
			"		</div>";
	
	private String contentTemplate = "" +
			"		<div class='x-img-list x-img-list-border' component='$UI/system/components/justep/list/list' xmlns='http://www.w3.org/1999/xhtml'" +
			"			data='%1$s' limit='-1' autoLoad='false'>" +
			"			<ul class='x-list-template'>" +
			"				<div class='x-img-item'>" +
			"					<div class='x-img-content'>" +
			"						<a>" +
			"							<div class='x-blob x-blob-radius x-img' component='$UI/system/components/justep/org/orgImage'" +
			"								bind-ref='ref(\"sOrgID\")'> " +
			"								<div class='x-blob-bar'>" +
			"					      			<i class='x-blob-edit icon-compose'/>" +
			"							   		<i class='x-blob-del icon-close-round'/>" +
			" 								</div>" +
			"							   	<img class='x-blob-img x-autofill'/>" +
			"							</div>" +
			"						</a>" +
			"						<a class='x-img-list-remove-item' bind-visible='($model.comp($element.parentElement.parentElement.parentElement.parentElement.parentElement).getBtnStatus()===\"removeAll\")'/>" +
			"						<div class='x-img-status' bind-visible='(val(\"sMessageNumber\")==0) &amp;&amp; $model.comp(\"%2$s\").isStatusEnabled()'/>" +
			"					</div>" +
			"					<span class='x-img-name'  bind-text='val(\"sOrgName\")'/>" +
			"				</div>" +
			"			</ul>" +
			"		</div>";
	
	private String seperatorTemplate = "" + 
			"				<div class='x-seperator-item' >" +
			"					<a class='x-img-right' bind-visible='($index()!==$model.comp($element.parentElement.parentElement.parentElement).getForeachData().length-1)'/>" +
			"				</div>";
	
	private static final String CHANGE_IMG = "./img/change.png";
	private static final String ADD_IMG = "./img/add.png";
	private static final String REMOVE_IMG = "./img/remove.png";
	private String actionTemplate = "" +
			"			<div class='x-img-item %2$s' style='height:65px' xmlns='http://www.w3.org/1999/xhtml'>" +
			"				<div class='x-img-content'>" +
			"					<a><img src='%1$s' class='x-img x-img-border'/></a>" +
			"				</div>" +
			"			</div>";
	
	private String actionTemplate2 = "" +
			"			<div class='x-img-item x-img-list-second-actions' style='display:none' xmlns='http://www.w3.org/1999/xhtml'>" +
			"				<a class='%1$s'><span>%2$s</span></a>" +
			"			</div>";
	
	
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		String xid = bound.attributeValue("xid");
		if (SystemUtils.isEmptyString(xid)){
			bound.addAttribute("xid", UUID.randomUUID().toString().replaceAll("-", ""));
		}
		processSocialData(bound);
		processTitle(bound);
		processContent(bound);
	}
	
	private void processContent(Element bound){
		String xid = bound.attributeValue("xid");
		String dataXid = bound.attributeValue("socialData");
		Element content = readTemplate(String.format(contentTemplate, dataXid, xid));
		content.addAttribute("filter", this.getFilter(bound));
		if (!"true".equalsIgnoreCase(bound.attributeValue("multiSelection"))
				&& "true".equalsIgnoreCase(bound.attributeValue("multiValue"))){
			content.element("ul").add(readTemplate(seperatorTemplate));
		}
		
		bound.add(content);

		Element actions = content.addElement("div");
		actions.addAttribute("bind-visible", "!$model.comp('" + xid + "').isReadonly()");
		String mutiSelection = bound.attributeValue("multiSelection");
		if ((mutiSelection!=null) && "true".equalsIgnoreCase(mutiSelection.trim())){
			Element add = readTemplate(String.format(actionTemplate, ADD_IMG, "x-img-list-add"));
			add.addAttribute("bind-visible", "($model.comp($element.parentElement.parentElement.parentElement).getRows().length===0) || !$model.comp($element.parentElement.parentElement.parentElement).getBtnStatus()");
			actions.add(add);
			
			Element remove = readTemplate(String.format(actionTemplate, REMOVE_IMG, "x-img-list-remove"));
			remove.addAttribute("bind-visible", "($model.comp($element.parentElement.parentElement.parentElement).getRows().length > 0) && !$model.comp($element.parentElement.parentElement.parentElement).getBtnStatus()");
			actions.add(remove);
			
			
			Element clearAll = readTemplate(String.format(actionTemplate2, "x-img-list-remove-all", "清空所有"));
			clearAll.addAttribute("bind-visible", "($model.comp($element.parentElement.parentElement.parentElement).getRows().length > 0) && ($model.comp($element.parentElement.parentElement.parentElement).getBtnStatus()==='removeAll')");
			actions.add(clearAll);
			
		}else{
			Element change = readTemplate(String.format(actionTemplate, CHANGE_IMG, "x-img-list-change"));
			change.addAttribute("bind-visible", "$model.comp($element.parentElement.parentElement.parentElement).getRows().length > 0");
			actions.add(change);
			
			Element add = readTemplate(String.format(actionTemplate, ADD_IMG, "x-img-list-change"));
			add.addAttribute("bind-visible", "$model.comp($element.parentElement.parentElement.parentElement).getRows().length <= 0");
			actions.add(add);
		}
		
		content.addElement("div").addAttribute("style", "clear:both;");
	}
	
	private String getFilter(Element bound){
		String filter = bound.attributeValue("filter");
		if (SystemUtils.isNotEmptyString(filter)){
			filter = filter.trim();
			if (filter.startsWith("js:")){
				filter = filter.substring("js:".length()).trim();
			}
		}
		
		String groupID = bound.attributeValue("groupID");
		if (SystemUtils.isNotEmptyString(groupID)){
			String groupFilter = "($row.val('sGroupID')=='" + groupID + "')";
			if (SystemUtils.isEmptyString(filter)){
				filter = groupFilter;
			}else{
				filter += "&&" + groupFilter;	
			}
		}
		
		return SystemUtils.isEmptyString(filter) ? "" : ("js:" + filter);
	}
	
	private void processTitle(Element bound){
		String title = String.format(titleTemplate);
		Element titleElement = readTemplate(title);
		bound.add(titleElement);
		Element contentElement = (Element)titleElement.selectSingleNode("./*[contains(@class, 'x-ro-title-content')]");
		String groupName = bound.attributeValue("groupName");
		contentElement.setText(groupName);
		
		Element statusElement = (Element)titleElement.selectSingleNode("./*[contains(@class, 'x-ro-title-status')]");
		String xid = bound.attributeValue("xid");
		statusElement.addAttribute("bind-text", "$model.comp('"+xid+"').getStatusSummary()");
		statusElement.addAttribute("bind-visible", "$model.comp('"+xid+"').isStatusEnabled()");
	}
	
	
	
	private void processSocialData(Element bound){
		String dataXid = bound.attributeValue("socialData");
		if (SystemUtils.isEmptyString(dataXid)){
			Element socialData = (Element)bound.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
			if(socialData == null){
				socialData = bound.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
				socialData.addAttribute("component", "$UI/system/components/justep/data/bizData");
			}
			
			socialData.addAttribute("concept", "SA_Social");
			socialData.addAttribute("autoLoad", "false");
			socialData.addAttribute("directDelete", "false");
			socialData.addAttribute("confirmDelete", "false");
			socialData.addAttribute("confirmRefresh", "false");
			socialData.addAttribute("limit", "-1");
			Element reader = socialData.element("reader");
			if(reader == null) reader = socialData.addElement("reader");
			reader.addAttribute("action", "/system/logic/action/querySocialAction");
			
			Element writer = socialData.element("writer");
			if (writer == null) writer = socialData.addElement("writer");
			writer.addAttribute("action", "/system/logic/action/saveSocialAction");
			
			dataXid = socialData.attributeValue("xid");
			if(SystemUtils.isEmptyString(dataXid)){
				dataXid = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
				socialData.addAttribute("xid", dataXid);
			}
			bound.addAttribute("socialData", dataXid);
		}else{
			//如果有data属性, data的概念必须是SA_Social
			Element socialData = (Element)bound.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
			if (socialData != null){
				bound.remove(socialData);
			}
		}
	}
	
	private Element readTemplate(String template){
		SAXReader reader = new SAXReader();
		ByteArrayInputStream in = null;
		try {
			in = new ByteArrayInputStream(template.getBytes("UTF-8"));
			return reader.read(in).getRootElement();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage() + "", e);
		}finally{
			try {
				if (in!=null) in.close();
			} catch (IOException e) {
			}
		}
	}
}
