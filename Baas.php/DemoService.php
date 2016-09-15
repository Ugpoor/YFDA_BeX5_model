<?php
require_once "BaasData.php";
use baas\data\Util;
use baas\data\Transform;

class DemoService {

	const TABLE_TAKEOUT_FOOD = "takeout_food";
	const TABLE_TAKEOUT_ORDER = "takeout_order";
	const TABLE_TAKEOUT_REGION = "takeout_region";
	const TABLE_TAKEOUT_USER = "takeout_user";
	
	public static function execute($pdo) {
		// 从POST请求中获取参数action和params
		$action = $_POST ["action"];
		$params = $_POST ["params"];
		// 参数反序列化成数组
		$params = Util::object_to_array ( json_decode ( $params ) );
		
		if ($action == "queryOrder") {
			self::demo_queryOrder ( $pdo, $params );
		} else if ($action == "saveOrder") {
			self::demo_saveOrder ( $pdo, $params );
		} else if ($action == "queryTest") {
			self::demo_queryTest ( $pdo, $params );
		} else if ($action == "saveTest") {
			self::demo_saveTest ( $pdo, $params );
		} else if ($action == "queryRegionTree") {
			self::queryRegionTree ( $pdo, $params );
		} else if ($action == "queryRegionTreeByParent") {
			self::queryRegionTreeByParent ( $pdo, $params );
		} else if ($action == "queryUser") {
			self::queryUser ( $pdo, $params );
		} else if ($action == "saveUser") {
			self::saveUser ( $pdo, $params );
		} else if ($action == "saveMasterDetail") {
			self::saveMasterDetail ( $pdo, $params );
		} 
	}
	
	private static function demo_queryOrder($pdo, $params) {
		$columns = $params ["columns"]; // 列定义
		$limit = $params ["limit"]; // 分页查询的行数
		$offset = $params ["offset"]; // 分页查询的行偏移
		$search = $params ["search"]; // 检索关键字
		                              
		// 存放SQL中的参数值
		$sqlParams = array ();
		// 存放SQL中的过滤条件
		$filters = array ();
		if ($search != null) {
			// 增加过滤条件
			$filters [] = "fUserName LIKE ? OR fPhoneNumber LIKE ? OR fAddress LIKE ? OR fContent LIKE ? ";
			// 检索关键字中如果没有%，则前后自动加%
			$search = is_numeric ( strpos ( $search, "%" ) ) ? $search : "%" . $search . "%";
			// sqlParams的参数个数和顺序必须与过滤条件的?相匹配
			for($i = 0; $i < 4; $i ++) {
				$sqlParams [] = $search;
			}
		}
		
		// 按用户ID过滤，用于主从数据示例
		$userID = $params ["userID"];
		if ($userID != null) {
			$filters [] = "fUserID = ?";
			$sqlParams [] = $userID;
		}
		
		$table = Util::queryData ( $pdo, self::TABLE_TAKEOUT_ORDER, $columns, $filters, "fCreateTime DESC", $sqlParams, $offset, $limit );
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function demo_saveOrder($pdo, $params) {
		$data = $params ["data"]; // 订单数据的JSON格式
		                          
		// JSON转换Table
		$table = Transform::jsonToTable ( $data );
		
		// 开启事务
		$pdo->beginTransaction ();
		try {
			// 保存Table
			Util::saveData ( $pdo, $table, self::TABLE_TAKEOUT_ORDER );
			// 提交事务
			$pdo->commit ();
		} catch ( PDOException $e ) {
			// 如果发生异常，首先回滚事务，然后把异常继续抛出
			$pdo->rollback ();
			throw $e;
		}
	}
	
	private static function demo_queryTest($pdo, $params) {
		$columns = $params ["columns"];
		$limit = $params ["limit"];
		$offset = $params ["offset"];
		
		$table = Util::queryData ( $pdo, "demo_test", $columns, null, null, null, $offset, $limit );
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function demo_saveTest($pdo, $params) {
		$data = $params ["data"];
		$table = Transform::jsonToTable ( $data );
		
		$pdo->beginTransaction ();
		try {
			Util::saveData ( $pdo, $table, "demo_test" );
			$pdo->commit ();
		} catch ( PDOException $e ) {
			$pdo->rollback ();
			throw $e;
		}
	}
	
	private static function queryRegionTree($pdo, $params) {
		$columns = $params ["columns"];
		$table = Util::queryData ( $pdo, self::TABLE_TAKEOUT_REGION, $columns, null, "fID ASC", null, null, null );
		$table->setIDColumn ( "fID" );
		$json = Transform::tableToTreeJson ( $table, "fParentID" );
		
		echo json_encode ( $json );
	}
	
	private static function queryRegionTreeByParent($pdo, $params) {
		$columns = $params ["columns"];
		$limit = $params ["limit"];
		$offset = $params ["offset"];
		$parent = $params ["parent"];
		
		// 存放SQL中的参数值
		$sqlParams = array ();
		// 构造过滤条件
		$filters = array ();
		// 构造父过滤条件
		if ($parent == null) {
			$filters [] = "fParentID is null";
		} else {
			$filters [] = "fParentID = ?";
			$sqlParams [] = $parent;
		}
		
		$table = Util::queryData ( $pdo, self::TABLE_TAKEOUT_REGION, $columns, $filters, "fID ASC", $sqlParams, $offset, $limit );
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function queryUser($pdo, $params) {
		// 获取参数
		$columns = $params ["columns"]; // 列定义
		$limit = $params ["limit"]; // 分页查询的行数
		$offset = $params ["offset"]; // 分页查询的行偏移
		$search = $params ["search"]; // 检索关键字
		                              
		// 存放SQL中的参数值
		$sqlParams = array ();
		// 构造where
		$sqlWhere = "";
		if ($search != null) {
			$sqlWhere = " WHERE (u.fID LIKE ? OR u.fName LIKE ? OR u.fPhoneNumber LIKE ? OR u.fAddress LIKE ?) ";
			// 多个问号参数的值
			$search = is_numeric ( strpos ( $search, "%" ) ) ? $search : "%" . $search . "%";
			for($i = 0; $i < 4; $i ++) {
				$sqlParams [] = $search;
			}
		}
		
		// 复杂查询
		$sql = "SELECT u.fID, u.fName, u.fPhoneNumber, u.fAddress, COUNT(ord.fID) AS orderCount " . " FROM takeout_user u LEFT JOIN takeout_order ord ON u.fID = ord.fUserID " . $sqlWhere . " GROUP BY u.fID, u.fName, u.fPhoneNumber, u.fAddress ";
		
		$table = Util::queryDataBySQL ( $pdo, $sql, $sqlParams, $columns, $offset, $limit );
		if ($offset != null && $offset == 0) {
			$sqlTotal = "SELECT COUNT(*) FROM takeout_user u " . $sqlWhere;
			$total = Util::getValueBySQL ( $pdo, $sqlTotal, $sqlParams );
			$table->setTotal ( $total );
		}
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function saveUser($pdo, $params) {
		$data = $params ["data"];
		
		// 转换Table
		$table = Transform::jsonToTable ( $data );
		
		$pdo->beginTransaction ();
		try {
			$columns = $table->getColumnNames ();
			array_splice ( $columns, array_search ( "orderCount", $columns ) );
			Util::saveData ( $pdo, $table, self::TABLE_TAKEOUT_USER, $columns );
			$pdo->commit ();
		} catch ( PDOException $e ) {
			$pdo->rollback ();
			throw $e;
		}
	}
	
	private static function saveMasterDetail($pdo, $params) {
		$userData = $params ["userData"];
		$orderData = $params ["orderData"];
		
		// 转换Table
		$userTable = Transform::jsonToTable ( $userData );
		$orderTable = Transform::jsonToTable ( $orderData );
		
		$pdo->beginTransaction ();
		try {
			$userColumns = $userTable->getColumnNames ();
			array_splice ( $userColumns, array_search ( "orderCount", $userColumns ) );
			Util::saveData ( $pdo, $userTable, self::TABLE_TAKEOUT_USER, $userColumns );
			Util::saveData ( $pdo, $orderTable, self::TABLE_TAKEOUT_ORDER );
			$pdo->commit ();
		} catch ( PDOException $e ) {
			$pdo->rollback ();
			throw $e;
		}
	}
}