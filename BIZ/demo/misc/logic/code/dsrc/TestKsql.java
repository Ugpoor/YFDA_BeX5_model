
import java.util.Iterator;
import com.justep.util.Utils;
import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;


public class TestKsql {
	 
	private static final String DATA_MODEL = "/demo/misc/data";
	
	public static String testKsql(String sKsqlText) {
		System.out.println("*************js***************");
		
		//where条件测试、 字段别名、 in（常量）、 in（子查询）、>、>=、<、<=、=
 		String kSqlWhere ="SELECT DISTINCT o1.*, o1.sCode AS sPCode, o1.sName AS sPName FROM SA_OPOrg o1 "
 		  +" WHERE o1.sCode = 'JUSTEP'"
 		  + " AND NOT o1.sLevel IN(1, 2) "
 		  + " AND o1.sLevel < 1 "
 		  + " AND o1.sLevel <= 1 "
 		  + " AND o1.sLevel >= 1 "
 		  + " AND o1.sLevel < 1 "
 		  + " AND o1 IN (SELECT p1.sMainOrgID FROM SA_OPPerson p1)";
		
 		//group by 测试
		String kSqlGroup ="SELECT MAX(p1.sNumb),MIN(p1.sNumb), AVG(p1.sNumb) FROM SA_OPPerson p1 GROUP BY p1.sMainOrgID HAVING NOT p1.sMainOrgID IS NULL" ;

		//连接--左连接OPTIONAL JOIN
		String kSqlJoin ="SELECT p1.sCode AS sPCode, p1.sName AS sPName, o1.sCode AS sOCode, o1.sName AS sOName FROM SA_OPPerson p1"
					+" OPTIONAL JOIN SA_OPOrg o1 ON p1.sMainOrgID = o1 WHERE o1.sName='起步软件'";
		
		//distinct测试、 between测试、字符串相加 、字符串与关系相加、数值加减乘除、括号测试
 		String kSqlDistinct ="SELECT DISTINCT o1.sOrgKindID, CONCAT(o1.sName, 'A', 'B')  AS aaa, (10 - 2 + 8) * 2 AS bbb FROM SA_OPOrg o1 ";
 			
		//INSERT 测试
		String kSqlInsert = " INSERT INTO SA_OPOrg o1 (o1, o1.sOrgKindID, o1.sName, o1.sCode, o1.sFID, o1.version ) VALUES(111111, 'org', 'LTFORG', '008', 'ORG01.ogn', 0)";
		
		//update 测试
		String kSqlUpdate = " UPDATE SA_OPOrg o1 SET o1.sName = 'LTFORG_NEW' WHERE o1.sCode = '008' ";
		
		//delete 测试
		String kSqlDelete = " DELETE FROM SA_OPOrg o1 WHERE o1.sCode = '008'";
		Table table = null;
		Row r = null;
		try{
				
			System.out.println("**********where测试*********");
			KSQL.select(kSqlWhere,null,DATA_MODEL,null);
	        System.out.println();
	        
	        System.out.println("**********group测试*********");
	        KSQL.select(kSqlGroup,null,DATA_MODEL,null);
	        System.out.println();
	
	        System.out.println("**********join测试*********");
	        KSQL.select(kSqlJoin,null,DATA_MODEL,null);
	        System.out.println();
	        
	        System.out.println("**********distinct测试*********");
	        KSQL.select(kSqlDistinct,null,DATA_MODEL,null);
	        System.out.println();
	
			System.out.println("**********insert测试**********");
			KSQL.executeUpdate(kSqlInsert, null, DATA_MODEL, null);
			System.out.println();
				
			System.out.println("*********update测试*********");
			KSQL.executeUpdate(kSqlUpdate, null, DATA_MODEL, null);
			System.out.println();
						
			System.out.println("*********delete测试*********");
			KSQL.executeUpdate(kSqlDelete, null, DATA_MODEL, null);
			System.out.println();
			
			System.out.println("----------------------执行成功！------------------------------");
	        return "执行成功！";
		}catch(Exception e){
			 e.printStackTrace();
             System.out.println("----------------------执行失败!------------------------------");
             return "执行失败:"+e.toString();
		}
	}
}
