package com.justep.doc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.JSONSerialization;
import com.justep.system.transform.Table2Json;
import com.justep.system.transform.Table2Row;
import com.justep.system.transform.TransformConfig;
import com.justep.system.transform.XMLSerialization;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

public class DocPermissions implements XMLSerialization, JSONSerialization {

	private List<String> depts;
	private Map<String, DocPermissionsItem> perItems = new HashMap<String, DocPermissions.DocPermissionsItem>();

	private Table2Json table2Json = new Table2Json();
	private Table2Row table2Row = new Table2Row();
	private static Logger logger = Logger.getLogger(Docs.class);

	public DocPermissions() {
		depts = DocUtils.getDepts();
		loadPermission();
	}

	@SuppressWarnings("rawtypes")
	public void loadPermission() {
		Map<String, String> sPermissionKsqls = createPermissionKsqls();
		Iterator<?> ksqlIter = sPermissionKsqls.entrySet().iterator();
		while (ksqlIter.hasNext()) {
			Entry entry = (Entry) ksqlIter.next();
			String ksql = (String) entry.getValue();
			String path = (String) entry.getKey();
			Table table = KSQL.select(ksql, null, DocDBHelper.DATA_MODEL, null);
			perItems.put(path, new DocPermissionsItem(path, table));
		}
	}

	// 查询文件权限
	private Map<String, String> createPermissionKsqls() {
		Map<String, String> sPermissionKsqls = new HashMap<String, String>();
		for (String dept : depts) {
			String[] pathList = dept.split("/");
			String sqlLike = "";
			String parent = "";
			for (int i = 0; i < pathList.length; i++) {
				String id = pathList[i];
				if ("".equals(id)) {
					if (i == 0) {
						continue;
					} else {
						throw new DocRTException(DocMessages.PERMISSIONPATHERROR,DocRTException.toList(dept));
					}
				}
				parent = i == 0 ? id : parent + "/" + id;
				if (i == pathList.length - 1) {
					sqlLike = sqlLike + " SA_DocAuth.sAuthorizeeFID = '" + parent + "' ";
					continue;
				}
				sqlLike = sqlLike + " SA_DocAuth.sAuthorizeeFID = '" + parent + "' or";
			}
			String ksql = "select SA_DocAuth, SA_DocAuth.sDocPath, SA_DocAuth.sAuthorizeeFID, SA_DocAuth.sAccess from SA_DocAuth SA_DocAuth where "
					+ sqlLike + " order by SA_DocAuth.sDocPath desc, SA_DocAuth.sAuthorizeeFID desc";

			sPermissionKsqls.put(dept, ksql);
		}
		return sPermissionKsqls;
	}

	public void refresh() {
		perItems = null;
		depts = DocUtils.getDepts();
		loadPermission();
	}
	public Map<String, Object> toMap() {
		Map<String, Object> result = new HashMap<String, Object>();
		for (DocPermissionsItem item : perItems.values()) {
			String path = item.getPersonFID();
			Table table = item.toTable();
			List<Map<String,Object>> pathItem = new ArrayList<Map<String,Object>>();
			if (table != null) {
				for (Iterator<Row> it = table.iterator(); it.hasNext();) {
					Row r = it.next();
					Map<String, Object> perItem = new HashMap<String, Object>();
					perItem.put("sDocPath", DocUtils.getValue(r.getString("sDocPath"), ""));
					perItem.put("sAuthorizeeFID", DocUtils.getValue(r.getString("sAuthorizeeFID"), ""));
					perItem.put("sAccess", r.getInt("sAccess"));
					pathItem.add(perItem);
				}
			}
			//多岗情况，已部门的id为标识 
			result.put(path, pathItem);
		}
		return result;
	}

	public int size() {
		int result = 0;
		for (DocPermissionsItem item : perItems.values()) {
			result += item.size();
		}
		return result;
	}

	public List<DocPermission> getAll() {
		List<DocPermission> result = new ArrayList<DocPermission>();
		for (DocPermissionsItem item : perItems.values()) {
			Iterator<?> it = item.toMap().keySet().iterator();
			while (it.hasNext()) {
				DocPermission p = (DocPermission) it.next();
				result.add(p);
			}
		}
		return result;
	}

	public DocPermission queryPermissionById(String docId, String docPath) {
		DocPermission docPermission = null;

		int access = -1;
		String[] pathList = "/".equals(docPath) ? ("/" + docId).split("/") : (docPath + "/" + docId).split("/");
		String parent = "";
		String[] comppath = new String[pathList.length];
		comppath[0] = "/";
		for (int i = 1; i < pathList.length; i++) {
			parent = parent + "/" + pathList[i];
			comppath[i] = parent;
		}

		for (DocPermissionsItem item : perItems.values()) {
			Table table = item.toTable();
			if (table == null) {
				continue;
			}
			boolean docPathBreak = false;
			for (int j = comppath.length - 1; j >= 0; j--) {
				for (Iterator<Row> it = table.iterator(); it.hasNext();) {
					Row r = it.next();
					if (r.getString("sDocPath").equals(comppath[j]) && r.getInt("sAccess") > access) {
						if(Utils.isNull(docPermission)|| r.getInt("sAccess") > docPermission.getsAccess()){
							docPermission = Utils.isNull(docPermission) ? new DocPermission(r, item) : docPermission.reRaload(r, item);
						}
						docPathBreak = true;
						break;
					}
					
				}
				if(docPathBreak){
					break;
				}
			}
		}
		return docPermission;
	}

	public List<String> getDepts() {
		return depts;
	}

	public void readerFromJson(Object arg0, TransformConfig arg1) {

	}

	public Object writerToJson(TransformConfig arg0) {
		JSONObject jo = new JSONObject();
		for (DocPermissionsItem item : perItems.values()) {
			try {
				jo.put(item.getPersonFID(), (table2Json.transform(item.toTable(), arg0)));
			} catch (JSONException e) {
				throw new RuntimeException(DocMessages.JSONTRANSFORMERROR, e);
				
			}
		}
		return jo;
	}

	public void reader(Element arg0, TransformConfig arg1) {

	}

	public Element writer(TransformConfig arg0) {
		Element ele = DocumentHelper.createElement("DocPermissions");
		for (DocPermissionsItem item : perItems.values()) {
			Element it = DocumentHelper.createElement("DocPermission");
			it.addAttribute("personFID", item.getPersonFID());
			it.add(table2Row.transform(item.toTable(), arg0));
			ele.add(it);
		}
		return ele;
	}

	class DocPermissionsItem {
		private String personFID;

		private Table itemContainer;
		private Map<String, DocPermission> pers = new ConcurrentHashMap<String, DocPermission>();

		DocPermissionsItem(String personFID, Table container) {
			this.personFID = personFID;
			this.itemContainer = container;

			for (Iterator<Row> it = itemContainer.iterator(); it.hasNext();) {
				Row r = it.next();
				pers.put(r.getString("SA_DocAuth"), new DocPermission(r, this));
			}
		}

		public String getPersonFID() {
			return personFID;
		}

		public DocPermission add(String sID, String sDocPath, String sAuthorizeeFID, String sAuthorizeeName, int sAccess) {
			if (Utils.isNotEmptyString(sID))
				sID = CommonUtils.createGUID();

			Row r = itemContainer.appendRow();
			r.setString("SA_DocAuth", sID);
			r.setString("sDocPath", sDocPath);
			r.setInt("sAccess", sAccess);
			r.setString("sAuthorizeeFID", sAuthorizeeFID);
			r.setString("sAuthorizeeName", sAuthorizeeName);
			r.setString("sAuthorizerFID", ContextHelper.getPersonMember().getFID());
			r.setString("sAuthorizerName", ContextHelper.getPersonMember().getName());

			DocPermission p = new DocPermission(r, this);
			pers.put(sID, p);
			return p;
		}

		public int save() {
			Model model = ModelUtils.getModel(DocDBHelper.DATA_MODEL);
			return itemContainer.save(model);
		}

		public DocPermissionsItem remove(String sID) {
			itemContainer.deleteRows(sID);
			pers.remove(sID);
			return this;
		}

		public DocPermissionsItem remove(Doc doc) {
			String id = doc.getsID();
			remove(id);
			return this;
		}

		public Table toTable() {
			return itemContainer;
		}

		public Map<String, DocPermission> toMap() {
			return pers;
		}

		public int size() {
			return pers.entrySet().size();
		}

		public DocPermission get(String sID) {
			return pers.get(sID);
		}

		public Iterator<DocPermission> getIterator() {
			return pers.values().iterator();
		}
		
		
		
	}

}
