package com.justep.doc.tools;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.justep.doc.Doc;
import com.justep.doc.DocDBHelper;
import com.justep.doc.DocUtils;
import com.justep.doc.Docs;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Table;

public class DocServerTools {
	private static final String DOCSTORE = "doc";
	/**
	 * 每添加一个租户  需要初始化租户模版
	 * @throws Exception 
	 */
	public static void initDoc(String initModelPath) throws Exception{
		HashMap<String,Docs> uploadDocsMap = new HashMap<String,Docs>();
		Docs docs = new Docs();
		docs.query(null, null, null, null, "not(SA_DocNode.sKind = 'dir')");
		List<String> docIDs = new ArrayList<String>();
		Iterator<Doc> it = docs.getIterator();
		String backDatadir = FileSystemWrapper.instance().getRealPath(initModelPath) ;
		for (int i = 0;it.hasNext();i++) {
			Doc doc = it.next();
			String docDisplayPath = doc.getsDocDisplayPath();
			String docName = doc.getsDocName();
			File blobFile = new File(backDatadir + File.separator + "init"+File.separator + DOCSTORE + docDisplayPath + File.separator + docName);
			if(!blobFile.exists()){
				continue;
			}else{
				docIDs.add(doc.getsID());
				Docs parentDocs = new Docs();
				if(uploadDocsMap.containsKey(doc.getsParentID())){
					parentDocs = uploadDocsMap.get(doc.getsParentID());
				}
				Doc newDoc = parentDocs.addDoc(doc.getsID(),doc.getsParentID());
				Collection<String> cols = doc.getRow().getTable().getColumnNames();
				for (String col : cols) {
					newDoc.getRow().setValue(col, doc.getRow().getValue(col));
				}
				newDoc.upload(blobFile);
				uploadDocsMap.put(doc.getsParentID(),parentDocs);
			}
		}
		if(docIDs.size()>0){
			String docIDsStr = "'"+StringUtils.join(docIDs, "', '")+"'";
			KSQL.executeUpdate("delete from SA_DocNode SA_DocNode where not(SA_DocNode.sKind = 'dir') and SA_DocNode.sFlag = 1 and SA_DocNode in ("+ docIDsStr +")", null, DocDBHelper.DATA_MODEL, null);
			for (String key :uploadDocsMap.keySet()) {
				uploadDocsMap.get(key).save();
			}
		}
	}
	
	public static void exportDoc(String dataModelPath,Table table) throws FileNotFoundException, Exception{
		Docs docs = new Docs(table);
		for (Iterator<Doc> it = docs.getIterator();it.hasNext();) {
			Doc doc = it.next();
			if("dir".equals(doc.getsKind())){
				continue;
			}
			String docDisplayPath = doc.getsDocDisplayPath();
			String docName = doc.getsDocName();
			String backDatadir = FileSystemWrapper.instance().getRealPath(dataModelPath);
			File blobFile = new File(backDatadir + File.separator + "init"+ File.separator + DOCSTORE + docDisplayPath);
			blobFile.mkdirs();
			blobFile = new File(blobFile,docName);
			doc.download(new FileOutputStream(blobFile));
		}
	}
}
