import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFile implements com.justep.ui.JProcessor {

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";

		// 临时文件目录
		File tempPathFile = new File(System.getProperty("java.io.tmpdir"));
		if (!tempPathFile.exists()) {
			tempPathFile.mkdirs();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(10 * 1024 * 1024);
		factory.setRepository(tempPathFile);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(500 * 1024 * 1024); // 设置最大文件尺寸500M
		upload.setHeaderEncoding("UTF-8");
		List<FileItem> items;
		try {
			items = (List<FileItem>) upload.parseRequest(request);
			if ((items.size() != 3) || !"appID".equals(items.get(1).getFieldName()) || !"filename".equals(items.get(2).getFieldName())) {
				throw new ServletException("上传的数据不正确，应该由appID、filename和文件内容三部分构成");
			}

			String tmpFullFileName = nativeDir + "/.workspace/" + items.get(1).getString() + "/upload/" + items.get(2).getString();
			File pngFile = new File(tmpFullFileName);
			try {
				pngFile.getParentFile().mkdirs();
				items.get(0).write(pngFile);
			} catch (Exception e) {
				throw new ServletException("保存文件“" + pngFile.getAbsolutePath() + "”失败");
			}

		} catch (FileUploadException e1) {
			throw new ServletException("上传的数据不正确，解析失败");
		}
	}
}