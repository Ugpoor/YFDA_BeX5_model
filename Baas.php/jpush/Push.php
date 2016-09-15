<?php

namespace jpush;

require_once("JPush/JPush.php");

class Push 
{
    private static $appKey = "";
	private static $masterSecret = "";
	private static $apnsProduction = false;
	private static $jpushClient;
    
	public static function push($paramsObject, $context)
	{
        //$doc = new DOMDocument(); 
        //$doc->load(APP_ROOT."/jpush/jpush.config.xml"); //读取xml文件    
        $string = file_get_contents(APP_ROOT."/jpush/jpush.config.xml");
        //echo $string;
        
        $doc = simplexml_load_string($string);
        //var_dump($doc);
        self::$appKey = $doc->appKey;
        self::$masterSecret = $doc->masterSecret;
        self::$apnsProduction = $doc->apnsProduction == "true" ? true : false;
        
        //echo self::$appKey;
        $registrationId = isset($_REQUEST["registrationId"]) ? $_REQUEST["registrationId"] : null;
        if (isset($GLOBALS['HTTP_RAW_POST_DATA']))
        {
            $tmpArray = json_decode($GLOBALS['HTTP_RAW_POST_DATA'], true);
            $registrationId = $tmpArray["registrationId"];
        }
            
        //echo $registrationId;
        if (empty($registrationId))
        {
            return;
        }
        
        try
        {
            self::sendPushMessage($registrationId, self::$appKey, self::$masterSecret);
        }
        catch(Exception $e)
        {
            echo $e->getMessage();
        }
	}
    
    public static function sendPushMessage($registrationId, $app_key, $master_secret)
    {
        $client = new \JPush($app_key, $master_secret);
        $payload = $client->push()
            ->setPlatform('all')
            ->addRegistrationId($registrationId)
            ->setNotificationAlert("亲爱的x5外卖用户，您的订单已经配货完毕，正在运送中..")
            ->build();
        $payload->setOptions(null, 86400, null, $master_secret, null);
        $currentDateString = date('Y-m-d H:i:s', time() + 60);
        //echo $currentDateString;
        //return;
        $response = $client->schedule()->createSingleSchedule("正在运送中", $payload, array("time"=>$currentDateString));
        return $response;
    }
}

?>