<?php

namespace justep;
	
class Takeout
{
	public static function queryAddr($params, $context)
	{
		$httpUrl = "http://apis.baidu.com/3023/geo/address";
        $x = isset($_REQUEST["x"]) ? $_REQUEST["x"] : "39.8622934399999";
        $y = isset($_REQUEST["y"]) ? $_REQUEST["y"] : "116.45764191999997";
        
        $httpArg = "l=".$x.",".$y;
        $httpUrl = $httpUrl.$httpArg;
        $result = self::getCurl($httpUrl);
        echo $result;
	}
    
    /**
     * get https的内容
     * @url 请求的url
     */
    private static function getCurl($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);//不输出内容
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, array (
        'apikey:8f91a2f0c505d88f49af77bba09ca8eb'
        ) );
        $result =  curl_exec($ch);
        curl_close ($ch);
        return $result;
    }
}	
?>