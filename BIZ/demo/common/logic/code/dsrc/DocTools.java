import java.io.File;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.justep.doc.Doc;
import com.justep.doc.DocHelper;
import com.justep.doc.Docs;
import com.justep.doc.attachment.Attachment;
import com.justep.doc.attachment.Attachments;
import com.justep.system.context.ContextHelper;
import com.justep.system.util.CommonUtils;


public class DocTools {

	// 按ID查找文档（或文件夹）
	public static Doc findDocByID(String id) {
		Docs docs = new Docs();
		docs.queryByDocID(id);
		if (docs.getIterator().hasNext()) {
			return docs.getIterator().next();
		} 
		return null;
	}
	
	// 按ID获取文档（或文件夹）
	public static Doc getDocByID(String id) {
		Doc doc = findDocByID(id);
		if (doc == null) {
			throw new RuntimeException("获取文档失败，文档ID：" + id);
		}
		return doc;
	}
	
	// 获取Path目录下的文档和文件夹
	public static Iterator<Doc> getDocsByPath(String path) {
		Docs docs = new Docs();
		docs.queryByDocPath(path);
		return docs.getIterator();
	}
	
	// 获取根目录
	public static Doc getRootDir() {
		Iterator<Doc> docs = getDocsByPath("/");
		if (docs.hasNext()) {
			return docs.next();
		}
		throw new RuntimeException("获取文档根目录失败");
	}
	
	// 按显示路径获取对应目录，如果目录不存在则自动创建
	public static Doc getDirByDisplayPath(String displayPath) throws Exception {
		Docs docs = new Docs();
		docs.addDirs(getRootDir().getsID(), displayPath);
		String dirID = (String) docs.getTable().getProperties().get("sys.selectedID");
		docs.save();
		return getDocByID(dirID);
	}
	
	// 获取指定目录下的指定文件，可能找到多个
	public static Iterator<Doc> findDocsByName(Doc dir, String name) {
		Docs docs = new Docs();
		return docs.query(null, dir.getDocFullPath(), null, null, "sDocName = '" + name + "'").getIterator();
	}

	// 按ID删除文件或目录
	public static void deleteDoc(String id, Boolean isLogicDelete) throws Exception {
		DocHelper.deleteDoc(id, null, isLogicDelete);
	}
	
	// 删除指定目录下的指定文件，可能删除多个
	public static void deleteDocs(Doc dir, String name, Boolean isLogicDelete) {
		Iterator<Doc> docs = findDocsByName(dir, name);
		while (docs.hasNext()) {
			Doc doc = docs.next();
			try {
				DocHelper.deleteDoc(doc.getsID(), null, isLogicDelete);
			} catch (Exception E) {
				
			}
		}
	}
	
	// 上传文档
	public static Doc uploadDoc(String displayPath, File file) throws Exception {
		Doc dir = getDirByDisplayPath(displayPath);
		return uploadDoc(dir, file);
	}
	
	public static Doc uploadDoc(Doc dir, File file) throws Exception {
		return uploadDocs(dir, Arrays.asList(file)).getIterator().next();
	}
	
	// 上传多个文档
	public static Docs uploadDocs(String displayPath, List<File> files) throws Exception {
		Doc dir = getDirByDisplayPath(displayPath);
		return uploadDocs(dir, files);
	}
	
	public static Docs uploadDocs(Doc dir, List<File> files) throws Exception {
		Docs docs = new Docs();
		for (File file : files) {
			Doc doc = docs.addDoc(CommonUtils.createGUID(), file.getName(), null, dir);
			doc.upload(file);
		}
		docs.save();
		return docs;
	}
	
	// 上传附件
	public static Attachments uploadAttachments(String displayPath, List<File> files, String billID) throws Exception {
		Doc dir = getDirByDisplayPath(displayPath);
		return uploadAttachments(dir, files, billID);
	}
	
	public static Attachments uploadAttachments(Doc dir, List<File> files, String billID) throws Exception {
		Attachments atts = new Attachments(
				ContextHelper.getActionContext().getProcess().getFullName(),
				ContextHelper.getActionContext().getActivity().getName(),
				"", false, null, false);
		for (File file : files) {
			Attachment att = atts.addDoc(CommonUtils.createGUID(), file.getName(), null, dir, billID);
			att.upload(file);
		}
		atts.save();
		return atts;
	}
	
}
