import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.MessageUtils;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.system.service.commonUtils;


public class Download extends com.justep.ui.impl.JProcessorImpl  {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			java.util.Date date = new java.util.Date();
			response.setDateHeader("Last-Modified",date.getTime());  
			response.setDateHeader("Expires",date.getTime()+((long)1000*60*60*24*365));  

			response.setHeader("Cache-Control", "public");  
			response.setHeader("Pragma", "Pragma");

			commonUtils.bizAction(request, response, "get");
		} catch (Exception e) {
			throw new ServletException(MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.SERVICE_BIZ_ACTION_ERROR), e);
		}
	}
}
