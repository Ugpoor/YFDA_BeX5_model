
	
<?php
// namespace justep;	

require_once(APP_ROOT.'/justep/Takeout.php');

	
class Takeout__do {
    public static $ActionUtil;

    private static $DbConfigBytes = array(123,34,97,99,99,111,117,110,116,34,58,34,106,97,118,97,58,99,111,109,112,47,101,110,118,47,97,99,99,111,117,110,116,34,44,34,116,97,107,101,111,117,116,34,58,34,106,97,118,97,58,99,111,109,112,47,101,110,118,47,116,97,107,101,111,117,116,34,44,34,116,97,111,98,97,111,34,58,34,106,97,118,97,58,99,111,109,112,47,101,110,118,47,116,97,111,98,97,111,34,125);
    
    private static function InitActionParams($privateParams, $publicParams, &$params)
    {
        $privateArray = $privateParams;
        foreach($privateArray as $k=>$v)
        {
            if (!array_key_exists($k, $params))
            {
                $params[$k] = $v;
            }
        }
        
        $publicArray = $publicParams;
        foreach($publicArray as $k=>$v)
        {
            if (!array_key_exists($k, $params))
            {
                $params[$k] = $v;
            }
        }
    }

	private static function DbConfig()
    {   
        return self::ByteArrayToJson(self::$DbConfigBytes);
    }
    
    private static function ByteArrayToJson($bytes)
    {
        $str = '';
        foreach($bytes as $ch)
        {
            $str .=chr($ch);
        }
        
        return json_decode($str); 
    }
	
	
	
    public static function queryFood($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,102,111,111,100,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,111,114,100,101,114,66,121,34,58,34,102,73,68,32,65,83,67,34,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = com\justep\baas\action\CRUD::query($paramsObject, $context);
            if ($selfContext)
            {
                $context->commit();
            }
            
            return $ret;
        }
        catch (Exception $e)
        {
            try
            {
                if ($selfContext)
                {
                    $context->rollback();
                }
            }
            catch (Exception $e1)
            {                    
            }

            echo $e->getMessage();
        }
    }	
	
	
	
    public static function queryUser($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,117,115,101,114,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,111,114,100,101,114,66,121,34,58,34,102,73,68,32,65,83,67,34,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = com\justep\baas\action\CRUD::query($paramsObject, $context);
            if ($selfContext)
            {
                $context->commit();
            }
            
            return $ret;
        }
        catch (Exception $e)
        {
            try
            {
                if ($selfContext)
                {
                    $context->rollback();
                }
            }
            catch (Exception $e1)
            {                    
            }

            echo $e->getMessage();
        }
    }	
	
	
	
    public static function queryOrder($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,111,114,100,101,114,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,111,114,100,101,114,66,121,34,58,34,102,67,114,101,97,116,101,84,105,109,101,32,68,69,83,67,34,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = com\justep\baas\action\CRUD::query($paramsObject, $context);
            if ($selfContext)
            {
                $context->commit();
            }
            
            return $ret;
        }
        catch (Exception $e)
        {
            try
            {
                if ($selfContext)
                {
                    $context->rollback();
                }
            }
            catch (Exception $e1)
            {                    
            }

            echo $e->getMessage();
        }
    }	
	
	
	
    public static function save($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,112,101,114,109,105,115,115,105,111,110,115,34,58,123,34,116,97,107,101,111,117,116,95,111,114,100,101,114,34,58,34,34,44,34,116,97,107,101,111,117,116,95,117,115,101,114,34,58,34,34,125,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = com\justep\baas\action\CRUD::save($paramsObject, $context);
            if ($selfContext)
            {
                $context->commit();
            }
            
            return $ret;
        }
        catch (Exception $e)
        {
            try
            {
                if ($selfContext)
                {
                    $context->rollback();
                }
            }
            catch (Exception $e1)
            {                    
            }

            echo $e->getMessage();
        }
    }	
	
	
	
    public static function queryAddr($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,120,34,58,34,51,57,46,56,54,50,50,57,51,52,51,57,57,57,57,57,34,44,34,121,34,58,34,49,49,54,46,52,53,55,54,52,49,57,49,57,57,57,57,57,55,34,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = justep\Takeout::queryAddr($paramsObject, $context);
            if ($selfContext)
            {
                $context->commit();
            }
            
            return $ret;
        }
        catch (Exception $e)
        {
            try
            {
                if ($selfContext)
                {
                    $context->rollback();
                }
            }
            catch (Exception $e1)
            {                    
            }

            echo $e->getMessage();
        }
    }	
	
	
}

?>
	
	