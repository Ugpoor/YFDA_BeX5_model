package com.justep.cordova.plugin.security.mob;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONException;
import org.json.JSONObject;

import android.util.Log;
import cn.smssdk.EventHandler;
import cn.smssdk.SMSSDK;


public class PluginSMSSDK extends CordovaPlugin {
	boolean ready = false;

	private static String appKey = "ceaf369d130e";
	private static String appSecret = "";
	// 01 测试模式  00线上模式
	private static String mMode = "01";
	
	private CallbackContext currentCallbackContext;

	private EventHandler eventHandler = new EventHandler() {
		
        public void afterEvent(int event, int result, Object data) {
        	JSONObject object = new JSONObject();
        	try {
				object.put("event", event);
				object.put("result", result);
	        	object.put("data", data);
	        	currentCallbackContext.success(object);
			} catch (JSONException e) {
				try {
					object = new JSONObject();
					object.put("event", event);
					object.put("result", result);
		        	object.put("data", "ERROR");
		        	currentCallbackContext.success(object);
				} catch (JSONException e2) {
					e2.printStackTrace();
				}
			}
        } 

	};

	/** 
	 *  demo
	 *  #define appKey "5b2655c71290"
		#define appSecret "55988074b9a3faadffa6f74cd3ae7845"
	 */
	@Override
	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);
		mMode = webView.getPreferences().getString("mobsms_mMode", "01");
		appKey = webView.getPreferences().getString("mobsms_appKey", "5b2655c71290");
		appSecret = webView.getPreferences().getString("mobsms_appSecret", "55988074b9a3faadffa6f74cd3ae7845");
	}

	public boolean execute(String action, CordovaArgs args, CallbackContext callbackContext) throws JSONException {
		currentCallbackContext = callbackContext;
		if ("getDeviceInfo".equals(action)) {
			callbackContext.success("a:"+appKey + " m:"+mMode);
		}else if("init".equals(action)){
			if(initApp(args)){
				callbackContext.success();
			}else{
				callbackContext.error("wrong app infomation");
			}
		} else if ("send".equals(action)) {
			send(args,findOtherEventHandler());
		}else if ("verify".equals(action)) {
			verify(args,findOtherEventHandler());
		}else if("uninit".equals(action)){
			uninit();
		}
		else{
			return false;
		}
		return true;
	}

	
	
	public boolean initApp(CordovaArgs args) {
		//if(ready) return ready;
		try {
			if("00".equals(mMode)){
				initSDK(appKey,appSecret);
				ready = true;
			}else{
				if(args.isNull(0)){
					initSDK(appKey,appSecret);
					ready = true;
				}else{
					JSONObject appInfo = args.getJSONObject(0);
					appKey = (String)appInfo.get("appKey");
					appSecret = (String)appInfo.get("appSecret");
					initSDK(appKey,appSecret);
					ready = true;
				}
			}
			return ready;
		} catch (JSONException e) {
			Log.d("", e.toString(),e);
			return false;
		}
	}
	
	
	public boolean initSDK(String appkey, String appsecret) {
		SMSSDK.initSDK(cordova.getActivity(), appkey, appsecret,false);
		SMSSDK.registerEventHandler(eventHandler);
		return true;
	}
	
	protected EventHandler findOtherEventHandler(){
		return null;
	}
	


	private void send(CordovaArgs args,EventHandler eh) {
		if (!ready){
			initSDK(appKey,appSecret);
			ready = true;
		}
		if(eh!=null){
			SMSSDK.registerEventHandler(eh);
		}
		
		try {
			JSONObject phone = args.getJSONObject(0);
			String country = (String)phone.get("zone");
			String number = (String)phone.get("phoneNumber");
			SMSSDK.getVerificationCode(country, number);
		} catch (JSONException e) {
			currentCallbackContext.error("bad phone");
		}
		
	}
	private void verify(CordovaArgs args,EventHandler eh) {
		if (!ready){
			initSDK(appKey,appSecret);
			ready = true;
		}
		if(eh!=null){
			SMSSDK.registerEventHandler(eh);
		}
		
		try {
			JSONObject phone = args.getJSONObject(0);
			String zone = (String)phone.get("zone");
			String phoneNumber = (String)phone.get("phoneNumber");
			String verificationCode = (String)phone.get("verificationCode");
			SMSSDK.submitVerificationCode(zone, phoneNumber, verificationCode);
			
		} catch (JSONException e) {
			currentCallbackContext.error("bad phone");
		}
		
	}
	
	public boolean uninit(){
		SMSSDK.unregisterAllEventHandler();
		ready = false;
		return true;
	}
	
	public void onDestroy() {
		super.onDestroy();
		ready = false;
//		this.unregisterReceiver(smsBroadcastReceiver);
			// 销毁回调监听接口
		SMSSDK.unregisterAllEventHandler();
	}
	
	
}
