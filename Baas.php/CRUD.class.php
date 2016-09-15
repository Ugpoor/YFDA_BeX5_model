<?php

namespace com\justep\baas\action;

class CRUD
{   
    private static $QUERY_MASTER_VAR_NAME = "_sys_master_value_";
    public static $QUERY_TREE_PARENT_VAR_NAME = "_sys_tree_parent_value_";
    
	private static function isOracle($pdo) {
		$driverName = $pdo->getAttribute(\PDO::ATTR_DRIVER_NAME);
        //echo $driverName.'<br/>';
		return is_numeric(stripos($driverName, "oracle")) || is_numeric(stripos($driverName, "oci"));  
	}
	
    public static function sqlQuery($paramsObject, $context)
    {
        //self::query($paramsObject, $context);
		$db = $paramsObject["db"];
		$sql = isset($paramsObject["sql"]) ? $paramsObject["sql"] : '';
		$countSql = isset($paramsObject["countSql"]) ? $paramsObject["countSql"] : '';
        $tableName = isset($paramsObject["tableName"]) ? $paramsObject["tableName"] : '';
        $columns = isset($paramsObject["columns"]) ? $paramsObject["columns"] : ''; // 列定义
		$limit = isset($paramsObject["limit"]) ? $paramsObject["limit"] : ''; // 分页查询的行数
		$offset = isset($paramsObject["offset"]) ? $paramsObject["offset"] : ''; // 分页查询的行偏移
		//var_dump($columns);
		$filter = null;
		if (isset($paramsObject["filter"]))
        {
            $filter = $paramsObject["filter"];
        }
		$orderBy = null;
        if (isset($paramsObject["orderBy"]))
        {
            $orderBy = $paramsObject["orderBy"];
        }
		$variables = self::GetVariables($paramsObject);
		$table = null;
		$pdo = $context->Connection($db);        
        
        if ($pdo == null)
        {
            die('Database connection is invalid.');
        }
		//filter整句替换
		if($filter != null){
			$sql = str_replace("::filter",$filter,$sql);
			$countSql = str_replace("::filter",$filter,$countSql);
			
		}
		
		//name整句替换
        if (isset($paramsObject["name"])){
			$name = $paramsObject["name"];
			//echo $name;
			$sql = str_replace("::name",$name,$sql);
			$countSql = str_replace("::name",$name,$countSql);
		}
		
		//order整句替换
		if($orderBy != null){
			$sql = str_replace("::orderBy"," order By ".$orderBy,$sql);
			$countSql = str_replace("::orderBy"," order By ".$orderBy,$countSql);
		}
		//var_dump($variables);
		//echo $sql;
		//echo $tableName;
		$ociMetas = array();
        if (self::isOracle($pdo))
        {            
            $rs = $pdo->query("select COLUMN_NAME, DATA_TYPE
                from user_tab_cols
                where table_name = '".$tableName."'
                order by column_id");
            //echo $tableName;
            $i = 0;
            foreach ($rs as $row) {
                $temp = array();
                $temp['name'] = $row['COLUMN_NAME'];
                $temp['type'] = $row['DATA_TYPE'];
                $ociMetas[$i++] = $temp;
            }
        }
		//echo $sql;
		$table = \baas\data\Util::queryDataBySQL ( $pdo, $sql, $variables, $columns, $offset, $limit, $ociMetas );
		
		
		if ($offset == 0) {
			$total = \baas\data\Util::getValueBySQL($pdo, $countSql, $variables);
			//echo $total;
			$table->setTotal(intval($total));
			$table->setOffset(0);
		}
		
		//echo 'line 25';
        //echo 'tablename:'.$tableName;
        //var_dump($table);
        
		$json = \baas\data\Transform::tableToJson( $table );
        
        $jsonHtml = json_encode ( $json );
        //echo $jsonHtml;
        //echo $jsonHtml;
        echo(urldecode($jsonHtml));
    }
    
    public static function query($paramsObject, $context)
    {        
        //var_dump($paramsObject);
        $db = $paramsObject["db"];
        $tableName = $paramsObject["tableName"];
        $columns = isset($paramsObject["columns"]) ? $paramsObject["columns"] : ''; // 列定义
		$limit = isset($paramsObject["limit"]) ? $paramsObject["limit"] : ''; // 分页查询的行数
		$offset = isset($paramsObject["offset"]) ? $paramsObject["offset"] : ''; // 分页查询的行偏移
        
        $orderBy = null;
        if (isset($paramsObject["orderBy"]))
        {
            $orderBy = $paramsObject["orderBy"];
        }
        
        $condition = null;
        if (isset($paramsObject["condition"]))
        {
            $condition = $paramsObject["condition"];
        }
        
        $filter = null;
        if (isset($paramsObject["filter"]))
        {
            $filter = $paramsObject["filter"];
        }
        
        $variables = self::GetVariables($paramsObject);
		//var_dump($variables);
        
        $filters = array();
        if (!empty($condition))
        {
            array_push($filters, $condition);
        }
        
        if (!empty($filter))
        {
            array_push($filters, $filter);
        }
        
        // 处理主从
        if (isset($paramsObject["master"]))
        {
            $master = $paramsObject["master"];
            if (isset($master["field"]))
            {
                array_push($filters, $master["field"]." = :".self::$QUERY_MASTER_VAR_NAME);
                $variables[QUERY_MASTER_VAR_NAME] = $master["value"];
            }
        }
        
        // 树形数据
        //bool isTree = false;
        $treeDelayLoad = true;
        if (isset($paramsObject["tree"]))
        {
            //isTree = true;
            $treeOption = $paramsObject["tree"];
            $treeDelayLoad = $treeOption["isDelayLoad"];
            $parentField = $treeOption["parentField"];
            $idField = $treeOption["idField"];
            if ($treeDelayLoad)
            {
                //分级加载增加根据父的过滤条件
                $rootFilter = $treeOption["rootFilter"];
                $parentValue = $treeOption["parentValue"];
                if (null != $parentValue)
                {
                    array_push($filters, parentField." = :".self::$QUERY_TREE_PARENT_VAR_NAME);
                    $variables[QUERY_TREE_PARENT_VAR_NAME] = $parentValue;
                }
                else {
                    if (null == rootFilter) filters.Add(parentField + " is null");//默认根条件就是 parent is null
                    else filters.Add(rootFilter);
                }
            }
        }
        
        $pdo = $context->Connection($db);        
        
        if ($pdo == null)
        {
            die('Database connection is invalid.');
        }
        //var_dump($variables);
		$table = \baas\data\Util::queryData ( $pdo, $tableName, $columns, $filters, $orderBy, $variables, $offset, $limit );
        
        //echo 'line 25';
        //echo 'tablename:'.$tableName;
        //var_dump($table);
        
		$json = \baas\data\Transform::tableToJson( $table );
        
        $jsonHtml = json_encode ( $json );
        //echo $jsonHtml;
        //echo $jsonHtml;
        echo(urldecode($jsonHtml));
    }
    
    public static function save($jObject, $context)
    {      
        //var_dump($jObject);
        $pdo = $context->Connection($jObject["db"]);               
        
        
        //$tableName = $jObject["tableName"];
        $tables = $jObject["tables"]; // 订单数据的JSON格式
        $permissions = $jObject["permissions"];		
        
        foreach($tables as $jsonTable)
        {
            // JSON转换Table
            $table = \baas\data\Transform::jsonToTable($jsonTable);
            //var_dump($table);
            $tableName = $table->getTableName();

            
            // 开启事务
            $pdo->beginTransaction ();
            try {
                // 保存Table
                \baas\data\Util::saveData ( $pdo, $table, $tableName );
                // 提交事务
                $pdo->commit ();
            } catch ( PDOException $e ) {
                // 如果发生异常，首先回滚事务，然后把异常继续抛出
                $pdo->rollback ();
                throw $e;
            }            
        }
    }
    
    private static function GetVariables($paramsObject)
    {
        $variableFlag = "var-";

        if (isset($paramsObject["variables"]))
        {
            $variables = $paramsObject["variables"];
        }
        else
        {
            $variables = array();
        }
        
        foreach ($paramsObject as $key => $value)
        {
            //echo $key."index:".(strpos($key, "table") === 0)."<br/>";
            if (strpos($key, $variableFlag) === 0)
            {
                $varName = substr($key, strlen($variableFlag));
                if (!isset($variables[$varName]))
                {
                    $variables[$varName] = $value;
                }
            }
        }
        //var_dump($variables);

        return $variables;
    }
}

?>