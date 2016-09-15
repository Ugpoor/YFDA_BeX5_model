import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionResult;
import com.justep.weixin.cp.WxHelper;


public class Logout extends com.justep.ui.impl.JProcessorImpl  {
	
	Logger logger = Logger.getLogger(Logout.class);
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.execute(req, resp);
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		try {
			Thread.currentThread().setContextClassLoader(Logout.class.getClassLoader());
			doExec(req);
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
		
	}
	private void doExec(HttpServletRequest req) {
		String userID = req.getParameter("weixinUserID");
		logger.info("userID:" + userID);
		Action action = new Action();
		action.setName("sendTextMessage");
		action.setParameter("userId", userID);
		String content = "注销成功[胜利]";
		action.setParameter("content", content);
		ActionResult result = WxHelper.invokeAction(action,req);
		if (!result.isSuccess()){
			throw new RuntimeException(result.getMessage());
		}
	}
}
