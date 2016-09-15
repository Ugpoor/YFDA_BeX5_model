package com.justep.cordova.plugin.youkuplayer;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.util.Log;
import android.widget.Toast;

import com.youku.player.ApiManager;
import com.youku.player.YoukuPlayerBaseConfiguration;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class YoukuPlayer extends CordovaPlugin {

    public String PLAY="go2Player";
    public String LOGIN="doLogin";
    public String LOGOUT="doLogout";
    public String GETLOGINSTATE="getLoginState";
    private static final String LOG_TAG = "YoukuPlayer";
    public static final int REQUEST_CODE = 0x0ba7c0de;
    private static final String PLAY_INTENT = "com.justep.cordova.plugin.youkuplayer.PLAY";
    private static final String CANCELLED = "cancelled";
    private static final String FORMAT = "format";
    private static final String TEXT = "text";
    private CallbackContext callbackContext;
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        this.callbackContext = callbackContext;
        if (PLAY.equals(action)) {
            try {
                JSONObject info = args.getJSONObject(0);
                String vid = info.getString("vid");
                int videoquality=1;
                try {
                    videoquality = info.getInt("videoquality");
                }catch(JSONException e){
                    e.printStackTrace();
                }
                if (vid != null) {
                    go2Player(vid,videoquality, callbackContext);
                }else {
                    callbackContext.error("视频id为空");
                }
            } catch (NumberFormatException ex) {
                callbackContext.error("视频id错误");
                return super.execute(action, args, callbackContext);
            }
        }else if(LOGIN.equals(action)){
            doLogin();
        }else if(LOGOUT.equals(action)){
            doLogout();
        }else if(GETLOGINSTATE.equals(action)){
            getLoginState();
        }
        return super.execute(action, args, callbackContext);
    }
    /**
     * 用户登陆
     */
    private void doLogin(){
        ApiManager.doLogin(this.cordova.getActivity());
        callbackContext.success();
    }

    /**
     * 用户登出
     */
    private void doLogout(){
        ApiManager.doLogout(this.cordova.getActivity());
        callbackContext.success();
    }

    /**
     * 获取当前登陆的用户
     */
    private void getLoginState(){
        //获取登陆用户的用户名，没有登陆则为空
        String user = ApiManager.getLoginUser();
        Toast.makeText(this.cordova.getActivity(), "user: " + user, Toast.LENGTH_SHORT).show();
        callbackContext.success();
    }
    /**
     * 跳转到播放界面进行播放
     */

    private void go2Player(String vid,int videoquality,CallbackContext callbackContext){
        Intent intentPlay = new Intent(PLAY_INTENT);
        intentPlay.addCategory(Intent.CATEGORY_DEFAULT);
        intentPlay.putExtra("vid", vid);
        if(videoquality!=0){
            intentPlay.putExtra("videoquality", videoquality);
        }
        // avoid calling other phonegap apps
        intentPlay.setPackage(this.cordova.getActivity().getApplicationContext().getPackageName());
        this.cordova.startActivityForResult((CordovaPlugin) this, intentPlay, REQUEST_CODE);
        callbackContext.success();
    }
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
    }
}