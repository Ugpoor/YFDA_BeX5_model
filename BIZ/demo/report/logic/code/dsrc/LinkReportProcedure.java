import java.util.HashMap;

import com.justep.system.data.DatabaseProduct;
import com.justep.system.data.Table;
import com.justep.system.data.SQL;
import com.justep.util.Utils;

public class LinkReportProcedure {

	/**
	 * 报表链接
	 * @return
	 */
	public static Table linkReportQuery(String company, String product,String category){
		
		String oracle = "SELECT * FROM ( SELECT RPRODUCTID , RPRODUCTNAME ,(SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME , (SELECT RCOMPANYNAME FROM DEMO_REPORTSUPPLIERS WHERE DEMO_REPORTSUPPLIERS.RSUPPLIERID = DEMO_REPORTPRODUCTS.RSUPPLIERID)AS RCOMPANYNAME, RQUANTITYPERUNIT, RUNITPRICE, RUNITSINSTOCK FROM DEMO_REPORTPRODUCTS )A ";
		String mssql =  "SELECT * FROM ( SELECT RPRODUCTID , RPRODUCTNAME ,(SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME , (SELECT RCOMPANYNAME FROM DEMO_REPORTSUPPLIERS WHERE DEMO_REPORTSUPPLIERS.RSUPPLIERID = DEMO_REPORTPRODUCTS.RSUPPLIERID)AS RCOMPANYNAME, RQUANTITYPERUNIT, RUNITPRICE, RUNITSINSTOCK FROM DEMO_REPORTPRODUCTS )A ";
		
		oracle += " WHERE 1=1 ";
		mssql += " WHERE 1=1 ";
		if(Utils.isNotEmptyString(company)&& !company.equals("null") ){
			oracle += String.format("and A.RCOMPANYNAME = '%s' ", company);
			mssql += String.format("and A.RCOMPANYNAME = '%s' ", company);
		}
		if(Utils.isNotEmptyString(product)&&!product.equals("null") ){
			oracle += String.format("and A.RPRODUCTNAME = '%s' ", product);
			mssql += String.format("and A.RPRODUCTNAME = '%s' ", product);
		}
		if(Utils.isNotEmptyString(category)&&!category.equals("null") ){
			oracle += String.format("and A.RCATEGORYNAME = '%s' ", category);
			mssql += String.format("and A.RCATEGORYNAME = '%s' ", category);
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