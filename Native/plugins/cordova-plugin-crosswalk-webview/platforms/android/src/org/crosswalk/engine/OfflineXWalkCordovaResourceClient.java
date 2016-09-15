package org.crosswalk.engine;

import android.util.Log;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import org.apache.cordova.ResourceLoader;
import org.xwalk.core.XWalkView;

public class OfflineXWalkCordovaResourceClient extends XWalkCordovaResourceClient {

    static final String TAG = "OfflineXWalkCordovaResourceClient";

    public OfflineXWalkCordovaResourceClient(XWalkWebViewEngine parentEngine) {
        super(parentEngine);
    }

    @Override
    public WebResourceResponse shouldInterceptLoadRequest(XWalkView view, String url) {
        WebResourceResponse result = ResourceLoader.load(this.parentEngine.cordova, url);
        if (result == null) {
            result = super.shouldInterceptLoadRequest(view, url);
            return result;
        } else {
            return result;
        }
    }
}