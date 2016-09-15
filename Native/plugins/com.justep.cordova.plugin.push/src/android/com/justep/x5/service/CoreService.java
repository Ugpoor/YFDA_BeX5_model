package com.justep.x5.service;

import java.io.File;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.eclipse.paho.android.service.MqttAndroidClient;
import org.eclipse.paho.client.mqttv3.IMqttActionListener;
import org.eclipse.paho.client.mqttv3.IMqttAsyncClient;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.IMqttToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttPersistenceException;
import org.eclipse.paho.client.mqttv3.MqttSecurityException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Binder;
import android.os.Environment;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;

import com.justep.cordova.plugin.push.Notify;
import com.justep.x5.base.Constants;

import de.mindpipe.android.logging.log4j.LogConfigurator;


public class CoreService extends Service {
	static final String TAG = "x5CoreService";
	MqttAndroidClient mc;
	IMqttToken token;
    Logger logger;
	Context context;
	CoreService self;
	String mqttServerURL;
	String userName;
	String password;
	String topicName;
	final int keepLiveInterval = 350;
	Thread reConnectThread;
	MqttConnectOptions options;
	IMqttActionListener listener;
	WakeLock wakeLock;
	
	PendingIntent mqttAlarmConnectIntent;
	
	Intent mqttConnectionIntent;
	boolean reTrying;
	
	@Override
	public void onCreate() {
		super.onCreate();
        configLog();
        logger.info("coreservice onCreate");
        context = getApplicationContext();
		getMqttParams();
		self = this;
		mc = new MqttAndroidClient(context, mqttServerURL,"android:" + getUuid(), new MemoryPersistence());

		listener = new IMqttActionListener() {
			@Override
			public void onSuccess(IMqttToken token) {
				//Notify.notifcation(context, "推送服务连接成功", Constants.APPNAME);
				reTrying = false;
				Intent intent = new Intent("com.justep.x5.service.CoreService");
				intent.putExtra("connected", true);
				intent.putExtra("token", self.getUuid());
				sendBroadcast(intent);
				final IMqttAsyncClient client = token.getClient();
				mc.setCallback(new MqttCallback() {
					@Override
					public void messageArrived(String topic, MqttMessage msg)
							throws Exception {
						String title = Constants.APPNAME;
						String message = new String(msg.getPayload());
						Notify.notifcation(context, message, title);
					}

					@Override
					public void deliveryComplete(IMqttDeliveryToken token) {
					}

					@Override
					public void connectionLost(Throwable e) {
						//网络丢失会触发2次 lost 第二次 e is null
                        if (e == null) {
                            logger.info("connectionLost");
                        } else {
                            logger.info("connectionLost:" + e.getMessage());
						}
						self.reConnect();
					}
				});
				try {
					mc.subscribe(topicName, 2);
				} catch (MqttSecurityException e1) {
					e1.printStackTrace();
				} catch (MqttException e1) {
					e1.printStackTrace();
				}
			}

			@Override
			public void onFailure(IMqttToken token, Throwable e) {
				logger.info("onFailure");
				Intent intent = new Intent("com.justep.x5.service.CoreService");
				intent.putExtra("connected", false);
				sendBroadcast(intent);

				if (context != null && e != null) {
					//Notify.notifcation(context, "连接推送服务失败:" + e.getMessage(), Constants.APPNAME);
				}
				self.reConnect();
			}
		};
		self.connect();

		PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
		wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "com.justep.x5.service.CoreService.wakeLock");

		//am 保证服务启动
		AlarmManager am = (AlarmManager) context.getSystemService(Service.ALARM_SERVICE);
		long triggerAtTime = SystemClock.elapsedRealtime();
		//包装需要执行Service的Intent
        Intent intent = new Intent(context, CoreService.class);
        intent.setAction("com.justep.x5.service.CoreService.AlarmManageer.checkService");
        mqttAlarmConnectIntent = PendingIntent.getService(context, 0,
                intent, PendingIntent.FLAG_UPDATE_CURRENT);
		am.setRepeating(AlarmManager.RTC_WAKEUP, triggerAtTime,keepLiveInterval * 1000, mqttAlarmConnectIntent);
	}

	


	private void connect() {
        logger.info("使用mqttAndroidClient开始连接");
		try {
            getMqttParams();
            options = new MqttConnectOptions();
            options.setCleanSession(false);
            options.setKeepAliveInterval(keepLiveInterval);
            options.setUserName(userName);
            options.setPassword(password.toCharArray());
			mc.connect(options, context, listener);
		} catch (MqttPersistenceException e) {
			e.printStackTrace();
		} catch (MqttSecurityException e) {
			e.printStackTrace();
		} catch (MqttException e) {
			e.printStackTrace();
		}
	}


	public void reConnect() {
		if(reConnectThread !=null &&  reConnectThread.isAlive()){
			logger.info("已经存在重连线程，本地重连退出");
			return;
		}

		SharedPreferences perference = context.getSharedPreferences("mqttPerference",context.MODE_WORLD_READABLE);
		if(perference.getBoolean("disConnected", false)){
			logger.info("断开链接状态 不需要重启");
			return;
		}

		reConnectThread = new Thread(new Runnable() {
				@Override
				public void run() {
					//保持cpu一直运行，不管屏幕是否黑屏
                    wakeLock.acquire();
					logger.info("启动线程开始探测是否需要重连");
					//sleep 3s wait for connect finish
					try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					if(mc!=null){
						if(!mc.isConnected()){
							Log.i(TAG,"需要重连");
							CoreService.this.connect();
                        }
                        logger.info("一轮检测结束：原始client连接状态:" + mc.isConnected());
                    } else {
                        logger.info("一轮检测结束：守护线程发现服务已经关闭，重连失败！");
					}
					wakeLock.release();
				}
		});
		reConnectThread.start();
	}

    void configLog() {
        final LogConfigurator logConfigurator = new LogConfigurator();

        logConfigurator.setFileName(Environment.getExternalStorageDirectory()
                + File.separator + "justep" +File.separator + "justepX5AppCoreService.log");
        // Set the root log level
        logConfigurator.setRootLevel(Level.DEBUG);
        // Set log level of a specific logger
        logConfigurator.setLevel("com.justep", Level.ERROR);
        logConfigurator.configure();

        // gLogger = Logger.getLogger(this.getClass());
        logger = Logger.getLogger(TAG);
    }

	private void getMqttParams() {
		SharedPreferences perference = context.getSharedPreferences("mqttPerference",context.MODE_WORLD_READABLE);
		userName = perference.getString("userName","");
		password = perference.getString("password","");
		topicName = perference.getString("topicName","");
		topicName = String.format(topicName, this.getUuid());
		mqttServerURL = perference.getString("mqttServerURL","");
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		logger.info("onStartCommand");
		int result = super.onStartCommand(intent, flags, startId);
		this.reConnect();
		return result;
	}

	@Override
	public void onDestroy() {
        super.onDestroy();
        logger.info("coreService onDestory");
		if(mc!=null && mc.isConnected()){
			try {
				AlarmManager am = (AlarmManager) context.getSystemService(Service.ALARM_SERVICE);
				am.cancel(mqttAlarmConnectIntent);
				mc.disconnect();
			} catch (MqttException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public IBinder onBind(Intent intent) {
		logger.info("onBind");
		return new CoreServiceBinder();
	}
	
	public class CoreServiceBinder extends Binder{
		public CoreService getService(){
			return CoreService.this;
		} 
	}
	

	private String getUuid() {
		String uuid = Settings.Secure.getString(context.getContentResolver(),
				android.provider.Settings.Secure.ANDROID_ID);
		return uuid;
	}
	
	//public api 
	public void disMqttconnect() {
		try {
			if(mc != null){
				mc.unsubscribe(topicName);
				mc.disconnect();
				AlarmManager am = (AlarmManager) context.getSystemService(Service.ALARM_SERVICE);
				am.cancel(mqttAlarmConnectIntent);
				mc = new MqttAndroidClient(context, mqttServerURL,"android:" + getUuid(), new MemoryPersistence());
				
			}
		} catch (MqttException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isMqttConnected(){
		if(mc ==null){
			return false;
		}
		return mc.isConnected();
	}
	
	public String getToken(){
		return this.getUuid();
	}
}
