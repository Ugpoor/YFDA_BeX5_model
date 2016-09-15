import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;

public class DoLogin extends com.justep.ui.impl.JProcessorImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject content = null;
		String bsessionid = request.getParameter("bsessionid");
		ActionResult checkResult = ActionEngine.checkSession(bsessionid, ActionUtils.JSON_CONTENT_TYPE);
		if (checkResult.isSessionTimeOut()) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String ip = request.getRemoteAddr();
			String language = "zh_CN";
			Date loginDate = new Date(System.currentTimeMillis());
			ActionResult actionResult = ActionEngine.login2(username, password, ip, language, loginDate, null, ActionUtils.JSON_CONTENT_TYPE, null);
			content = (JSONObject) actionResult.getContent();
			bsessionid = actionResult.getBSessionID();
		} else {
			content = (JSONObject) checkResult.getContent();
		}

		content.put("bsessionid", bsessionid);

		String json = content.toString();
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
