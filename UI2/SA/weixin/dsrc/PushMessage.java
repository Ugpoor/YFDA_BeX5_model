import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.Action;
import com.justep.biz.client.ActionResult;
import com.justep.weixin.cp.WxHelper;

public class PushMessage extends com.justep.ui.impl.JProcessorImpl {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		try {
			Thread.currentThread().setContextClassLoader(PushMessage.class.getClassLoader());
			doExec(req);
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
	}

	private void doExec(HttpServletRequest req) throws IOException {
		String inputStr = IOUtils.toString(req.getInputStream(), "UTF-8");
		
		JSONObject msg = (JSONObject) JSON.parse(inputStr);
		String userid = msg.getString("userid");
		JSONObject contentObject = msg.getJSONObject("content");
		String url = contentObject.getString("url");
		JSONObject apnsObj = contentObject.getJSONObject("aps");
		String alert = apnsObj.getString("alert");
		
		Action action = new Action();
		action.setName("sendLinkMessage");
		action.setParameter("msg", alert);
		action.setParameter("url", url);
		action.setParameter("userid", userid);
		action.setParameter("contextPath", req.getContextPath());
		
		ActionResult result = WxHelper.invokeAction(action,req);
		if (!result.isSuccess()){
			throw new RuntimeException(result.getMessage());
		}
	}
	
	
}
