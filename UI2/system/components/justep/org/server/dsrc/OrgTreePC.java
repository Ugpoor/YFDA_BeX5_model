import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;

import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.xml.XMLConstants;


public class OrgTreePC implements ComponentTemplate {
	public static final QName READER_QNAME = new QName("reader", XMLConstants.XHTML_NAMESPACE);
	public static final QName TREE_OPTION_QNAME = new QName("treeOption", XMLConstants.XHTML_NAMESPACE);

	private Element eDef;
	Map<String, Object> context;
	String dataXid = null;
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context) {
		// TODO 自动生成的方法存根
		eDef = bound;
		this.context = context;
		
		processOrgData();
		processOrgTree();
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
		//orgDataE.addAttribute("autoLoad", "true");
		orgDataE.addAttribute("isTree", "true");
		Element readerE = orgDataE.element(READER_QNAME);
		if(null==readerE) readerE = orgDataE.addElement(READER_QNAME);
		readerE.addAttribute("action", "/system/logic/action/queryOrgAction");
		
		Element treeOptionE = orgDataE.element(TREE_OPTION_QNAME);
		if(null==treeOptionE) treeOptionE = orgDataE.addElement(TREE_OPTION_QNAME);
		treeOptionE.addAttribute("parentRelation", "sParent");
		treeOptionE.addAttribute("nodeKindRelation", "sNodeKind");
		
		dataXid = orgDataE.attributeValue("xid");
		if(null==dataXid || "".equals(dataXid)){
			dataXid = "D"+UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			orgDataE.addAttribute("xid", dataXid);
		}
		eDef.addAttribute("data", dataXid);
	}
	
/*
	      <div component="$UI/system/components/justep/grid/grid" xid="orgTree"
	        data="orgData" appearance="tree" expandColumn="sName" useVirtualRoot="true"
	        virtualRootLabel="组织机构" onTreeIconRender="orgTreeTreeIconRender" width="500" multiselect="true" multiboxonly="true"> 
	        <columns xid="columns1">
	          <column name="sName" xid="column1"/>
	        </columns>
	      </div>
 */
	protected void processOrgTree(){
		Element orgTreeE = (Element)eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/grid/grid')]");
		if(null==orgTreeE){
			orgTreeE = eDef.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
			orgTreeE.addAttribute("component", "$UI/system/components/justep/grid/grid");
		}
		
		String orgTreeXid = orgTreeE.attributeValue("xid");
		if(null==orgTreeXid || "".equals(orgTreeXid)){
			orgTreeXid = "T"+UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			orgTreeE.addAttribute("xid", orgTreeXid);
		}
		eDef.addAttribute("tree", orgTreeXid);
		orgTreeE.addAttribute("data", dataXid);
		orgTreeE.addAttribute("appearance", "tree");
		orgTreeE.addAttribute("expandColumn", "sName");
		if(null!=eDef.attribute("multiSelection"))
			orgTreeE.addAttribute("multiselect",eDef.attributeValue("multiSelection"));
		/*
		if(null==eDef.attribute("onTreeIconRender")){
			
		}
		*/

		Element colsE = orgTreeE.element("columns");
		if(null==colsE)
			colsE = orgTreeE.addElement(new QName("columns", XMLConstants.XHTML_NAMESPACE));
		Element colE = colsE.element("column");
		if(null==colE)
			colE = orgTreeE.addElement(new QName("column", XMLConstants.XHTML_NAMESPACE));
		colE.addAttribute("name", "sName");
	}
}
