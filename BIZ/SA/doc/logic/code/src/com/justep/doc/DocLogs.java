package com.justep.doc;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

public class DocLogs {

	private String sDocId;

	private Table container;
	

	private boolean isInit = false;
	private Map<String, DocLog> logs = new HashMap<String, DocLog>();

	public Map<String, DocLog> getLogs() {
		return logs;
	}

	public void setLogs(Map<String, DocLog> logs) {
		this.logs = logs;
	}

	public DocLogs() {
	}

	public DocLogs(String docID) {
		sDocId = docID;
		loadLogs(docID);
	}

	public String getsDocId() {
		return sDocId;
	}

	private DocLogs loadLogs(String docID) {
		container = DocDBHelper.queryAccessRecord(docID, false, false, false, null);
		container.getMetaData().setKeyColumn("SA_DocLog");
		for (Iterator<Row> it = container.iterator(); it.hasNext();) {
			Row r = it.next();
			logs.put(r.getString("SA_DocLog"), new DocLog(r, this));
		}
		isInit = true;
		return this;
	}

	public DocLogs refresh() {
		if (Utils.isNotEmptyString(this.sDocId))
			loadLogs(sDocId);
		return this;
	}
	
	public List<DocLog> getLogs(String columnName,Object value) {
		List<DocLog> resultLogs = new ArrayList<DocLog>();
		Collection<Row> rows = container.getRows(columnName,Integer.parseInt(value.toString()));
		String key = container.getMetaData().getKeyColumnName();
		for (Row row : rows) {
			String sLogID = row.getString(key);
			resultLogs.add(logs.get(sLogID));
		}
		return resultLogs;
	}
	
	public List<DocLog> getHistorys() {
		List<DocLog> historyLog = new ArrayList<DocLog>();

		for (Entry<String, DocLog> entry : logs.entrySet()) {
			DocLog log = entry.getValue();
			if ("edit".equals(log.getsAccessType()) || "new".equals(log.getsAccessType())) {
				historyLog.add(log);
			}
		}
		return historyLog;
	}

	public Table getHistorysTable() {
		Table t = container;
		t.setRecordState(false);
		for (Entry<String, DocLog> entry : logs.entrySet()) {
			DocLog log = entry.getValue();
			if (!("edit".equals(log.getsAccessType()) || "new".equals(log.getsAccessType()))) {
				t.deleteRows(log.getsID());
			}
		}
		t.setRecordState(true);
		return t;
	}

	public Table getDownloadsTable() {
		Table t = container;
		t.setRecordState(false);
		for (Entry<String, DocLog> entry : logs.entrySet()) {
			DocLog log = entry.getValue();
			if (!"download".equals(log.getsAccessType())) {
				t.deleteRows(log.getsID());
			}
		}
		t.setRecordState(true);
		return t;
	}

	public List<DocLog> getDownloads() {
		List<DocLog> downloadLog = new ArrayList<DocLog>();
		if (Utils.isNull(logs))
			loadLogs(sDocId);

		for (Entry<String, DocLog> entry : logs.entrySet()) {
			DocLog log = entry.getValue();
			if ("download".equals(log.getsAccessType())) {
				downloadLog.add(log);
			}
		}
		return downloadLog;
	}

	public Iterator<DocLog> getDocLogsIterator() {
		return logs.values().iterator();
	}

	public int size() {
		return logs.size();
	}

	public DocLog getLog(int i) {
		return logs.get(i);
	}

	public DocLogs addLog(String sID, String sAccessType, String sDocID, String sDocName, Integer sDocVersionID, Float sSize) {
		if (!isInit) {
			container = DocDBHelper.initDocLog();
			isInit = true;
		}
		Row r = container.appendRow();
		sID = Utils.isEmptyString(sID) ? CommonUtils.createGUID() : sID;
		this.sDocId = sDocID;
		r.setString("SA_DocLog", sID);
		r.setString("sAccessType", sAccessType);
		r.setString("sDocID", sDocID);
		r.setString("sDocName", sDocName);
		if (Utils.isNotNull(sDocVersionID))
			r.setInteger("sDocVersionID", sDocVersionID);
		r.setFloat("sSize", sSize);
		r.setString("sPersonFID", ContextHelper.getPersonMember().getFID());
		r.setString("sPersonName", ContextHelper.getPersonMember().getName());
		r.setDateTime("sTime", com.justep.system.util.CommonUtils.getCurrentDateTime());
		r.setInt("version", 0);
		logs.put(r.getString("SA_DocLog"), new DocLog(r, this));
		return this;
	}

	public int save() {
		Model model = ModelUtils.getModel(DocDBHelper.DATA_MODEL);
		return container.save(model);
	}

	public static DocLog getHistoryLogByVersion(String docID, String docVersionID) {
		Table table = DocDBHelper.queryAccessRecord(docID, true, false, true, null);
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			return new DocLog(r, null);
		}
		return null;
	}

	

	

}
