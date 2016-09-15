<?php

require_once("Engine.class.php");
require_once(dirname(__FILE__).'/UrlHandler.php');
require_once("reference.php");

class ActionHandler
{
    private $MethodPost = "POST";
    private $MultipartContentType = "multipart/form-data";
    private $accessControlAllowOrigin = "*";

    public function ProcessRequest()
    {
        try
        {
            $request = $_REQUEST;
            
            switch ($_SERVER['REQUEST_METHOD'])
            {
                case "POST":
                case "GET":
                    $this->ExecService($request);
                    break;

                // 设置跨域访问支持
                case "OPTIONS":
                    if (!is_numeric($accessControlAllowOrigin) && !empty($accessControlAllowOrigin))
                    {
                        $RequestHeader = get_all_headers();
                        header("P3P", "CP=CAO PSA OUR");
                        header("Access-Control-Allow-Origin", $accessControlAllowOrigin);
                        headerr("Access-Control-Allow-Credentials", "true");
                        header("Access-Control-Allow-Methods", $RequestHeader["Access-Control-Request-Method"]);
                        header("Access-Control-Allow-Headers", $RequestHeader["Access-Control-Request-Headers"]);
                    }
                    return;

                default:
                    return;
            }
        }
        catch (Exception $e)
        {
            echo($e.StackTrace);
        }
    }

    private function get_all_headers() { 
        $headers = array(); 

        foreach($_SERVER as $key => $value) { 
            if(substr($key, 0, 5) === 'HTTP_') { 
                $key = substr($key, 5); 
                $key = strtolower($key); 
                $key = str_replace('_', ' ', $key); 
                $key = ucwords($key); 
                $key = str_replace(' ', '-', $key); 

                $headers[$key] = $value; 
            } 
        } 

        return $headers; 
    } 

    private function ExecService($request)
    {
        // 设置跨域访问
        if (!is_numeric($this->accessControlAllowOrigin) && !empty($this->accessControlAllowOrigin))
        {
            header("P3P: CP=CAO PSA OUR");
            header("Access-Control-Allow-Origin:".$this->accessControlAllowOrigin);
            header("Access-Control-Allow-Credentials:true");
        }
        
        session_start();
        
        header("Content-type: text/html; charset=utf-8");        
        
        $pathArray = explode('/', $_SERVER['REQUEST_URI']);
        if (count($pathArray) >= 2 && $pathArray[1] !== 'baas')
        {
            //var_dump($pathArray);
            
            $urlHandler = new UrlHandler();
            $urlHandler->VersionCotroller($_SERVER['REQUEST_URI']);
            
            return;
        }
        else
        {
			$reg = $request;
			$paramObject = $this->GetParams($reg);
			if($_SERVER['PHP_SELF'] == '/baas/index.php')
			{
				$URL = $_SERVER['REQUEST_URI'];
				$ret = Engine::ExecAction('/baas/index.php'.substr($URL,5,strlen($URL)), $paramObject);
			}
			else
			{
				//echo "line 77:";
				//var_dump($paramObject);
				//echo "URL:".$_SERVER['PHP_SELF']."<br/>";
				$ret = Engine::ExecAction($_SERVER['PHP_SELF'], $paramObject);   
			}
        }
    }

    private function GetParams($request)
    {
        $method = $_SERVER['REQUEST_METHOD'];
        $paramObject = array();
        if ($this->IsRequestMultipart())
        {            
            return $paramObject;
        }

        if ($this->MethodPost == $method)
        {
            return $this->GetParamsFromRawData($GLOBALS['HTTP_RAW_POST_DATA']);
        }
        //var_dump($_REQUEST);
        //$paramObject = array();
        foreach ($_REQUEST as $key => $value) 
        {
            if (is_array($value)) $value = join(',', $value);
            $paramObject[$key] = $value;
            //echo "Key: $key; Value: $value<br />\n";
        }

        return $paramObject;
    }
    
    private function GetParamsFromRawData($inputStream)
    {
        $tmpArray = json_decode($inputStream, true);
        //var_dump($tmpArray);
        return $tmpArray;
    }

    private function IsRequestMultipart()
    {
        $type = "";
        if (isset($_SERVER["CONTENT_TYPE"]))
        {
            $type = $_SERVER["CONTENT_TYPE"];
            return !is_numeric($type) && !empty($type) && -1 < stripos($type, $this->MultipartContentType);
        }

        return false;
    }
}

define("APP_ROOT",dirname(__FILE__));

header("Content-type: text/html; charset=utf-8");

$Handler = new ActionHandler();

$Handler->ProcessRequest();

//echo "Hello World!";

?>