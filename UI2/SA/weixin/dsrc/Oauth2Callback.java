import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.justep.auth.client.AuthUtils;
import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.ui.util.NetUtils;
import com.justep.weixin.cp.WxHelper;



public class Oauth2Callback extends com.justep.ui.impl.JProcessorImpl  {
	Logger logger = Logger.getLogger(Oauth2Callback.class);
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doExec(req, resp);
	}
	
	public String getUserId(String userCode,HttpServletRequest req) {
        Action action = new Action();
        action.setName("getUserId");
		action.setParameter("userCode", userCode);
		
		ActionResult result = WxHelper.invokeAction(action,req);
		if (result.isSuccess()){
			JSONObject json = (JSONObject)result.getDatas().get(0);
			String userId = json.getString("value");
			logger.info(userId);
			return userId;
		}else{
			throw new RuntimeException(result.getMessage());
		}
	}

	private void doExec(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		logger.info("oauth request");
		logger.info("oauth2callback:" + req.getParameter("pageURL"));
		
		String userCode = req.getParameter("code");
		logger.info("userCode:" + userCode);
		
        //登录x5
        Cookie[] cookies = req.getCookies();
        boolean needLogin = true;
        if(cookies != null){
        	for (Cookie cookie : cookies) {
    			if("bsessionid".equals(cookie.getName())){
    				//logined sessionid 超时机制
    				logger.info("已经登录过:" + cookie.getValue());
    				ActionResult result = ActionEngine.checkSession(cookie.getValue(),"");
    				if(result.isSuccess()){
    					logger.info("session 没有超时");
    					needLogin = false;
        				break;
    				}else{
    					logger.info("session session超时");
    					needLogin = true;
        				break;
    				}
    			}
    		}
        }
        
        if(needLogin){
        	String userId = this.getUserId(userCode,req);
        	String bssessionid = WxHelper.ssoLogin(userId,NetUtils.getLanguage(req));
        	Cookie bsessionIDCookie = new Cookie("bsessionid", bssessionid);
			bsessionIDCookie.setMaxAge(Integer.MAX_VALUE);
			bsessionIDCookie.setPath("/");
			resp.addCookie(bsessionIDCookie);
			AuthUtils.loginAuthServer(resp);
        }
        
		String pageURL = req.getParameter("pageURL");
		byte[] decodedBytes = Base64.decodeBase64(pageURL.getBytes());
		logger.info(new String(decodedBytes));
		logger.info(req.getQueryString());
		resp.sendRedirect(new String(decodedBytes));
	}
		
}
