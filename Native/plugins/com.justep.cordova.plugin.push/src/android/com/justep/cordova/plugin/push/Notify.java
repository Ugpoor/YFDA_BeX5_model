/*******************************************************************************
 * Copyright (c) 1999, 2014 IBM Corp.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution. 
 *
 * The Eclipse Public License is available at 
 *    http://www.eclipse.org/legal/epl-v10.html
 * and the Eclipse Distribution License is available at 
 *   http://www.eclipse.org/org/documents/edl-v10.php.
 */
package com.justep.cordova.plugin.push;

import java.lang.reflect.Field;
import java.util.Calendar;
import java.util.Random;

import org.json.JSONException;
import org.json.JSONObject;

import com.justep.x5.base.Constants;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

@SuppressLint("NewApi")
public class Notify {

	/** Message ID Counter **/
	private static int MessageID = 0;

	public static void notifcation(Context context, String messageString, String notificationTitle) {

		// Get the notification manage which we will use to display the
		// notification
		String ns = Context.NOTIFICATION_SERVICE;
		NotificationManager mNotificationManager = (NotificationManager) context.getSystemService(ns);
		Calendar.getInstance().getTime().toString();
		long when = System.currentTimeMillis();

		String notifyContent = messageString;
		try {
			JSONObject msgJSON = new JSONObject(messageString);
			JSONObject apsJSON = msgJSON.getJSONObject("aps");
			notifyContent = apsJSON.getString("alert");
		} catch (JSONException e) {

			e.printStackTrace();
		}

		Intent viewIntent;
		try {
			viewIntent = new Intent(context, Notify.class.getClassLoader().loadClass(Constants.PACKNAME+ "."+ Constants.ACTIVITYCLASSNAME));
			viewIntent.putExtra("title", notificationTitle);
			viewIntent.putExtra("content", messageString);

			PendingIntent viewPendingIntent = PendingIntent.getActivity(context, new Random().nextInt(Integer.MAX_VALUE), viewIntent,
					PendingIntent.FLAG_UPDATE_CURRENT);
			Class<?> klass = Notify.class.getClassLoader().loadClass(Constants.PACKNAME + ".R$drawable");

			Integer iconNum = (Integer) klass.getDeclaredField("icon").get(klass);

			// build the notification
			Builder notificationCompat = new Builder(context);
			notificationCompat.setAutoCancel(true).setContentTitle(notificationTitle).setContentIntent(viewPendingIntent)
					.setContentText(notifyContent).setSmallIcon(iconNum).setWhen(when);

			Notification notification = notificationCompat.build();
			notification.defaults = Notification.DEFAULT_SOUND;
			// display the notification
			mNotificationManager.notify(MessageID, notification);
			MessageID++;

		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public static void toast(Context context, CharSequence text, int duration) {
		Toast toast = Toast.makeText(context, text, duration);
		toast.show();
	}

}
