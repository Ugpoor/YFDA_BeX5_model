import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.auth.client.AuthUtils;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.ui.system.service.portal.LoginAction;

public class Login extends com.justep.ui.impl.JProcessorImpl {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionResult result = LoginAction.execute(request);
		JSONObject content = (JSONObject) result.getContent();
		if(result.isSuccess()){
			content.put("bsessionid", result.getBSessionID());
			content.put("sys", result.getSysCode());
		}else{
			content = (JSONObject)result.getContent();
			response.setCharacterEncoding("UTF-8");
			response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
			OutputStream output = response.getOutputStream();
			output.write(content.toString().getBytes("UTF-8"));
			output.flush();
			output.close();
			return;
		}

		//hcr 支持oauth登录
		AuthUtils.loginAuthServer(response);
		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(content.toString().getBytes("UTF-8"));
		output.flush();
		output.close();

	}
}