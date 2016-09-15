import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;

import com.justep.biz.client.ActionUtils;
import com.justep.ui.util.NetUtils;
import com.justep.ui.util.UIUtils;


public class Context implements com.justep.ui.JProcessor{
	
	private String getWindowURL(HttpServletRequest request, String path){
		String contextPath = request.getContextPath();
		String result = path;
		if (path.contains(contextPath)){
			result = path.substring(path.indexOf(contextPath) + contextPath.length());
		}
		result = NetUtils.removeVersion(result);
		return result;
	}
	
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String windowURL = getWindowURL(request, request.getParameter("$pURL"));
		Object result = UIUtils.getWindowContext(request, windowURL);
		String responseType = null;
		String output = null;
		if (result instanceof Document){
			responseType = ActionUtils.XML_CONTENT_TYPE;
			output = ((Document)result).asXML();
		}else{
			responseType = ActionUtils.JSON_CONTENT_TYPE;
			output = result.toString();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType(responseType);
		PrintWriter out = response.getWriter();
		out.write(output);
		out.flush();
	}
	

}