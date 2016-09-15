import me.chanjar.weixin.cp.bean.WxCpXmlMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlOutMessage;

import com.justep.weixin.cp.JustepCpServiceInstance;

public class Weixin {
	
	public static String doWeixinRequest(String msgSignature,String inputStr,String nonce,String timestamp,String echostr){
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		try {
			Thread.currentThread().setContextClassLoader(JustepCpServiceInstance.class.getClassLoader());
			return JustepCpServiceInstance.getInstance().doRequest(msgSignature, inputStr, nonce, timestamp, echostr);
		} finally{
			Thread.currentThread().setContextClassLoader(cl);
		}
	}
	
	public static void sendLinkMessage(String msg,String url,String userid,String contextPath){
		JustepCpServiceInstance.getInstance().sendLinkMessage(msg, url, userid, contextPath);
	}

	public static String getUserId(String userCode){
		return JustepCpServiceInstance.getInstance().getWxCpService().getUserInfo(userCode).getUserId();
	}

	public static void sendTextMessage(String userId,String content){
		JustepCpServiceInstance.getInstance().sendTextMessage(userId,content);
	}

	public static WxCpXmlOutMessage handleMessage(WxCpXmlMessage inMessage){
		/*
		 * 示例代码 可以通过写这个action的listener来根据不同情况执行不同逻辑
		 * WxCpXmlOutTextMessage m = WxCpXmlOutMessage
	              .TEXT()
	              .content(inMessage.getContent())
	              .fromUser(inMessage.getToUserName())
	              .toUser(inMessage.getFromUserName())
	              .build();
	       return m;       
	              */
		return null;
	}
}