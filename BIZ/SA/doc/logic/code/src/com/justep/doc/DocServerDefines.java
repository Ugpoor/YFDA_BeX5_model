package com.justep.doc;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;

public class DocServerDefines{

	private Table nameSpaces;
	private Map<String, DocServerDefine> docServers = new LinkedHashMap<String, DocServerDefine>();
	private final static String DOCNameSPACE_CONCEPT = "SA_DocNameSpace";
	public static Logger logger = Logger.getLogger(DocServerDefines.class);
	private Boolean isLogicDelete = true;

	private DocServerDefines() {
		loadNameSpace();
	}

	public static DocServerDefines getInstance() {
		return new DocServerDefines();
	}
	
	public DocServerDefine getDefaultDocServer() {
		DocServerDefine dsd = this.get("defaultDocNameSpace");
		if(dsd != null){
			return dsd;
		}else if(this.size() >= 1){
			return this.getIterator().next(); 
		}else{
			return null;
		}
	}

	public DocServerDefines(Table nameSpaces) {
		for (Iterator<Row> it = nameSpaces.iterator(); it.hasNext();) {
			Row r = it.next();
			DocServerDefine docServer = new DocServerDefine(r, this);
			docServers.put(r.getString("SA_DocNameSpace"), docServer);
		}
	}

	/*
	 *  获取分布式文档服务器的名空间
	 */
	private void loadNameSpace() {
		nameSpaces = DocDBHelper.queryNameSpace();
		for (Iterator<Row> it = nameSpaces.iterator(); it.hasNext();) {
			Row r = it.next();
			DocServerDefine docServer = new DocServerDefine(r, this);
			docServers.put(r.getString("SA_DocNameSpace"), docServer);
		}
	}

	public void refresh() {
		nameSpaces = null;
		docServers = null;
		loadNameSpace();
	}

	public DocServerDefine add(String sID, String sDisplayName, String sUrl, String sAccessMode) {
		if (Utils.isEmptyString(sID))
			sID = CommonUtils.createGUID();
		Row r = nameSpaces.appendRow();
		r.setString("SA_DocNameSpace", sID);
		r.setString("sDisplayName", sDisplayName);
		r.setString("sUrl", sUrl);
		r.setString("sAccessMode", sAccessMode);
		r.setInt("version", 0);
		r.setInt("sFlag", 1);
		DocServerDefine dsd = new DocServerDefine(r, this);
		docServers.put(sID, dsd);
		return dsd;
	}

	public DocServerDefine getDocServerByPath(String docPath) {
		String rootDocId = DocUtils.getRootId(docPath);
		DocServerDefine result = null;
		for (DocServerDefine docServer : docServers.values()) {
			if (rootDocId.equals(docServer.getsRootDocId())) {
				result = docServer;
				break;
			}
		}
		return result;
	}
	
	public int save() {
		Model model = ModelUtils.getModel(DocDBHelper.DATA_MODEL);
		nameSpaces.getMetaData().setStoreByConcept(DOCNameSPACE_CONCEPT, true);
		nameSpaces.getMetaData().setStoreByConcept("SA_DocNode", false);
		return nameSpaces.save(model);
	}

	public DocServerDefines remove(String sID) {
		if (isLogicDelete) {
			DocServerDefine dsd = get(sID);
			if (Utils.isNotNull(dsd))
				dsd.setsFlag(0);
		} else {
			nameSpaces.deleteRows(sID);
		}
		docServers.remove(sID);
		return this;
	}

	public DocServerDefines remove(DocServerDefine docServerDefine) {
		String id = docServerDefine.getsID();
		remove(id);
		return this;
	}

	public DocServerDefine get(String sID) {
		return docServers.get(sID);
	}

	public int size() {
		return docServers.size();
	}

	public Iterator<DocServerDefine> getIterator() {
		return docServers.values().iterator();
	}

	public Table toTable() {
		return nameSpaces;
	}
}
