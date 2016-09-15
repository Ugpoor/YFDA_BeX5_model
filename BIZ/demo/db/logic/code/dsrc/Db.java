import java.sql.*;
import java.util.*;

import javax.naming.NamingException;


import com.justep.model.ModelUtils;
import com.justep.system.data.*;
import com.justep.system.util.BizUtils;
import com.justep.system.util.CommonUtils;

public class Db {

	// KSQL参数示例：按单据号获取订单ID
	public static String getOrderIDByNumber_KSQL(String number) {
		// 定义包含命名参数的KSQL
		String ksql = "SELECT o FROM DEMO_Orders o WHERE o.fOrderNumber = :number ";
		// 构造参数Map
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("number", number);
		// 执行KSQL并传入参数
		Table table = KSQL.select(ksql, params, "/demo/common/data", null);
		// 从返回的Table对象里面，获取订单ID
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row row = rows.next();
			// 在KSQL中以概念的别名作为主键字段名
			return row.getString("o");
		} else {
			throw new RuntimeException("无效的单据号: " + number);
		}
	}
	
	// SQL参数示例：按单据号获取订单ID
	public static String getOrderIDByNumber_SQL(String number) {
		/* 定义包含参数的SQL

		可以在Map中通过key指定不同数据库的SQL语句，支持的数据库类型如下，更多请参见DatabaseProduct的API手册
			DatabaseProduct.MSSQL.name()
			DatabaseProduct.ORACLE.name()
			DatabaseProduct.DB2.name()
			DatabaseProduct.SYBASE.name()
			DatabaseProduct.MYSQL.name()
		
		SQL.DEFAULT_DB_NAME表示默认的数据库SQL，当在Map中找不到匹配的数据库类型时会执行默认的SQL
		 */
		Map<String, String> sql = new HashMap<String, String>();
		sql.put(SQL.DEFAULT_DB_NAME, "SELECT o.fOrderID FROM DEMO_Orders o WHERE o.fOrderNumber = ? ");
		// 构造参数List，SQL中的参数是按顺序匹配的
		List<Object> params = new ArrayList<Object>();
		params.add(number);
		// 执行SQL并传入参数
		Table table = SQL.select(sql, params, "/demo/common/data");
		// 从返回的Table对象里面，获取订单ID
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row row = rows.next();
			return row.getString("fOrderID");
		} else {
			throw new RuntimeException("无效的单据号: " + number);
		}
	}
	
	// 执行存储过程示例
	public static Table doDatabaseProcedure() throws NamingException, SQLException {
		// 从当前上下文的事务对象中获取数据库连接
		Connection conn = ModelUtils.getConnectionInTransaction("/demo/common/data");
		// 创建一个 CallableStatement对象来调用数据库存储过程
		CallableStatement stat = conn.prepareCall("{call 存储过程的名称(?, ?)}");
		try {
			// 设置IN参数，参数以顺序匹配
			stat.setString(1, "入参的值");
			// 设置OUT参数
			stat.registerOutParameter(2, Types.INTEGER);
			// 执行存储过程
			stat.execute();
			// 获取OUT参数的值
//			int outValue = stat.getInt(2);
			// 获取返回的数据集
			ResultSet rs = stat.getResultSet();
			// ResultSet转换为Table
			Table table = BizUtils.resultSet2Table(rs,"/demo/common/data");
			return table;
		} finally {
			stat.close();
		}
	}
	
	// 自定义事务案例
	public static void customTransaction() throws Exception {
		// 创建独立事务对象
		Transaction tran = new Transaction();
		try {
			// 开启事务
			tran.begin();
			try {
				/* 在当前独立事务中执行数据库操作
				Connection conn = tran.getConnection("/demo/common/data");
				...
				*/
				// 提交事务
				tran.commit();
			} catch (Exception e) {
				// 发生异常后回滚事务
				tran.rollback();
				// 这里要把异常继续抛出去，让客户端知道发生了什么错误
				throw e;
			}
		} finally {
			// 关闭数据库连接
			tran.closeConnections();
		}
	}

	public static Table createCalendar(Integer year, Integer month) {
		// 在内存中构造日历的数据集
		List<String> names = new ArrayList<String>();
		names.add("sun"); names.add("mon");	names.add("tues"); names.add("wed"); names.add("thur"); names.add("fri"); names.add("sat");
		List<String> types = new ArrayList<String>();
		types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer");	types.add("Integer");
		// 创建table，names代表列，types代表列的类型
		Table table = TableUtils.createTable(null, names, types);
		
		// 填充日历数据
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int maxDay = cal.getActualMaximum(Calendar.DATE);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		Row row = null;
		for (int day = 0; day < maxDay; day++) {
			int colIndex = (day + week - 1) % 7; 
			if (table.size() == 0 || colIndex == 0) {
				row = table.appendRow();
			}
			row.setInt(colIndex, day + 1);
		}
		return table;
	}

	public static Table returnTable() {
		// 用KSQL查询获得Table
		Table table = KSQL.select("SELECT DEMO_Customers, DEMO_Customers.fCompanyName, DEMO_Customers.fContactName, DEMO_Customers.fContactTitle, DEMO_Customers.fAddress, DEMO_Customers.fCity, DEMO_Customers.fRegion, DEMO_Customers.fPhone "
				+ " FROM DEMO_Customers DEMO_Customers LIMIT 0, 5", null, "/demo/common/data", null);
		// 设置rowID列
		table.getProperties().put(Table.PROP_NAME_ROWID, "DEMO_Customers");
		return table;
	}

	public static Table addTableRow(Table table) {
		if (table.getRow("fCompanyName", "北京起步科技有限公司") == null) {
			//新增一个空行
			Row row = table.appendRow();
			//给列赋值
			row.setString("DEMO_Customers", CommonUtils.createGUID());
			row.setString("fCompanyName", "北京起步科技有限公司");
			row.setString("fContactName", "马科");
			row.setString("fContactTitle", "总经理");
			row.setString("fAddress", "北京市朝阳区东三环南路98号韩建丹阳大厦1802室");
			row.setString("fCity", "北京");
			row.setString("fRegion", "华北");
			row.setString("fPhone", "(010)59798677");
		}
		return table;
	}

	public static Table delTableRow(Table table, String id) {
		// 按id删除某一行，需要先调用setKeyColumn设置主键列
		table.getMetaData().setKeyColumn("DEMO_Customers");
		table.deleteRows(id);
		return table;
	}

	public static Table addColumn(Table table, String columnName) {
		table.addColumn(columnName, "String");
		return table;
	}

	public static Table delColumn(Table table, String columnName) {
		table.deleteColumn(columnName);
		return table;
	}

	public static List<String> listTable(Table table, String columnName) {
		List<String> list = new ArrayList<String>();
		// 获取列集合
//		Collection<String> columns = table.getColumnNames();
		// 获取行迭代
		Iterator<Row> rows = table.iterator();
		// 遍历行
		while (rows.hasNext()) {
			Row row = rows.next();
			// 遍历列
//			for (String column : columns) {
//				Object value = row.getValue(column);
//			}
			list.add(row.getValue(columnName).toString());
		}
		return list;
	}
}