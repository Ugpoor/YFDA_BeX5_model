package com.justep.cordova.plugin.voiceManager;
import android.content.Context;
import android.media.AudioManager;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Created by peace on 2016/3/7.
 */
public class VoiceManager extends CordovaPlugin {
	public String CALL="1";
    public String NORMAL="0";
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("setPlayMode".equals(action)) {
            try {
                String type = args.get(0).toString();
                if (type != null) {
                    int voiceMode = 0;
                    if (type.equals(CALL)) {
                        voiceMode = AudioManager.MODE_IN_CALL;
                    } else if (type.equals(NORMAL)) {
                        voiceMode = AudioManager.MODE_NORMAL;
                    }
                    setPlayMode(voiceMode, callbackContext);
                }else {
                    callbackContext.error("模式参数为空");
                }
            } catch (NumberFormatException ex) {
                callbackContext.error(ex.toString());
                return super.execute(action, args, callbackContext);
            }
        }
        return super.execute(action, args, callbackContext);
    }
    public void setPlayMode(int voiceMode,CallbackContext callbackContext){
        try {
            AudioManager am=(AudioManager) cordova.getActivity().getSystemService(Context.AUDIO_SERVICE);//提供访问控制音量和钤声模式的操作
            am.setMode(voiceMode);
        }catch (Exception e){
            e.printStackTrace();
            callbackContext.error(e.toString());
        }
        callbackContext.success();
    }
}