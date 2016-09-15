import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.StreamCallback;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;


public class QueryOnlineUsers implements com.justep.ui.JProcessor  {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StreamCallback callback = new StreamCallback(response);
		String accept = NetUtils.getAccept(request);
		String contentType = NetUtils.getContentType(request);
		ActionEngine.invokeActions(JustepConfig.getBusinessServer() + "/onlineUsers", null, null, null, accept, contentType, null, null, "get", callback);
	}
}
