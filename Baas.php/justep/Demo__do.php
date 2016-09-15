
	
<?php
// namespace justep	
	
class Demo__do {
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
	
	
	
    public static function queryUser($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,99,111,117,110,116,83,113,108,34,58,34,83,69,76,69,67,84,32,67,79,85,78,84,40,102,73,68,41,32,70,82,79,77,32,116,97,107,101,111,117,116,95,117,115,101,114,32,87,72,69,82,69,32,40,48,61,58,117,115,101,83,101,97,114,99,104,41,32,111,114,32,40,102,73,68,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,78,97,109,101,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,80,104,111,110,101,78,117,109,98,101,114,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,65,100,100,114,101,115,115,32,76,73,75,69,32,58,115,101,97,114,99,104,41,34,44,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,115,113,108,34,58,34,83,69,76,69,67,84,32,117,46,102,73,68,44,32,117,46,102,78,97,109,101,44,32,117,46,102,80,104,111,110,101,78,117,109,98,101,114,44,32,117,46,102,65,100,100,114,101,115,115,44,32,67,79,85,78,84,40,111,114,100,46,102,73,68,41,32,65,83,32,111,114,100,101,114,67,111,117,110,116,32,70,82,79,77,32,116,97,107,101,111,117,116,95,117,115,101,114,32,117,32,76,69,70,84,32,74,79,73,78,32,116,97,107,101,111,117,116,95,111,114,100,101,114,32,111,114,100,32,79,78,32,117,46,102,73,68,32,61,32,111,114,100,46,102,85,115,101,114,73,68,32,87,72,69,82,69,32,40,48,61,58,117,115,101,83,101,97,114,99,104,41,32,111,114,32,40,117,46,102,73,68,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,117,46,102,78,97,109,101,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,117,46,102,80,104,111,110,101,78,117,109,98,101,114,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,117,46,102,65,100,100,114,101,115,115,32,76,73,75,69,32,58,115,101,97,114,99,104,41,32,71,82,79,85,80,32,66,89,32,117,46,102,73,68,44,32,117,46,102,78,97,109,101,44,32,117,46,102,80,104,111,110,101,78,117,109,98,101,114,44,32,117,46,102,65,100,100,114,101,115,115,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,117,115,101,114,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,118,97,114,45,117,115,101,83,101,97,114,99,104,34,58,48,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = com\justep\baas\action\CRUD::sqlQuery($paramsObject, $context);
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
	
	
	
    public static function saveUser($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,112,101,114,109,105,115,115,105,111,110,115,34,58,123,34,116,97,107,101,111,117,116,95,117,115,101,114,34,58,34,34,125,125);
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
	
	
	
    public static function getOrderCount($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,125);
        $publicParams = self::ByteArrayToJson($publicParamBytes);

        self::InitActionParams($privateParams, $publicParams, $paramsObject);
        
        try
        {		
            $ret = justep\Demo::getOrderCount($paramsObject, $context);
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

        $privateParamBytes =  array(123,34,99,111,110,100,105,116,105,111,110,34,58,34,40,48,61,58,117,115,101,83,101,97,114,99,104,41,32,111,114,32,40,102,85,115,101,114,78,97,109,101,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,80,104,111,110,101,78,117,109,98,101,114,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,65,100,100,114,101,115,115,32,76,73,75,69,32,58,115,101,97,114,99,104,32,79,82,32,102,67,111,110,116,101,110,116,32,76,73,75,69,32,58,115,101,97,114,99,104,41,34,44,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,111,114,100,101,114,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,34,118,97,114,45,117,115,101,83,101,97,114,99,104,34,58,48,125);
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
	
	
	
    public static function saveOrder($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,112,101,114,109,105,115,115,105,111,110,115,34,58,123,34,116,97,107,101,111,117,116,95,111,114,100,101,114,34,58,34,34,125,125);
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
	
	
	
    public static function queryRegionTree($paramsObject, $context){
        $selfContext = null == $context;
        if ($selfContext)
        {
            $context = new ActionContext(self::DbConfig());
        }

        $privateParamBytes =  array(123,34,100,98,34,58,34,116,97,107,101,111,117,116,34,44,34,116,97,98,108,101,78,97,109,101,34,58,34,116,97,107,101,111,117,116,95,114,101,103,105,111,110,34,125);
        $privateParams = self::ByteArrayToJson($privateParamBytes);
        $publicParamBytes = array(123,125);
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
	
	
}

?>
	
	