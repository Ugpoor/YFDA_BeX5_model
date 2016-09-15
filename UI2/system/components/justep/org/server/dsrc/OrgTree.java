import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;

import com.justep.ui.xml.XMLConstants;


public class OrgTree extends com.justep.system.component.List{
	public static final QName READER_QNAME = new QName("reader", XMLConstants.XHTML_NAMESPACE);
	public static final QName TREE_OPTION_QNAME = new QName("treeOption", XMLConstants.XHTML_NAMESPACE);

	String dataXid = null;
	
	protected Element getTemplate(){
		return (Element)eDef.selectSingleNode(".//*[contains(@class,'x-tree-template')]");
	}
	
	protected void processElement(){
		eDef.addAttribute("labelColumn","sName");
		processOrgData();
		processOrgIcon();
		processOrgLabel();
		processCheckbox();
		processLink();
		processOrgRow();
		super.processElement();
	}
	
	/*
    <div component="$UI/system/components/justep/data/bizData" xid="orgData" concept="SA_OPOrg"
      relations="sName,sFName,sOrgKindID,sSequence,sParent,sPersonID,sNodeKind" offset="0"
      limit="20" autoLoad="true" isTree="true"> 
      <reader action="/system/logic/action/queryOrgAction"/>  
      <treeOption parentRelation="sParent" nodeKindRelation="sNodeKind"/> 
    </div> 
 */
	protected void processOrgData(){
		Element orgDataE = (Element)eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
		if(null==orgDataE){
			orgDataE = eDef.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
			orgDataE.addAttribute("component", "$UI/system/components/justep/data/bizData");
		}
		
		orgDataE.addAttribute("concept", "SA_OPOrg");
		orgDataE.addAttribute("autoLoad", "false");
		orgDataE.addAttribute("isTree", "true");
		Element readerE = orgDataE.element(READER_QNAME);
		if(null==readerE) readerE = orgDataE.addElement(READER_QNAME);
		readerE.addAttribute("action", "/system/logic/action/queryOrgAction");
		
		Element treeOptionE = orgDataE.element(TREE_OPTION_QNAME);
		if(null==treeOptionE) treeOptionE = orgDataE.addElement(TREE_OPTION_QNAME);
		treeOptionE.addAttribute("parentRelation", "sParent");
		treeOptionE.addAttribute("nodeKindRelation", "sNodeKind");
		
		//生成记录选中的计算列
		//<calculateRelation relation="selected" type="Integer"/>
		Element selectedE = (Element)orgDataE.selectSingleNode("./*[local-name()='calculateRelation' and @relation='selected']");
		if(null==selectedE)
			selectedE = orgDataE.addElement(new QName("calculateRelation", XMLConstants.XHTML_NAMESPACE));
		selectedE.addAttribute("relation", "selected");
		selectedE.addAttribute("type", "Integer");
		
		dataXid = orgDataE.attributeValue("xid");
		if(null==dataXid || "".equals(dataXid)){
			dataXid = "D"+UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			orgDataE.addAttribute("xid", dataXid);
		}
		eDef.addAttribute("data", dataXid);
	}

	/*
    <li xid="li1" bind-css="{x-currentRow: $model.orgData.currentRow.get() == $object}">   
	 */
	protected void processOrgRow(){
		Element eT = getTemplate();
		
		if(null!=eT){
			@SuppressWarnings("unchecked")
			java.util.List<Element> Es = eT.elements();
			for(Element E : Es){
				E.addAttribute("bind-css", "{'x-currentRow': $model."+dataXid+".currentRow.get() == $object}");
			}
		}
	}

	/*
    <div component="$UI/system/components/justep/output/output" data="orgData" bind-ref="ref('sOrgKindID')" class="x-output x-label x-center x-org-icon"/>  
	 */
	protected void processOrgIcon(){
		Element orgIconE = (Element)eDef.selectSingleNode(".//*[contains(@class,'x-org-icon')]");
		if(null!=orgIconE){
			orgIconE.addAttribute("onRender", getOrgIconRenderFuncName());
			orgIconE.addAttribute("data", dataXid);
			orgIconE.addAttribute("bind-ref", "ref('sOrgKindID')");
		}
	}

	/*
     <div component="$UI/system/components/justep/output/output" class="x-output x-edit x-org-label"
        data="orgData" bind-ref="ref('sName')"/> 
	 */
	protected void processOrgLabel(){
		Element orgIconE = (Element)eDef.selectSingleNode(".//*[contains(@class,'x-org-label')]");
		if(null!=orgIconE){
			orgIconE.addAttribute("data", dataXid);
			orgIconE.addAttribute("bind-ref", "ref('sName')");
		}
	}

	/*
     <span component="$UI/system/components/justep/button/checkbox"
        class="x-checkbox x-tree-checkbox" value="1" label="" bind-ref="ref('selected')"/> 
	 */
	protected void processCheckbox(){
		Element checkboxE = (Element)eDef.selectSingleNode(".//*[contains(@class,'x-tree-checkbox')]");
		if(null!=checkboxE){
			checkboxE.addAttribute("bind-ref", "ref('selected')");
			checkboxE.addAttribute("value", "");
			checkboxE.addAttribute("label", "");
			checkboxE.getParent().addAttribute("bind-css", "{hide: !$model."+getMultiSelectionObservableName()+".get()}");
		}
	}

	/*
     <div class="x-col x-col-10 x-tree-link">
      	<i class="icon-chevron-right"/>
     </div>  
	 */
	protected void processLink(){
		Element linkE = (Element)eDef.selectSingleNode(".//*[contains(@class,'x-tree-link')]");
		if(null!=linkE){
			linkE.addAttribute("bind-css", "{hide: val('sOrgKindID')=='psm'}");
		}
	}

	protected String getOrgIconRenderFuncName() {
		return "__doIconRender__" + eDef.attributeValue("xid");
	}
	
	protected String getMultiSelectionObservableName() {
		return "__multiSelection__" + eDef.attributeValue("xid");
	}
}
