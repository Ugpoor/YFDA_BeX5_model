import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.ui.util.NetUtils;

public class ToOtherURL extends com.justep.ui.impl.JProcessorImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 调用getUserNameAndPassword，获取用户名和密码
		Action action = new Action();
		action.setProcess("/demo/actions/process/integration/integrationProcess");
		action.setActivity("staticActivity2");
		action.setName("getUserNameAndPassword");

		String bSessionID = NetUtils.getBSessionID(request);
		String language = NetUtils.getLanguage(request);

		ActionResult actionResult = ActionEngine.invokeAction(action, ActionUtils.XML_CONTENT_TYPE, bSessionID, language, null);
		Document domResult = ((Document) actionResult.getContent());
		String userID = domResult.selectSingleNode("//item[@key='userID']/*").getText();
		String userName = domResult.selectSingleNode("//item[@key='userName']/*").getText();
		String password = domResult.selectSingleNode("//item[@key='password']/*").getText();
		System.out.println("当前人员 -> " + userID + ";" + userName + ";" + password);

		// 跳转到其他系统页面
		response.sendRedirect("http://www.baidu.com?user=" + userID);
	}

}
