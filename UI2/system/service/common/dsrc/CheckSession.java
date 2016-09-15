import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.StreamCallback;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;

public class CheckSession extends com.justep.ui.impl.JProcessorImpl {
	private static void checkSession(HttpServletRequest request, HttpServletResponse response) {
		String businessServerURL = JustepConfig.getBusinessServer();
		String bsessionID = NetUtils.getBSessionID(request);
		String accept = NetUtils.getAccept(request);
		ActionEngine.invokeActions(businessServerURL + "/check-session", null, null, null, accept, null, bsessionID, null, "get", new StreamCallback(response));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkSession(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		checkSession(request, response);
	}
}
