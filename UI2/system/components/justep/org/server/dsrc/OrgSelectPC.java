import java.util.Map;
import java.util.UUID;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.component.Grid;
import com.justep.system.transform.Mate;
import com.justep.system.transform.Transform;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.component.common.BaseContainer;
import com.justep.ui.xml.XMLConstants;

public class OrgSelectPC implements ComponentTemplate {
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
		JSONObject cfg = processConfig();
		bound.addAttribute("data-config", cfg.toJSONString());
	}

	protected JSONObject processOptionConfig() {
		Element eleOp = eDef.element("option");
		if (null != eleOp) {
			Mate mate = new Mate(Grid.xml2jsonCfg);
			JSONObject cfg = (JSONObject) Transform.asJSON(eleOp, mate);
			eDef.remove(eleOp);

			//生成option节点
			//<div class="x-gridSelect-option"/>
			QName divQName = new QName("div", XMLConstants.XHTML_NAMESPACE);
			eDef.addElement(divQName).addAttribute("class", "x-gridSelect-option");
			return cfg;
		}
		return null;
	}

	private JSONObject processConfig() {
		JSONObject cfg = new JSONObject();
		BaseContainer baseContainer = new BaseContainer();
		cfg.put("optionCfg", processOptionConfig());
		if (null != eDef.attribute("valueSeparator"))
			cfg.put("valueSeparator", eDef.attributeValue("valueSeparator"));
		if (null != eDef.attribute("labelSeparator"))
			cfg.put("labelSeparator", eDef.attributeValue("labelSeparator"));
		if (null != eDef.attribute("extSeparator"))
			cfg.put("extSeparator", eDef.attributeValue("extSeparator"));
		if ("true".equalsIgnoreCase(eDef.attributeValue("multiselect")))
			cfg.put("multiselect", true);
		if("true".equalsIgnoreCase(eDef.attributeValue("clearButton")))
			cfg.put("clearButton", true);
		cfg.put("optionHeight", baseContainer.attributeIntValue(eDef, "optionHeight", 300));
		cfg.put("autoOptionWidth",baseContainer.attributeBoolValue(eDef, "autoOptionWidth", false));
		cfg.put("defaultLabel",baseContainer.attributeValue(eDef, "defaultLabel", null));
		cfg.put("includeOrgKind", baseContainer.attributeValue(eDef, "includeOrgKind"));
		cfg.put("includeDisabled", baseContainer.attributeBoolValue(eDef, "includeDisabled", false));
		cfg.put("manageCodes", baseContainer.attributeValue(eDef, "manageCodes"));
		cfg.put("selectFilter",baseContainer.attributeValue(eDef, "selectFilter", null));
		
		return cfg;
	}

	/*
	    <div component="$UI/system/components/justep/data/bizData" xid="orgData" concept="SA_OPOrg"
	      relations="sName,sFName,sOrgKindID,sSequence,sParent,sPersonID,sNodeKind" offset="0"
	      limit="20" autoLoad="true" isTree="true"> 
	      <reader action="/system/logic/action/queryOrgAction"/>  
	      <treeOption parentRelation="sParent" nodeKindRelation="sNodeKind"/> 
	    </div> 
	*/
	protected void processOrgData() {
		Element orgDataE = (Element)eDef.selectSingleNode("./*[contains(@component,'/system/components/justep/data/bizData')]");
		if (null == orgDataE) {
			orgDataE = eDef.addElement(new QName("div", XMLConstants.XHTML_NAMESPACE));
			orgDataE.addAttribute("component", "$UI/system/components/justep/data/bizData");
		}

		orgDataE.addAttribute("concept", "SA_OPOrg");
		orgDataE.addAttribute("isTree", "true");
		Element readerE = orgDataE.element(READER_QNAME);
		if (null == readerE)
			readerE = orgDataE.addElement(READER_QNAME);
		readerE.addAttribute("action", "/system/logic/action/queryOrgAction");

		Element treeOptionE = orgDataE.element(TREE_OPTION_QNAME);
		if (null == treeOptionE)
			treeOptionE = orgDataE.addElement(TREE_OPTION_QNAME);
		treeOptionE.addAttribute("parentRelation", "sParent");
		treeOptionE.addAttribute("nodeKindRelation", "sNodeKind");

		dataXid = orgDataE.attributeValue("xid");
		if (null == dataXid || "".equals(dataXid)) {
			dataXid = "D" + UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			orgDataE.addAttribute("xid", dataXid);
		}
	}

	/*
	<option xid="orgTree"
	  data="orgData" appearance="tree" expandColumn="sName" useVirtualRoot="true"
	  virtualRootLabel="组织机构" onTreeIconRender="orgTreeTreeIconRender" width="500" multiselect="true" multiboxonly="true"> 
	  <columns xid="columns1">
	    <column name="sName" xid="column1"/>
	  </columns>
	</option>
	*/
	protected void processOrgTree() {
		Element orgTreeE = eDef.element("option");;
		if (null == orgTreeE) {
			orgTreeE = eDef.addElement(new QName("option", XMLConstants.XHTML_NAMESPACE));
		}

		orgTreeE.addAttribute("data", dataXid);
		orgTreeE.addAttribute("appearance", "tree");
		orgTreeE.addAttribute("expandColumn", "sName");

		Element colsE = orgTreeE.element("columns");
		if (null == colsE)
			colsE = orgTreeE.addElement(new QName("columns", XMLConstants.XHTML_NAMESPACE));
		Element colE = colsE.element("column");
		if (null == colE)
			colE = orgTreeE.addElement(new QName("column", XMLConstants.XHTML_NAMESPACE));
		colE.addAttribute("name", "sName");
	}
}
