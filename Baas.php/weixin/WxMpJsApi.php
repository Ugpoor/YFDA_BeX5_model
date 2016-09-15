<?php

ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
require_once "lib/WxPay.Api.php";
require_once "lib/WxPay.JsApiPay.php";
require_once 'log.php';

class WxMpJsApi {
    
    public static function service($params, $context)
    {
        //初始化日志
        $logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
        $log = Log::Init($logHandler, 15);
        
        $action = null;
        if (isset($_REQUEST["action"]))
        {
            $action = $_REQUEST["action"];
        }
        
        //Log::DEBUG("action:".$action);
        
        if ($action == "getTicket")
        {
            self::getTicket();
        }
        else if ($action == "chooseWXPay")
        {
            self::chooseWXPay();
        }
    }    
    
    private static function getTicket()
    {
        //初始化日志
        $logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
        $log = Log::Init($logHandler, 15);
        
        $jsApiPay = new JsApiPay();        
        $jsapiTicket = $jsApiPay->getJsApiTicket();
        Log::DEBUG("jsapiTicket:".$jsapiTicket);
        
        ob_clean();
        echo $jsapiTicket;
	}
    
    private static function chooseWXPay()
    {
        //初始化日志
        $logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
        $log = Log::Init($logHandler, 15);
        //Log::DEBUG("Begin chooseWXPay function:");

        //①、获取用户openid
        $tools = new JsApiPay();
        //$openId = $tools->GetOpenid();
        if (!isset($_SESSION['openid']))
        {
            die("请先通过微信Oauth2对x5外面授权,然后才能发起支付");
        }
        
        $openId = $_SESSION['openid'];
        //Log::DEBUG("chooseWXPay openId:".$openId);
        
        //②、统一下单
        $input = new WxPayUnifiedOrder();
        $input->SetOpenid($openId);
        
        $body = $_REQUEST["body"];
        //$body = "x5 pushcase";
        $input->SetBody($body);
        $input->SetNotify_url($_REQUEST["notifyUrl"]);
        $input->SetOut_trade_no($_REQUEST["outTradeNo"]);
        $input->SetTotal_fee($_REQUEST["totalFee"]);
        $input->SetTrade_type("JSAPI");
        
        $input->SetAttach($body);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("");
        
        $order = WxPayApi::unifiedOrder($input);
        
        //echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';
        //printf_info($order);
        $jsApiParameters = $tools->GetJsApiParameters($order);
        
        //Log::DEBUG("chooseWXPay result:".$jsApiParameters);
        ob_clean();
        echo $jsApiParameters;

        //获取共享收货地址js函数参数
        //$editAddress = $tools->GetEditAddressParameters();

        //③、在支持成功回调通知中处理成功之后的事宜，见 notify.php
        /**
         * 注意：
         * 1、当你的回调地址不可访问的时候，回调通知会失败，可以通过查询订单来确认支付是否成功
         * 2、jsapi支付时需要填入用户openid，WxPay.JsApiPay.php中有获取openid流程 （文档可以参考微信公众平台“网页授权接口”，
         * 参考http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html）
         */
    }
    
    /**
     * $str Unicode编码后的字符串
     * $decoding 原始字符串的编码，默认GBK
     * $prefix 编码字符串的前缀，默认"&#"
     * $postfix 编码字符串的后缀，默认";"
     */
    private static function unicode_decode($unistr, $encoding = 'UTF-8', $prefix = '&#', $postfix = ';') {
        $arruni = explode($prefix, $unistr);
        $unistr = '';
        for($i = 1, $len = count($arruni); $i < $len; $i++) {
            if (strlen($postfix) > 0) {
                $arruni[$i] = substr($arruni[$i], 0, strlen($arruni[$i]) - strlen($postfix));
            } 
            $temp = intval($arruni[$i]);
            $unistr .= ($temp < 256) ? chr(0) . chr($temp) : chr($temp / 256) . chr($temp % 256);
        } 
        return iconv('UCS-2', $encoding, $unistr);
    }
}

?>