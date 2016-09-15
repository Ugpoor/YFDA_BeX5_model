<?php
/**
  * wechat php test
  */

require_once 'log.php';

class wechatCallbackapi
{
	public function valid()
    {
        //初始化日志
        $logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
        $log = Log::Init($logHandler, 15);
        
        //var_dump($_GET);
        $echoStr = null;
        if (isset($_GET["echostr"]))
        {
            $echoStr = $_GET["echostr"];
        }
        
        //echo $echoStr;
        Log::DEBUG("begin notify echoStr: ".$_SERVER['QUERY_STRING']);
        Log::DEBUG("info: ".$_SERVER['REMOTE_ADDR']);
        
        //valid signature , option
        if(!$this->checkSignature())
        {
            Log::DEBUG("echo fails.");
            echo "如果你在浏览器中看到这句话，说明此地址可以被作为微信公众账号后台的Url，请注意保持Token一致。";
            exit;
        }
        else if ($echoStr != null)
        {
            ob_clean();
        	echo $echoStr;
            Log::DEBUG("return echoStr: ".$echoStr);
        	exit;
        }
    }

    public function responseMsg()
    {
		//get post data, May be due to the different environments
        
        if (isset($GLOBALS["HTTP_RAW_POST_DATA"]))
        {
		  $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        }
        //Log::DEBUG("postStr: ".$postStr);
      	//extract post data
		if (!empty($postStr)){
                /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
                   the best way is to check the validity of xml by yourself */
                libxml_disable_entity_loader(true);
              	$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
                $fromUsername = $postObj->FromUserName;
                $toUsername = $postObj->ToUserName;
                $keyword = trim($postObj->Content);
                $time = time();
                $textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							<Content><![CDATA[%s]]></Content>
							<FuncFlag>0</FuncFlag>
							</xml>";             
				if(!empty( $keyword ))
                {
              		$msgType = "text";
                	$contentStr = "Welcome to Justep's wechat baas.php world!";
                	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType, $contentStr);
                	echo $resultStr;
                }else{
                	echo "Input something...";
                }

        }else {
        	echo "";
        	return;
        }
    }
		
	private function checkSignature()
	{
        // you must define TOKEN by yourself
        if (!defined("TOKEN")) {
            throw new Exception('TOKEN is not defined!');
        }
        
        if (!isset($_GET["signature"])  || !isset($_GET["timestamp"]))
        {
            return false;
        }
                
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        		
		$token = TOKEN;
        //echo $token;
		$tmpArr = array($token, $timestamp, $nonce);
        // use SORT_STRING rule
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );
        //Log::DEBUG($tmpStr." ".$signature);
        
		if( $tmpStr == $signature ){
            //Log::DEBUG("Return true.");
			return true;
		}else{
			return false;
		}
	}
}

?>