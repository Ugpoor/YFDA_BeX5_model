<?php

require_once("lib/WxPay.JsApiPay.php");

class UserInfo {
    
    public static function service($paramJObject, $context)
    {
        //初始化日志
        $logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
        $log = Log::Init($logHandler, 15);
        //Log::DEBUG("Begin get user info");
               
        $jsApiPay = new JsApiPay();
        //Log::DEBUG("Begin get openid");
        $openid = $jsApiPay->GetOpenid();
        
        $_SESSION['openid'] = $openid;
        
        //Log::DEBUG("Begin get accessToken");
        $accessToken = $jsApiPay->data["access_token"];     
        //Log::DEBUG("Begin get getUserinfo with accessToken");
        $user_info = $jsApiPay->getUserinfo($accessToken, $openid);
        
        //Log::DEBUG("user info: ".$user_info);
        if (isset($user_info["errcode"])) {
            echo '<h1>错误：</h1>'.$user_info["errcode"];
            echo '<br/><h2>错误信息：</h2>'.$user_info["errmsg"];
            exit;
        }
        else
        {
            $result = array();
            $result["openid"] = $openid;
            $result["nickname"] = $user_info["nickname"];
            $result["country"] = $user_info["country"];
            $result["province"] = $user_info["province"];
            $result["city"] = $user_info["city"];
            $result["headimgurl"] = $user_info["headimgurl"];
            
            ob_clean();
            echo json_encode($result);
            //Log::DEBUG("userinfo:".json_encode($result));
            //echo '{}';
        }
    }
    
}

?>