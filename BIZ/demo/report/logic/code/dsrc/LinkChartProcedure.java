import java.util.HashMap;

import com.justep.system.data.DatabaseProduct;
import com.justep.system.data.SQL;
import com.justep.system.data.Table;


public class LinkChartProcedure {

	/**
	 * 报表链接
	 * @return
	 */
	public static Table linkChartQuery(String category, String number){
		
		String oracle = "SELECT * FROM ( SELECT RPRODUCTID , RPRODUCTNAME ,(SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME , (SELECT RCOMPANYNAME FROM DEMO_REPORTSUPPLIERS WHERE DEMO_REPORTSUPPLIERS.RSUPPLIERID = DEMO_REPORTPRODUCTS.RSUPPLIERID)AS RCOMPANYNAME, RQUANTITYPERUNIT, RUNITPRICE, RUNITSINSTOCK FROM DEMO_REPORTPRODUCTS)A ";
		String mssql = "SELECT * FROM ( SELECT RPRODUCTID , RPRODUCTNAME ,(SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME , (SELECT RCOMPANYNAME FROM DEMO_REPORTSUPPLIERS WHERE DEMO_REPORTSUPPLIERS.RSUPPLIERID = DEMO_REPORTPRODUCTS.RSUPPLIERID)AS RCOMPANYNAME, RQUANTITYPERUNIT, RUNITPRICE, RUNITSINSTOCK FROM DEMO_REPORTPRODUCTS)A ";
		
		if(!"".equals(category) && !"".equals(number)){
			oracle += String.format("where A.%s = '%s' ", category, number);
			mssql +=String.format("where A.%s = '%s' ", category, number);
		}
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put(SQL.DEFAULT_DB_NAME,mssql);
		sqlMap.put(DatabaseProduct.ORACLE.name(),oracle);
		sqlMap.put(DatabaseProduct.MSSQL.name(),mssql);
		sqlMap.put(DatabaseProduct.KINGBASE.name(),oracle);
		sqlMap.put(DatabaseProduct.SYBASE.name(),mssql);
		sqlMap.put(DatabaseProduct.DB2.name(),oracle);
		return SQL.select(sqlMap,null,"/demo/report/data");
	}
}