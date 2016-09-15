import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionUtils;
import com.justep.biz.client.StreamCallback;
import com.justep.ui.util.NetUtils;


public class DownloadFile extends com.justep.ui.impl.JProcessorImpl  {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
	
		// 构造动作对象
		Action action = new Action();
		action.setProcess(request.getParameter("process"));
		action.setActivity(request.getParameter("activity"));
		action.setName(request.getParameter("action"));
		action.setExecutor(request.getParameter("executor"));
		action.setParameter("fileName", request.getParameter("fileName"));
		
		String bSessionID = NetUtils.getBSessionID(request);
		String language = NetUtils.getLanguage(request);
		
		// 在返回的头部信息中，指定以附件方式下载，并指定文件名
		response.addHeader("Content-disposition", "attachment;filename=\"" + java.net.URLEncoder.encode(fileName, "UTF8") + "\";");

		// 调用动作
		ActionEngine.invokeAction(action, 
			ActionUtils.BINARY_CONTENT_TYPE, 	// 返回数据格式
			bSessionID, 						// bsessionid是必须的
			language, 							// 语言
			new StreamCallback(response)		// 以流的方式返回
		);
		
		/* .J中调用Action，并获取返回值的示例，只能用于动作的同步调用方式
		Action actionReturnMap = new Action();
		actionReturnMap.setProcess(request.getParameter("process"));
		actionReturnMap.setActivity(request.getParameter("activity"));
		actionReturnMap.setName("demoReturnMap");
		actionReturnMap.setExecutor(request.getParameter("executor"));
		ActionResult result = ActionEngine.invokeAction(actionReturnMap, ActionUtils.XML_CONTENT_TYPE, bSessionID, language, null);
		if (result.isSuccess()) {
			// 这里result.getContent()的值与invokeAction第二个参数指定的类型有关
			System.out.println(((Document)result.getContent()).asXML());
		}
		*/

		/* .J中调用Action，使用回调的方式处理返回值的示例
		Action actionReturnMap = new Action();
		actionReturnMap.setProcess(request.getParameter("process"));
		actionReturnMap.setActivity(request.getParameter("activity"));
		actionReturnMap.setName("demoReturnMap");
		actionReturnMap.setExecutor(request.getParameter("executor"));
		ActionEngine.invokeAction(actionReturnMap, ActionUtils.JSON_CONTENT_TYPE, bSessionID, language, new testCallback());
		*/
	}
	
	/* .J中调用Action，使用回调的方式处理返回值的示例
	class testCallback implements Callback {
		public Object execute(InputStream in, String contentType, String bsessionID) {
			if (contentType.toLowerCase().indexOf(ActionUtils.XML_CONTENT_TYPE.toLowerCase()) != -1) {
				Document dom = ActionResult.toXML(in);
				System.out.println(dom.asXML());
			} else if (contentType.toLowerCase().indexOf(ActionUtils.JSON_CONTENT_TYPE.toLowerCase()) != -1) {
				JSONObject json = ActionResult.toJSON(in);
				System.out.println(json.toString());
			} else {
				throw new RuntimeException("无效的contentType: " + contentType);
			}
			return null;
		}
		
	}
	*/
}
