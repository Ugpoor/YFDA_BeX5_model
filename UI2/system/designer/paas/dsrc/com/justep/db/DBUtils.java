package com.justep.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class DBUtils {
	static Logger logger = Logger.getLogger(DBUtils.class);
			
	public static Connection getConn(String dataSource) {
		try {
			InitialContext initCtx = new InitialContext();
			DataSource ds = (DataSource) initCtx.lookup(dataSource);
			return ds.getConnection();
		} catch (SQLException exSql) {
			logger.error("SQL Exception:" + exSql.getMessage() + "</br>", exSql);
			return null;
		} catch (NamingException exNam) {
			logger.error("Naming Exception:" + exNam.getMessage() + "</br>", exNam);
			return null;
		}
	}


}
