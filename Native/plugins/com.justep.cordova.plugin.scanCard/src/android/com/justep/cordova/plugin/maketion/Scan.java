package com.justep.cordova.plugin.maketion;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.widget.Toast;

import java.io.File;
import java.util.ArrayList;

import cn.maketion.uploadSdk.MkxActivityCamera;
import cn.maketion.uploadSdk.MkxBackAuth;
import cn.maketion.uploadSdk.MkxBackCards;
import cn.maketion.uploadSdk.MkxBackPicture;
import cn.maketion.uploadSdk.MkxBackUpload;
import cn.maketion.uploadSdk.MkxCard;
import cn.maketion.uploadSdk.MkxErrorCode;
import cn.maketion.uploadSdk.MkxServer;

public class Scan extends CordovaPlugin {

	public static String pname = "abcxyz1111111@163.com";
	public static String pkey = "F681EA2B819A5927B2E765D1E4AA6AFA";
	public static String psign = "a76e83486d7fc3f4f33bc25bb142c88d21a97263ea7e4df1105d24e553d66671569c7cb38a4edf033b462f582903888aa734176016099ea389570e2c8c4a7ff3";
	private MkxServer server;
	private boolean isInit;
	private MkxCard[] cardlist = new MkxCard[] {};
	private ArrayList<String> upLoadFails = new ArrayList<String>();
	private int uploadTimes = 0;

	CallbackContext currentCallbackContext;

	@Override
	public boolean execute(String action, CordovaArgs args, CallbackContext callbackContext) throws JSONException {
		// save the current callback context
		currentCallbackContext = callbackContext;
		if (action.equals("auth")) {
			authenticateAccount(args.getString(0));
		} else if (action.equals("checkAuth")) {
			checkAuthentication();
		} else if (action.equals("clearAuthentication")) {
			clearAuthentication();
		} else if (action.equals("takePicture")) {
			takepic();
		} else if (action.equals("getCardByTime")) {
			getCards(args.getLong(0));
		} else if (action.equals("setSavePath")) {
			setSavePath(args.getString(0));
		} else if (action.equals("uploadPicture")) {
			uploadImage(args.getString(0));
		} else if (action.equals("getCardByUuid")) {
			JSONArray uuids = (JSONArray) args.getJSONObject(0).get("uuids");
			String[] ids = new String[uuids.length()];
			for (int i = 0; i < uuids.length(); i++) {
				ids[i] = uuids.getString(i);
			}
			getCardByUuid(ids);
		} else if (action.equals("getCardPicture")) {
			getCardPicture(args.getString(0));
		}
		return true;
	}

	@Override
	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);
		pkey = webView.getPreferences().getString("key", "F681EA2B819A5927B2E765D1E4AA6AFA");
		psign = webView.getPreferences().getString("sign", "a76e83486d7fc3f4f33bc25bb142c88d21a97263ea7e4df1105d24e553d66671569c7cb38a4edf033b462f582903888aa734176016099ea389570e2c8c4a7ff3");
		server = MkxServer.getServer(cordova.getActivity().getApplication());

	}

	private void authenticateAccount(String name) {
		if (!isInit) {
			String authName = (name == null ? pname : name);
			server.auth(pkey, psign, authName, new MkxBackAuth() {
				@Override
				public void onBack(int code, String errInfo) {
					if (code == MkxErrorCode.CODE_SUCCESS) {
						isInit = server.isAuth();
						if (isInit) {
							currentCallbackContext.success("{code:" + code + "}");
						} else {
							currentCallbackContext.error("验证失败:" + errInfo);
						}
					} else {
						currentCallbackContext.error("验证失败:" + errInfo);
					}
				}
			});
		} else {
			currentCallbackContext.error(" have been authed ");
		}
	}

	private void checkAuthentication() {
		isInit = server.isAuth();
		if (isInit) {
			currentCallbackContext.success();
		} else {
			currentCallbackContext.error("没有验证");
		}
	}

	private void clearAuthentication() {
		server.clearAuth();
		isInit = server.isAuth();
		if (isInit) {
			currentCallbackContext.error("清除验证信息失败");
		} else {
			currentCallbackContext.success();
		}
	}

	private void getCardPicture(String uuid) {
		isInit = server.isAuth();
		if (isInit) {
			server.getCardImage(uuid, new MkxBackPicture() {
				@Override
				public void onBack(final File file) {
					if (file != null) {
						currentCallbackContext.success(file.getPath());
					} else {
						currentCallbackContext.error("获取名片原图失败");
					}
				}
			});
		}

	}

	private void getCards(long time) {
		isInit = server.isAuth();
		if (isInit) {
			server.getDataWithTime(time, new MkxBackCards() {
				@Override
				public void onBack(int code, String info, MkxCard[] cards) {
					if (code == MkxErrorCode.CODE_SUCCESS) {
						cardlist = cards;
						JSONArray re = new JSONArray();
						if (cards.length > 0) {
							try {
								for (int i = 0; i < cards.length; i++) {
									re.put(i, cardToString(cards[i]));
								}
								currentCallbackContext.success(re);
							} catch (JSONException e) {
								e.printStackTrace();
								currentCallbackContext.success(re);
							}
						} else {
							currentCallbackContext.success(re);
						}
					} else {
						currentCallbackContext.error("fail:" + info);
					}

				}
			});
		} else {
			showToast("还未验证账户!", Toast.LENGTH_SHORT);
		}
	}

	private void getCardByUuid(String[] uuids) {
		isInit = server.isAuth();
		if (isInit) {
			server.getDataWithUUID(uuids, new MkxBackCards() {
				@Override
				public void onBack(int code, String info, MkxCard[] cards) {
					if (code == MkxErrorCode.CODE_SUCCESS) {
						cardlist = cards;
						JSONArray re = new JSONArray();
						if (cards.length > 0) {
							try {
								for (int i = 0; i < cards.length; i++) {
									re.put(i, cardToString(cards[i]));
								}
								currentCallbackContext.success(re);
							} catch (JSONException e) {
								e.printStackTrace();
								currentCallbackContext.success(re);
							}
						} else {
							currentCallbackContext.success(re);
						}
					} else {
						currentCallbackContext.error("{code:" + code + ",info:\"" + info + "\"}");
					}
				}
			});
		} else {
			showToast("未验证账户，无法获取", Toast.LENGTH_SHORT);
		}
	}

	private void uploadImage(String uuid) {
		isInit = server.isAuth();
		if (isInit) {
			server.setUploadListener(new MkxBackUpload() {
				@Override
				public void onBack(int code, String errInfo, String uuid, int status) {
					Message msg = null;
					switch (status) {
					case STATUS_ERROR:// 上传出错
						msg = mHandler.obtainMessage(1);
						msg.obj = "上传出错";
						mHandler.sendMessage(msg);
						break;
					case STATUS_START:// 开始上传
						break;
					case STATUS_SUCESS:// 上传成功
						msg = mHandler.obtainMessage(0);
						msg.obj = uuid;
						mHandler.sendMessage(msg);
						break;
					}
				}
			});
			server.uploadImage(uuid);
		} else {
			currentCallbackContext.sendPluginResult((new PluginResult(PluginResult.Status.ERROR, "未验证账户")));
			showToast("未验证账户，无法上传", Toast.LENGTH_SHORT);
		}
	}

	private Handler mHandler = new Handler() {
		@Override
		public void handleMessage(Message msg) {
			String info = (String) msg.obj;
			switch (msg.what) {
			case 1:
				currentCallbackContext.error(info);
				break;
			case 0:
				currentCallbackContext.success(info);
				break;
			default:
				break;
			}
		};
	};

	private MkxBackUpload uploadBean = new MkxBackUpload() {
		@Override
		public void onBack(int code, String errInfo, String uuid, int status) {
			switch (status) {
			case STATUS_ERROR:// 上传出错
				if (uploadTimes <= 5) {// 由于重新上传与拍照上传都是调用统一上传函数，因此需要限制重传次数，避免上传图片时产生无限递归
					uploadTimes++;
					server.uploadImage(uuid);// 重新上传
				} else {// 重新上传的次数达到上限时，不再上传，保存不能上传图片的uuid
					uploadTimes = 0;
					upLoadFails.add(uuid);
					currentCallbackContext.sendPluginResult((new PluginResult(PluginResult.Status.ERROR, uuid)));
					showToast("上传失败，等待网络通畅时再重新上传", Toast.LENGTH_SHORT);
				}
				break;
			case STATUS_START:// 开始上传
				break;
			case STATUS_SUCESS:// 上传成功
				upLoadFails.remove(uuid);
				currentCallbackContext.sendPluginResult((new PluginResult(PluginResult.Status.OK, uuid)));
				showToast("上传成功", Toast.LENGTH_SHORT);
				break;
			}
		}
	};

	private void takepic() {
		isInit = server.isAuth();
		if (isInit) {
			server.setUploadListener(uploadBean);
			Intent intent = new Intent(cordova.getActivity(), MkxActivityCamera.class);
			this.cordova.getActivity().startActivity(intent);
		} else {
			showToast("还未验证账户，无法拍照上传", Toast.LENGTH_SHORT);
		}
	}

	/**
	 * 设置名片保存的路径
	 */
	private void setSavePath(String path) {
		server.setSdcardPath(path);
		String sdcard = null;
		if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
			sdcard = Environment.getExternalStorageDirectory().toString();
		}
		currentCallbackContext.success(sdcard + "/" + path);
	}

	private JSONObject cardToString(MkxCard card) throws JSONException {
		String json = "{\"carduuid\": \"" + card.carduuid + "\",  \"name\": \"" + card.name + "\",  \"duty\": \"" + card.duty + "\",  \"mobile1\": \"" + card.mobile1 + "\",  \"mobile2\": \""
				+ card.mobile2 + "\",  \"email\": \"" + card.email + "\",  \"tel1\": \"" + card.tel1 + "\",  \"tel2\": \"" + card.tel2 + "\",  \"fax\": \"" + card.fax + "\",  \"cname\": \""
				+ card.cname + "\",  \"address\": \"" + card.address + "\",  \"website\": \"" + card.website + "\",  \"logo\": \"" + card.logo + "\",  \"createtime\": \"" + card.createtime
				+ "\",  \"updatetime\": \"" + card.updatetime + "\",  \"fields\": \"" + card.fields + "\",  \"audit\": \"" + card.audit + "\",  \"flag\": \"" + card.flag + "\"}";
		JSONObject jo = null;
		try {
			jo = new JSONObject(json);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jo;
	}

	private void showToast(String info, int duration) {
		Toast.makeText(cordova.getActivity(), info, duration).show();
	}
}

