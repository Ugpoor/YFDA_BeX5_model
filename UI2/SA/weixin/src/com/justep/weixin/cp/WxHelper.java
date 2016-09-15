package com.justep.weixin.cp;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.common.ServerConfig;
import com.justep.common.SystemUtils;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;

public class WxHelper {
	static Logger logger = Logger.getLogger(WxHelper.class);
	
	public static final String INTERGRATORNAME = "system";
	public static final String WEIXINLOGINBIDKEY = "weixin_pre_login_bsessionid";
	public static final String WEIXINPROCESS = "/SA/weixin/process/weixin/weixinProcess";
	public static final String WEIXINACTIVITY = "mainActivity";
	
	
	public static void checkLogin(ServletContext cacheManager,String language) {
		String bsessionid = (String)cacheManager.getAttribute(WEIXINLOGINBIDKEY);
		logger.info("bsessionid:" + bsessionid);
		if(!StringUtils.isEmpty(bsessionid)){
			logger.info("已经登录过:" + bsessionid);
			ActionResult result = ActionEngine.checkSession(bsessionid,"");
			if(result.isSuccess()){
				logger.info("session 没有超时");
				return;
			}else{
				logger.info("session超时");
			}
		}
		logger.info("sso login");
		String weixinBsessionid = login(language);
		logger.info("sso login bsessionid:" + weixinBsessionid);
		
		//hcr 注销旧的bsessionid, 可能会引起旧bsessionid正在使用的错误
		String oldBID = (String)cacheManager.getAttribute(WxHelper.WEIXINLOGINBIDKEY);
		if (SystemUtils.isNotEmptyString(oldBID)){
			try{
				ActionEngine.logout(oldBID);
			}catch(java.lang.Exception e){}
		}
		cacheManager.setAttribute(WEIXINLOGINBIDKEY,weixinBsessionid);
	}
	
	public static String login(String language){
		try {
			ActionResult ar = ActionEngine.login2(ServerConfig.getUsername(), ActionUtils.md5(ServerConfig.getPassword()), "127.0.0.1", null, new java.sql.Date(System.currentTimeMillis()), new HashMap<String, Object>(), ActionUtils.JSON_CONTENT_TYPE, null);
			if (ar.isSuccess()){
				return ar.getBSessionID();
			}else{
				throw new RuntimeException(ar.getMessage());
			}
		} catch (Exception e) {
			logger.error(e.getMessage()+"", e);
			throw new RuntimeException(e.getMessage()+"", e);
		}
	}
	
	
	public static String ssoLogin(String username,String language){
		Action action = new Action();
		action.setProcess("/SA/OPM/system/systemProcess");
		action.setActivity("mainActivity");
		action.setName("ntLoginAction");
		action.setParameter("name", username);
		action.setParameter("loginDate", new java.sql.Date(System.currentTimeMillis()));
		action.setParameter("ip", "127.0.0.1");
		action.setParameter("options", new HashMap<String, Object>());
		action.setParameter("lang", language);
		try {
			ActionResult ar = ActionEngine.invokeActions(JustepConfig.getBusinessServer() + "/login2", null, action.asXML().getBytes("UTF-8"), 
					null, ActionUtils.XML_CONTENT_TYPE, ActionUtils.XML_CONTENT_TYPE, 
					null, language, "post", null);
			if (ar.isSuccess()){
				return ar.getBSessionID();
			}else{
				throw new RuntimeException(ar.getMessage());
			}
		} catch (Exception e) {
			logger.error(e.getMessage()+"", e);
			throw new RuntimeException(e.getMessage()+"", e);
		}
	}
	
	public static String getWeixinBSessionID(HttpServletRequest request){
		logger.info("getWeixinBSessionID");
		String language = NetUtils.getLanguage(request);
		ServletContext cacheManager = request.getSession().getServletContext();
		checkLogin(cacheManager, language);
		logger.info("check login end getWeixinBSessionID");
		String bsessionid = (String)request.getSession().getServletContext().getAttribute(WxHelper.WEIXINLOGINBIDKEY);
		return bsessionid;
	}
	
	public static ActionResult invokeAction(Action action,HttpServletRequest request) {
		action.setProcess(WxHelper.WEIXINPROCESS);
		action.setActivity(WxHelper.WEIXINACTIVITY);
		String configKey = request.getParameter("configKey");
		action.addExecuteContextItem("configKey", configKey);
		return ActionEngine.invokeAction(action,ActionUtils.JSON_CONTENT_TYPE,WxHelper.getWeixinBSessionID(request),NetUtils.getLanguage(request),null);
	}
	
}
