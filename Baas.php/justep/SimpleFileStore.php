<?php

namespace takeout_admin;

class SimpleFileStore 
{
    static $docStorePath;
	static $docStoreDir;
    static $osSeparator;
    
	public static function service($params, $context) 
    {
        self::$osSeparator = self::Separator();
        //echo exec('whoami');
        self::$docStorePath = str_replace("model".self::$osSeparator."Baas.php","", APP_ROOT)."data".self::$osSeparator."attachmentSimple";
        //self::$docStorePath = "../../../model/UI2/demo/takeoutAdmin/data/attachmentSimple";
		//$file = file(self::$docStorePath);
        //echo self::$docStorePath;
        //return;
		if(!file_exists(self::$docStorePath) && !is_dir(self::$docStorePath)){
            echo self::$docStorePath;
			mkdir(self::$docStorePath);
		}
        
		//self::$docStoreDir = file(self::$docStorePath);
        
		if($_SERVER['REQUEST_METHOD'] == "GET")
        {
			self::doGet();
		}
        else if($_SERVER['REQUEST_METHOD'] == "POST")
        {
			self::doPost();
		}
        
		return null;
	}
	
	/**
		get为获取文件 浏览或者下载
	**/
	private static function doGet()
	{
		$operateType = $_REQUEST["operateType"];
		if("copy" == $operateType){
			self::copyFile();
		}else{
			self::getFile();
		}
	}
	
	
	private static function copyFile()
    {
		$ownerID = self::GetParam("ownerID");
		$targetOwnerID = self::GetParam("targetOwnerID");
		$storeFileName = self::GetParam("storeFileName");
		$file = file(docStorePath + File.separator +ownerID + File.separator + storeFileName);
		$targetFile = new File(docStorePath + File.separator + targetOwnerID + File.separator + storeFileName);
		FileUtils.copyFile(file, targetFile);
	}
	
	
	private static $BUFFER_SIZE = 262144;
    
	private static function getFile() 
    {
		$ownerID = self::GetParam("ownerID");
		$realFileName = urldecode(self::GetParam("realFileName"));
		$storeFileName = self::GetParam("storeFileName");
		$operateType = self::GetParam("operateType");
		/*String fileSize = request.getParameter("fileSize");*/    
        ob_clean();
        header('Content-type:image/jpeg; charset=utf-8');
        if (!file_exists(self::$docStorePath .self::$osSeparator. $ownerID .self::$osSeparator. $storeFileName))
        {
            exit;
        }
        
        if ($stream = fopen(self::$docStorePath .self::$osSeparator. $ownerID .self::$osSeparator. $storeFileName, 'r')) {
            // print all the page starting at the offset 10
            echo stream_get_contents($stream, -1, 0);

            fclose($stream);
        }
        
        exit;
	}

	/**
		post为上传
	**/
	protected static function doPost()
	{
		
		$contentType = $_SERVER["CONTENT_TYPE"];
		try {
			if("application/octet-stream" == $contentType){
				self::storeOctStreamFile();
			}else if($contentType !=null && strpos($contentType, "multipart/") === 0){
				self::storeFile();
			}else{
				throw new Exception("not supported contentType");
			}
		} catch (Exception $e) {
			echo $e->getMessage();
			throw new Exception("storeFile异常");
		}
	}

	private static function storeOctStreamFile() 
    {
		$in = null;
		$storeStream = null;
		try{
			$ownerID = self::GetParam("ownerID");
			$storeFileName = self::GetParam("storeFileName");
			
			$in = $GLOBALS['HTTP_RAW_POST_DATA'];
			$storePath = $docStorePath .self::$osSeparator. $ownerID;
			self::getOrCreateFile($storePath);
			$toStoreFile = new File($storePath .self::$osSeparator. $storeFileName);
	        $storeStream = new FileOutputStream(toStoreFile);
	        IOUtils::copy($in, $storeStream);
		}
        catch(Exception $e)
        {
            echo $e->getMessage();
        }
        
        IOUtils::closeQuietly(in);
        IOUtils::closeQuietly(storeStream);
	}
	
	private static function getOrCreateFile($path) {
		$storeDir = file($path);
        if(!($storeDir.exists() && is_dir($storeDir))){
            mkdir($path);
        }
        return $storeDir;
	}
	
	public static function parseMultipartRequest() 
    {
		$postData = isset($GLOBALS['HTTP_RAW_POST_DATA']) ? $GLOBALS['HTTP_RAW_POST_DATA'] : null;
        var_dump($_POST);
        var_dump($_FILES);
        exit;
        
		return $items;
	}
	
	private static function storeFile() 
    {        
        if (!isset($_FILES['userfile']))
        {
            die('The userfile is invalid.');
        }
        
        $upload_file = isset($_FILES['userfile']['tmp_name']) ? $_FILES['userfile']['tmp_name'] : '';
        if ($upload_file)
        {
            $upload_file_name = self::GetParam('storeFileName');
            //$upload_file_size = isset($_FILES['userfile']['size']) ? $_FILES['userfile']['size'] : ''; 
            
            $storeDir = self::$docStorePath.self::$osSeparator.self::GetParam("ownerID");
            if(!(file_exists($storeDir) && is_dir($storeDir))){
                mkdir($storeDir);
            }
            
            // 检查读写文件  
            if (file_exists($storeDir.$upload_file_name)) {  
                die("The file is exist.");                
            }
            
            //复制文件到指定目录  
            if (!move_uploaded_file($upload_file, $storeDir.self::$osSeparator.$upload_file_name)) {  
                die("Copy file faild.");
            }  
        }				
	}

	private static function GetParam($index, $defaultValue = null) {
        return isset($_REQUEST[$index]) ? $_REQUEST[$index] : $defaultValue;
    }  

    public static function Separator()
    {
        $os_name = php_uname('s');
        //echo $os_name;
        if ($os_name == 'Darwin')
        {
            return '/';
        }
        elseif (strpos($os_name, 'Windows') != -1)
        {
            return '\\';
        }
        else
        {
            return '/';
        }
    }
}

?>