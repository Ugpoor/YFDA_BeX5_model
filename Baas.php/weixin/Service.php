<?php

require_once("wechatCallbackapi.php");
require_once("lib/WxPay.JsApiPay.php");

class Service {	
	public static function PayNotifyCallBack($params, $context)
    {        
		define("TOKEN", "123");      
        
        $wechatObj = new wechatCallbackapi();
        $wechatObj->valid();
        $wechatObj->responseMsg();
        
        return;
        
        $menuPostString = "{
            \"button\":[
                {
                    \"name\":\"起步科技\",
                    \"type\":\"view\",
                    \"url\":\"http://www.justep.com\"
                },
                {
                    \"name\":\"外卖\",
                    \"type\":\"view\",
                    \"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=".
                    WxPayConfig::APPID."&redirect_uri=http%3A%2F%2Fwx.justep.com%2Ftakeout%2Findex.html&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect\"
                },
                {
                    \"name\":\"外卖案例\",
                    \"type\":\"view\",
                    \"url\":\"http://www.justep.com\"
                }
            ]
        }";
        
        //Log::DEBUG("menuPostString: ".$menuPostString);
        //echo $menuPostString;
        //echo 'new jsapi';
        $jsApiPay = new JsApiPay();
        //var_dump($jsApiPay);
        $jsApiPay->createMenu($menuPostString);
	}    
}

?>