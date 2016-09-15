package com.justep.weixin.cp;
import java.util.HashMap;
import java.util.Map;

import me.chanjar.weixin.cp.api.WxCpConfigStorage;
import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;
import me.chanjar.weixin.cp.api.WxCpMessageHandler;
import me.chanjar.weixin.cp.api.WxCpMessageRouter;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.api.WxCpServiceImpl;
import me.chanjar.weixin.cp.bean.WxCpMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlOutMessage;
import me.chanjar.weixin.cp.util.crypto.WxCpCryptUtil;

import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.net.URLCodec;
import org.apache.commons.lang.StringUtils;

import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;

/**
 * Created by 007slm on 10/23/14.
 */
public class WxCpServiceInstance {
    public WxCpService getWxCpService() {
        return wxCpService;
    }

    public void setWxCpService(WxCpService wxCpService) {
        this.wxCpService = wxCpService;
    }

    private WxCpService wxCpService;

    public WxCpConfigStorage getWxCpConfigStorage() {
        return wxCpConfigStorage;
    }

    public void setWxCpConfigStorage(WxCpConfigStorage wxCpConfigStorage) {
        this.wxCpConfigStorage = wxCpConfigStorage;
    }

    public WxCpMessageRouter getWxCpMessageRouter() {
        return wxCpMessageRouter;
    }

    public void setWxCpMessageRouter(WxCpMessageRouter wxCpMessageRouter) {
        this.wxCpMessageRouter = wxCpMessageRouter;
    }

    private WxCpConfigStorage wxCpConfigStorage;
    private WxCpMessageRouter wxCpMessageRouter;
    
    public WxCpServiceInstance(WxCpInMemoryConfigStorage corpConfig) {
    	wxCpConfigStorage = corpConfig;
        wxCpService = new WxCpServiceImpl();
        wxCpService.setWxCpConfigStorage(corpConfig);
        
        wxCpMessageRouter = new WxCpMessageRouter();
        wxCpMessageRouter.rule().async(false)
        .handler(new WxCpMessageHandler() {
			public WxCpXmlOutMessage handle(WxCpXmlMessage wxMessage,
					Map<String, Object> context) {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("inMessage", wxMessage);
				String process = ContextHelper.getActionContext().getProcess().getFullName();
				String activity = ContextHelper.getActionContext().getActivity().getName();
				String executor = ContextHelper.getActionContext().getExecutor();
				String executeContext = ContextHelper.getActionContext().getExecuteContext();
				WxCpXmlOutMessage outMessage = (WxCpXmlOutMessage)ActionUtils.invokeAction(process, activity, "handleMessage", executor,executeContext, params);
				return outMessage;
			}
		})
        .end();
    }

    public String doRequest(String msgSignature,String inputStr,String nonce,String timestamp,String echostr){
        if (StringUtils.isNotBlank(echostr)) {
            if (!this.getWxCpService().checkSignature(msgSignature, timestamp, nonce, echostr)) {
                return "非法请求";
            }
            WxCpCryptUtil cryptUtil = new WxCpCryptUtil(this.getWxCpConfigStorage());
            String plainText = cryptUtil.decrypt(echostr);
            return plainText;
        }

        WxCpXmlMessage inMessage = WxCpXmlMessage.fromEncryptedXml(inputStr, this.getWxCpConfigStorage(), timestamp, nonce, msgSignature);
        WxCpXmlOutMessage outMessage = this.getWxCpMessageRouter().route(inMessage);
        if (outMessage != null) {
            return outMessage.toEncryptedXml(this.getWxCpConfigStorage());
        }
        return "";
    }
    
    
    public void sendLinkMessage(String msg,String url,String userid,String contextPath) {
		String content = generateMsgContent(msg,url,contextPath);
		String agentID = this.getWxCpConfigStorage().getAgentId();
		WxCpMessage message = WxCpMessage
				.TEXT()
				.agentId(agentID).toUser(userid)
				.content(content).build();
		this.getWxCpService().messageSend(message);
	}
	
	private String generateMsgContent(String msg,String url,String contextPath) {
		String weixinOauth2Url = this.generateOauth2Url(url, contextPath);	
		return msg + "<a href=\"" + weixinOauth2Url +"\">详情</a>";
	}
	
	
	public String generateOauth2Url(String url ,String contextPath) {
		String corpID = this.getWxCpConfigStorage().getCorpId();
		//String corpID = "wxd869657006aa364d";
		//TODO:js中生成url没有使用safeUrl 所以base64后 最后可能会有等号
		String base64Url = Base64.encodeBase64URLSafeString(url.getBytes());
		URLCodec encoder = new URLCodec("utf-8");
		String pageUrlEncoded;
		try {
			pageUrlEncoded = "pageURL=" + base64Url;
			String domainName = this.getWxCpConfigStorage().getCallbackDomain();
			//String domainName = "http://i.justep.com";
			String contextPart = "".equals(contextPath)?"":"/"+contextPath;
			String configKey = WxCpHelper.getConfigKey();
			//String configKey = "wxd869657006aa364d1";
			//TODO:biz中获取不到$UI
			String x5Oauth2CallbackUrlPrefix = domainName + contextPart + "/UI2/SA/weixin/oauth2Callback.j?configKey=" + configKey +"&";
			String x5Oauth2CallbackUrl = x5Oauth2CallbackUrlPrefix + pageUrlEncoded;
			String weixinRedictUrl = encoder.encode(x5Oauth2CallbackUrl);
			String weixinRedictUrlPrefix = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + corpID + "&redirect_uri=";
			String weixinRedictUrlSuffix = "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
			String weixinOauth2Url = weixinRedictUrlPrefix + weixinRedictUrl + weixinRedictUrlSuffix;
			return weixinOauth2Url;
		} catch (EncoderException e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public void sendTextMessage(String userId,String content) {
		String agentID = this.getWxCpConfigStorage().getAgentId();
		WxCpMessage message = WxCpMessage
				.TEXT()
				.agentId(agentID).toUser(userId)
				.content(content).build();
		this.getWxCpService().messageSend(message);
	}
	
}

