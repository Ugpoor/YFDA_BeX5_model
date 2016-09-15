import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.SQL;


public class TestSQL {

	public static Object testSQL(String type, String sql, String dataModel) throws SQLException, NamingException {
		ContextHelper.getTransaction().begin();
		try {
			sql = sql.trim();
			Map<String, String> sqlMap = new HashMap<String, String>();
			sqlMap.put(SQL.DEFAULT_DB_NAME, sql);
			if (sql.toUpperCase().startsWith("SELECT")) {
				if (type.equals("ksql")) {
					return KSQL.select(sql, null, dataModel, null);
				} else {
					return SQL.select(sqlMap, null, dataModel);
				}
			} else if (sql.toUpperCase().startsWith("INSERT") || sql.toUpperCase().startsWith("UPDATE") || sql.toUpperCase().startsWith("DELETE")) {
				if (type.equals("ksql")) {
					return KSQL.executeUpdate(sql, null, dataModel, null);
				} else {
					return SQL.executeUpdate(sqlMap, null, dataModel);
				}
			} else {
				throw new RuntimeException("SQL语句必须以SELECT、INSERT、UPDATE或DELETE关键字开始");
			}
		} finally {
			// 因为是测试，这里强制回滚
			ContextHelper.getTransaction().rollback();
		}
	}
	
}
