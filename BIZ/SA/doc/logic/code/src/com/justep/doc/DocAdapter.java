package com.justep.doc;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.justep.doc.attachment.Attachment;
import com.justep.doc.attachment.Attachments;
import com.justep.doc.attachment.DocLinkAttachments;
import com.justep.doc.attachment.DocLinkDirs;
import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

public class DocAdapter {

	/*
	 * 知识中心调用
	 */
	public static Logger logger = Logger.getLogger(DocAdapter.class);

	public static Table queryDocAuth(String concept, String idColumn,
			String select, String from, String condition,
			List<DataPermission> range, String filter, Boolean distinct,
			int offset, int limit, String columns, String orderBy,
			String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel) {
		DocDirPermissions ddp = new DocDirPermissions();
		return ddp.query(concept, idColumn, select, from, condition, range,
				filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel).toTable();
	}

	public static int saveDocAuth(Table table, String concept,
			String dataModel, String fnModel, List<DataPermission> insertRange,
			List<DataPermission> deleteRange, List<DataPermission> updateRange,
			String readOnly, String notNull) throws Exception {
		table.getMetaData().setStoreByConcept(concept, true);
		DocDirPermissions ddp = new DocDirPermissions(table);
		return ddp.save();
	}

	public static int saveDocNode(Table table, String concept,
			String dataModel, String fnModel, List<DataPermission> insertRange,
			List<DataPermission> deleteRange, List<DataPermission> updateRange,
			String readOnly, String notNull) throws Exception {
		table.getMetaData().setStoreByConcept(concept, true);
		Docs ds = new Docs(table, new DocPermissions(), null);
		ds.checkAceess();
		return table.save(DocDBHelper.DATA_MODEL);
	}

	public static Table queryDocNode(String concept, String idColumn,
			String select, String from, String condition,
			List<DataPermission> range, String filter, Boolean distinct,
			int offset, int limit, String columns, String orderBy,
			String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel) {
		Docs ds = new Docs(new DocPermissions(), null);
		return ds.query(concept, idColumn, select, from, condition, range,
				filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel).getTable();
	}

	public static Table queryDoc(String docID, String docPath, String pattern,
			String orderBy, String custom) {
		Docs ds = new Docs();	
		return ds.query(docID, docPath, pattern, orderBy, custom).getTable();
	}

	public static void syncCustomFileds(String sDocID, Boolean isHttps)
			throws UnsupportedEncodingException, DocumentException, Exception {
		Docs docs = new Docs();
		docs.query(sDocID, null, null, null, null);
		for (Iterator<Doc> iterator = docs.getIterator(); iterator.hasNext();) {
			Doc doc = iterator.next();
			doc.setState(ModifyState.EDIT);
		}
		docs.setIsEditInfo(true);
		docs.save();
	}

	public static int addAccessRecord(String param) throws JSONException {
		JSONObject jsonObject = JSONObject.parseObject(param);
		JSONArray items = jsonObject.getJSONArray("items");
		DocLogs dl = new DocLogs();
		for (int i = 0; i < items.size(); i++) {
			JSONObject item = items.getJSONObject(i);
			dl.addLog("", item.getString("operation_type"),
					item.getString("doc_id"), item.getString("doc_name"),
					Integer.valueOf(item.getString("doc_version_id")),
					Float.valueOf(item.getString("size")));
		}
		return dl.save();
	}

	public static int deleteDocAdapter(String changeLog)
			throws UnsupportedEncodingException, DocumentException, Exception {
		JSONObject jsonObject = null;
		int result = -1;

		jsonObject = JSONObject.parseObject(changeLog);
		boolean isHttps = jsonObject.getBoolean("isHttps");
		Docs ds = new Docs(null, isHttps);
		JSONArray jsonArray = jsonObject.getJSONArray("items");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);
			String sID = item.getString("doc_id");
			if (Utils.isEmptyString(sID))
				sID = CommonUtils.createGUID();
			Doc up = ds.addDoc(sID, item.getString("parent_id"),
					item.getString("doc_name"), item.getString("kind"),
					item.getString("doc_path"),
					item.getString("doc_display_path"));
			String op = item.getString("operation_type");
			// ds.setIsLogicDelete(false);
			if (op.equals("delete")) {
				up.setsFileID(item.getString("file_id"));
				up.setVersion(Integer.valueOf(item.getString("version")));
				/* 通过标志位假删除 */
				up.setState(ModifyState.DELETE);
			}
		}
		result = ds.saveTable();
		if (result < 0)
			throw new DocRTException(DocMessages.DOCSAVEERROR);
		ds.commitFile();
		return result;
	}
	
	/**
	 * 
	 * 文档中心  上传完文件后 仅仅commitFile 
	 * data的commit通过前面的data的save动作完成
	 * 然后配合js中调用commitFlag
	 */
	public static Table commitDocAdapter(String changeLog) throws Exception {
		JSONObject jsonObject = null;
		Table result = null;
		try {
			jsonObject = JSONObject.parseObject(changeLog);
			boolean isHttps = jsonObject.getBoolean("isHttps");
			Docs ds = new Docs(null, isHttps);
			JSONArray jsonArray = jsonObject.getJSONArray("items");
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				Doc up = ds.addDoc("", item.getString("parent_id"),
						item.getString("doc_name"), item.getString("kind"),
						item.getString("doc_path"),
						item.getString("doc_display_path"));
				String op = item.getString("operation_type");
				Utils.check(Utils.isNotEmptyString(item.getString("cache_name"))
								&& (!op.equals("delete")),
								DocMessages.class, DocMessages.STATUSERROR);
				up.setScacheName(item.getString("cache_name"));

				String revisionCacheName = item
						.getString("revision_cache_name");
				if (Utils.isNotEmptyString(revisionCacheName))
					up.setSrevisionCacheName(revisionCacheName);

				String commentFileContent = item
						.getString("comment_file_content");
				if (Utils.isNotEmptyString(commentFileContent)) {
					up.setCommentFileContent(commentFileContent);
				}

				if (op.equals("new") || op.equals("newDir")) {
					up.setState(ModifyState.NEW);
				} else if (op.equals("edit")) {
					up.setsFileID(item.getString("file_id"));
					up.setVersion(Integer.valueOf(item.getString("version")));
					up.setState(ModifyState.EDIT);
				} else if (op.equals("delete")) {
					up.setsFileID(item.getString("file_id"));
					up.setState(ModifyState.DELETE);
				}
			}
			ds.commitFile();
			result = ds.getTable();
		} catch (Exception e) {
			throw new DocRTException(DocMessages.COMMITDOCCENTERERROR, e);
		}
		return result;
	}

	private static void parseToCommitFile(Attachments atts,
			JSONArray createVersionArray, String process, String activity,
			Boolean isHttps) throws JSONException {
		for (int i = 0; i < createVersionArray.size(); i++) {
			JSONObject item = createVersionArray.getJSONObject(i);
			String attachmentValue = item.getString("attachmentValue");
			String billID = item.getString("billID");
			Attachments temp = new Attachments(process, activity,
					attachmentValue, true, null, isHttps);
			for (Iterator<Attachment> iterator = temp.getIterator(); iterator
					.hasNext();) {
				Attachment att = (Attachment) iterator.next();
				String sCacheName = att.getCacheName();
				att.setState(ModifyState.EDIT);
				if (Utils.isEmptyString(sCacheName)) {
					iterator.remove();
				} else if (atts.get(att.getsID()) != null) {
					iterator.remove();
				} else {
					int lockNum = DocDBHelper.checkLocker(att.getsID());
					if (lockNum != 1) {
						iterator.remove();
					} else {
						atts.addAttachment(att, billID);
					}
				}
			}
		}
	}

	private static void parseToCommitFile(Attachments atts,
			JSONArray jsonArray, Boolean autoCreateVersion)
			throws JSONException {
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);
			String cacheName = "";
			String revisionCacheName = "";
			String commentFileContent = "";
			if (item.containsKey("cache_name")) {
				cacheName = item.getString("cache_name");
			}

			if (item.containsKey("revision_cache_name")) {
				revisionCacheName = item.getString("revision_cache_name");
			}
			if (item.containsKey("comment_file_content")) {
				commentFileContent = item.getString("comment_file_content");
			}

			String op = item.getString("operation_type");
			if (Utils.isEmptyString(cacheName) && (!op.equals("delete"))) {
				continue;
			}
			if (op.equals("edit")) {
				if (autoCreateVersion) {
					int lockNum = DocDBHelper.checkLocker(item
							.getString("doc_id"));
					if (lockNum != 1) {
						continue;
					}
				} else {
					continue;
				}
			}
			Attachment up = atts.addDoc(item.getString("doc_id"),
					item.getString("parent_id"), item.getString("doc_name"),
					item.getString("kind"), item.getString("doc_path"),
					item.getString("doc_display_path"),
					item.getString("bill_id"));
			up.setScacheName(cacheName);
			if (Utils.isNotEmptyString(revisionCacheName))
				up.setSrevisionCacheName(revisionCacheName);
			if (Utils.isNotEmptyString(commentFileContent)) {
				up.setCommentFileContent(commentFileContent);
			}

			if (Utils.isNotEmptyString(item.getString("size")))
				up.setsSize(Float.valueOf(item.getString("size")));
			if (op.equals("new") || op.equals("newDir")) {
				up.setState(ModifyState.NEW);
			} else if (op.equals("edit")) {
				up.setsFileID(item.getString("file_id"));
				up.setVersion(Integer.valueOf(item.getString("version")));
				up.setState(ModifyState.EDIT);
			} else if (op.equals("delete")) {
				up.setsFileID(item.getString("file_id"));
				up.setState(ModifyState.DELETE);
			}
		}
	}

	private static void parseToCommitData(Attachments atts,
			JSONArray createVersionArray, String process, String activity,
			Boolean isHttps) throws JSONException {
		for (int i = 0; i < createVersionArray.size(); i++) {
			JSONObject item = createVersionArray.getJSONObject(i);
			String attachmentValue = item.getString("attachmentValue");
			String billID = item.getString("billID");
			Attachments temp = new Attachments(process, activity,
					attachmentValue, true, null, null);
			for (Iterator<Attachment> iterator = temp.getIterator(); iterator
					.hasNext();) {
				Attachment att = (Attachment) iterator.next();
				String sCacheName = att.getCacheName();
				if (Utils.isEmptyString(sCacheName)) {
					iterator.remove();
				} else if (atts.get(att.getsID()) != null) {
					iterator.remove();
				} else if (DocDBHelper.checkLocker(att.getsID()) == 1) {
					Attachment up = atts.addAttachment(att, billID);
					up.getRow().setState(ModifyState.EDIT);
					up.setScacheName("");
					up.setSrevisionCacheName("");
					up.setSeditorDeptName("");
					up.setSeditorFID("");
					up.setSeditorName("");
				}
			}
		}
	}

	private static void parseToCommitData(Attachments atts,
			JSONArray jsonArray, Boolean autoCreateVersion)
			throws JSONException {
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);
			String op = item.getString("operation_type");
			if (op.equals("edit") && !autoCreateVersion) {
				continue;
			}
			Attachment up = atts.addDoc(item.getString("doc_id"),
					item.getString("parent_id"), item.getString("doc_name"),
					item.getString("kind"), item.getString("doc_path"),
					item.getString("doc_display_path"),
					item.getString("bill_id"));
			if (Utils.isNotEmptyString(item.getString("size")))
				up.setsSize(Float.valueOf(item.getString("size")));
			if ("new".equals(op) || "newDir".equals(op)) {
				up.setVersion(Integer.valueOf(item.getString("version")));
				up.setScacheName(item.getString("cache_name"));
				up.setSrevisionCacheName(item.getString("revision_cache_name"));
				up.setState(ModifyState.NEW);
			} else if ("edit".equals("edit") || "editInfo".equals(op)) {
				up.setVersion(Integer.valueOf(item.getString("version")));
				up.setScacheName(item.getString("cache_name"));
				up.setSrevisionCacheName(item.getString("revision_cache_name"));
				up.setState(ModifyState.EDIT);
			} else if ("delete".equals(op)) {
				up.setsFileID(item.getString("file_id"));
				up.setState(ModifyState.DELETE);
			}
			if (Utils.isNotEmptyString(item.getString("file_id"))) {
				up.setsFileID(item.getString("file_id"));
				up.setsDocLiveVersionID(Integer.valueOf(item
						.getString("doc_version_id")));
			}
		}
	}
	
	public static int updateDocState(boolean isLockDoc, String sDocID) {
		return DocDBHelper.updateDocState(isLockDoc, sDocID);
	}
	

	public static Table commitAttachAdapter(String changeLog) throws Exception {
		JSONObject jsonObject = JSONObject.parseObject(changeLog);
		String url = jsonObject.getString("url");
		Boolean autoCreateVersion = true;
		if (jsonObject.containsKey("autoCreateVersion")) {
			autoCreateVersion = jsonObject.getBoolean("autoCreateVersion");
		}
		String process = ContextHelper.getActionContext().getProcess()
				.getFullName();
		if (jsonObject.containsKey("process")) {
			process = jsonObject.getString("process");
		}
		String activity = ContextHelper.getActionContext().getActivity()
				.getName();
		if (jsonObject.containsKey("activity")) {
			activity = jsonObject.getString("activity");
		}
		Boolean isHttpsValue = jsonObject.getBoolean("isHttps");
		Boolean isHttps = (isHttpsValue == true) ? isHttpsValue : false;
		if (!"".equals(url)) {
			isHttps = url.startsWith("https") ? true : false;
		}
		Attachments atts = new Attachments(process, activity, "", false, null,
				isHttps);
		JSONArray jsonArray = jsonObject.getJSONArray("items");
		parseToCommitFile(atts, jsonArray, autoCreateVersion);
		if (jsonObject.containsKey("createVersionLogs") && autoCreateVersion) {
			JSONArray createVersionArray = jsonObject
					.getJSONArray("createVersionLogs");

			parseToCommitFile(atts, createVersionArray, process, activity,
					isHttps);
		}
		atts.commitFile();
		return atts.toTable();
	}

	// 以下2个方法为知识中心保留
	public static void commitDocCacheAdapter(String changeLog) throws Exception {
		JSONObject item = JSONObject.parseObject(changeLog);
		String cacheName = item.getString("cache_name");
		String revisionCacheName = item.getString("revision_cache_name");
		String docID = item.getString("doc_id");
		if (!(Utils.isNotEmptyString(cacheName) || Utils
				.isNotEmptyString(revisionCacheName))) {
			throw new DocRTException(DocMessages.DOCCACHEERROR);
		}
		DocDBHelper.updateDocCache(docID, cacheName, revisionCacheName);
	}

	public static void commitDocFlag(String changeLog) throws Exception {
		JSONObject jsonObject = JSONObject.parseObject(changeLog);
		JSONArray jsonArray = jsonObject.getJSONArray("items");
		if (jsonArray.size() == 0) {
			return;
		}
		boolean isHttps = jsonObject.getBoolean("isHttps");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);
			String operationType = item.getString("operation_type");
			if (!("new".equals(operationType) || "edit".equals(operationType))) {
				continue;
			}
			DocUtils.saveDocFlag(item.getString("doc_path"),
					item.getString("kind"), item.getString("file_id"),
					item.getString("cache_name"), isHttps);
		}
	}

	public static int saveAttachAdapter(String changeLog, Boolean isSaveDocLink)
			throws Exception {
		int i = -1;
		if (isSaveDocLink) {
			i = saveLinkAttach(changeLog);
		} else {
			i = saveCommAttach(changeLog);
		}

		return i;
	}

	/**
	 * office控件点击成文时候调用
	 */
	public static String createVersion(String sDocID, Boolean isSaveDocLink,
			Boolean isHttps, String sDocName) throws Exception {
		return DocUtils.createVersion(sDocID, isHttps, sDocName);
	}

	@Deprecated
	public static void saveAttachFlag(String changeLog) throws Exception {
		JSONObject jsonObject = null;
		jsonObject = JSONObject.parseObject(changeLog);
		JSONArray jsonArray = jsonObject.getJSONArray("items");
		if (jsonArray.size() == 0) {
			return;
		}
		boolean isHttps = jsonObject.getBoolean("isHttps");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);
			String operationType = item.getString("operation_type");
			if (!("new".equals(operationType) || "edit".equals(operationType))) {
				continue;
			}
			DocUtils.saveDocFlag(item.getString("doc_path"),
					item.getString("kind"), item.getString("file_id"), "",
					isHttps);
		}
	}

	private static int saveCommAttach(String changeLog) throws Exception {

		JSONObject jsonObject = JSONObject.parseObject(changeLog);

		String process = ContextHelper.getActionContext().getProcess()
				.getFullName();

		if (jsonObject.containsKey("process")) {
			process = jsonObject.getString("process");
		}

		String activity = ContextHelper.getActionContext().getActivity()
				.getName();

		if (jsonObject.containsKey("process")) {
			activity = jsonObject.getString("activity");
		}

		Boolean isHttps = jsonObject.getBoolean("isHttps");
		Boolean autoCreateVersion = true;

		if (jsonObject.containsKey("autoCreateVersion")) {
			autoCreateVersion = jsonObject.getBoolean("autoCreateVersion");
		}

		JSONArray jsonArray = jsonObject.getJSONArray("items");

		Attachments atts = new Attachments(process, activity, "", false, null,
				isHttps);

		parseToCommitData(atts, jsonArray, autoCreateVersion);

		if (jsonObject.containsKey("createVersionLogs") && autoCreateVersion) {
			JSONArray createVersionArray = jsonObject
					.getJSONArray("createVersionLogs");
			parseToCommitData(atts, createVersionArray, process, activity,
					isHttps);
		}

		int affectNum = -1;
		if (atts.size() > 0) {

			affectNum = atts.commitData();
			atts.commitFlag();
		}
		return affectNum;
	}

	private static int saveLinkAttach(String changeLog) throws Exception {
		JSONObject jsonObject = JSONObject.parseObject(changeLog);
		JSONArray jsonArray = jsonObject.getJSONArray("items");

		Boolean isHttps = false;
		if (jsonObject.containsKey("isHttps")) {
			isHttps = jsonObject.getBoolean("isHttps");
		}
		Boolean autoCreateVersion = false;
		if (jsonObject.containsKey("autoCreateVersion")) {
			autoCreateVersion = jsonObject.getBoolean("autoCreateVersion");
		}
		String process = ContextHelper.getActionContext().getProcess()
				.getFullName();
		if (jsonObject.containsKey("process")) {
			process = jsonObject.getString("process");
		}
		String activity = ContextHelper.getActionContext().getActivity()
				.getName();
		if (jsonObject.containsKey("activity")) {
			activity = jsonObject.getString("activity");
		}
		DocLinkAttachments atts = new DocLinkAttachments("", process, activity,
				false, isHttps);
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject item = jsonArray.getJSONObject(i);

			String op = item.getString("operation_type");

			String cacheName = "";
			String revisionCacheName = "";
			String commentFileContent = "";
			if (item.containsKey("cache_name")) {
				cacheName = item.getString("cache_name");
			}
			if (item.containsKey("revision_cache_name")) {
				revisionCacheName = item.getString("revision_cache_name");
			}
			if (item.containsKey("comment_file_content")) {
				commentFileContent = item.getString("comment_file_content");
			}

			Attachment up = atts.addDoc(item.getString("doc_id"),
					item.getString("parent_id"), item.getString("doc_name"),
					item.getString("kind"), item.getString("doc_path"),
					item.getString("doc_display_path"),
					item.getString("bill_id"));
			up.setScacheName(cacheName);
			up.setSrevisionCacheName(revisionCacheName);
			up.setCommentFileContent(commentFileContent);
			if (op.equals("new") || op.equals("newDir")) {
				up.setState(ModifyState.NEW);
				if (Utils.isNotEmptyString(item.getString("size")))
					up.setsSize(Float.valueOf(item.getString("size")));
				setLinkAttachRalation(up, "sDocSerialNumber",
						item.getString("serial_number"));
				setLinkAttachRalation(up, "sClassification",
						item.getString("classification"));
				setLinkAttachRalation(up, "sKeywords",
						item.getString("keywords"));
				setLinkAttachRalation(up, "sDescription",
						item.getString("description"));
				/*
				 * if(Utils.isNotEmptyString(item.getString("finish_time")));
				 * up.getRow().setDateTime("sFinishTime",Timestamp.valueOf(item.
				 * getString("finish_time")));
				 */
			} else if (op.equals("edit") || "editInfo".equals(op)) {
				up.setState(ModifyState.EDIT);
				up.setsDocName(item.getString("doc_name"));
				editLinkAttachInfo(up, item);
				if (!autoCreateVersion && op.equals("edit")) {
					up.setState(ModifyState.NONE);
					atts.deleteAtts(up.getsID());
				} else if (op.equals("editInfo")) {
					syncCustomFileds(up.getsID(), isHttps);
					atts.saveTable();
					atts.deleteAtts(up.getsID());
				}
			} else if (op.equals("delete")) {
				up.setsFileID(item.getString("file_id"));
				up.setState(ModifyState.DELETE);
			}
			if (Utils.isNotEmptyString(item.getString("file_id"))) {
				up.setsFileID(item.getString("file_id"));
				up.setsDocLiveVersionID(Integer.valueOf(item
						.getString("doc_version_id")));
			}
		}

		if (autoCreateVersion && jsonObject.containsKey("changedBillIDs")) {
			String billIDs = jsonObject.getString("changedBillIDs");
			atts.setBillIDs(billIDs);
			Table table = DocDBHelper.queryDocLink(billIDs, process, activity);
			for (Iterator<Row> iterator = table.iterator(); iterator.hasNext();) {
				Row row = iterator.next();
				String sID = row.getString("sDocID");
				String sParentID = row.getString("sParentID");
				String sDocName = row.getString("sDocName");
				String sKind = row.getString("sKind");
				String sDocPath = row.getString("sDocPath");
				String sDocDisplayPath = row.getString("sDocDisplayPath");
				String sCacheName = row.getString("sCacheName");
				String sRevisionCacheName = row.getString("sRevisionCacheName");
				String sEditorFID = row.getString("sEditorFID");
				String sEditorName = row.getString("sEditorName");
				String sEditorDeptName = row.getString("sEditorDeptName");
				String billID = row.getString("sOwnerID");
				int version = row.getInt("version");
				if (Utils.isNotEmptyString(sCacheName)
						&& Utils.isNotEmptyString(sRevisionCacheName)
						&& DocDBHelper.checkLocker(sID) == 1) {
					if (atts.get(sID) == null) {
						Attachment up = atts.addDoc(sID, sParentID, sDocName,
								sKind, sDocPath, sDocDisplayPath, billID);
						up.setScacheName(sCacheName);
						up.setSrevisionCacheName(sRevisionCacheName);
						up.setSeditorFID(sEditorFID);
						up.setSeditorName(sEditorName);
						up.setSeditorDeptName(sEditorDeptName);
						up.setSrevisionCacheName(sRevisionCacheName);
						up.setVersion(version);
						up.setState(ModifyState.EDIT);
					}
				}
			}
		}
		int i = atts.createVersion();
		return i;
	}

	private static void editLinkAttachInfo(Attachment att, JSONObject item)
			throws JSONException {
		if (Utils.isNotEmptyString(item.getString("size")))
			att.setsSize(Float.valueOf(item.getString("size")));
		att.setRelation("sDocSerialNumber", item.getString("serial_number"));
		att.setRelation("sClassification", item.getString("classification"));
		att.setRelation("sKeywords", item.getString("keywords"));
		att.setRelation("sDescription", item.getString("description"));
	}

	private static void setLinkAttachRalation(Attachment att, String field,
			String value) {
		if (Utils.isNotEmptyString(value))
			att.setRelation(field, value);
	}

	public static Map<String, Object> queryDocInfoById(boolean isHttps,String host, String fileId, String docVersion) throws Exception {
		return DocDBHelper.queryDocInfoById(isHttps, host, fileId, docVersion);
	}

	public static Map<String, String> queryDocCacheById(String docID) throws Exception {
		Map<String, String> cacheMap = new HashMap<String, String>();
		String result = DocUtils.lock(docID);
		if (result == "failure") {
			cacheMap.put("isLockSuccess", "failure");
			return cacheMap;
		} else {
			cacheMap.put("isLockSuccess", result);
		}
		Model model = ModelUtils.getModel(DocDBHelper.DATA_MODEL);
		String queryCacheSql = "select SA_DocNode.sCacheName,SA_DocNode.sRevisionCacheName from SA_DocNode SA_DocNode where SA_DocNode='"
				+ docID + "'";
		Table table = KSQL.select(queryCacheSql, null, model, null);
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row row = (Row) it.next();
			cacheMap.put("sCacheName", row.getString("sCacheName"));
			cacheMap.put("sRevisionCacheName",
					row.getString("sRevisionCacheName"));
		}
		return cacheMap;
	}

	// 查询文件权限
	public static Object queryPermission(String deptPath, String personId)
			throws Exception {
		DocPermissions p = new DocPermissions();
		return p.toMap();
	}

	public static Document queryDocSearch(Document param) {
		Document result = null;
		/* 兼容原先ui实现的形式 */
		String optStr = getOptionType(param);
		if (optStr.equals("queryDocSearch")) {
			try {
				DocSearch ds = new DocSearch();
				result = ds.queryDocSearch(param);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}/* RDF格式xml */
		return result;
	}
	
	//附件subPath对应的guid值
	public static Table queryLinkDirAdapter(String rootPath, String subPath,
			String billID, String process, String activity, Boolean isTree)
			throws Exception {
		DocLinkDirs dl = new DocLinkDirs(billID, rootPath, subPath);
		return dl.toTable();
	}

	public static Table docDispatchOptT(Document param) throws Exception {
		Table result = null;
		String optStr = getOptionType(param);
		if (optStr.equals("queryAccessRecord")) {
			List<?> list = param.selectNodes("data");
			Element elt = (Element) list.get(0);
			String docID = elt.elementText("doc-id");
			String hasNew = elt.elementText("has-new");
			String hasDownload = elt.elementText("has-download");
			String hasEdit = elt.elementText("has-edit");
			DocLogs dl = new DocLogs(docID);
			if ("true".equals(hasNew) || "true".equals(hasEdit))
				result = dl.getHistorysTable();
			if ("true".equals(hasDownload)) {
				result = dl.getDownloadsTable();
			}
			// result = DocDBHelper.queryAccessRecord(docID, hasNew,
			// hasDownload, hasEdit);
		} else if (optStr.equals("queryNameSpace")) {
			DocServerDefines docNameSpace = DocServerDefines.getInstance();
			result = docNameSpace.toTable();
		} else if (optStr.equals("queryLinkedDoc")) {
			/* 查询与业务数据关联的文档信息 */
			List<?> list = param.selectNodes("data");
			Element elt = (Element) list.get(0);
			String billID = elt.elementText("bill-id");
			DocLinkAttachments dl = new DocLinkAttachments(billID, "", "",
					true, null);
			result = dl.toTable();
		} else {
			throw new DocRTException(DocMessages.PARAMERROR);
		}
		return result;
	}

	public static String queryHost(Boolean isHttps, String docPath,
			String urlPattern, Boolean isFormAction) throws Exception {
		if (checkPermission(urlPattern, docPath)) {
			return queryNoPermissionHost(isHttps, docPath, urlPattern, isFormAction);
		}else{
			return "#";
		}
	}
	
	/**
	 * /repository/file/view/" + fileID + "/" + versionID + "/" + partType
	 * /repository/file/cache/upload
	 * "/repository/file/download/" + fileID + "/" + versionID + "/" + partType
	 * for office plugin
	 * "/repository/file/cache/office/"+fileID
	 * "/repository/file/cache/office/new"
	 * 
	 */
	public static String queryNoPermissionHost(Boolean isHttps, String docPath,
			String urlPattern, Boolean isFormAction) throws Exception {
		return  DocUtils.getDocUrl(docPath,urlPattern,isFormAction);
	}
	

	private static Boolean checkPermission(String urlPattern, String docPath) {
		int index = docPath.indexOf("/", 2);
		if (index != -1) {
			String rootPath = docPath.substring(0, index);
			String subPath = docPath.substring(index + 1);
			docPath = rootPath + "/" + DocUtils.convertExpression(subPath);
		}

		String fileID = "";
		String docID = "";
		String operater = "";
		try {
			if (urlPattern.indexOf("/repository/file/cache/upload") != -1) {
				operater = "upload";
			} else if (urlPattern.indexOf("/repository/file/download") != -1) {
				fileID = urlPattern.split("/repository/file/download")[1]
						.split("/")[1];
				operater = "download";
			} else if (urlPattern.indexOf("/repository/file/view") != -1) {
				fileID = urlPattern.split("/repository/file/view")[1]
						.split("/")[1];
				operater = "view";
			} else if (urlPattern.indexOf("/repository/file/cache/office/") != -1) {
				fileID = urlPattern.split("/repository/file/cache/office")[1]
						.split("/")[1];
				if (fileID.equals("new")) {
					fileID = "";
					operater = "edit";
				} else {
					operater = "view";
				}
			}
		} catch (NullPointerException e) {
			throw new DocRTException(DocMessages.URLERROR, e);
		}
		// getdocServerAction
		// /repository/file/cache/office
		if (!fileID.equals("")) {
			Table table = DocDBHelper.queryDocID(fileID, docPath);
			for (Iterator<Row> iterator = table.iterator(); iterator.hasNext();) {
				Row row = iterator.next();
				// Utils.check("".equals(docID), "一个fileID:" + fileID +
				// "不能对应多条记录");
				if (!"".equals(docID)) {
					logger.info("一个fileID:" + fileID + "不应该对应多条记录");
				}
				docID = row.getString("SA_DocNode");
				docPath = row.getString("sDocPath");
			}
		}

		DocPermission dp = new DocPermissions().queryPermissionById(docID,
				docPath);
		if (Utils.isNull(dp)) {
			return false;
		}
		int access = dp.getsAccess();
		if ("upload".equals(operater)) {
			return access % 512 >= 256;
		} else if ("download".equals(operater)) {
			return access % 8 >= 4;
		} else if ("view".equals(operater)) {
			return access % 4 >= 2;
		} else if ("edit".equals(operater)) {
			return access % 1024 >= 512;
		} else if ("".equals(operater)) {
			logger.info("扩展的url：" + urlPattern + "暂不判断权限");
			return true;
		}
		return false;
	}

		private static String getOptionType(Document param) {
		String xpath = "//data/operate";
		List<?> list = param.selectNodes(xpath);
		Element elt = (Element) list.get(0);
		return elt.getText();
	}

	public static String checkSession(String key, String path) throws Exception {
		DesUtils des = new DesUtils();

		String deKey = des.decrypt(key);
		String[] a = deKey.split(",");
		if (!Utils.isEmptyString(a[0])) {
			a[0] = a[0].replace(":80/", "/");
		}
		if (!Utils.isEmptyString(path)) {
			path = path.replace(":80/", "/");
		}
		if (Utils.isEmptyString(path) || !path.equals(a[0])) {
			throw new DocRTException(DocMessages.SECURITYERROR);
		}

		long ss = (new java.util.Date().getTime() - Long.valueOf(a[1])) / 1000;
		if (ss > 60) {
			throw new DocRTException(DocMessages.TIMEOUT);
		}
		return "";
	}

	public static int deleteDocNameSpace(Boolean isHttps, String sID)
			throws UnsupportedEncodingException, DocumentException, Exception {
		DocServerDefines ds = DocServerDefines.getInstance();
		DocServerDefine docServerDefine = ds.get(sID);
		if (docServerDefine == null) {
			throw new DocRTException(DocMessages.DELETEPERMISSIONERROR);
		}
		ds.remove(sID);
		Docs docs = new Docs(new DocPermissions(), isHttps);
		docs.query("", "", "", "", "sNameSpace='" + sID + "'");
		
		List<Doc> needRemove = new ArrayList<Doc>();
		for (Iterator<Doc> it = docs.getIterator(); it.hasNext();) {
			Doc doc = it.next();
			needRemove.add(doc);
		}
		for (Doc  item: needRemove) {
			docs.remove(item);
		}
		
		docs.commitFile();
		docs.commitData();
		return ds.save();
	}

	public static String queryCommentFileContent(Boolean isHttps,
			String docPath, String fileID, String docVersionID)
			throws Exception {
		return DocUtils.getFileComment(docPath, fileID, docVersionID);
	}
	
	public static void deleteVersion(String sDocPath, String sFileID,
			String sLogID, String docVersion, Boolean isHttps) throws Exception {
		Docs ds = new Docs();
		ds.queryByFileID(sFileID);
		if(ds.size()>1){
			throw new DocRTException(DocMessages.FILEIDNOTSINGLE,DocRTException.toList(sFileID));
		}
		Doc doc = ds.getIterator().next();
		doc.deleteHistoryVersion(docVersion);
	}
}
