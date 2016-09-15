import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionUtils;
import com.justep.biz.client.util.BizClientUtils;

public class FileExists extends com.justep.ui.impl.JProcessorImpl {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";
		String appID = request.getParameter("appID");
		String projectName = request.getParameter("projectName");
		String filename = request.getParameter("filename");
		String newFile = request.getParameter("newFile");
		String edit = request.getParameter("edit");

		String fullFilename = "";
		if ("true".equals(newFile)) {
			fullFilename = nativeDir + "/.workspace/" + appID + "/upload/" + filename;
		} else {
			if ("true".equals(edit)) {
				fullFilename = nativeDir + "/" + projectName + "/" + filename;
			}
		}

		Boolean fileExists = new File(fullFilename).exists();
		String result = BizClientUtils.generateResult(fileExists, "fileExists", "fileExists", "", "", "", "", ActionUtils.JSON_CONTENT_TYPE);

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(result.getBytes("UTF-8"));
		output.flush();
		output.close();
	}
}
