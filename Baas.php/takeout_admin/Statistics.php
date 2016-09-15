<?php

namespace takeout_admin;

class Statistics 
{
    
	public static function getCuisineStatistics($params, $context) 
    {
		$startDate = isset($_REQUEST["startDate"]) ? $_REQUEST["startDate"] : null;
		$endDate = isset($_REQUEST["endDate"]) ? $_REQUEST["endDate"] : null;
		
		$sqlParams = array();
        array_push($sqlParams, $startDate);
		array_push($sqlParams, $endDate);
		//$startDate = '2016-03-04 16:44:47';
        //$endDate = '2014-03-04 16:44:47';
		
		$table = null;
		$conn = $context->Connection("demo");
		$sql = "";
		try{
			if($startDate != null && $endDate != null){
				$sql = "SELECT SUM(ord.fSum) AS daySum ,count(*) AS count,avg(ord.fSum) AS price,date(fCreateTime) AS times FROM takeout_order ORD where ord.fCreateTime between ? and ? GROUP BY date(ord.fCreateTime)";
				$table = \baas\data\Util::queryDataBySQL($conn, $sql, $sqlParams, null, null, null);
			}else{
				$sql = "SELECT SUM(ord.fSum) AS daySum ,count(*) AS count,avg(ord.fSum) AS price,date(fCreateTime) AS times FROM takeout_order ORD GROUP BY date(ord.fCreateTime)";
				$table = \baas\data\Util::queryDataBySQL($conn, $sql, null, null, null, null);                
			}			
			
			$result = \baas\data\Transform::tableToJson($table);
            echo json_encode($result);
			
		}
        catch(Exception $e)
        {
            echo $e->getMessage();
        }
	}
}

?>