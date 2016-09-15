import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;

public class DoLogout extends com.justep.ui.impl.JProcessorImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bsessionid = request.getParameter("bsessionid");
		ActionResult result = ActionEngine.logout(bsessionid, ActionUtils.JSON_CONTENT_TYPE);

		String json = result.getContent().toString();
		if (request.getParameter("x5callback") != null) {
			json = String.format("%s(%s)", request.getParameter("x5callback"), json); 
		}

		response.setCharacterEncoding("UTF-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		response.getWriter().write(json);
		response.flushBuffer();
	}

}
