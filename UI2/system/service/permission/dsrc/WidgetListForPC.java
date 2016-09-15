import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;

import com.justep.biz.client.ActionUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;


public class WidgetListForPC implements com.justep.ui.JProcessor {
	
	public void execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		Object result = com.justep.ui.system.service.permission.WidgetList.executeForPC(request, "/" + JustepConfig.getUIValue(NetUtils.getRequestPath(request)));
		String buf = null;
		String responseContentType = ActionUtils.JSON_CONTENT_TYPE;
		if (result instanceof Document) {
			responseContentType = ActionUtils.XML_CONTENT_TYPE;
			buf = ((Document) result).asXML();
		} else {
			responseContentType = ActionUtils.JSON_CONTENT_TYPE;
			buf = result.toString();
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType(responseContentType);
			PrintWriter out = response.getWriter();
			out.write(buf.toString());
			out.flush();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
}
