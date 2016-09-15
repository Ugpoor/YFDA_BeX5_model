import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.doc.DocDBHelper;
import com.justep.doc.DocServerDefines;
import com.justep.doc.DocUtils;
import com.justep.doc.Docs;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Doc {
	public static Map<String,String> uploadFile(String title,String rootPath,String subPath,InputStream file,String filename) {
		HashMap<String, String> ret = new HashMap<String,String>();
		ret.put("state", "SUCCESS");
		ret.put("fileID", "");
		
		String docServerID = rootPath;
		if (Utils.isEmptyString(docServerID)) {
			docServerID = DocServerDefines.getInstance().getDefaultDocServer().getsID();
		}
		Docs docs = new Docs();
		subPath = DocUtils.convertExpression(subPath);
		
		if (docs.addDirs(docServerID, subPath)) {
			String dirID = (String) docs.getTable().getProperties().get("sys.selectedID");
			try {
				docs.save();
			} catch (Exception e1) {
				ret.put("state", "DIR");
				return ret;
			}
			com.justep.doc.Doc doc = docs.addDoc(dirID);
			doc.setsDocName(filename);
			doc.setRelation("sDescription",title);
			try {
				doc.upload(file);
				docs.save();
				ret.put("fileID", doc.getsFileID());
			} catch (Exception e) {
				ret.put("state", "IO");
			}
		} else ret.put("state", "DIR");
		
		return ret;
	}

	public static List<String> queryDocFileIDs(String subPath, String rootPath, Integer limit, Integer offset, String filter) {
		String docServerID = rootPath;
		if (Utils.isEmptyString(docServerID)) {
			docServerID = "/" + DocServerDefines.getInstance().getDefaultDocServer().getsDisplayName();
		}
		subPath = DocUtils.convertExpression(subPath);
		String ksql = "select d.sFileID as sFileID from SA_DocNode d where " + "d.sDocDisplayPath like '" + docServerID + "/" + subPath + "' order by d.sCreateTime desc limit " + offset + "," + limit;
		Table t = KSQL.select(ksql, null, DocDBHelper.DATA_MODEL, null);
		List<String> rets = new ArrayList<String>();
		Iterator<Row> it = t.iterator();
		while(it.hasNext()){
			Row r = it.next();
			rets.add(r.getString("sFileID"));
		}
		return rets;
	}
}