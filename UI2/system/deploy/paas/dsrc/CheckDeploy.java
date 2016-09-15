import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionUtils;
import com.justep.biz.client.util.BizClientUtils;

public class CheckDeploy extends com.justep.ui.impl.JProcessorImpl {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = BizClientUtils.generateResult(true, com.justep.deploy.Deploy.packStatus, "部署状态检测", "", "", "", "", ActionUtils.JSON_CONTENT_TYPE);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		OutputStream output = response.getOutputStream();
		output.write(result.getBytes("UTF-8"));
		output.flush();
		output.close();
	}
}
