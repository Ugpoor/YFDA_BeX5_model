import java.util.HashMap;

import com.justep.system.data.DatabaseProduct;
import com.justep.system.data.SQL;
import com.justep.system.data.Table;


public class TestCaseProcedure {
	//<!-- 大数据网格报表 -->
	public static Table testGrid(){
        String oracle = "SELECT RORDERDETAILSID , (SELECT RSHIPNAME FROM DEMO_REPORTORDERS WHERE DEMO_REPORTORDERS.RORDERID = DEMO_REPORTORDERDETAILS.RORDERID ) AS RSHIPNAME , (SELECT RPRODUCTNAME FROM DEMO_REPORTPRODUCTS WHERE DEMO_REPORTPRODUCTS.RPRODUCTID = DEMO_REPORTORDERDETAILS.RPRODUCTID ) AS RPRODUCTNAME ,RUNITPRICE , RQUANTITY FROM DEMO_REPORTORDERDETAILS";
		String mssql = "SELECT RORDERDETAILSID , (SELECT RSHIPNAME FROM DEMO_REPORTORDERS WHERE DEMO_REPORTORDERS.RORDERID = DEMO_REPORTORDERDETAILS.RORDERID ) AS RSHIPNAME , (SELECT RPRODUCTNAME FROM DEMO_REPORTPRODUCTS WHERE DEMO_REPORTPRODUCTS.RPRODUCTID = DEMO_REPORTORDERDETAILS.RPRODUCTID ) AS RPRODUCTNAME ,RUNITPRICE , RQUANTITY FROM DEMO_REPORTORDERDETAILS";
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put(DatabaseProduct.ORACLE.name(),oracle);
		sqlMap.put(DatabaseProduct.MSSQL.name(),mssql);
		sqlMap.put(DatabaseProduct.KINGBASE.name(),oracle);
		sqlMap.put(DatabaseProduct.SYBASE.name(),mssql);
		sqlMap.put(DatabaseProduct.MYSQL.name(),mssql);
		sqlMap.put(DatabaseProduct.DB2.name(),oracle);
		return SQL.select(sqlMap,null,"/demo/report/data");
	}
	//<!-- 大数据分组报表 -->
	public static Table testGroup(){
        String oracle = "SELECT RORDERDETAILSID , (SELECT RSHIPNAME FROM DEMO_REPORTORDERS WHERE DEMO_REPORTORDERS.RORDERID = DEMO_REPORTORDERDETAILS.RORDERID ) AS RSHIPNAME , (SELECT RPRODUCTNAME FROM DEMO_REPORTPRODUCTS WHERE DEMO_REPORTPRODUCTS.RPRODUCTID = DEMO_REPORTORDERDETAILS.RPRODUCTID ) AS RPRODUCTNAME ,RUNITPRICE , RQUANTITY FROM DEMO_REPORTORDERDETAILS";
		String mssql = "SELECT RORDERDETAILSID , (SELECT RSHIPNAME FROM DEMO_REPORTORDERS WHERE DEMO_REPORTORDERS.RORDERID = DEMO_REPORTORDERDETAILS.RORDERID ) AS RSHIPNAME , (SELECT RPRODUCTNAME FROM DEMO_REPORTPRODUCTS WHERE DEMO_REPORTPRODUCTS.RPRODUCTID = DEMO_REPORTORDERDETAILS.RPRODUCTID ) AS RPRODUCTNAME ,RUNITPRICE , RQUANTITY FROM DEMO_REPORTORDERDETAILS";
		String sybase = "SELECT RORDERDETAILSID , (SELECT RSHIPNAME FROM DEMO_REPORTORDERS WHERE DEMO_REPORTORDERS.RORDERID = DEMO_REPORTORDERDETAILS.RORDERID ) AS RSHIPNAME , (SELECT RPRODUCTNAME FROM DEMO_REPORTPRODUCTS WHERE DEMO_REPORTPRODUCTS.RPRODUCTID = DEMO_REPORTORDERDETAILS.RPRODUCTID ) AS RPRODUCTNAME ,RUNITPRICE , RQUANTITY FROM DEMO_REPORTORDERDETAILS";
		
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put(DatabaseProduct.ORACLE.name(),oracle);
		sqlMap.put(DatabaseProduct.MSSQL.name(),mssql);
		sqlMap.put(DatabaseProduct.KINGBASE.name(),oracle);
		sqlMap.put(DatabaseProduct.SYBASE.name(),mssql);
		sqlMap.put(DatabaseProduct.MYSQL.name(),mssql);
		sqlMap.put(DatabaseProduct.DB2.name(),oracle);
		return SQL.select(sqlMap,null,"/demo/report/data");
	}
}