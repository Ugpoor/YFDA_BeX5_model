package com.justep.x5.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;

public class CoreServiceDaemonReceiver extends BroadcastReceiver{
	@Override
	public void onReceive(Context context, Intent intent) {
		SharedPreferences perference = context.getSharedPreferences("mqttPerference",context.MODE_WORLD_READABLE);
		if(perference.getBoolean("disConnected", false)){
			return;
		}else{
			Intent ps = new Intent(context,CoreService.class);
	    	context.startService(ps);
		}
	}
}
