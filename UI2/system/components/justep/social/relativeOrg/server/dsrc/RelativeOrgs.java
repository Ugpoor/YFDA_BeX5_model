import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;
import org.dom4j.io.SAXReader;

import com.justep.common.SystemUtils;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.SystemComponentException;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.xml.XMLConstants;


public class RelativeOrgs implements ComponentTemplate{
	
	private String template = "" +
			"			<div class='x-list' component='$UI/system/components/justep/list/list' xmlns='http://www.w3.org/1999/xhtml'" +
			"				data='%1$s' limit='%2$s' autoLoad='false'>" +
			"				<div class='x-img-item' style='display:none'>%3$s</div>" +
			"				<ul class='x-list-template'>" +
			"					<div class='x-img-item'>" +
			"						<div class='x-img-content'>" +
			"							<a>" +
			"								<div class='x-blob x-blob-radius x-img' component='$UI/system/components/justep/org/orgImage'" +
			"									bind-ref='ref(\"sOrgID\")'> " +
			"									<div class='x-blob-bar'>" +
			"					      				<i class='x-blob-edit icon-compose'/>" +
			"							   			<i class='x-blob-del icon-close-round'/>" +
			" 									</div>" +
			"							   		<img class='x-blob-img x-autofill'/>" +
			"								</div>" +
			"							</a>" +
			"						</div>" +
			"						<span class='x-img-name' bind-text='val(\"sOrgName\")'/>" +
			"					</div>" +
			"				</ul>" +
			"			</div>";
	
	private String moreTemplate = "" +
			"			<div class='x-img-more' xmlns='http://www.w3.org/1999/xhtml'>" +
			"				<a class='x-img-right'>" +
			"					<div style='position: absolute; top:0px; right:0px;width:100%;height:100%'></div>" +
			"				</a>" +
			"			</div>";
	
	private String dialogTemplate = "" +
			"			<div xid='%1$s' class='x-ro-dialog' component='$UI/system/components/justep/dialog/dialog' xmlns='http://www.w3.org/1999/xhtml'>" +
			"				<div component='$UI/system/components/justep/panel/panel' class='x-panel x-full'" +
			"					top='true' bottom='false'>" +
			"					<div class='x-panel-top'>" +
			"						<div component='$UI/system/components/justep/titleBar/titleBar'" +
			"							title='相关人' class='x-titlebar'>" +
			"							<div class='x-titlebar-left'>" +
			"								<a component='$UI/system/components/justep/button/button' label=''" +
			"									class='btn btn-link btn-icon-left x-ros-dialog-cancel' icon='icon-chevron-left'" +
			"									bind-click='$model.comp(\"%1$s\").close()'>" +
			"									<i class='icon-chevron-left' />" +
			"									<span></span>" +
			"								</a>" +
			"							</div>" +
			"						<div class='x-titlebar-title'>相关人</div>" +
			"						<div class='x-titlebar-right reverse'>" +
			"							<a component='$UI/system/components/justep/button/button' label=''" +
			"								class='btn btn-link btn-icon-left x-ros-dialog-ok' icon='icon-checkmark-round'"  +
			"								bind-click='$model.comp(\"%1$s\").close()'>" +
			"								<i />" +
			"								<span></span>" +
			"							</a>" +
			"						</div>" +
			"					</div>" +
			"				</div>" +
			"				<div class='x-panel-content' refresh='false'>" +
			"					<div component='$UI/system/components/justep/controlGroup/controlGroup'	" +
			"						class='x-control-group'> " +
			"					</div>" +	
			"				</div>" +
			"			</div>" +
			"		</div>";
	
	private String roTemplate = "" +
		"			<div class='x-ro x-ro-border' component='$UI/system/components/justep/social/relativeOrg/relativeOrg' xmlns='http://www.w3.org/1999/xhtml'>" +
		"				<div component='$UI/system/components/justep/data/bizData' concept='SA_Social'/>" +
		"			</div>";
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		String xid = bound.attributeValue("xid");
		if (SystemUtils.isEmptyString(xid)){
			bound.addAttribute("xid", UUID.randomUUID().toString().replaceAll("-", ""));
		}
		processSocialData(bound);
		processDialog(bound);
		processGroup(bound);
	}
	
	private void processDialog(Element bound){
		String xid = bound.attributeValue("xid");
		String dialogXid = xid + "Dialog_";
		Element dialog = readTemplate(String.format(dialogTemplate, dialogXid));
		bound.add(dialog);
		
		String url = bound.attributeValue("url");
		String process = bound.attributeValue("process");
		String activity = bound.attributeValue("activity");

		String nameRef = bound.attributeValue("bind-nameRef");
		if (SystemUtils.isEmptyString(nameRef)){
			throw SystemComponentException.create(UISystemMessages.RELATIVE_ORGS_NAME_REF_ERROR1, bound.attributeValue("xid"));
		}
		
		Element dialogContent = (Element)dialog.selectSingleNode("./*/*/*[@component='$UI/system/components/justep/controlGroup/controlGroup']");
		java.util.List<?> groups = (java.util.List<?>)bound.selectNodes("./*[contains(@class,'x-ros-item')]");
		for (Object o : groups){
			Element group = (Element)o;
			Element ro = readTemplate(String.format(roTemplate));
			String readonly = group.attributeValue("readonly");
			if (SystemUtils.isEmptyString(readonly)) readonly = "";
			ro.addAttribute("readonly", readonly);
			ro.addAttribute("data", bound.attributeValue("data"));
			ro.addAttribute("groupName", group.attributeValue("groupName"));
			String groupID = group.attributeValue("groupID");
			if (SystemUtils.isNotEmptyString(groupID)){
				ro.addAttribute("groupID", groupID);	
			}
			String multiSelection = group.attributeValue("multiSelection");
			if (SystemUtils.isNotEmptyString("multiSelection")){
				ro.addAttribute("multiSelection", multiSelection);
			}

			String multiValue = group.attributeValue("multiValue");
			if (SystemUtils.isNotEmptyString("multiValue")){
				ro.addAttribute("multiValue", multiValue);
			}
			
			String statusEnabled = group.attributeValue("statusEnabled");
			if (SystemUtils.isNotEmptyString(statusEnabled)){
				ro.addAttribute("statusEnabled", statusEnabled);
			}
			
			if (SystemUtils.isNotEmptyString(process)){
				ro.addAttribute("process", process);
			}
			
			if (SystemUtils.isNotEmptyString(activity)){
				ro.addAttribute("activity", activity);
			}
			
			if (SystemUtils.isNotEmptyString(url)){
				ro.addAttribute("url", url);
			}
			
			ro.addAttribute("bind-nameRef", nameRef);
			
			String socialData = bound.attributeValue("socialData");
			ro.addAttribute("socialData", socialData);
			dialogContent.add(ro);
		}	
	}
	
	private void processGroup(Element bound){
		java.util.List<?> groups = (java.util.List<?>)bound.selectNodes("./*[contains(@class,'x-ros-item')]");
		String dataXid = bound.attributeValue("socialData");
		for (Object o : groups){
			Element group = (Element)o;
			String title = group.attributeValue("groupName");
			String limit = group.attributeValue("limit");
			if (SystemUtils.isEmptyString(limit)) limit = "20";
			Element content = readTemplate(String.format(template, dataXid, limit, title));
			String filter = getFilter(group.attributeValue("filter"), group.attributeValue("groupID"));
			content.addAttribute("filter", filter);
			group.add(content);
		}
		
		Element more = readTemplate(moreTemplate);
		bound.add(more);
		bound.addElement("div").addAttribute("style", "clear:both;");
	}
	
	private String getFilter(String filter, String groupID){
		if (SystemUtils.isNotEmptyString(filter)){
			filter = filter.trim();
			if (filter.startsWith("js:")){
				filter = filter.substring("js:".length()).trim();
			}
		}
		
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
