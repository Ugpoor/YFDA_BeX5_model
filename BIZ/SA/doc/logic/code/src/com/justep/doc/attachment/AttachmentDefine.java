package com.justep.doc.attachment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONException;
import com.justep.doc.DocDBHelper;
import com.justep.doc.DocUtils;
import com.justep.doc.Docs;
import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.model.ModelUtils;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.transform.Table2Row;
import com.justep.util.Utils;

public class AttachmentDefine {

	private String process;
	private String activity;
	private Document mergeDefine;
	private Document currentDefine;
	private boolean isParent = true;
	private AttachmentDefine parentDefine;
	private String keyId;
	private final Logger logger = Logger.getLogger(AttachmentDefine.class);

	public AttachmentDefine(String process, String activity) {
		this.process = process;
		this.activity = activity;
		try {
			load();
		} catch (DocumentException e) {
			throw new DocRTException(DocMessages.ATTACHMENTDEFINEINITERROR, e);
		}
	}

	protected AttachmentDefine(String process, String activity, Document currentDefine) {
		this.process = process;
		this.activity = activity;
		this.currentDefine = currentDefine;
	}

	private void load() throws DocumentException {
		StringBuffer ksql = new StringBuffer();
		ksql.append("select SA_DocLinkDefine,SA_DocLinkDefine.sDefineItems,SA_DocLinkDefine.sActivity,SA_DocLinkDefine.sPersonFID ");
		ksql.append("from SA_DocLinkDefine SA_DocLinkDefine ");

		ksql.append("where (SA_DocLinkDefine.sProcess='" + process + "' and (SA_DocLinkDefine.sActivity='' or SA_DocLinkDefine.sActivity IS NULL))");

		if (Utils.isNotEmptyString(activity)) {
			ksql.append(" or (SA_DocLinkDefine.sProcess='" + process + "' and SA_DocLinkDefine.sActivity='" + activity + "') ");
		}
		ksql.append(" order by SA_DocLinkDefine.sActivity desc");

		Table table = KSQL.select(ksql.toString(), null, DocDBHelper.DATA_MODEL, null);
		if (table.size() > 2) {
			DocRTException t = new DocRTException(("加载文档关联数据时出错!"));
			//logger.error("load出错:", t);
			throw t;
		}

		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			String defineItems = r.getString("sDefineItems");
			if (Utils.isEmptyString(r.getString("sActivity")) & Utils.isNotEmptyString(activity)) {
				defineItems = Utils.isEmptyString(defineItems) ? "<defineRoot></defineRoot>" : defineItems;
				parentDefine = new AttachmentDefine(process, activity, DocumentHelper.parseText(defineItems));
				continue;
			}
			if (Utils.isEmptyString(defineItems)) {
				currentDefine = DocumentHelper.parseText("<defineRoot></defineRoot>");
			} else {
				isParent = false;
				currentDefine = DocumentHelper.parseText(defineItems);
			}

		}
	}

	public AttachmentDefine merge() {
		/*合并xml*/
		if (Utils.isNull(parentDefine) && Utils.isNull(currentDefine)) {
			try {
				mergeDefine = DocumentHelper.parseText("<defineRoot></defineRoot>");
			} catch (DocumentException e) {
				throw new DocRTException(DocMessages.XMLTRANSFORMERROR, e);
			}
			return this;
		}
		mergeDefine = isParent ? (Document) parentDefine.get().clone() : (Document) currentDefine.clone();
		Element rootElement = mergeDefine.getRootElement();
		Element activityAccess = (Element) rootElement.selectSingleNode("/defineRoot/rootPath");

		org.dom4j.Node templates = rootElement.selectSingleNode("/defineRoot/templates");
		List<?> keys = rootElement.selectNodes("/defineRoot/keys/key");
		for (Iterator<?> it = keys.iterator(); it.hasNext();) {
			Element key = (Element) it.next();
			Element keyRootpath = (Element) key.selectSingleNode("//key/rootPath");
			if ((activityAccess != null || !"".equals(activityAccess)) && (keyRootpath == null || "".equals(keyRootpath.getTextTrim()))) {
				key.add(rootElement.selectSingleNode("/defineRoot/rootName"));
				key.add(rootElement.selectSingleNode("/defineRoot/rootPath"));
				key.add(rootElement.selectSingleNode("/defineRoot/subPath"));
				key.add(rootElement.selectSingleNode("/defineRoot/access"));
				key.add(rootElement.selectSingleNode("/defineRoot/limitSize"));
			}
			if (key.selectNodes("//key/templates/template").size() == 0 && templates!=null && templates.selectNodes("//template").size() != 0) {
				if (key.selectSingleNode("//key/templates") != null)
					key.remove(key.selectSingleNode("//key/templates"));
				key.add((org.dom4j.Node) templates.clone());
			}
			if (key.selectNodes("//templates/template/fields").size() == 0 && templates!=null && templates.selectNodes("//template/fields/field").size() != 0) {
				if (key.selectSingleNode("//templates/fields") != null)
					key.remove(key.selectSingleNode("//templates/fields"));
				key.add((org.dom4j.Node) templates.selectSingleNode("//template/fields").clone());
			}
		}
		return this;
	}
	
	public Document getMerged() {
		return mergeDefine;
	}

	public Document get() {
		return currentDefine;
	}

	public AttachmentDefine getparentDefine() {
		return parentDefine;
	}

	public void save() {
		saveDefineItems(process, activity, currentDefine);
	}

	private int saveDefineItems(String process, String activity, Document document) {
		StringBuffer ksql = new StringBuffer();
		ksql.append("update SA_DocLinkDefine SA_DocLinkDefine set SA_DocLinkDefine.sDefineItems= :defineItems");
		ksql.append(" where  SA_DocLinkDefine.sProcess ='" + process + "' and ");
		if (activity == null || "".equals(activity))
			ksql.append("(SA_DocLinkDefine.sActivity ='" + activity + "' or SA_DocLinkDefine.sActivity IS NULL)");
		else
			ksql.append("SA_DocLinkDefine.sActivity ='" + activity + "'");
		Map<String, Object> vars = new HashMap<String, Object>();
		vars.put("defineItems", document.asXML());
		return KSQL.executeUpdate(ksql.toString(), vars, DocDBHelper.DATA_MODEL, null);
	}

	/*
	 * 保存文档关联信息
	 */
	private void saveLinkedDefine(Element element, String rootName, String rootPath, String subPath, int access, Float limitSize) {
		saveOrUpdateElementNode(element, "rootName", rootName);
		saveOrUpdateElementNode(element, "rootPath", rootPath);
		saveOrUpdateElementNode(element, "subPath", subPath);
		saveOrUpdateElementNode(element, "access", String.valueOf(access));
		saveOrUpdateElementNode(element, "limitSize", Utils.isNull(limitSize) ? "" : String.valueOf(limitSize));
	}

	/*
	 * 保存或更新节点元素
	 */
	private Element saveOrUpdateElementNode(Element parentElement, String nodeName, String nodeText) {
		Element element = parentElement.element(nodeName);
		if (element == null) {
			parentElement.addElement(nodeName).addText(nodeText);
		} else {
			element.setText(nodeText);
		}
		return element;
	}

	/*
	 * 新增文档关联
	 */
	public void addActivityLinkedDefine(String rootName, String rootPath, String subPath, int access, Float limitSize) throws Exception {
		Element root = currentDefine.getRootElement();
		saveLinkedDefine(root, rootName, rootPath, subPath, access, limitSize);
	}

	/*
	 * 新增模板
	 */
	public void addActivityTemplate(String docId, String fileID, String docName, String docPath) throws Exception {
		Element root = currentDefine.getRootElement();
		addOfficeTemplate(root, docId, fileID, docName, docPath);
	}

	/*
	 * 新增域
	 */
	public void addActivityField(String sId, String docId, String id, String name) throws Exception {
		Element root = currentDefine.getRootElement();
		Element template = (Element) root.selectSingleNode("/defineRoot/templates/template[@docId='" + docId + "']");
		addOfficefields(template, id, name);
	}

	/*
	 * 增加key节点
	 */
	public void addKeyNode(org.dom4j.Node node) {
		Element root = currentDefine.getRootElement();
		getElement(root, "keys").add(node);
	}

	/*
	 * 编辑key节点
	 */
	public void editKeyNode(String keyId, org.dom4j.Node node) {
		Element root = (Element) currentDefine.getRootElement().selectSingleNode("//keys");
		Element delElement = (Element) root.selectSingleNode("//key[@keyId='" + keyId + "']");
		root.remove(delElement);
		root.add(node);
	}

	/*
	 * 新增key的域
	 */
	public void addKeyField(String sId, String keyId, String docId, String id, String name) throws Exception {
		Element root = currentDefine.getRootElement();
		Element key = (Element) root.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']");
		Element keyTemplate = (Element) key.selectSingleNode("//template[@docId='" + docId + "']");
		addOfficefields(keyTemplate, id, name);
	}

	/*
	 * 新增key的文档关联定义
	 */
	public void addKeyLinkedDefine(String keyId, String rootName, String rootPath, String subPath, int access, Float limitSize) throws Exception {
		Element root = currentDefine.getRootElement();
		Element key = getElement(root, "keys").addElement("key").addAttribute("keyId", keyId);
		saveLinkedDefine(key, rootName, rootPath, subPath, access, limitSize);
	}

	/*
	 * 删除key的文档关联定义
	 */
	public boolean deleteKeyLinkedDefine(String keyId) throws Exception {
		Element root = (Element) currentDefine.getRootElement().selectSingleNode("//keys");
		Element delElement = (Element) root.selectSingleNode("//key[@keyId='" + keyId + "']");
		return root.remove(delElement);
	}

	/*
	 * 新增key的模板信息
	 */
	public void addkeyTemplate(String sId, String keyId, String docId, String fileID, String docName, String docPath) throws Exception {
		Element root = currentDefine.getRootElement();
		Element key = (Element) root.selectSingleNode("//keys/key[@keyId='" + keyId + "']");
		addOfficeTemplate(key, docId, fileID, docName, docPath);
	}

	/*
	 * 更新文档关联信息数据库字段
	 */
	public int saveDefineItems(String sId, Document document) {
		String ksql = "update SA_DocLinkDefine SA_DocLinkDefine set SA_DocLinkDefine.sDefineItems=" + currentDefine.asXML()
				+ " where  SA_DocLinkDefine='" + sId + "'";

		return KSQL.executeUpdate(ksql, null, DocDBHelper.DATA_MODEL, null);
	}

	/*
	 * 增加模板
	 */
	private Element addOfficeTemplate(Element parentElement, String docId, String fileID, String docName, String docPath) {
		Element templates = getElement(parentElement, "templates");
		Element template = templates.addElement("template").addAttribute("docId", docId);
		template.addElement("fileID").addText(fileID);
		template.addElement("docName").addText(docName);
		template.addElement("docPath").addText(docPath);
		return templates;
	}

	/*
	 * 获取某个节点元素，没有的就自动创建
	 */
	private Element getElement(Element parentElement, String nodeName) {
		Element element = parentElement.element(nodeName);
		if (element == null)
			element = parentElement.addElement(nodeName);
		return element;
	}

	/*
	 * 修改模板
	 */
	public Element updateOfficeTemplate(Element parentElement, String docId, String fileID, String docName, String docPath) {
		Element templates = getElement(parentElement, "templates");
		Element template = (Element) templates.selectSingleNode("//template[@docId='" + docId + "']");
		getElement(template, "fileID").setText(fileID);
		getElement(template, "docName").setText(docName);
		getElement(template, "docPath").setText(docPath);
		return templates;
	}

	/*
	 * 新增域
	 */
	public Element addOfficefields(Element paraElement, String fieldId, String name) {
		Element fields = getElement(paraElement, "fields");
		Element field = fields.addElement("field").addAttribute("fieldId", name);
		field.addElement("name").addText(name);
		return fields;
	}

	/*
	 * 修改域
	 */
	public Element updateOfficefields(Element paraElement, String fieldId, String id, String name) {
		Element fields = getElement(paraElement, "fields");
		Element field = (Element) fields.selectSingleNode("//template[@fieldId='" + fieldId + "']");
		getElement(field, "name").setText(name);
		return fields;
	}

	/**
	 * 
	 * 获取rootName
	 */
	public String getRootName(String rootPath) {
		if (Utils.isNotEmptyString(rootPath)) {
			String[] paths = rootPath.split("/");
			rootPath = paths[paths.length - 1];
		}
		String ksql = "select SA_DocNode.sDocName from SA_DocNode SA_DocNode where SA_DocNode ='" + rootPath + "'";
		Table table = KSQL.select(ksql, null, DocDBHelper.DATA_MODEL, null);
		if (table.size() != 1) {
			DocRTException t = new DocRTException(("加载文档关联数据时出错!"));
			//logger.error("getRootName的值不唯一:", t);
			throw t;
		}
		return ((Row) table.iterator().next()).getString("sDocName");
	}

	public Table queryKeyList(String linkProcess, String linkActivity) throws Exception {
		if (Utils.isEmptyString(linkProcess)) {
			throw new NullPointerException();
		}
		List<String> names = new ArrayList<String>();
		names.add("sKeyId");
		List<String> types = new ArrayList<String>();
		types.add("String");
		Table result = TableUtils.createTable(ModelUtils.getModel(DocDBHelper.DATA_MODEL), names, types);
		if (currentDefine == null) {
			return result;
		}
		List<?> keys = currentDefine.getRootElement().selectNodes("/defineRoot/keys/key");
		for (Iterator<?> it = keys.iterator(); it.hasNext();) {
			Element key = (Element) it.next();
			Row row = result.appendRow();
			row.setString("sKeyId", key.attributeValue("keyId"));
		}
		return result;
	}

	public Table queryAccessSetting(Element root) {
		List<String> names = new ArrayList<String>();
		names.add("sRootName");
		names.add("sRootPath");
		names.add("sSubPath");
		names.add("sAccess");
		names.add("sLimitSize");
		List<String> types = new ArrayList<String>();
		types.add("String");
		types.add("String");
		types.add("String");
		types.add("String");
		types.add("String");

		Table result = TableUtils.createTable(ModelUtils.getModel(DocDBHelper.DATA_MODEL), names, types);

		Row row = result.appendRow();
		row.setString("sRootName", getElement(root, "rootName").getTextTrim());
		row.setString("sRootPath", getElement(root, "rootPath").getTextTrim());
		row.setString("sSubPath", getElement(root, "subPath").getTextTrim());
		row.setString("sAccess", getElement(root, "access").getTextTrim());
		row.setString("sLimitSize", getElement(root, "limitSize").getTextTrim());
		return result;
	}

	public Table queryTemplateSetting(Element root) {
		List<String> names = new ArrayList<String>();
		names.add("sDocId");
		names.add("sDocName");
		names.add("sFileID");
		names.add("sDocPath");
		List<String> types = new ArrayList<String>();
		types.add("String");
		types.add("String");
		types.add("String");
		types.add("String");

		Table result = TableUtils.createTable(ModelUtils.getModel(DocDBHelper.DATA_MODEL), names, types);
		Document document = DocumentHelper.createDocument();
		document.add(root);

		List<?> temps = document.selectNodes("/*/templates/template");
		for (Iterator<?> it = temps.iterator(); it.hasNext();) {
			Element temp = (Element) it.next();
			Row row = result.appendRow();
			String docIdString = temp.attributeValue("docId");
			row.setString("sDocId", docIdString);
			row.setString("sFileID", getElement(temp, "fileID").getTextTrim());
			row.setString("sDocName", getElement(temp, "docName").getTextTrim());
			row.setString("sDocPath", getElement(temp, "docPath").getTextTrim());
		}
		return result;
	}

	public Table queryFieldSetting(Element root) {
		List<String> names = new ArrayList<String>();
		names.add("sFieldId");
		names.add("sfieldName");
		names.add("sDocId");
		List<String> types = new ArrayList<String>();
		types.add("String");
		types.add("String");
		types.add("String");
		Table result = TableUtils.createTable(ModelUtils.getModel(DocDBHelper.DATA_MODEL), names, types);
		Document document = DocumentHelper.createDocument();
		document.add(root);

		List<?> temps = document.selectNodes("//templates/template");
		for (Iterator<?> it = temps.iterator(); it.hasNext();) {
			Element temp = (Element) it.next();
			String docId = temp.attributeValue("docId");
			List<?> fields = temp.selectNodes("//template[@docId='" + docId + "']/fields/field");
			for (Iterator<?> itOne = fields.iterator(); itOne.hasNext();) {
				Element field = (Element) itOne.next();
				Row row = result.appendRow();
				row.setString("sFieldId", field.attributeValue("fieldId"));
				row.setString("sfieldName", getElement(field, "name").getTextTrim());
				row.setString("sDocId", docId);
			}
		}
		return result;
	}

	public Document queryAllSetting(String linkProcess, String linkActivity, String keyId) {
		Element root;
		Document result = DocumentHelper.createDocument();
		Element responseRoot = result.addElement("allSetting");
		if (Utils.isNull(keyId) || Utils.isEmptyString(keyId)) {
			root = (Element) currentDefine.selectSingleNode("/defineRoot");
			Element rootPath = (Element) root.selectSingleNode("/defineRoot/rootPath");
			if (Utils.isNotNull(rootPath) && Utils.isNotEmptyString(rootPath.getText())) {
				root.selectSingleNode("/defineRoot/rootName").setText(this.getRootName(rootPath.getText()));
			}
		} else {
			root = (Element) currentDefine.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']");
			Element rootPath = (Element) root.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']/rootPath");
			if (Utils.isNotNull(rootPath) && Utils.isNotEmptyString(rootPath.getText())) {
				root.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']/rootName").setText(this.getRootName(rootPath.getText()));
			}
			responseRoot.addAttribute("keyId", keyId);
		}

		Table2Row table2Row = new Table2Row();
		responseRoot.addElement("AccessSetting").add(table2Row.transform(queryAccessSetting(root), null));
		responseRoot.addElement("TemplateSetting").add(table2Row.transform(queryTemplateSetting(root.createCopy()), null));

		/*Table table = queryFieldSetting(root);
		table.getProperties().put(Table.PROP_NAME_ROWID, "sFieldId");*/
		responseRoot.addElement("FieldSetting").add(table2Row.transform(queryFieldSetting(root.createCopy()), null));
		return result;
	}
	
	public Map<String,Object> queryAllSetting2(String linkProcess, String linkActivity, String keyId) {
		Element root;
		Map<String,Object> settings = new HashMap<String,Object>();
		if (Utils.isNull(keyId) || Utils.isEmptyString(keyId)) {
			root = (Element) currentDefine.selectSingleNode("/defineRoot");
			Element rootPath = (Element) root.selectSingleNode("/defineRoot/rootPath");
			if (Utils.isNotNull(rootPath) && Utils.isNotEmptyString(rootPath.getText())) {
				root.selectSingleNode("/defineRoot/rootName").setText(this.getRootName(rootPath.getText()));
			}
		} else {
			root = (Element) currentDefine.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']");
			Element rootPath = (Element) root.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']/rootPath");
			if (Utils.isNotNull(rootPath) && Utils.isNotEmptyString(rootPath.getText())) {
				root.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']/rootName").setText(this.getRootName(rootPath.getText()));
			}
			settings.put("keyId", keyId);
		}
		settings.put("AccessSetting", queryAccessSetting(root));
		settings.put("TemplateSetting", queryTemplateSetting(root.createCopy()));
		settings.put("FieldSetting", queryFieldSetting(root.createCopy()));
		return settings;
	}
	

	protected void setDefineItems(Document settingDoc) {
		Element keysEle = (Element) currentDefine.selectSingleNode("//keys");
		if (keysEle != null)
			settingDoc.getRootElement().add(keysEle.createCopy());
		currentDefine = settingDoc;
	}

	public DefineItems getDefineItems() {
		Element root;
		if (Utils.isNull(mergeDefine))
			merge();
		if (Utils.isEmptyString(keyId)) {
			root = (Element) mergeDefine.selectSingleNode("/defineRoot");

		} else {
			root = (Element) mergeDefine.selectSingleNode("/defineRoot/keys/key[@keyId='" + keyId + "']");
		}
		String acces = getElement(root, "access").getTextTrim();
		String size = getElement(root, "limitSize").getTextTrim();

		return new DefineItems(getElement(root, "rootName").getTextTrim(), getElement(root, "rootPath").getTextTrim(), getElement(root, "subPath")
				.getTextTrim(), Utils.isEmptyString(acces) ? null : Integer.valueOf(acces), Utils.isEmptyString(size) ? null : Float.valueOf(size));
	}

	public String getKeyId() {
		return keyId;
	}

	public void setKeyId(String keyId) {
		this.keyId = keyId;
	}

	public static void editKeyNodeProcedure(String linkProcess, String linkActivity, Document settingDoc) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		Element root = settingDoc.getRootElement();
		docLinkDefine.editKeyNode(root.attributeValue("keyId"), root.selectSingleNode("//key"));
		docLinkDefine.saveDefineItems(linkProcess, linkActivity, docLinkDefine.currentDefine);
	}

	public static void addKeyProcedure(String linkProcess, String linkActivity, Document settingDoc) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		docLinkDefine.addKeyNode(settingDoc.getRootElement().selectSingleNode("//key"));
		docLinkDefine.saveDefineItems(linkProcess, linkActivity, docLinkDefine.currentDefine);
	}

	public static Document querySettingProcedure(String linkProcess, String linkActivity, String keyId) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		return docLinkDefine.queryAllSetting(linkProcess, linkActivity, keyId);
	}
	
	public static Map<String,Object> querySettingProcedure2(String linkProcess, String linkActivity, String keyId) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		return docLinkDefine.queryAllSetting2(linkProcess, linkActivity, keyId);
	}
	

	public static Table queryKeyListProcedure(String linkProcess, String linkActivity) throws Exception {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		return docLinkDefine.queryKeyList(linkProcess, linkActivity);
	}

	public static void setDefineItemsProcedure(String linkProcess, String linkActivity, Document settingDoc) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		docLinkDefine.setDefineItems(settingDoc);
		docLinkDefine.saveDefineItems(linkProcess, linkActivity, docLinkDefine.currentDefine);
	}

	public static void delDefineItemsProcedure(String linkProcess, String linkActivity, Document settingDoc) {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		docLinkDefine.setDefineItems(settingDoc);
		docLinkDefine.saveDefineItems(linkProcess, linkActivity, docLinkDefine.currentDefine);
	}

	public static void deleteKeyByIdProcedure(String linkProcess, String linkActivity, String keyId) throws Exception {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		docLinkDefine.deleteKeyLinkedDefine(keyId);
		docLinkDefine.saveDefineItems(linkProcess, linkActivity, docLinkDefine.currentDefine);
	}

	public static Table queryLinkDefine(String concept, String idColumn, String select, String from, String condition, List<DataPermission> range,
			String filter, Boolean distinct, int offset, int limit, String columns, String orderBy, String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel, String linkProcess, String linkActivity) throws Exception {
	
		if (Utils.isNotEmptyString(linkProcess) && Utils.isEmptyString(linkActivity)) {
			condition = "SA_DocLinkDefine.sProcess = '" + linkProcess + "'";
			filter = "";
		}
		Table table = BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
		return table;
	}

	public static Document queryLinkItems(String linkProcess, String linkActivity) throws Exception {
		if (Utils.isEmptyString(linkProcess)) {
			throw new NullPointerException();
		}
		StringBuffer ksql = new StringBuffer();
		ksql.append("select SA_DocLinkDefine ,SA_DocLinkDefine.sDefineItems from SA_DocLinkDefine SA_DocLinkDefine");
		ksql.append(" where SA_DocLinkDefine.sProcess = '" + linkProcess + "' and SA_DocLinkDefine.sActivity = '" + linkActivity + "' ");
		Table table = KSQL.select(ksql.toString(), null, DocDBHelper.DATA_MODEL, null);
		Document result = null;
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			String defineItems = r.getString("sDefineItems").trim();
			result = DocumentHelper.parseText("".equals(defineItems) ? "<defineRoot></defineRoot>" : defineItems);
		}
		return result;
	}

	public static void deleteLinkDefine(String linkProcess, String linkActivity) throws Exception {
		String ksql = "";
		if (Utils.isEmptyString(linkActivity)) {
			ksql = "delete from SA_DocLinkDefine SA_DocLinkDefine where SA_DocLinkDefine.sProcess = '" + linkProcess + "'";
		} else {
			ksql = "delete from SA_DocLinkDefine SA_DocLinkDefine where SA_DocLinkDefine.sProcess = '" + linkProcess
					+ "' and SA_DocLinkDefine.sActivity = '" + linkActivity + "'";
		}
		KSQL.executeUpdate(ksql, null, DocDBHelper.DATA_MODEL, null);
	}

	public static Document queryExistDefine(Document param) {
		List<?> items = param.selectNodes("//data/item");
		for (Iterator<?> it = items.iterator(); it.hasNext();) {
			Element item = (Element) it.next();
			String sProcess = item.selectSingleNode("process").getText();
			String sActivity = item.selectSingleNode("activity").getText();
			StringBuffer ksql = new StringBuffer();
			ksql.append("select SA_DocLinkDefine from SA_DocLinkDefine SA_DocLinkDefine");
			if (Utils.isEmptyString(sActivity)) {
				ksql.append(" where SA_DocLinkDefine.sProcess = '" + sProcess
						+ "' and (SA_DocLinkDefine.sActivity is null or SA_DocLinkDefine.sActivity ='') ");
			} else {
				ksql.append(" where SA_DocLinkDefine.sProcess = '" + sProcess + "' and SA_DocLinkDefine.sActivity = '" + sActivity + "' ");
			}
			int size = KSQL.select(ksql.toString(), null, DocDBHelper.DATA_MODEL, null).size();
			if (size == 1) {
				item.addAttribute("isExist", "true");
			} else {
				item.addAttribute("isExist", "false");
			}
		}
		return param;
	}
	
	/**
	 * 附件查询文档关联信息的action 对应的函数
	 */
	public static Map<String, Object> queryLinkDefineMap(String linkProcess, String linkActivity) throws DocumentException, JSONException {
		AttachmentDefine docLinkDefine = new AttachmentDefine(linkProcess, linkActivity);
		Element rootElement = docLinkDefine.merge().getMerged().getRootElement();

		Map<String, Object> linkDefineMap = new HashMap<String, Object>();
		linkDefineMap.put("rootName", DocUtils.getNodeText(rootElement.selectSingleNode("/defineRoot/rootName")));
		linkDefineMap.put("rootPath", DocUtils.getNodeText(rootElement.selectSingleNode("/defineRoot/rootPath")));
		linkDefineMap.put("subPath", DocUtils.getNodeText(rootElement.selectSingleNode("/defineRoot/subPath")));
		linkDefineMap.put("access", DocUtils.getNodeText(rootElement.selectSingleNode("/defineRoot/access")));
		linkDefineMap.put("limitSize", DocUtils.getNodeText(rootElement.selectSingleNode("/defineRoot/limitSize")));

		/*添加模板*/
		Map<String, Object> rootTmps = new HashMap<String, Object>();
		List<?> templates = rootElement.selectNodes("/defineRoot/templates/template");
		int i = 0;
		for (Iterator<?> it = templates.iterator(); it.hasNext();) {
			Element tmp = (Element) it.next();
			Map<String, String> tmpMap = new HashMap<String, String>();
			String docId = tmp.attribute("docId").getText();
			tmpMap.put("sDocId", docId);
			Docs docs = new Docs().queryByDocID(docId);
			if(docs.size()!=1){
				continue;
			}
			tmpMap.put("sFileId", docs.getIterator().next().getsFileID());
			tmpMap.put("sDocName", DocUtils.getNodeText(tmp.selectSingleNode("/defineRoot/templates/template[@docId='" + docId + "']/docName")));
			tmpMap.put("sDocPath", DocUtils.getNodeText(tmp.selectSingleNode("/defineRoot/templates/template[@docId='" + docId + "']/docPath")));
			rootTmps.put("" + i, tmpMap);
			i++;
		}
		rootTmps.put("length", i);
		linkDefineMap.put("docTemplate", rootTmps);

		Map<String, Object> jsonKeys = new HashMap<String, Object>();
		List<?> keys = rootElement.selectNodes("/defineRoot/keys/key");
		for (Iterator<?> it = keys.iterator(); it.hasNext();) {
			Element key = (Element) it.next();
			
			/** key 基本信息 **/
			Map<String, Object> itemJson = new HashMap<String, Object>();
			String keyId = key.attribute("keyId").getText();
			itemJson.put("keyId", keyId);
			itemJson.put("rootName", DocUtils.getNodeText(key.selectSingleNode("//key/rootName")));
			itemJson.put("rootPath", DocUtils.getNodeText(key.selectSingleNode("//key/rootPath")));
			itemJson.put("subPath", DocUtils.getNodeText(rootElement.selectSingleNode("//key/subPath")));
			itemJson.put("access", DocUtils.getNodeText(key.selectSingleNode("//key/access")));
			itemJson.put("limitSize", DocUtils.getNodeText(key.selectSingleNode("//key/limitSize")));
			jsonKeys.put(key.attribute("keyId").getText(), itemJson);

			/*key 模板*/
			Map<String, Object> keyTmps = new HashMap<String, Object>();

			List<?> keyTemplates = key.selectNodes("//key[@keyId='" + keyId + "']/templates/template");
			i = 0;
			for (Iterator<?> itTmp = keyTemplates.iterator(); itTmp.hasNext();) {
				Element keyTmp = (Element) itTmp.next();
				Map<String, String> tmpMap = new HashMap<String, String>();
				String docId = keyTmp.attribute("docId").getText();
				tmpMap.put("sDocId", docId);
				tmpMap.put(
						"sFileId",
						DocUtils.getNodeText(keyTmp.selectSingleNode("//key[@keyId='" + keyId + "']/templates/template[@docId='" + docId
								+ "']/fileID")));
				tmpMap.put(
						"sDocName",
						DocUtils.getNodeText(keyTmp.selectSingleNode("//key[@keyId='" + keyId + "']/templates/template[@docId='" + docId
								+ "']/docName")));
				tmpMap.put(
						"sDocPath",
						DocUtils.getNodeText(keyTmp.selectSingleNode("//key[@keyId='" + keyId + "']/templates/template[@docId='" + docId
								+ "']/docPath")));

				keyTmps.put("" + i, tmpMap);
				i++;
			}
			keyTmps.put("length", i);
			itemJson.put("docTemplate", keyTmps);
		}
		linkDefineMap.put("keys", jsonKeys);
		return linkDefineMap;
	}

	public static DefineItems getDefineItems(String linkProcess, String linkActivity, String keyId) {
		AttachmentDefine attachment = new AttachmentDefine(linkProcess, linkActivity);
		if (Utils.isNotEmptyString(keyId))
			attachment.setKeyId(keyId);
		return attachment.getDefineItems();
	}
}
