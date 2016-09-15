package com.justep.doc;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.dom4j.Element;

import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.JSONSerialization;
import com.justep.system.transform.Table2Json;
import com.justep.system.transform.Table2Row;
import com.justep.system.transform.TransformConfig;
import com.justep.system.transform.XMLSerialization;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

public class DocDirPermissions implements XMLSerialization, JSONSerialization {

	private Table container;
	private Map<String, DocPermission> pers = new ConcurrentHashMap<String, DocPermission>();

	public static Logger logger = Logger.getLogger(Docs.class);
	private Table2Json table2Json = new Table2Json();
	private Table2Row table2Row = new Table2Row();

	public DocDirPermissions() {
	}

	public DocDirPermissions(Table table) {
		this.container = table;
	}

	public DocDirPermissions query(String concept, String idColumn, String select, String from, String condition, List<DataPermission> range,
			String filter, Boolean distinct, int offset, int limit, String columns, String orderBy, String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel) {
		container = BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
		for (Iterator<Row> it = container.iterator(); it.hasNext();) {
			Row r = it.next();
			pers.put(r.getString("SA_DocAuth"), new DocPermission(r, this));
		}
		return this;
	}

	public DocDirPermissions queryByPath(String docPath) {
		return query(
				"SA_DocAuth",
				"SA_DocAuth",
				"SA_DocAuth.*",
				"SA_DocAuth SA_DocAuth",
				null,
				null,
				"(SA_DocAuth.sDocPath='" + docPath + "')",
				false,
				0,
				-1,
				"sDocPath,sAuthorizerFID,sAuthorizerName,sAuthorizerDeptName,sAuthorizeeFID,sAuthorizeeName,sAuthorizeeDeptName,sGrantTime,sAccess,sScope,version,SA_DocAuth",
				null, null, null, null, DocDBHelper.DATA_MODEL, null);
	}

	public DocPermission add(String sID, String sDocPath, String sAuthorizeeFID, String sAuthorizeeName, int sAccess) {
		if (Utils.isNull(container)) {
			container = DocDBHelper.initDocAuth();
		}
		if (Utils.isNotEmptyString(sID))
			sID = CommonUtils.createGUID();

		Row r = container.appendRow();
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
		int affectCount = container.save(model);
		for (Iterator<Row> iterator = container.iterator(); iterator.hasNext();) {
			Row row = iterator.next();
			String str = row.getString("sDocPath");
			if (str.equals("/")) {
				if (Integer.parseInt(row.getValue("sAccess").toString()) % 32768 < 16384
						&& (!row.getState().equals(ModifyState.NEW)) && Integer.parseInt(row.getOldValue("sAccess").toString()) % 32768 > 16384) {
					checkRootPermission();
				}
			}
		}
		return affectCount;
	}

	private void checkRootPermission() {
		int size = DocDBHelper.getRootPermission();
		if (size == 0) {
			throw new DocRTException(DocMessages.MUSTHASROOTPERMISSION);
		}
	}

	public DocDirPermissions remove(String sID) {
		container.deleteRows(sID);
		pers.remove(sID);
		return this;
	}

	public DocDirPermissions remove(Doc doc) {
		String id = doc.getsID();
		remove(id);
		return this;
	}

	public Table toTable() {
		return container;
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

	public void readerFromJson(Object arg0, TransformConfig arg1) {

	}

	public Object writerToJson(TransformConfig arg0) {
		return table2Json.transform(container, arg0);
	}

	public void reader(Element arg0, TransformConfig arg1) {

	}

	public Element writer(TransformConfig arg0) {
		return table2Row.transform(container, arg0);
	}

}
