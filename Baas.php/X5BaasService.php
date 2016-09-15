<?php
use baas\data\Transform;
require ("DemoService.php");
require ("TakeoutService.php");

// 忽略通知类提示
error_reporting ( E_ALL ^ E_NOTICE );
// 设置字符集
header ( "Content-type: text/html; charset=utf-8" );
// 设置支持跨域
header ( "Access-Control-Allow-Origin: *" );

function getConnection() {
	// 用PDO方式连接数据库
	$pdo = new PDO ( "mysql:host=localhost;dbname=takeout", "root", "", array (
			PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8;" 
	) );
	// 设置异常模式
	$pdo->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	return $pdo;
}

function run() {
	try {
		// 这里做了个简单的路由，依据url上的最后一节，进入不同的服务处理类
		// 	 http://localhost/baas/X5BaasService.php/demo
		//   http://localhost/baas/X5BaasService.php/takeout
		$uri = $_SERVER ["REQUEST_URI"];
		$serviceName = basename ( $uri );
		if ($serviceName == "demo") {
			DemoService::execute ( getConnection() );
		} else if ($serviceName == "takeout") {
			TakeoutService::Execute ( getConnection() );
		} else {
			// 为X5BaasService.php默认给出一个验证信息
			echo "Hello X5!<hr/>";

			// 这里给出一个例子，展示如何执行一个SQL，并将返回结果转换为Table
			$pdo = getConnection();
			$stmt = $pdo->query ( "SELECT * FROM TAKEOUT_FOOD" );
			// 由于PHP是弱类型，所以转换时必须给出列定义
			$columns = array (
				"fID" => array ( "name" => "fID", "type" => "String" ),
				"fName" => array ( "name" => "fName", "type" => "String" ),
				"fPrice" => array ( "name" => "fPrice", "type" => "Decimal" ),
				"fDescription" => array ( "name" => "fDescription", "type" => "String" ),
				"fImage" => array ( "name" => "fImage", "type" => "String")
			);
			// PDOStatement转换Table
			$table = Transform::PDOStatementToTable ( $stmt, $columns );
			// Table转换为Json
			$json = Transform::tableToJson ( $table );
			print_r ( $json );
		}
	} catch ( Exception $e ) {
		header ( "HTTP/1.1 500 Internal Server Error" );
		throw $e;
	}
}

run();

