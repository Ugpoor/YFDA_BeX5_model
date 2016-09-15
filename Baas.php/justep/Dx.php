<?php

namespace justep;

class Dx {
    private static $DATASOURCE_TAKEOUT = "takeout";
    
    public static function DuanXinCheck($params, $context) {
        
    }
    
    public static function login($params, $context) {
        $columns = self::GetParam("columns");
        $limit = self::GetParam("limit");
        $offset = self::GetParam("offset");
        
        $pdo = $context->Connection(self::$DATASOURCE_TAKEOUT);  
        
        $sql = "select * from user_info u where u.fPhoneNumber = :fPhoneNumber and u.fPassWord = :fPassWord";
        $sqlParams[":fPhoneNumber"] = self::GetParam("fPhoneNumber", "");
        $sqlParams[":fPassWord"] = self::GetParam("fPassWord", "");
        
        try{
            //$table = \baas\data\Util::queryDataBySQL($pdo, $sql, $sqlParams, $columns, $offset, $limit, null);            
            //echo json_encode($table);
        }
        catch (Exception $e)
        {
            var_dump($e);
        }
    }
    
    private static function GetParam($index, $defaultValue = null) {
        return isset($_REQUEST[$index]) ? $_REQUEST[$index] : $defaultValue;
    }        
}

?>