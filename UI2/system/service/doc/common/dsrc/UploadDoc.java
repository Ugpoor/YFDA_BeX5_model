import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.ui.impl.JProcessorImpl;
import com.justep.ui.system.service.doc.DocUtils;

public class UploadDoc extends JProcessorImpl{
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException{
		DocUtils.service(request,response);
		
	}
}