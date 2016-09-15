import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;


public class DoAction extends com.justep.ui.impl.JProcessorImpl  {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject content = null;
		String bsessionid = request.getParameter("bsessionid");
		
		String params = "";
		for(Object k : request.getParameterMap().keySet()){
			String name = (String)k;
			if("_".equalsIgnoreCase(name) || "x5callback".equalsIgnoreCase(name) || "bsessionid".equalsIgnoreCase(name) || name.indexOf("$")==0) continue; 
			params += (!"".equals(params)?"&":"") + java.net.URLEncoder.encode(name, "utf-8") +"="+java.net.URLEncoder.encode(request.getParameter(name), "utf-8");
		}
		
		// 调用动作
		ActionResult result = ActionEngine.invokeActions(params, ActionUtils.JSON_CONTENT_TYPE, ActionUtils.JSON_CONTENT_TYPE, bsessionid, null, null);
		content = (JSONObject) result.getContent();

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
