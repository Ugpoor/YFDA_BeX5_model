import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;

import com.justep.biz.client.ActionUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.system.service.permission.FunctionTree;
import com.justep.ui.util.NetUtils;

public class GetFunctionTree extends com.justep.ui.impl.JProcessorImpl  {
	
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Object functionTree = FunctionTree.execute(request, "/" + JustepConfig.getUIValue(NetUtils.getRequestPath(request)));
		String responseType = null;
		String output = null;
		if (functionTree instanceof Document){
			responseType = ActionUtils.XML_CONTENT_TYPE;
			output = ((Document)functionTree).asXML();
		}else{
			responseType = ActionUtils.JSON_CONTENT_TYPE;
			output = functionTree.toString();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType(responseType);
		PrintWriter out = response.getWriter();
		out.write(output);
		out.flush();
	}	
}
