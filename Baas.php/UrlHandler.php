<?php

require_once(dirname(__FILE__)."/class.phplock.php");

class UrlHandler
{
    private $JSON_FILE = 'appMetadata_in_server.json';
    
    private $versionArray = null;
    
    private static $PathVersion;
    
    public function VersionCotroller($urlString)
    {
        self::InitVersionArray();
        
        //echo $urlString.'<br/>';
        $fileName = str_replace("\\", "/", dirname(__FILE__)).$urlString;
        if (strpos($fileName, '?') !== FALSE )
        {
            $fileName = substr($fileName, 0, strpos($fileName, '?'));
        }
        
        //echo "filename:".$fileName."end";
        //echo file($fileName) === true;
        $currentPathInfo = self::NeedVersionControll($urlString);
        //var_dump($currentPathInfo);
        //echo $urlString;
        //return;
        if (!empty($currentPathInfo))
        { 
            if (in_array($currentPathInfo["mode"], array('2', '3')))
            {
                // update to latest version path
                $newUrl = self::NeedUpdatePath($currentPathInfo["path"], $currentPathInfo["version"], $urlString);
                if ($newUrl != $urlString)
                {
                    header("Location: ".$newUrl.'?'.$_SERVER['QUERY_STRING']);
                }
                elseif (file_exists($fileName) === false)
                {
                    $newFile = str_replace("\\", "/", dirname(__FILE__)).$currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"];
                    //echo $newFile;
                    if (file_exists($newFile))
                    {
                        //echo $currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"];
                        header("Location: ".$currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"]);
                    }
                }
            }
            elseif ($currentPathInfo["mode"] == '1')
            {
                //echo $fileName;
                //return;
                if (file_exists($fileName) === false)
                {
                    $newFile = str_replace("\\", "/", dirname(__FILE__)).$currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"];
                    //echo $newFile;
                    if (file_exists($newFile))
                    {
                        //echo $currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"];
                        header("Location: ".$currentPathInfo["path"].$currentPathInfo["version"].$currentPathInfo["indexURL"]);
                    }
                }
            }
        }
        
        if (is_dir($fileName) && file_exists($fileName) === true)
        {
            foreach(array('html','htm', 'shtml', 'w') as $ext)
            {
                if (file_exists($fileName.'/index.'.$ext) === true)
                {
                    header("Location: ".$urlString.'/index.html');
                    break;
                }
            }            
        }
        elseif (file_exists($fileName) === true)    
        {
            ob_clean();
            $extensionName = self::get_extension($fileName);
            //echo $extensionName;
            
            //return;
            if (in_array($extensionName, array('jpg', 'jpeg')))
            {                
                //echo 'jpg handler';
                //return;
                
                header('Content-type:image/jpeg');
                //header('Content-Length: '.filesize($fileName));
                //require $fileName;
                readfile($fileName);
                exit;
            }
            elseif (in_array($extensionName, array('png')))
            {
                header('Content-type:image/png');
                readfile($fileName);
                exit;
            }
            elseif (in_array($extensionName, array('css')))
            {
                header('Content-type:text/css');
                require_once $fileName;
                exit;
            }
            elseif (in_array($extensionName, array('js')))
            {
                header('Content-type:application/javascript');
                require_once $fileName;
                exit;
            }
            elseif (in_array($extensionName, array('txt')))
            {
                header('Content-type:text/plain');
                require_once $fileName;
                exit;
            }
            elseif (in_array($extensionName, array('ttf')))
            {
                header('application/octet-stream');
                readfile($fileName);
                exit;
            }
            else
            {
            //echo $fileName;
            //return;
            
                
                require_once $fileName;
                //header("Location: ".$urlString);
            }
            //header("Location: ".$urlString);
        }
    }
    
    private function InitVersionArray()
    {
        if ($this->versionArray === null)
        {
            $lock = new PHPLock('lock/', 'lockversioninfo' );
            $lock->startLock();
                
            if ($this->versionArray === null)
            {            
                $targetFile = 'appMetadata_in_server.json';
                $this->tree(dirname(__FILE__), $targetFile);
                $this->versionArray = self::$PathVersion;
            }

            $lock->unlock();
            $lock->endLock();
        }
        
        return false;
    }
    
    private function get_extension($file)
    {
        return strtolower(substr(strrchr($file, '.'), 1));
    }
        
    /**********************
    一个简单的目录递归函数
    第一种实现办法：用dir返回对象
    ***********************/
    public static function tree($directory, $targetFile) 
    { 
        $mydir = dir($directory); 
        //echo "<ul>\n"; 
        while($file = $mydir->read())
        { 
            if((is_dir("$directory/$file")) AND ($file!=".") AND ($file!="..")) 
            {
                if (file_exists("$directory/$file/".$targetFile)) 
                {
                    //echo "<li><font color=\"#ff00cc\"><b>$file</b></font></li>\n"; 
                    //self::tree("$directory/$file", $targetFile);
                    self::$PathVersion[self::UrlPath("$directory/$file/")] = self::readJsonFile("$directory/$file/".$targetFile, self::UrlPath("$directory/$file/"));
                }
                else
                {
                    //echo "<li><font color=\"#ff00cc\"><b>$file</b></font></li>\n"; 
                    self::tree("$directory/$file", $targetFile); 
                }
            }
            elseif ($file == $targetFile)
            {
                //echo $directory."\\".$targetFile;
                self::$PathVersion[self::UrlPath($directory)] = self::readJsonFile($directory."\\".$targetFile, self::UrlPath($directory));
            }
        } 
        //echo "</ul>\n"; 
        $mydir->close(); 
    } 
    
    /**
     * Read appMetadata_in_server.json file content.
     * return mode, version, indexURL, path array.
     */
    public static function readJsonFile($file, $path)
    {
        $json = json_decode(file_get_contents($file), true);
        $resourceInfo = $json["resourceInfo"];
        $resourceInfo['path'] = $path;
        return $resourceInfo;
    }
    
    private static function UrlPath($diskPath)
    {
        if (strpos($diskPath, '/') === false)
        {
            return '/';
        }
        else
        {
            $result = substr($diskPath, strlen(dirname(__FILE__)));
            //echo $result;
            return $result;
        }
    }
    
    public static function NeedVersionControll($url)
    {
        $fixUrl = '';
        if (empty($url))
        {
            $fixUrl = '/';
            return false;
        }
        
        if (strrpos($url, '/') === 0 )
        {
            $fixUrl = '/';
        }
        elseif (strrpos($url, '/') > 0 )
        {
            $fixUrl = substr($url, 0, strrpos($url, '/')+1);
        }
        
        //echo $fixUrl.'<br/>';
        
        if ( !empty(self::$PathVersion) && count(self::$PathVersion) > 0)
        {
            $tmpKeys = array();
            foreach(self::$PathVersion as $key => $value)
            {
                array_push($tmpKeys, $key);
            }
            
            rsort($tmpKeys);
            
            //var_dump($tmpKeys);
            foreach($tmpKeys as $key)
            {
                if (strlen($key) > 1)
                {
                    $cmplen = strlen($key);
                    if (strlen($fixUrl) >= $cmplen)
                    {
                        if (substr($key, 0, $cmplen) === substr($fixUrl, 0, $cmplen))
                        {
                            //echo 'key:'.$key.'fixurl:'.$fixUrl."<br/>";
                            return self::$PathVersion[$key];
                        }
                    }
                }
            }
            
            if (count($tmpKeys) > 0 and $tmpKeys[count($tmpKeys) - 1] === '/')
            {
                return self::$PathVersion['/'];
            }
        }
        
        return null;
    }
    
    public static function NeedUpdatePath($key, $latestVerionPath, $url)
    {
        $keyArray = explode('/', $key);
        //var_dump($keyArray);
        $realKey = $keyArray[count($keyArray) - 2];
        //echo $realKey;
        //echo '<br/>';
        
        $realUrl = substr($url, strlen($key));
        //echo '<br/>realUrl:'.$realUrl;
        
        if (strpos($realUrl, '/'.$realKey.'/') != false)
        {
            $realVersion = substr($realUrl, 0, strpos($realUrl, '/'.$realKey.'/'));
            if ($realVersion !== $latestVerionPath)
            {
                //echo '<br/>'.$key.$latestVerionPath.substr($realUrl, strpos($realUrl, '/'.$realKey.'/'));
                return $key.$latestVerionPath.substr($realUrl, strpos($realUrl, '/'.$realKey.'/'));
            }
        }
        
        //echo '<br/>realUrl:'.$realUrl;
        return $url;
    }
}

?>