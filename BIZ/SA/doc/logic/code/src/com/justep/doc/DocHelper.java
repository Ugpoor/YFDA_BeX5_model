package com.justep.doc;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.dom4j.DocumentException;

import com.justep.doc.DocUrlPatternHelper.PartType;
import com.justep.message.CommonMessages;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class DocHelper {
	public static Doc queryDocInfo(String docID) {
		return Docs.queryDocByID(docID);
	}

	public static String getDocUrl(String docID, String docPath,
			String urlType, String versionID, String partType, String resultID) {
		Utils.check(Utils.isNotEmptyString(urlType), CommonMessages.class,
				CommonMessages.PARAM_NULL1, "urlType");
		Docs docs = new Docs();
		if (docID != null) {
			docs.queryByDocID(docID);
		} else if (docPath != null) {
			docs.queryByDocPath(docPath);
		}
		Doc doc = docs.getIterator().next();
		Map<String, String> params = new LinkedHashMap<String, String>();
		if (StringUtils.isEmpty(versionID)) {
			versionID = "last";
		}
		params.put("versionID", versionID);
		if (StringUtils.isEmpty(partType)) {
			partType = PartType.content.toString();
		}
		params.put("partType", partType);
		if (StringUtils.isEmpty(resultID)) {
			resultID = "";
		}
		params.put("fileID", doc.getsFileID());
		params.put("resultID", resultID);
		return doc.getDocUrl(urlType, params);
	}

	public static void saveDoc(String docID, String docName, String docPath,
			String fileID, String kind, String size)
			throws UnsupportedEncodingException, DocumentException, Exception {
		Docs docs = new Docs();
		Doc parent = new Docs().queryByDocPath(docPath).getIterator().next();
		String sParentID = parent.getsID();
		String sDocDisplayPath = (parent.getsDocDisplayPath().endsWith("/") ? parent
				.getsDocDisplayPath() : (parent.getsDocDisplayPath() + "/"))
				+ parent.getsDocName();
		Doc doc = docs.addDoc(docID, sParentID, docName, kind, Float.parseFloat(size), docPath,
				sDocDisplayPath);
		doc.setScacheName(fileID);
		int affectRows = docs.save();
		if (affectRows != 1) {
			throw new IllegalArgumentException();
		}
	}

	public static String getDocPath(String displayPath) {
		Docs docs = new Docs();
		docs.queryByDocDisplayPath(displayPath);
		if (docs.size() > 0) {
			return docs.getIterator().next().getsDocPath();
		} else {
			throw new IllegalArgumentException("displayPath:[" + displayPath
					+ "]");
		}
	}
	
	/**
	 * 
	 * 历史版本不存在逻辑删除，如果传递versionID 直接忽略isLogicDelete
	 * versionID 为 -1 代表删除所有历史版本
	 */
	public static void deleteDoc(String docID,String versionID,Boolean isLogicDelete) throws UnsupportedEncodingException, DocumentException, Exception{
		Docs docs = new Docs();
		docs.queryByDocID(docID);
		if(StringUtils.isNotEmpty(versionID)){
			docs.get(docID).deleteHistoryVersion(versionID);
		}else{
			Doc doc = docs.get(docID);
			Docs.deleteDoc(isLogicDelete, docID, doc.getsDocPath(), doc.getsFileID(), "dir".equals(doc.getsKind()));
		}
	}
	
	public static void reverseDoc(String docID) throws UnsupportedEncodingException, DocumentException, Exception{
		Table table = DocDBHelper.queryDeleteDocInfo(docID);
		Docs docs = new Docs(table);
		Doc doc = docs.get(docID);
		Docs.reverseDoc(docID, doc.getsDocPath(), doc.getsFileID(), "dir".equals(doc.getsKind()));
	}
	
	public static void changeDocName(String docID,String docName) throws UnsupportedEncodingException, DocumentException, Exception{
		Docs docs = new Docs();
		docs.queryByDocID(docID);
		docs.setIsEditInfo(true);
		docs.get(docID).setsDocName(docName);
		docs.save();
	}
	
	public static String uploadDoc(String docName,InputStream in,String docDisplayPath) throws Exception {
		Table table = DocDBHelper.queryDoc("","","","","SA_DocNode.sDocDisplayPath ='"+docDisplayPath+"' and SA_DocNode.sKind ='dir'");
		Docs docs = new Docs();
		Doc doc = docs.addDoc(table.iterator().next().getString("SA_DocNode"));
		doc.setsDocName(docName);
        doc.upload(in);
        docs.save();
        return doc.getsID();
	}
	
	public static void downloadDoc(String docID,OutputStream out) throws Exception{
		Docs.queryDocByID(docID).download(out);
	}
}
