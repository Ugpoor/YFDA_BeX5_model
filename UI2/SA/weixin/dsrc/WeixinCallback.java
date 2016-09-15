import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.Action;
import com.justep.biz.client.ActionResult;
import com.justep.weixin.cp.WxHelper;


public class WeixinCallback extends com.justep.ui.impl.JProcessorImpl  {
	Logger logger = Logger.getLogger(WeixinCallback.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doExecute(request, response);
	}
	
	private void doExecute(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Action action = new Action();
		action.setName("doWeixinRequest");
		
		String inputStr = IOUtils.toString(request.getInputStream(), "UTF-8");
		
		String msgSignature = request.getParameter("msg_signature");
        String nonce = request.getParameter("nonce");
        String timestamp = request.getParameter("timestamp");
        String echostr = request.getParameter("echostr");
        
		action.setParameter("msgSignature", msgSignature);
		action.setParameter("inputStr", inputStr);
		action.setParameter("nonce", nonce);
		action.setParameter("timestamp", timestamp);
		action.setParameter("echostr", echostr);
		
		ActionResult result = WxHelper.invokeAction(action,request);
		if (result.isSuccess()){
			JSONObject json = (JSONObject)result.getDatas().get(0);
			String resultValue = json.getString("value");
			logger.info(resultValue);
			Writer writer = response.getWriter();
			writer.write(resultValue);
		}else{
			throw new RuntimeException(result.getMessage());
		}
	}	
}
