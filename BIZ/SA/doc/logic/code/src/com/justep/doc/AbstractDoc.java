package com.justep.doc;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.PartSource;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.message.SystemMessages;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.JSONSerialization;
import com.justep.system.transform.TransformConfig;
import com.justep.system.util.BizSystemException;
import com.justep.util.Utils;

public abstract class AbstractDoc implements JSONSerialization{
	private String commentFileContent = "";
	protected Row info;
	private DocServerDefine ds;
	
	
	
	public AbstractDoc(Row info) {
		this.info = info;
	}
	
	protected String getHost() {
		String docPath = getsDocPath();
		if (Utils.isEmptyString(docPath))
			throw new DocRTException(DocMessages.DOCPATHNULLPARAMS);
		if(ds == null){
			DocServerDefines dns = DocServerDefines.getInstance();
			ds = dns.getDocServerByPath(docPath);
		}
		return ds.getsUrl();
	}
	
	protected String getsAccessMode() {
		String docPath = getsDocPath();
		if (Utils.isEmptyString(docPath))
			throw new DocRTException(DocMessages.DOCPATHNULLPARAMS);
		if(ds == null){
			DocServerDefines dns = DocServerDefines.getInstance();
			ds = dns.getDocServerByPath(docPath);
		}
		return ds.getsAccessMode();
	}

	public ModifyState getState() {
		return info.getState();
	}

	public void setState(ModifyState state) {
		info.setState(state);
	}

	public String getDocFullPath() {
		return getsDocPath() + "/" + getsID();
	}
	
	public boolean isPublicDoc(){
		String docDisplayPath = this.getsDocDisplayPath();
		if(Utils.isEmptyString(docDisplayPath)){
			return false;
		}else {
			return docDisplayPath.indexOf("justep_public")!=-1?true:false;
		}
	}
	
	protected abstract void checkDownloadAccess();
	
	public void download(OutputStream outputStream) throws Exception {
		this.download(outputStream, null, null);
	}
	
	public InputStream download(String versionID, String partType) {
		checkDownloadAccess();
		InputStream inputStream = null;
		String url = getHost() + DocUrlPatternHelper.downloadPattern(getsFileID(), versionID, partType);
		HttpClient client = new HttpClient(new HttpClientParams(), new SimpleHttpConnectionManager(true));
		HttpMethod method = new GetMethod(DocUtils.addBsessionId(DocUtils.getUrlAssign(url)));
		try {
			client.executeMethod(method);
			inputStream = method.getResponseBodyAsStream();
			return new HttpInputStream(inputStream, method);
		} catch (Exception e) {
			throw new DocRTException(DocMessages.REQUESTDOCSERVERERROR,DocRTException.toList(method.getStatusLine()),e);
		}	
	}
	
	private class HttpInputStream extends InputStream{
		private InputStream input;
		private HttpMethod method;
		public HttpInputStream(InputStream input,HttpMethod method) {
			this.input = input;
			this.method = method;
		}
		@Override
		public int read() throws IOException {
			return this.input.read();
		}
		@Override
		public void close() throws IOException {
			try{
				this.input.close();
			}finally{
				if(this.method!=null){
					this.method.releaseConnection();
				}
			}
		}
		
	}
	
	
	public void download(OutputStream outputStream, String versionID, String partType) throws Exception {
		InputStream inputStream = null;
		try{
			inputStream = this.download(versionID, partType);
			int bytesRead;
			byte[] buf = new byte[4 * 1024]; //4K buffer
			while ((bytesRead = inputStream.read(buf)) != -1) {
				outputStream.write(buf, 0, bytesRead);
			}
			outputStream.flush();
		}finally{
			if(inputStream != null){
				try {
					inputStream.close();
				} catch (IOException e) {
				}
			}
		}
		
	}
	
	public String getDocUrl(String urlType,Map<String,String> params) {
		if(DocUrlPatternHelper.UrlPattern.view.name().equals(urlType) && this.getsDocPath().contains("/public")){
			urlType = DocUrlPatternHelper.UrlPattern.publicFileView.name();
		}
		String urlPattern = DocUrlPatternHelper.getUrlPattern(urlType, params);
		String docUrl = DocUtils.getUrlAssign(this.getHost() + urlPattern);
		if (DocUtils.UIPROXYMODE.equals(ds.getsAccessMode())) {
			docUrl = DocUtils.addUIProxyPart(docUrl);
		}
		return docUrl;
	}
	
	@Deprecated
	public void download(Boolean isHttps, OutputStream outputStream, String versionID, String partType) throws Exception {
		this.download(outputStream, versionID, partType);
	}

	private void upload(Part[] parts) throws Exception {
		String url = getHost() + DocUrlPatternHelper.cacheUploadPattern();
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(DocUtils.addBsessionId(DocUtils.getUrlAssign(url)));
		MultipartRequestEntity multipartRequestEntity = new MultipartRequestEntity(parts, postMethod.getParams());
		postMethod.setRequestEntity(multipartRequestEntity);
		int statusCode = httpClient.executeMethod(postMethod);
		if (statusCode != HttpStatus.SC_OK) {
			throw new DocRTException(DocMessages.REQUESTDOCSERVERERROR,DocRTException.toList(postMethod.getStatusLine()));
		} else {
			InputStream is = postMethod.getResponseBodyAsStream();
			SAXReader reader = new SAXReader();
			Document responseDoc = null;
			try {
				responseDoc = reader.read(is);
				postMethod.releaseConnection();
			} catch (DocumentException e) {
				e.printStackTrace();
			}
			org.dom4j.Element fe = (org.dom4j.Element) responseDoc.getRootElement().selectSingleNode("//file");
			setsKind(fe.attributeValue("mediatype"));
			setScacheName(fe.attributeValue("file-name"));
			setsSize(Float.valueOf(fe.attributeValue("fileSize")));
		}
	}

	public void upload(InputStream inputStream) throws Exception {
		String sDocName = getsDocName();
		InputStreamPartSource bps = new InputStreamPartSource(inputStream, sDocName);
		Part[] parts = { new FilePart(sDocName, bps) };
		upload(parts);
	}

	public void upload(File file) throws Exception {
		String sDocName = getsDocName();
		if(Utils.isEmptyString(sDocName)){
			sDocName = file.getName();
			setsDocName(sDocName);
		}
		Part[] parts = { new FilePart(sDocName, file) };
		upload(parts);
	}
	
	private class InputStreamPartSource implements PartSource {
		private InputStream in = null;
		private String fileName = null;

		public InputStreamPartSource(InputStream in, String fileName) {
			this.in = in;
			this.fileName = fileName;
		}

		public InputStream createInputStream() throws IOException {
			return in;
		}

		public String getFileName() {
			return fileName;
		}

		public long getLength() {
			try {
				return this.in.available();
			} catch (IOException e) {
				e.printStackTrace();
				return -1;
			}
		}
	}
	
	
	public Table getHistorysTable() {
		DocLogs dl = new DocLogs(getsID());
		return dl.getHistorysTable();
	}
	
	public void deleteHistoryVersion(String docVersionID)
				throws UnsupportedEncodingException, Exception {
		Utils.check(Utils.isNotEmptyString(docVersionID), "非法的docVersion");
		String url = this.getHost() + DocUrlPatternHelper.deletePattern();
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		sb.append("<file-id>");
		sb.append(this.getsFileID());
		sb.append("</file-id>");
		sb.append("<doc-version>");
		sb.append(docVersionID);
		sb.append("</doc-version>");
		sb.append("</data>");
		Document result = DocUtils.excutePostAction(url, new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
		DocLogs dls = new DocLogs(getsID());
		if (Boolean.parseBoolean(result.selectSingleNode("//flag").getText())) {
			String lastVersionID = result.selectSingleNode("//doc-version-id").getText();
			String liveVersionID = result.selectSingleNode("//doc-live-version-id").getText();
			if ("-1".equals(docVersionID)) {
				for (Entry<String, DocLog> entry : dls.getLogs().entrySet()) {
					String docVersion = entry.getValue().getsDocVersionID().toString();
					if (!(docVersion.equals(lastVersionID) || docVersion.equals(liveVersionID))){
						entry.getValue().getRow().setState(ModifyState.DELETE);
					}
				}
				dls.save();
			} else if (!(docVersionID.equals(lastVersionID) || docVersionID.equals(liveVersionID))) {
				List<DocLog> dlMap = dls.getLogs("sDocVersionID",docVersionID);
				for (DocLog dl : dlMap) {
					dl.getRow().setState(ModifyState.DELETE);
				}
				dls.save();
			} else if (docVersionID.equals(lastVersionID) || docVersionID.equals(liveVersionID)) {
				throw new DocRTException(DocMessages.CANNOTDELETELASTVERSION);
			}
		} else {
			throw new DocRTException(result.asXML());
		}
	}

	
	/**
	 * `sID`,  `sParentID`,  `sDocName`,  `sSequence`,  `sSize`,  `sKind`,  LEFT(`sDocPath`, 256),  LEFT(`sDocDisplayPath`, 256),  LEFT(`sCreatorFID`, 256),  
	 * `sCreatorName`,  `sCreatorDeptName`,  `sCreateTime`,  LEFT(`sEditorFID`, 256),  `sEditorName`,  `sEditorDeptName`,  LEFT(`sLastWriterFID`, 256),  
	 * `sLastWriterName`,  `sLastWriterDeptName`,  `sLastWriteTime`,  `sFileID`,  LEFT(`sDescription`, 256),  `sDocLiveVersionID`,  `version`,  `sClassification`,  
	 * `sKeywords`,  `sDocSerialNumber`,  `sFinishTime`,  `sNameSpace`,  `sCacheName`,  `sRevisionCacheName`,  `sFlag`
	 * getter setter 方法
	 */
	
	public String getsID() {
		return info.getString("SA_DocNode");
	}

	public void setsID(String sID) {
		info.setString("SA_DocNode", sID);
	}

	public String getBillID() {
		return info.getString("bill_id");
	}

	public void setBillID(String billID) {
		info.setString("bill_id", billID);
	}

	public String getsParentID() {
		return info.getString("sParentID");
	}

	public void setsParentID(String sParentID) {
		info.setString("sParentID", sParentID);
	}

	public String getsDocName() {
		return info.getString("sDocName");
	}

	public void setsDocName(String sDocName) {
		info.setString("sDocName", sDocName);
	}

	protected String getsSequence() {
		return info.getString("sSequence");
	}

	protected void setsSequence(String sSequence) {
		info.setString("sSequence", sSequence);
	}

	public Float getsSize() {
		return Utils.isNull(info.getFloatObject("sSize")) ? 0 : info.getFloat("sSize");
	}

	public void setsSize(Float sSize) {
		info.setFloatObject("sSize", sSize);
	}

	public String getsKind() {
		return info.getString("sKind");
	}

	public void setsKind(String sKind) {
		info.setString("sKind", sKind);
	}
	
	
	
	public String getsDocPath() {
		return info.getString("sDocPath");
	}

	public void setsDocPath(String sDocPath) {
		info.setString("sDocPath", sDocPath);
	}

	public String getsDocDisplayPath() {
		return info.getString("sDocDisplayPath");
	}

	public void setsDocDisplayPath(String sDocDisplayPath) {
		info.setString("sDocDisplayPath", sDocDisplayPath);
	}
	
	public String getsFileID() {
		return info.getString("sFileID");
	}

	public void setsFileID(String sFileID) {
		info.setString("sFileID", sFileID);
	}

	public Integer getsDocLiveVersionID() {
		return info.getInteger("sDocLiveVersionID");
	}

	public void setsDocLiveVersionID(int sDocLiveVersionID) {
		info.setInteger("sDocLiveVersionID", sDocLiveVersionID);
	}

	protected String getsNameSpace() {
		return info.getString("sNameSpace");
	}

	protected void setsNameSpace(String sNameSpace) {
		info.setString("sNameSpace", sNameSpace);
	}

	public int getVersion() {
		return info.getInt("version");
	}

	protected void setVersion(int version) {
		info.setInt("version", version);
	}

	protected int getsFlag() {
		return info.getInt("sFlag");
	}

	protected void setsFlag(int sFlag) {
		info.setInt("sFlag", sFlag);
	}

	public String getCacheName() {

		return info.getString("sCacheName");
	}

	public void setScacheName(String cacheName) {
		info.setString("sCacheName", cacheName);
	}

	public String getRevisionCacheName() {
		return info.getString("sRevisionCacheName");

	}

	public void setSrevisionCacheName(String revisionCacheName) {
		info.setString("sRevisionCacheName", revisionCacheName);
	}

	public String getCommentFileContent() {
		return commentFileContent;
	}

	public void setCommentFileContent(String commentFileContent) {
		this.commentFileContent = commentFileContent;
	}

	public void setSeditorFID(String value) {
		info.setString("sEditorFID", value);
	}

	public void setSeditorName(String value) {
		info.setString("sEditorName", value);
	}

	public void setSeditorDeptName(String value) {
		info.setString("sEditorDeptName", value);
	}

	public String getRelation(String relation) {
		return info.getString(relation);

	}

	public void setRelation(String relation, String value) {
		info.setString(relation, value);
	}

	public Row getRow() {
		return info;
	}
	
	public void readerFromJson(Object content, TransformConfig config) {
	}
	
	public Object writerToJson(TransformConfig config) {
		try {
			JSONObject result = new JSONObject();
			for (String colName : info.getTable().getColumnNames()) {
				result.put(colName, info.getValue(colName));
			}
			return result;
		} catch (JSONException e) {
			throw BizSystemException.create(e, SystemMessages.PARAM_VALUE_IN_LOG);
		}
	}
	
}
