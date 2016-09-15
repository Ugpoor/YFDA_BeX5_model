<?php

namespace justep;

class Demo {
	private static $DATASOURCE_TAKEOUT = "takeout";

	public static function getOrderCount($params, $context) {
        $pdo = $context->Connection(self::$DATASOURCE_TAKEOUT);  
        
        $sql = "SELECT COUNT(ord.fID) AS orderCount "
                . " FROM takeout_order ord ";
        $count = \baas\data\Util::getValueBySQL($pdo, $sql, null);

        $ret = array();
        $ret["orderCount"] = $count;
        
        echo json_encode($ret);
	}

}

?>