import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import com.justep.doc.Doc;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.system.data.*;

public class InitAttachments {

	private static final String filePath = FileSystemWrapper.instance().getBase() + "/demo/common/data/init/attachments/";
	private static final File pdfFile = new File(filePath + "X5产品白皮书.pdf");
	private static final File jpgFile = new File(filePath + "X5界面建模.jpg");
	private static final File docFile = new File(filePath + "X5平台基本情况.doc");
	
	private static final File blackTemplate = new File(filePath + "模板（黑）.doc");
	private static final File blueTemplate = new File(filePath + "模板（蓝）.doc");
	private static final File greenTemplate = new File(filePath + "模板（绿）.doc");

	public static void initAttachmentDemo() throws Exception {
		clear();
		
		insertAttachmentData("Attachment_Editor_Single", "附件编辑器-单文档模式", "'演示案例/附件组件/附件编辑器-单文档模式'", Arrays.asList(docFile));
		insertAttachmentData("Attachment_Editor_Multi", "附件编辑器-多文档模式", "'演示案例/附件组件/附件编辑器-多文档模式'", Arrays.asList(pdfFile, jpgFile, docFile));
		insertAttachmentData("Attachment_Dialog_1", "附件对话框-示例数据-1", "'演示案例/附件组件/附件对话框'", Arrays.asList(pdfFile, jpgFile, docFile));
		insertAttachmentData("Attachment_Dialog_2", "附件对话框-示例数据-2", "'演示案例/附件组件/附件对话框'", Arrays.asList(jpgFile));
		insertAttachmentData("Attachment_Dialog_3", "附件对话框-示例数据-3", "'演示案例/附件组件/附件对话框'", Arrays.asList(docFile, pdfFile));
		insertAttachmentData("Attachment_Image", "附件图片", "'演示案例/附件组件/附件图片'", Arrays.asList(jpgFile));
		insertData("BlobImage", "二进制图片", null, null, null, null, null, new FileInputStream(jpgFile));
		

		insertAttachmentData("Attachment_Define", "文档关联", "'演示案例/附件组件/文档关联'", Arrays.asList(pdfFile, jpgFile, docFile));
		DocTools.uploadDocs("'演示案例/附件组件/附件模板'", Arrays.asList(blackTemplate, blueTemplate, greenTemplate));
		insertData("Attachment_Template", "附件模板", null, "X5附件组件演示案例", "201404100001", "起步科技", new SimpleDateFormat("yyyy-MM-dd").parse("2014-04-10"), null);

		insertAttachmentData("Attachment_Extend_Style", "扩展样式", "'演示案例/附件组件/扩展样式'", Arrays.asList(pdfFile, jpgFile, docFile));
		insertAttachmentData("Attachment_Extend_Permission", "设置权限", "'演示案例/附件组件/设置权限'", Arrays.asList(pdfFile, jpgFile, docFile));
		insertAttachmentData("Attachment_Extend_LimitUpload", "限制上传", "'演示案例/附件组件/限制上传'", Arrays.asList(pdfFile, jpgFile, docFile));
		insertAttachmentData("Attachment_Extend_SetTemplate_1", "设定模板_1", "'演示案例/附件组件/设定模板'", Arrays.asList(blackTemplate));
		insertAttachmentData("Attachment_Extend_SetTemplate_2", "设定模板_2", "'演示案例/附件组件/设定模板'", Arrays.asList(blueTemplate));
		insertAttachmentData("Attachment_Extend_SetTemplate_3", "设定模板_3", "'演示案例/附件组件/设定模板'", Arrays.asList(greenTemplate));
	}
	
	private static void clear() throws Exception {
		Doc dir = DocTools.getDirByDisplayPath("'演示案例/附件组件'");
		DocTools.deleteDoc(dir.getsID(), false);
		KSQL.executeUpdate("DELETE FROM DEMO_Attachment a", null, "/demo/common/data", null);
	}

	private static void insertAttachmentData(String id, String sampleName, String displayPath, List<File> files) throws Exception {
		String json = DocTools.uploadAttachments(displayPath, files, id).toJson();
		insertData(id, sampleName, json, null, null, null, null, null);
	}
	
	private static void insertData(String id, String sampleName, String attachment, String title, String number, 
			String author, Date createDate, InputStream image) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("sampleName", sampleName);
		params.put("attachment", attachment);
		params.put("title", title);
		params.put("number", number);
		params.put("author", author);
		params.put("createDate", createDate == null ? null : new java.sql.Date(createDate.getTime()));
		params.put("blobImage", image);
		
		KSQL.executeUpdate("INSERT INTO DEMO_Attachment a (a, a.version, a.fSampleName, a.fAttachment, a.fTitle, a.fNumber, a.fAuthor, a.fCreateDate, a.fBlobImage) "
				+ " VALUES (:id, 0, :sampleName, :attachment, :title, :number, :author, :createDate, :blobImage) ", params, "/demo/common/data", null);
	}
	
}