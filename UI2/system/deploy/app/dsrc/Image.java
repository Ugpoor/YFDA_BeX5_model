import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;

public class Image extends com.justep.ui.impl.JProcessorImpl {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";
		String appID = request.getParameter("appID");
		String projectName = request.getParameter("projectName");
		String filename = request.getParameter("filename");
		String newImage = request.getParameter("newImage");
		String edit = request.getParameter("edit");

		String fullFilename = "";
		if ("true".equals(newImage)) {
			fullFilename = nativeDir + "/.workspace/" + appID + "/upload/" + filename;
		} else {
			if ("true".equals(edit)) {
				fullFilename = nativeDir + "/" + projectName + "/" + filename;
			}
		}

		if (!(new File(fullFilename)).exists()) {
			String UI = JustepConfig.getUIValue(NetUtils.getRequestPath(request));
			fullFilename = modelPath + UI + "/system/deploy/app/img/" + filename;
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("image/png");
		OutputStream output = response.getOutputStream();

		FileInputStream is = new FileInputStream(fullFilename);
		byte[] buffer = new byte[2048];
		int byteread = 0;
		while ((byteread = is.read(buffer)) != -1) {
			output.write(buffer, 0, byteread);
		}
		is.close();

		output.flush();
		output.close();
	}

}
