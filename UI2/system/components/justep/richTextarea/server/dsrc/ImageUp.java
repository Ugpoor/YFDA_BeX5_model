import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.MessageUtils;
import com.justep.ui.system.UISystemMessages;


public class ImageUp extends com.justep.ui.impl.JProcessorImpl  {
	private static String SAVE_PATH = "concat('justep_public/',currentPersonID(),'/image')";
	private static int MAX_SIZE = 2000;//单位KB
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		Uploader up = new Uploader(request);
		up.setSavePath(SAVE_PATH);
		String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
		up.setAllowFiles(fileType);
		up.setMaxSize(MAX_SIZE); 
		try {
			up.upload();
		} catch (Exception e) {
			throw new ServletException(MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.XBL_UEDITOR_UPLOAD_ERROR),e);
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("{'original':'"+up.getOriginalName()+"','url':'"+up.getUrl()+"','title':'"+up.getTitle()+"','state':'"+up.getState()+"'}");
	}

}
