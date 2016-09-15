import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;
import com.justep.system.data.*;


public class Customer {


	public static Table queryOA_CustomerLetter(String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,List range,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map variables){
		Table table =  BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
				
		// 在内存中构造客户的数据集
		List<String> names = new ArrayList<String>();
		names.add("fName"); names.add("fAbbr"); names.add("fLetter");names.add("OA_Customer");
		List<String> types = new ArrayList<String>();
		types.add("String"); types.add("String");types.add("String");types.add("String");
		// 创建table，names代表列，types代表列的类型
		Table customerTable = TableUtils.createTable(null, names, types);

		Row originalRow;
		String sLastLetter = "", sLetter;
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
		    originalRow = it.next();
		    sLetter = originalRow.getString("fAbbr");
		    sLetter = sLetter.substring(0,1).toUpperCase();
		    if(!sLetter.equals(sLastLetter)){
		    	Row row = customerTable.appendRow();
		    	row.setString("fLetter", sLetter);
		    	sLastLetter = sLetter;
		    }
			Row row = customerTable.appendRow();
			row.setString("OA_Customer", originalRow.getString("OA_Customer"));
			row.setString("fName", originalRow.getString("fName"));
			row.setString("fAbbr", originalRow.getString("fAbbr"));
			row.setString("fLetter", "");
		}
		return customerTable;

	}
	//使用上面的方法
	public static void queryOA_CustomerSelect(String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,List range,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map variables){
		
	}
}