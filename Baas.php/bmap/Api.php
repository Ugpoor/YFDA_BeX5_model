<?php

namespace bmap;

class Api
{
    public static function convertLocation($paramsObject, $context)
    {
        if (!isset($_REQUEST["longitude"]) || !isset($_REQUEST["latitude"]))
        {
            echo '请指定经纬度数据.';
            return null;
        }
        
        $longitude = $_REQUEST["longitude"];
        $latitude = $_REQUEST["latitude"];
        
        $url = "http://api.map.baidu.com/geoconv/v1/?coords=".$longitude.",".$latitude."&from=1&to=5&ak=xifH76TpyIL1cvnTzuEP0bpq";

        $requestClient = self::getCurl($url);
        echo $requestClient;

        return null;
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
        $result =  curl_exec($ch);
        curl_close ($ch);
        return $result;
    }
}

?>