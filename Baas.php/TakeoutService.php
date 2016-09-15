<?php
require_once "BaasData.php";
use baas\data\Util;
use baas\data\Transform;

class TakeoutService {
	
	const TABLE_TAKEOUT_FOOD = "takeout_food";
	const TABLE_TAKEOUT_ORDER = "takeout_order";
	const TABLE_TAKEOUT_REGION = "takeout_region";
	const TABLE_TAKEOUT_USER = "takeout_user";
	
	public static function Execute($pdo) {
		// 从POST请求中获取参数action和params
		$action = $_POST ["action"];
		$params = $_POST ["params"];
		// 参数反序列化成数组
		$params = Util::object_to_array ( json_decode ( $params ) );
		
		if ($action == "queryFood") {
			self::QueryFood ( $pdo, $params );
		} else if ($action == "queryUser") {
			self::QueryUser ( $pdo, $params );
		} else if ($action == "queryOrder") {
			self::QueryOrder ( $pdo, $params );
		} else if ($action == "save") {
			self::Save ( $pdo, $params );
		}
	}

	private static function QueryFood($pdo, $params) {
		$columns = $params ["columns"]; // 列定义
		$limit = $params ["limit"]; // 分页查询的行数
		$offset = $params ["offset"]; // 分页查询的行偏移
		
		$table = Util::queryData ( $pdo, self::TABLE_TAKEOUT_FOOD, $columns, null, "fID ASC", null, $offset, $limit );
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function QueryUser($pdo, $params) {
		// 获取参数
		$columns = $params ["columns"]; // 列定义
		$id = $params ["id"];
		
		$filters = array ( "fID = ?" );
		$sqlParams = array ( $id );
		
		$table = Util::QueryData ( $pdo, self::TABLE_TAKEOUT_USER, $columns, $filters, "fID ASC", $sqlParams, null, null );
		$json = Transform::tableToJson ( $table );
		
		echo json_encode ( $json );
	}
	
	private static function QueryOrder($pdo, $params) {
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
	
	private static function Save($pdo, $params) {
		$userData = $params ["userData"];
		$orderData = $params ["orderData"];
		
		// 转换Table
		$userTable = Transform::jsonToTable ( $userData );
		$orderTable = Transform::jsonToTable ( $orderData );
		
		$pdo->beginTransaction ();
		try {
			Util::saveData ( $pdo, $userTable, self::TABLE_TAKEOUT_USER );
			Util::saveData ( $pdo, $orderTable, self::TABLE_TAKEOUT_ORDER );
			$pdo->commit ();
		} catch ( PDOException $e ) {
			$pdo->rollback ();
			throw $e;
		}
	}
}