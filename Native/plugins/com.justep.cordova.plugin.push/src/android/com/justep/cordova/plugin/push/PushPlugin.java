/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
 */

package com.justep.cordova.plugin.push;

import java.util.List;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.log4j.Logger;
import org.eclipse.paho.android.service.MqttAndroidClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import com.justep.x5.service.CoreService;
import com.justep.x5.service.CoreService.CoreServiceBinder;
import com.justep.x5.service.CoreServiceDaemonReceiver;


@SuppressLint("NewApi") public class PushPlugin extends CordovaPlugin {
	MqttAndroidClient mc;
	private static final String TAG = "PushPlugin";
	private CoreService coreService;
	public String userName;
	public String password;
	public String topicName;
	public String mqttServerURL;
	ServiceConnection connection;
	BroadcastReceiver receiver;
	static boolean isDisConnected = true;
	SharedPreferences msgPerference;
	
	@Override
	public void initialize(CordovaInterface cordovaInterface,
			CordovaWebView webView) {
		super.initialize(cordovaInterface, webView);
		
		Intent intent = cordovaInterface.getActivity().getIntent();
		Bundle data = intent.getExtras();
		if (data != null && data.getString("content") != null && data.getString("content") != "") {
			this.setMsg(data.getString("content"));
		}
	}
	
	public String getMsg() {
		Log.i(TAG, "get msg");
		if(msgPerference == null){
			return null;
		}else{
			return msgPerference.getString("msg", "");
		}
	}

	public void setMsg(String msg) {
		Log.i(TAG, "set intent msg:" + msg);
		if(msgPerference == null){
			msgPerference = cordova.getActivity().getSharedPreferences("messagePersistence", Context.MODE_WORLD_READABLE);
		}
		SharedPreferences.Editor editor = msgPerference.edit();
		editor.putString("msg", msg);
		editor.commit();
	}
	

	@Override
	public void onNewIntent(Intent intent) {
		super.onNewIntent(intent);
		Log.i(TAG,"plugin onNewIntent");
		Bundle data = intent.getExtras();
		//launchMode="singleTop"
		if (data != null) {
			String msg = data.getString("content");
			if(msg!=null){
				notifyJSMessage(msg);
			}
		} else {
			Log.i(TAG,"plugin onNewIntent no msg:");
			//Notify.toast(cordova.getActivity(), "from plugindata is null or from luncher", Toast.LENGTH_LONG);
		}
	}
	
	private void notifyJSMessage(String msg) {
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
			if(msg!=null){
				//Notify.toast(cordova.getActivity(), "from plugin"+ msg,Toast.LENGTH_LONG);
				webView.loadUrl("javascript:" + "navigator.push.onMessage('"+msg+"')");
			}
		} else {
			if(msg!=null){
				//Notify.toast(cordova.getActivity(), "from plugin"+ msg,Toast.LENGTH_LONG);
				final String script = "navigator.push.onMessage('"+msg+"')";
				webView.getView().post(new Runnable(){
					public void run(){
						webView.sendJavascript(script);
					}
				});
			}
		}
	}

	
	private void persistenceMqttParam(){
		SharedPreferences perference = cordova.getActivity().getApplicationContext().getSharedPreferences("mqttPerference",cordova.getActivity().getApplicationContext().MODE_WORLD_READABLE);
		SharedPreferences.Editor editor=  perference.edit();
		editor.putString("userName", userName);
		editor.putString("password", password);
		editor.putString("topicName", topicName);
		editor.putString("mqttServerURL", mqttServerURL);
		editor.commit();
	}
	
	boolean connected = false;
	String token;
	
	
	private void connectSuccess(CallbackContext callbackContext,String token){
		callbackContext.success(token);
		Handler mainHandler = new Handler(Looper.getMainLooper());
        mainHandler.postDelayed(new Runnable() {
			@Override
			public void run() {
				final String msg = PushPlugin.this.getMsg();
				if(msg != null && !msg.equals("")){
					PushPlugin.this.setMsg("");
					cordova.getActivity().runOnUiThread(new Runnable() {
			            @SuppressLint("NewApi")
			            @Override
			            public void run() {
			            	notifyJSMessage(msg);
			            }
			        });
				}
			}
		}, 2000);
		
	}
	
	private void regDaemonReceiver(){
		//Toast.makeText(cordova.getActivity().getApplicationContext(), "注册coreService守护逻辑", Toast.LENGTH_SHORT).show();
	    IntentFilter filter = new IntentFilter();
	    filter.addAction(Intent.ACTION_BOOT_COMPLETED);
		filter.addAction(Intent.ACTION_SCREEN_ON);
		cordova.getActivity().getApplicationContext().registerReceiver(new CoreServiceDaemonReceiver(), filter);
	}
	
	
	/**
	 * plugin 入口
	 */
	public boolean execute(String action, JSONArray args,
			CallbackContext callbackContext) {
		if("connect".equals(action)){
			SharedPreferences perference = cordova.getActivity().getApplicationContext().getSharedPreferences("mqttPerference",cordova.getActivity().getApplicationContext().MODE_WORLD_READABLE);
			SharedPreferences.Editor editor = perference.edit();
			editor.putBoolean("disConnected", false);
			editor.commit();
			

			
			final boolean running = this.isCoreServiceRunning(cordova.getActivity().getApplicationContext());
			Log.i(TAG, "后台服务启动中:" + running);
			
			final CallbackContext connectCallbackContext = callbackContext;
			mqttServerURL = webView.getPreferences().getString("mqttServerURL", "tcp://127.0.0.1:1883");
			JSONObject obj = args.optJSONObject(0);
            if (obj != null) {
                JSONObject options;
				try {
					options = obj.getJSONObject("options");
					if(options !=null){
	                	userName = options.getString("userName");
	                	password = options.getString("password");
	                	topicName = options.getString("topicName");
	                }
				} catch (JSONException e) {
					e.printStackTrace();
					callbackContext.error(e.getMessage());
				}
            }
            persistenceMqttParam();


			if(coreService !=null){
				if(connected){
					this.connectSuccess(callbackContext,token);
				}else{
					coreService.reConnect();
				}
				return true;
			}

            //动态注册广播接收器
	        IntentFilter intentFilter = new IntentFilter();  
	        intentFilter.addAction("com.justep.x5.service.CoreService");
	        
	        receiver = new BroadcastReceiver(){
				@Override
				public void onReceive(Context context, Intent intent) {
					boolean connected = intent.getBooleanExtra("connected", false);
					String token = intent.getStringExtra("token");
					//Notify.notifcation(context, "收到广播连接|connected:" + connected + "|token:" + token, "x5广播");
					PushPlugin.this.connected = connected; 
					PushPlugin.this.token = token;
					if(connected){
						//Notify.notifcation(cordova.getActivity().getApplicationContext(), "请求连接成功", "jscode");
						PushPlugin.this.connectSuccess(connectCallbackContext, token);
					}else{
						connectCallbackContext.error("连接推送服务失败");
					}
				}
	        };
	        
	        cordova.getActivity().registerReceiver(receiver, intentFilter);
			
	    	Intent intent = new Intent(cordova.getActivity(),CoreService.class);
	    	
	    	regDaemonReceiver();
	    	
	    	connection = new ServiceConnection() {
				@Override
				public void onServiceDisconnected(ComponentName name) {
					coreService = null;
				}
				
				@Override
				public void onServiceConnected(ComponentName name, IBinder service) {

					Log.i(TAG, "绑定成功");
					coreService = ((CoreServiceBinder)service).getService();
					if(running){
						Handler mainHandler = new Handler(Looper.getMainLooper());
				        mainHandler.postDelayed(new Runnable() {
							@Override
							public void run() {
								connected = coreService.isMqttConnected(); 
								token = coreService.getToken();
								Log.i(TAG, "通过服务判定mqtt状态为：" + connected);
								if(connected){
									//Notify.notifcation(cordova.getActivity().getApplicationContext(), "请求连接成功|服务已经存在", "jscode");
									PushPlugin.this.connectSuccess(connectCallbackContext, token);
								}else{
									coreService.reConnect();
								}
							}
						}, 5000);
		            }
				}
			};
			cordova.getActivity().startService(intent);
            cordova.getActivity().bindService(intent, connection, Context.BIND_AUTO_CREATE);
            
            
            
		}else if("disconnect".equals(action)){
			Log.i(TAG,"plugin ready");
			if(coreService!=null){
				SharedPreferences perference = cordova.getActivity().getApplicationContext().getSharedPreferences("mqttPerference",cordova.getActivity().getApplicationContext().MODE_WORLD_READABLE);
				SharedPreferences.Editor editor = perference.edit();
				editor.putBoolean("disConnected", true);
				editor.commit();
				coreService.disMqttconnect();
				new Thread(new Runnable() {
					@Override
					public void run() {
						Log.i(TAG, "断开链接:"+ connection);
				    	//cordova.getActivity().unbindService(connection);
				    	Intent intent = new Intent(cordova.getActivity(),CoreService.class);
						boolean stoped = cordova.getActivity().stopService(intent);
						coreService = null;
						Log.i(TAG, "关闭coreService:" + stoped);
					}}).start();
			}
		}
		return true;
	}

	public boolean isCoreServiceRunning(Context mContext) {
        boolean isRunning = false;
        ActivityManager activityManager = (ActivityManager)
        mContext.getSystemService(Context.ACTIVITY_SERVICE); 
        List<ActivityManager.RunningServiceInfo> serviceList= activityManager.getRunningServices(300);

        if (!(serviceList.size()>0)) {
            return false;
        }

        for (int i=0; i<serviceList.size(); i++) {
        	Log.i(TAG, serviceList.get(i).service.getClassName());
            if (serviceList.get(i).service.getClassName().equals("com.justep.x5.service.CoreService") == true) {
                isRunning = true;
                break;
            }
        }
        return isRunning;
    }
	
	
	
	@Override
	public void onDestroy() {
		super.onDestroy();
		if(connection != null){
			cordova.getActivity().unbindService(connection);
		}
		if(receiver!=null){
			cordova.getActivity().unregisterReceiver(receiver);
		}
		
		
	}
}
