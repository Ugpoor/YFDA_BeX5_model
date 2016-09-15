package com.justep.db;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public enum DatabaseProduct {
	ORACLE, MSSQL, HSQLDB, SYBASE, DB2;
	static Logger logger = Logger.getLogger(DatabaseProduct.class);
	public static DatabaseProduct getProduct(Connection conn) throws SQLException {
		if (null == conn)
			logger.error("获取数据库厂商信息时获得的连接为空!");
		if (logger.isDebugEnabled()) {
			logger.debug("Connection product name:" + conn.getMetaData().getDatabaseProductName());
			logger.debug("Connection product version:" + conn.getMetaData().getDatabaseProductVersion());
		}
		if (conn.getMetaData().getDatabaseProductName().equals("Oracle"))
			return DatabaseProduct.ORACLE;
		if (conn.getMetaData().getDatabaseProductName().equals("Microsoft SQL Server"))
			return DatabaseProduct.MSSQL;

		if (conn.getMetaData().getDatabaseProductName().equals("sql server"))
			return DatabaseProduct.SYBASE;
		if (conn.getMetaData().getDatabaseProductName().equals("ASE"))
			return DatabaseProduct.SYBASE;
		if (conn.getMetaData().getDatabaseProductName().startsWith("DB2"))
			return DatabaseProduct.DB2;
		if (conn.getMetaData().getDatabaseProductName().equals("HSQL Database Engine"))
			return DatabaseProduct.HSQLDB;
		logger.error("未找到对应的数据库产品：" + conn.getMetaData().getDatabaseProductName());
		throw new SQLException("目前不支持数据库产品：" + conn.getMetaData().getDatabaseProductName());
	}
}
