import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;


public class MakeApplicense extends com.justep.ui.impl.JProcessorImpl  {
	private static String URL = "http://reg.justep.com/x5/UI/reg/license/service/makeApplicense.j";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CerateCert.toJustepBiz(request, response, URL);
		} catch (FileUploadException e) {
			throw new ServletException("创建应用License失败", e);
		}
	}	
	
}
