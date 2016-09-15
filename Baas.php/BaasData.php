<?php
namespace baas\data;

class DataType {
	const DT_STRING = "String";
	const DT_INTEGER = "Integer";
	const DT_LONG = "Long";
	const DT_FLOAT = "Float";
	const DT_DOUBLE = "Double";
	const DT_DECIMAL = "Decimal";
	const DT_BOOLEAN = "Boolean";
	const DT_DATE = "Date";
	const DT_TIME = "Time";
	const DT_DATETIME = "DateTime";
}

class DatabaseType {
    const MySql = 'mysql';
    const MSSql = 'mssql';
    const Oracle = 'oracle';
    const Sybase = 'sybase';
}

class RowState {
	const RS_NONE = "none";
	const RS_NEW = "new";
	const RS_EDIT = "edit";
	const RS_DELETE = "delete";
}

class ColumnValue {
	private $__value;
	private $__oldValue;
	private $__changed;

	public function __construct($value, $oldValue = null, $changed = false) {
		$this->__value = $value;
		$this->__oldValue = $oldValue;
		$this->__changed = $changed;
	}
	
	public function getValue() {
		return $this->__value;
	}

	public function getOldValue() {
		return $this->__oldValue;
	}

	public function isChanged() {
		return $this->__changed;
	}
}

class Row {
	private $__columnValues;
	private $__rowState;

 	public function __construct($columnValues, $rowState = RowState::RS_NONE) {
 		$this->__columnValues = $columnValues;
 		$this->__rowState = $rowState;
 	}
 	
	public function  getState() {
		return $this->__rowState;
	}
	
	public function getColumnValue($column) {
        if (array_key_exists($column, $this->__columnValues))
        {
		  return $this->__columnValues[$column];
        }
        
        return null;
	}
	
	public function getValue($column) {
		return $this->__columnValues[$column]->getValue();
	}

	public function getOldValue($column) {
		return $this->__columnValues[$column]->getOldValue();
	}

	public function isChanged($column) {
		return $this->__columnValues[$column]->isChanged();
	}
}

class Table {
	private $__columnTypes;
	private $__idColumn = null;
	private $__total = null;
	private $__offset = null;
    private $__tableName = null;

	private $__rows = array();

	public function __construct($columnTypes) {
		$this->__columnTypes = $columnTypes;
	}
    
    public function setTableName($tableName) {
        $this->__tableName = $tableName;
    }        
    
    public function getTableName() {
        return $this->__tableName;
    }    

	public function getColumnNames() {
		return array_keys($this->__columnTypes);
	}
    
    public function setColumnNames($value)
    {
        $this->__columnTypes = $value;
    }

    public function setColumnTypes($columnTypes) {
		$this->__columnTypes = $columnTypes;
	}
    
	public function getColumnTypes() {
		return array_values($this->__columnTypes);
	}

	public function getColumnType($column) {
		return $this->__columnTypes[$column];
	}

	public function appendRow($row) {
		$this->__rows[] = $row;
	}

	public function appendRows($rows) {
		foreach ($rows as $row) {
			$this->appendRow($row);
		}
	}

	public function getRows($rowState = null) {
		$result = array();
		foreach ($this->__rows as $row) {
			if (($rowState == null) or ($row->getState() == $rowState)) {
				$result[] = $row;
			}
		}
		return $result;
	}

	public function getIDColumn() {
		return $this->__idColumn;
	}

	public function setIDColumn($idColumn) {
		$this->__idColumn = $idColumn;
	}

	public function getTotal() {
		return $this->__total;
	}

	public function setTotal($total) {
		$this->__total = $total;
	}

	public function getOffset() {
		return $this->__offset;
	}

	public function setOffset($offset) {
		$this->__offset = $offset;
	}
}

class Transform {
	const __DATE_FORMAT = "Y-m-d";
	const __TIME_FORMAT = "H:i:s.000"; //"HH:mm:ss.SSS";
	const __DATETIME_FORMAT = "Y-m-d\TH:i:s.000\Z"; //"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
	
	const __USER_DATA = "userdata";
	const __ID_COLUMN_NAME = "idColumnName";
	const __ID_COLUMN_TYPE = "idColumnType";
	const __COLUMN_NAMES = "relationAlias";
	const __COLUMN_TYPES = "relationTypes";
	
	const __TABLE_TOTAL = "sys.count";
	const __TABLE_OFFSET = "sys.offset";
	
	const __ROWS = "rows";
	const __ROW_STATE = "recordState";
	const __ROW_ID = "id";
	const __ROW_VALUE = "value";
	const __ROW_OLD_VALUE = "originalValue";
	const __ROW_VALUE_CHANGED = "changed";
	const __ROW_VALUE_ISCHANGED = 1;
	
	/**
	 * 将.w中data.toJson()的数据转换为Table
	 * @param array或string $json Table的JSON数据结构
	 * @return Table Table对象
	 */
	public static function jsonToTable($json) {
		if (is_string($json)) {
			$json = json_decode($json);
		}
		if (is_object($json)) {
			$json = Util::object_to_array($json);
		}
		
		$jsUserData = $json[self::__USER_DATA];
        
        //echo 'jsonToTable line 200.<br/>'.
        //var_dump($jsUserData);
	
		$columnTypes = array();
		if (array_key_exists(self::__ID_COLUMN_NAME, $jsUserData)) {
			$idColumn = $jsUserData[self::__ID_COLUMN_NAME];
			$idColumnType = $jsUserData[self::__ID_COLUMN_TYPE];
			$columnTypes[$idColumn] = $idColumnType;
		}
	
		$names = explode(",", $jsUserData[self::__COLUMN_NAMES]);
		$types = explode(",", $jsUserData[self::__COLUMN_TYPES]);
		for ($i = 0; $i < count($names); $i++) {
			$columnTypes[$names[$i]] = $types[$i];
		}
	
		$table = new Table($columnTypes);
	    $table->setTableName($jsUserData["tableName"]);
        
		if ($idColumn != null) {
			$table->setIDColumn($idColumn);
		}
		if (array_key_exists(self::__TABLE_TOTAL, $jsUserData)) {
			$table->setTotal($jsUserData[self::__TABLE_TOTAL]);
		}
		if (array_key_exists(self::__TABLE_OFFSET, $jsUserData)) {
			$table->setOffset($jsUserData[self::__TABLE_OFFSET]);
		}
	
		$jsRows = $json[self::__ROWS];
		$rows = array();
		foreach ($jsRows as $jsRow) {
			$row = self::jsonToRow($table, $jsRow);
			$rows[] = $row;
		}
		$table->appendRows($rows);
	
		return $table;
	}
	
	/**
	 * 将Table转换为.w中data可以加载的JSON数据结构
	 * @param Table $table Table对象
	 * @return array Table的JSON数据结构
	 */
	public static function tableToJson($table) {
		return self::__tableToJson($table, null);
	}
	
	/**
	 * 将Table转换为.w中data可以加载的树形JSON数据结构
	 * @param Table $table 必须指定Table的idColumn属性
	 * @param string $parentColumn 与Table的idColumn构成父子树
	 * @return array Table的JSON数据结构
	*/
	public static function tableToTreeJson($table, $parentColumn) {
		if ($parentColumn == null || $table->getIDColumn() == null) {
			throw new RuntimeException("转换树形结构必须指定Table的idColumn属性和parentColumn参数");
		}
		return self::__tableToJson($table, $parentColumn);
	}
	
	private static function __tableToJson($table, $parentColumn) {
		$jsTable = array("@type" => "table");
	
		$jsUserData = array();
		if ($table->getTotal() != null)	{
			$jsUserData[self::__TABLE_TOTAL] = $table->getTotal();
		}
		if ($table->getOffset() != null) {
			$jsUserData[self::__TABLE_OFFSET] = $table->getOffset();
		}
	
		$idColumn = $table->getIDColumn();
		if ($idColumn != null) {
			$jsUserData[self::__ID_COLUMN_NAME] = $idColumn;
			$jsUserData[self::__ID_COLUMN_TYPE] = $table->getColumnType($idColumn);
		}
        //var_dump($table->getColumnNames());
		$jsUserData[self::__COLUMN_NAMES] = implode(",", $table->getColumnNames());
		$jsUserData[self::__COLUMN_TYPES] = implode(",", $table->getColumnTypes());
		$jsTable[self::__USER_DATA] = $jsUserData;
	
		$jsRows = array();
		if ($parentColumn == null) {
			foreach ($table->getRows() as $row) {
                //var_dump($row);
				$jsRow = self::rowToJson($table, $row);
				//var_dump($jsRow);
                
                $jsRows[] = $jsRow;
			}
		} else {
			$parentMap = array();
			$childrenMap = array();
			foreach ($table->getRows() as $row) {
				$idValue = $row->getValue($idColumn);
				$parentValue = $row->getValue($parentColumn);

				$parentMap[$idValue] = self::rowToJson($table, $row);

				if ($parentValue != null) {
					if (!array_key_exists($parentValue, $childrenMap)) {
						$childrenMap[$parentValue] = array();
					}
					$childrenMap[$parentValue][] = &$parentMap[$idValue];
				}
				
				// find parent
				if (array_key_exists($parentValue, $parentMap)) {
					self::addJsonRowChild($parentMap[$parentValue], $parentMap[$idValue]);
				} else {
					$jsRows[] = &$parentMap[$idValue];
				}
				// find children
				if (array_key_exists($idValue, $childrenMap)) {
					for ($i = 0; $i < count($childrenMap[$idValue]); $i++) {
						self::addJsonRowChild($parentMap[$idValue], $childrenMap[$idValue][$i]);
						array_splice($jsRows, array_search($childrenMap[$idValue][$i], $jsRows), 1);
					}
				}
			}
		}
		$jsTable[self::__ROWS] = $jsRows;
	
		return $jsTable;
	}
	
	private static function addJsonRowChild(&$parent, &$child) {
		if (!array_key_exists(self::__ROWS, $parent)) {
			$parent[self::__ROWS] = array();
		}
		$parent[self::__ROWS][] = &$child;
	}
	
	private static function jsonToRow($table, $jsRow) {
		$columnValues = array();
		$rowState = RowState::RS_NONE;
	
		if (array_key_exists(self::__USER_DATA, $jsRow)) {
			$jsUserData = $jsRow[self::__USER_DATA];
			if (array_key_exists(self::__ROW_STATE, $jsUserData)) {
				$rowState = $jsUserData[self::__ROW_STATE];
			}
			if (array_key_exists(self::__ROW_ID, $jsUserData)) {
				$idColumn = $table->getIDColumn();
				$idColumnValue = self::jsonToColumnValue($jsUserData[self::__ROW_ID], $table->getColumnType($idColumn));
				$columnValues[$idColumn] = $idColumnValue;
			}
		}
		
		foreach ($table->getColumnNames() as $columnName) {
			if (array_key_exists($columnName, $jsRow)) {
				$columnValue = self::jsonToColumnValue($jsRow[$columnName], $table->getColumnType($columnName));
				$columnValues[$columnName] = $columnValue;
			}
		}
	
		return new Row($columnValues, $rowState);
	}
	
	private static function rowToJson($table, $row) {
		$jsRow = array();
	    
        //var_dump($table->getIDColumn());
		$jsUserData = array();
		$jsUserData[self::__ROW_STATE] = $row->getState();
		$idColumn = $table->getIDColumn();
		if ($idColumn != null) {
			$jsUserData[self::__ROW_ID] = self::columnValueToJson($row->getColumnValue($idColumn), $table->getColumnType($idColumn));
		}
		
		$jsRow[self::__USER_DATA] = $jsUserData;
	
        //var_dump($table->getColumnNames());
        //var_dump($row);
		foreach ($table->getColumnNames() as $columnName) {            
            //echo $columnName." columnName:".$table->getColumnType($columnName)."<br/>";
            //var_dump($row->getColumnValue($columnName));
            
			$jsRow[$columnName] = self::columnValueToJson($row->getColumnValue($columnName), $table->getColumnType($columnName));
            
            //var_dump($jsRow[$columnName]);
		}
	
		return $jsRow;
	}
	
	private static function jsonToColumnValue($jsColumnValue, $dataType) {
		$value = null;
		if (array_key_exists(self::__ROW_VALUE, $jsColumnValue)) {
			$value = self::jsonToValue($jsColumnValue[self::__ROW_VALUE], $dataType);
		}
		$changed = false;
		$oldValue = null;
		if (array_key_exists(self::__ROW_VALUE_CHANGED, $jsColumnValue)) {
			$changed = $jsColumnValue[self::__ROW_VALUE_CHANGED];
			$oldValue = isset($jsColumnValue[self::__ROW_OLD_VALUE]) ? self::jsonToValue($jsColumnValue[self::__ROW_OLD_VALUE], $dataType) : null;
		}
		return new ColumnValue($value, $oldValue, ($changed == self::__ROW_VALUE_ISCHANGED));
	}
	
	private static function columnValueToJson($columnValue, $dataType) {
		$jsColumnValue = array();
		if ($columnValue != null) {
			$jsColumnValue[self::__ROW_VALUE] = self::valueToJson($columnValue->getValue(), $dataType);
			if ($columnValue->isChanged()) {
				$jsColumnValue[self::__ROW_OLD_VALUE] = self::valueToJson($columnValue->getOldValue(), $dataType);
				$jsColumnValue[self::__ROW_VALUE_CHANGED] = self::__ROW_VALUE_ISCHANGED;
			}
		}
		return $jsColumnValue;
	}
	
	private static function jsonToValue($jsValue, $type) {
		if ($jsValue === null) {
			return null;
		}
		switch ($type) {
			case DataType::DT_DATE:
			case DataType::DT_TIME:
			case DataType::DT_DATETIME:
				// 这里其实是为了忽略时区的影响 
				return str_replace(array("T", "Z"), ' ', $jsValue);
			default:
				return $jsValue;
		}
	}
	
	private static function valueToJson($value, $type) {
		if ($value === null) {
			return null;
		}
        //echo "type:".$type."<br/>";
		switch ($type) {
			case DataType::DT_DATE:
				return date(self::__DATE_FORMAT, strtotime($value));
			case DataType::DT_TIME:
				return date(self::__TIME_FORMAT, strtotime($value));
			case DataType::DT_DATETIME:
                //echo "datetime:".date(self::__DATETIME_FORMAT, strtotime(urldecode($value)));
				return date(self::__DATETIME_FORMAT, strtotime(urldecode($value)));
			default: 
                $value = urldecode($value);
                //echo $value;
                $value = str_replace('"', '\\"', $value);
				$value = preg_replace("/\s/",'\r\n', $value);
                return urlencode($value);
		}
	}
	
	/**
	 * 按来自前端Data组件的列定义生成Table对象
	 * @param array $columnsDefine
	 * @return Table
	 */
	public static function createTableByColumnsDefine($columnsDefine) {
		$columnTypes = array();
		foreach ((array)$columnsDefine as $column => $columnDefine) {
            if (array_key_exists("name", (array)$columnDefine))
            {
                $columnTypes[$columnDefine["name"]] = $columnDefine["type"];
            }
		}
		$table = new Table($columnTypes);
		return $table;
	}
	
	/**
	 * 按来自前端Data组件的列定义，转换PDOStatement为Table
	 * @param \PDOStatement $stmt
	 * @param array $columnsDefine 来自前端Data的列定义
	 * @param int $count 行数，如果为null或小于零，则转换所有行
	 * @return Table Table对象
	 */
	public static function PDOStatementToTable($databaseType, $stmt, $columnsDefine, $count = null, $ociMetas = null) {
		$table = self::createTableByColumnsDefine($columnsDefine);
        
        //var_dump($table);
        
		self::loadRowsFromPDOStatement($databaseType, $table, $stmt, $count, $ociMetas);
        //var_dump($table);
            
		return $table;
	}
	
	/**
	 * 转换PDOStatement行数据到Table
	 * @param Table $table
	 * @param \PDOStatement $stmt
	 * @param int $count 行数，如果为null或小于零，则转换所有行
	 */
	public static function loadRowsFromPDOStatement($databaseType, &$table, $stmt, $count = null, $ociMetas = null) {
		$columnNameMap = array();
        
        if (count($table->getColumnNames()) == 0)
        {
            $typeArray = array();
            $nameArray = array();
            $length = $stmt->columnCount();
            if ($databaseType == DatabaseType::Oracle)
            {
                $length = count($ociMetas);
            }
            
            foreach (range(0, $length - 1) as $column_index)
            {
                //echo $column_index;
                if ($databaseType != DatabaseType::Oracle)
                {
                    $meta = $stmt->getColumnMeta($column_index);
                }
                
                //var_dump($meta);
                //echo $meta["native_type"];
                //rray_push($nameArray, $meta["name"]);
                //$dateType;
                if ($databaseType == DatabaseType::MySql)
                {
                    $native_type = $meta["native_type"];
                }
                else if ($databaseType == DatabaseType::MSSql)
                {                    
                    $native_type = strtoupper($meta["sqlsrv:decl_type"]);
                }
                else if ($databaseType == DatabaseType::Oracle)
                {
                    //var_dump($ociMetas);
                    //var_dump($ociMetas[$column_index]);
                    $native_type = $ociMetas[$column_index]['type'];
                    //echo $native_type;
                }
                
                if ($databaseType == DatabaseType::MySql || $databaseType == DatabaseType::MSSql)
                {
                    $fieldName = $meta["name"];
                }
                else if ($databaseType == DatabaseType::Oracle)
                {
                    $fieldName = $ociMetas[$column_index]['name'];
                }
                
                switch($native_type)
                {
                    case "VAR_STRING":
                    case "VARCHAR":
                    case "VARCHAR2":
                        $dateType[$fieldName] = DataType::DT_STRING;
                        break;
                        
                    case "DATETIME":
                        $dateType[$fieldName] = DataType::DT_DATETIME;
                        break;
                        
                    case "NEWDECIMAL":
                    case "DECIMAL":
                    case "NUMBER":
                        $dateType[$fieldName] = DataType::DT_FLOAT;
                        break;
                        
                    case "INT":
                        $dateType[$fieldName] = DataType::DT_INTEGER;
                        break;
                        
                    case "LONG":
                        $dateType[$fieldName] = DataType::DT_LONG;
                        break;
					default:
						$dateType[$fieldName] = DataType::DT_STRING;
                }
                
                //array_push($typeArray, $dateType);
            }
            //var_dump($dateType);
            //var_dump($nameArray);
            //var_dump($dateType);
            $table->setColumnTypes($dateType);
            //var_dump($table);
            //var_dump($table->getColumnNames());
        }
        
        foreach ($table->getColumnNames() as $columnName) {
            $columnNameMap[$columnName] = $columnName;
        }
        
        //var_dump($columnNameMap);

		$i = 0;
        //var_dump($stmt);
        
        $needTranscoding = false;
        if ($databaseType == DatabaseType::Oracle)
        {
            $needTranscoding = true;
        }
        
		while (($row = $stmt->fetch(\PDO::FETCH_ASSOC)) && ($count == null || $count < 0 || $i < $count)) {
			$columnValues = array();
            if (count($columnNameMap) > 0)
            {
                foreach ($row as $columnName => $value) {
                    if (array_key_exists($columnName, $columnNameMap)) {
                        if (!$needTranscoding)
                        {
                            $columnValues[$columnNameMap[$columnName]] = new ColumnValue(urlencode($value));
                        }
                        else
                        {
                            $columnValues[$columnNameMap[$columnName]] = new ColumnValue(urlencode(mb_convert_encoding($value, 'utf-8', 'gbk')));
                        }
                    }
                }
            }
            else
            {
                foreach ($row as $columnName => $value) {
                    if (!array_key_exists($columnName, $columnNameMap))
                    {
                        $columnNameMap[$columnName] = $columnName;
                    }
                    
                    if (!$needTranscoding)
                    {
                        $columnValues[$columnNameMap[$columnName]] = new ColumnValue(urlencode($value));
                    }
                    else
                    {
                        $columnValues[$columnNameMap[$columnName]] = new ColumnValue(urlencode(mb_convert_encoding($value, 'utf-8', 'gbk')));
                    }
                }
            }
            //var_dump(new Row($columnValues));       
            
			$table->appendRow(new Row($columnValues));
			$i++;
		}
        //$table->setColumnNames($columnNameMap);
	}
}

class Util {
	/**
	 * 转换json_decode返回的对象结构为数组结构
	 * @param object $object
	 * @return array
	 */
	public static function object_to_array($object) {
		if (is_object($object)) {
			$object = (array)$object;
		}
		if (is_array($object)) {
			foreach ($object as $key => $value) {
				$object[$key] = Util::object_to_array($value);
			}
		}
		return $object;
	}
	
	/**
	 * 将array连接成字符串
	 * @param array $array
	 * @param string $format 格式化字符串
	 * @param string $separator 分隔符
	 */
	public static function arrayJoin($array, $format, $separator) {
		$str = "";
		foreach ($array as $item) {
			if ($str != "") {
				$str = $str . $separator;
			}
			$str = $str . sprintf($format, $item);
		}
		return $str;
	}
	
	private static function isMysql($pdo) {
		$driverName = $pdo->getAttribute(\PDO::ATTR_DRIVER_NAME);
		return is_numeric(stripos($driverName, "mysql"));  
	}
    
    private static function isMssql($pdo) {
        $driverName = $pdo->getAttribute(\PDO::ATTR_DRIVER_NAME);
        //echo $driverName;
		return is_numeric(stripos($driverName, "sqlsrv"));  
    }

	private static function isOracle($pdo) {
		$driverName = $pdo->getAttribute(\PDO::ATTR_DRIVER_NAME);
        //echo $driverName.'<br/>';
		return is_numeric(stripos($driverName, "oracle")) || is_numeric(stripos($driverName, "oci"));  
	}
    
    private static function GetDatabaseType($pdo) {
        if (self::isMysql($pdo))
        {
            return DatabaseType::MySql;
        }
        
        if (self::isMssql($pdo))
        {
            return DatabaseType::MSSql;
        }
        
        if (self::isOracle($pdo))
        {
            return DatabaseType::Oracle;
        }
    }
	
	/**
	 * SQL数据查询
	 * @param PDO pdo
	 * @param string sql
	 * @param array params SQL参数数组
	 * @param array columnsDefine 列定义
	 * @param int offset 偏移行，null则不分页
	 * @param int limit 行数，null则不分页
	 * @return Table Table
	 */
	public static function queryDataBySQL($pdo, $sql, $params, $columnsDefine, $offset = null, $limit = null, $ociMetas = null) {
		if ($limit != null && $offset != null) {
			if (self::isMysql($pdo)) {
				$sql = $sql . " LIMIT " . $offset . "," . $limit;
			} else if (self::isOracle($pdo)) {
				$sql = sprintf("SELECT * FROM (SELECT rownum no___, A___.* FROM (%s) A___ WHERE rownum <= %d) WHERE no___ > %d", $sql, $offset + $limit, $offset);
			}
		}
        
        //var_dump($params);        
        //echo $sql;
		$stmt = $pdo->prepare($sql);
        //echo 'prepare';
		$stmt->execute($params);
        //echo 'execute';
		if ($limit != null && $offset != null && !self::isMysql($pdo) && !self::isOracle($pdo)) {
			for ($i = 0; $i < $offset; $i++) {
				$stmt->fetch();
			}
		}

		$table = Transform::PDOStatementToTable(self::GetDatabaseType($pdo), $stmt, $columnsDefine, $limit, $ociMetas);
		return $table;
	}

	/**
	 * 单表数据查询
	 * @param PDO pdo
	 * @param string tableName 表名
	 * @param array columnsDefine 列定义
	 * @param array filters 过滤条件列表
	 * @param string orderBy SQL的orderBy部分
	 * @param array params SQL参数数组
	 * @param int offset 偏移行
	 * @param int limit 行数
	 * @return Table
	 */
	public static function queryData($pdo, $tableName, $columnsDefine, $filters, $orderBy, $params, $offset = null, $limit = null) {
		$format = "SELECT %s FROM %s %s %s ";		
		
        if (self::isOracle($pdo))
        {
            $where = ($filters != null && count($filters) > 0) ? (" WHERE (" . implode(") AND (", $filters) . ") ") : "";
            
            if (strpos($orderBy, ",") === true)
            {
                $tempOrderBy = explode(",", $orderBy);
            }
            else
            {
                $tempOrderBy = array();
                array_push($tempOrderBy, $orderBy);
            }
            
            //var_dump($tempOrderBy);
            $preparedOrderBy = "";
            foreach($tempOrderBy as $item)
            {
                $tempStr = "";
                if (strpos($item, " ") == true)
                {
                    $strArray = explode(" ", $item);
                    //var_dump($strArray);
                    $tempStr = "";
                    foreach($strArray as $element)
                    {
                        if ((strtoupper($element) != "ASC") && (strtoupper($element) != "DESC"))
                        {
                            if ($tempStr == "")
                            {
                                $tempStr = "\"".$element."\"";
                            }
                            else
                            {
                                $tempStr = $tempStr." \"".$element."\"";
                            }
                        }
                        else
                        {
                            if ($tempStr == "")
                            {
                                $tempStr = $element;
                            }
                            else
                            {
                                $tempStr = $tempStr." ".$element;
                            }
                        }
                    }
                }
                else 
                {
                    $tempStr = "\"".$item."\"";
                }
                
                if ($preparedOrderBy == "")
                {
                    $preparedOrderBy = $tempStr;
                }
                else
                {
                    $preparedOrderBy = $preparedOrderBy.",".$tempStr;
                }
            }
            
            //echo "order string:".$preparedOrderBy;
            $orderBy = ($orderBy != null) ? (" ORDER BY " . $preparedOrderBy) : "";
            $sql = sprintf($format, "*", "\"".$tableName."\"", $where, $orderBy);
        }
        else
        {
            $where = ($filters != null && count($filters) > 0) ? (" WHERE (" . implode(") AND (", $filters) . ") ") : "";
            $orderBy = ($orderBy != null) ? (" ORDER BY " . $orderBy) : "";
            $sql = sprintf($format, "*", $tableName, $where, $orderBy);
        }
        
        //echo $sql;
        $ociMetas = array();
        if (self::isOracle($pdo))
        {            
            $rs = $pdo->query("select COLUMN_NAME, DATA_TYPE
                from user_tab_cols
                where table_name = '".$tableName."'
                order by column_id");
            
            $i = 0;
            foreach ($rs as $row) {
                $temp = array();
                $temp['name'] = $row['COLUMN_NAME'];
                $temp['type'] = $row['DATA_TYPE'];
                $ociMetas[$i++] = $temp;
            }
        }
        
        //var_dump($columnsDefine);
		$table = self::queryDataBySQL($pdo, $sql, $params, $columnsDefine, $offset, $limit, $ociMetas);
		if ($offset == 0) {
			$sqlTotal = sprintf($format, "COUNT(*)", $tableName, $where, "");
			$total = Util::getValueBySQL($pdo, $sqlTotal, $params);
			$table->setTotal(intval($total));
			$table->setOffset(0);
		}
		return $table;
	}
		

	/**
	 * 执行SQL查询，返回第一行第一列的值
	 * @param PDO $pdo
	 * @param string $sql
	 * @param array $params SQL参数数组
	 * @return 
	 */
	public static function getValueBySQL($pdo, $sql, $params) {
		$stmt = $pdo->prepare($sql);
		$stmt->execute($params);
		$row = $stmt->fetch(\PDO::FETCH_NUM);
		if ($row) {
			return $row[0];
		} else {
			return null;
		}
	}

	private static function createNewSQL($table, $tableName, $columns) {
		$sql = "INSERT INTO " . $tableName;
		$sql = $sql . " (" . self::arrayJoin($columns, "%s", ",") . ") ";
		$sql = $sql . " VALUES (" . self::arrayJoin($columns, "?", ",") . ") ";
		return $sql;
	}

	private static function createUpdateSQL($table, $tableName, $columns) {
		$sql = "UPDATE " . $tableName;
		$sql = $sql . " SET " . self::arrayJoin($columns, "%s=?", ",") . " ";
		$sql = $sql . " WHERE " . $table->getIDColumn() . "=? ";
		return $sql;
	}

	private static function createDeleteSQL($table, $tableName) {
		$sql = "DELETE FROM " . $tableName;
		$sql = $sql . " WHERE " . $table->getIDColumn() . "=? ";
		return $sql;
	}
	
	/**
	 * 保存Table数据
	 * @param PDO $pdo
	 * @param Table table
	 * @param string tableName 数据库表名
	 * @param array columns 列数组
	 */
	public static function saveData($pdo, $table, $tableName, $columns = null) {
		if ($columns == null) {
			$columns = $table->getColumnNames();
		} 
		$idColumn = $table->getIDColumn();
		
		$newSQL = self::createNewSQL($table, $tableName, $columns);
		$newStmt = $pdo->prepare($newSQL);
		foreach ($table->getRows(RowState::RS_NEW) as $row) {
			$params = array();
			foreach ($columns as $column) {
				$params[] = $row->getValue($column);
			}
			$newStmt->execute($params);
		}
		
		$editSQL = self::createUpdateSQL($table, $tableName, $columns);
		$editStmt = $pdo->prepare($editSQL);
		foreach ($table->getRows(RowState::RS_EDIT) as $row) {
			$params = array();
			foreach ($columns as $column) {
				$params[] = $row->getValue($column);
			}
			$params[] = $row->isChanged($idColumn) ? $row->getOldValue($idColumn) : $row->getValue($idColumn);
			$editStmt->execute($params);
		}
		
		$deleteSQL = self::createDeleteSQL($table, $tableName);
		$deleteStmt = $pdo->prepare($deleteSQL);
		foreach ($table->getRows(RowState::RS_DELETE) as $row) {
			$params = array();
			$params[] = $row->isChanged($idColumn) ? $row->getOldValue($idColumn) : $row->getValue($idColumn);
			$deleteStmt->execute($params);
		}
	}
}