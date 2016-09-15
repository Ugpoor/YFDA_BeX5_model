import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.util.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.dom4j.Element;

import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.common.MessageUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.util.InputStreamPartSource;
import com.justep.ui.util.NetUtils;

import sun.misc.BASE64Decoder;
import javax.servlet.http.HttpServletRequest;

/**
 * UEditor文件上传辅助类
 *
 */
public class Uploader {
	// 输出文件地址
	private String url = "";
	// 上传文件名
	private String fileName = "";
	// 状态
	private String state = "";
	// 文件类型
	private String type = "";
	// 原始文件名
	private String originalName = "";
	// 文件大小
	private String size = "";

	private HttpServletRequest request = null;
	private String title = "";

	private boolean useFileSystem = false;

	// 保存路径
	private String savePath = "";
	// 文件允许格式
	private String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg", ".bmp" };
	// 文件大小限制，单位KB
	private int maxSize = 2000;

	private HashMap<String, String> errorInfo = new HashMap<String, String>();

	public Uploader(HttpServletRequest request) {
		this.request = request;
		HashMap<String, String> tmp = this.errorInfo;
		tmp.put("SUCCESS", "SUCCESS"); //默认成功
		tmp.put("NOFILE", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_NOFILE_ERROR));
		tmp.put("TYPE", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_TYPE_ERROR));
		tmp.put("SIZE", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_SIZE_ERROR));
		tmp.put("ENTYPE", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_ENTYPE_ERROR));
		tmp.put("REQUEST", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_REQUEST_ERROR));
		tmp.put("IO", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_IO_ERROR));
		tmp.put("DIR", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_DIR_ERROR));
		tmp.put("UNKNOWN", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_UNKNOWN_ERROR));
		tmp.put("SESSION_TIMEOUT", MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_BIZ_ACTION_TIMEOUT));
	}

	private void uploadToDocServer() throws Exception {
		if (NetUtils.isRequestMultipart(request)) {
			Part[] parts = generateParts(request);
			String contentType = NetUtils.getContentType(request);
			String bsessionID = NetUtils.getBSessionID(request);
			String language = NetUtils.getLanguage(request);
			ActionResult ar = ActionEngine.invokeActions(parts, ActionUtils.XML_CONTENT_TYPE, contentType, bsessionID, language, null);
			if(ar.isSuccess()){
				java.util.List<Object> datas = ar.getDatas();
				if(datas.size()==1){
					Element data = (Element)datas.get(0);
					
					this.url = String.format("?fileid=%s", data.selectSingleNode("./item[@key='fileID']/xbiz:simple").getText());
					String state = data.selectSingleNode("./item[@key='state']/xbiz:simple").getText();
					if(this.errorInfo.containsKey(state)) this.state = this.errorInfo.get(state);
					else this.state = this.errorInfo.get("UNKNOWN");
				}else this.state = this.errorInfo.get("UNKNOWN");
			}
			else if(ar.isSessionTimeOut()) this.state = this.errorInfo.get("SESSION_TIMEOUT");
			else this.state = this.errorInfo.get("UNKNOWN");
		}
	}

	private Part[] generateParts(HttpServletRequest request) throws FileUploadException, IOException {
		// 临时文件目录
		File tempPathFile = new File(System.getProperty("java.io.tmpdir"));
		if (!tempPathFile.exists()) {
			tempPathFile.mkdirs();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(10 * 1024 * 1024);
		factory.setRepository(tempPathFile);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(this.maxSize * 1024); 
		upload.setHeaderEncoding("UTF-8");
		
		@SuppressWarnings("unchecked")
		java.util.List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iterator = items.iterator();
		java.util.List<Part> partList = new ArrayList<Part>();
		while (iterator.hasNext()) {
			FileItem fi = iterator.next();
			String fieldName = fi.getFieldName();
			if (!fi.isFormField()) {
				String fullFileName = fi.getName();
				if (fullFileName != null) {
					this.originalName = fullFileName.substring(fullFileName.lastIndexOf(System.getProperty("file.separator")) + 1);
					if (!this.checkFileType(this.originalName)) {
						this.state = this.errorInfo.get("TYPE");
						continue;
					}
					this.fileName = this.getName(this.originalName);
					this.type = this.getFileExt(this.fileName);
					InputStreamPartSource bps = new InputStreamPartSource(fi.getInputStream(), fullFileName);
					partList.add(new FilePart("file", bps));
					partList.add(new StringPart("filename", this.fileName));
				}
			} else {
				if(fieldName.equals("pictitle")){
					this.title = fi.getString("UTF-8");
					
					partList.add(new StringPart("title", this.title, "UTF-8"));
				}
			}
		}
		partList.add(new StringPart("action", "uploadFile"));
		partList.add(new StringPart("process", "/SA/doc/system/systemProcess"));
		partList.add(new StringPart("activity", "mainActivity"));
		//partList.add(new StringPart("rootPath", this.savePath));//使用默认文档服务器
		partList.add(new StringPart("subPath", this.savePath));//支持表达式
		Part[] parts = new Part[partList.size()];
		int i = 0;
		for (Part part : partList) {
			parts[i] = part;
			i++;
		}
		return parts;
	}

	private void uploadToFile() throws Exception {
		DiskFileItemFactory dff = new DiskFileItemFactory();
		String savePath = this.getFolder(this.savePath);
		dff.setRepository(new File(savePath));
		try {
			ServletFileUpload sfu = new ServletFileUpload(dff);
			sfu.setSizeMax(this.maxSize * 1024);
			sfu.setHeaderEncoding("utf-8");
			FileItemIterator fii = sfu.getItemIterator(this.request);
			while (fii.hasNext()) {
				FileItemStream fis = fii.next();
				if (!fis.isFormField()) {
					this.originalName = fis.getName().substring(fis.getName().lastIndexOf(System.getProperty("file.separator")) + 1);
					if (!this.checkFileType(this.originalName)) {
						this.state = this.errorInfo.get("TYPE");
						continue;
					}
					this.fileName = this.getName(this.originalName);
					this.type = this.getFileExt(this.fileName);
					String filePath = savePath+"/"+this.fileName;
					this.url = String.format("?file=%s", filePath);
					BufferedInputStream in = new BufferedInputStream(fis.openStream());
					FileOutputStream out = new FileOutputStream(new File(this.getPhysicalPath(filePath)));
					BufferedOutputStream output = new BufferedOutputStream(out);
					Streams.copy(in, output, true);
					this.state = this.errorInfo.get("SUCCESS");
					//UE中只会处理单张上传，完成后即退出
					break;
				} else {
					String fname = fis.getFieldName();
					//只处理title，其余表单请自行处理
					if (!fname.equals("pictitle")) {
						continue;
					}
					BufferedInputStream in = new BufferedInputStream(fis.openStream());
					BufferedReader reader = new BufferedReader(new InputStreamReader(in));
					StringBuffer result = new StringBuffer();
					while (reader.ready()) {
						result.append((char) reader.read());
					}
					this.title = new String(result.toString().getBytes(), "utf-8");
					reader.close();
				}
			}
		} catch (SizeLimitExceededException e) {
			this.state = this.errorInfo.get("SIZE");
		} catch (InvalidContentTypeException e) {
			this.state = this.errorInfo.get("ENTYPE");
		} catch (FileUploadException e) {
			this.state = this.errorInfo.get("REQUEST");
		} catch (Exception e) {
			this.state = this.errorInfo.get("UNKNOWN");
		}
	}

	public void upload() throws Exception {
		boolean isMultipart = ServletFileUpload.isMultipartContent(this.request);
		if (!isMultipart) {
			this.state = this.errorInfo.get("NOFILE");
			return;
		}

		if (useFileSystem)
			uploadToFile();
		else
			uploadToDocServer();
	}

	/**
	 * 接受并保存以base64格式上传的文件
	 * @param fieldName
	 */
	public void uploadBase64(String fieldName) {
		String savePath = this.getFolder(this.savePath);
		String base64Data = this.request.getParameter(fieldName);
		this.fileName = this.getName("test.png");
		this.url = savePath + "/" + this.fileName;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			File outFile = new File(this.getPhysicalPath(this.url));
			OutputStream ro = new FileOutputStream(outFile);
			byte[] b = decoder.decodeBuffer(base64Data);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					b[i] += 256;
				}
			}
			ro.write(b);
			ro.flush();
			ro.close();
			this.state = this.errorInfo.get("SUCCESS");
		} catch (Exception e) {
			this.state = this.errorInfo.get("IO");
		}
	}

	/**
	 * 文件类型判断
	 * 
	 * @param fileName
	 * @return
	 */
	private boolean checkFileType(String fileName) {
		Iterator<String> type = Arrays.asList(this.allowFiles).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取文件扩展名
	 * 
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 依据原始文件名生成新文件名
	 * @return
	 */
	private String getName(String fileName) {
		Random random = new Random();
		return this.fileName = "" + random.nextInt(10000) + System.currentTimeMillis() + this.getFileExt(fileName);
	}

	/**
	 * 根据字符串创建本地目录 并按照日期建立子目录返回
	 * @param path 
	 * @return 
	 */
	private String getFolder(String path) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
		path += "/" + formater.format(new Date());
		File dir = new File(this.getPhysicalPath(path));
		if (!dir.exists()) {
			try {
				dir.mkdirs();
			} catch (Exception e) {
				this.state = this.errorInfo.get("DIR");
				return "";
			}
		}
		return path;
	}

	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 * @return
	 */
	private String getPhysicalPath(String path) {
		return JustepConfig.getUeditorDataDir() + path;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setAllowFiles(String[] allowFiles) {
		this.allowFiles = allowFiles;
	}

	public void setMaxSize(int size) {
		this.maxSize = size;
	}

	public String getSize() {
		return this.size;
	}

	public String getUrl() {
		return this.url;
	}

	public String getFileName() {
		return this.fileName;
	}

	public String getState() {
		return this.state;
	}

	public String getTitle() {
		return this.title;
	}

	public String getType() {
		return this.type;
	}

	public String getOriginalName() {
		return this.originalName;
	}

	public boolean useFileSystem() {
		return useFileSystem;
	}

	public void setUseFileSystem(boolean b) {
		this.useFileSystem = b;
	}
}
