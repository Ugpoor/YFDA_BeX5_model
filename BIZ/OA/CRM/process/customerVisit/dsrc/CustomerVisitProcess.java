import java.math.BigDecimal;
import java.util.Iterator;

import com.justep.system.context.*;
import com.justep.system.data.*;

public class CustomerVisitProcess {

/**
 * 用拜访记录中的经纬度更新客户表的经纬度
 */
	public static void customerVisitProcessBeforeSaveOA_CustomerVisitAction() {
		Table table = (Table) ContextHelper.getActionContext().getParameter("table");
		Row row;
		Iterator<Row> rows = table.iterator(com.justep.system.data.ModifyState.NEW);
		while (rows.hasNext()) {
			row = rows.next();
			
			String customerID = row.getString("fCustomerID");
			BigDecimal flongitude = row.getDecimal("flongitude");
			BigDecimal fLatitude = row.getDecimal("fLatitude");

			String sql = "update OA_Customer OA_Customer set  OA_Customer.flongitude = "+flongitude+" , OA_Customer.fLatitude = "+fLatitude
					+" , OA_Customer.fVisitNum = OA_Customer.fVisitNum + 1 where OA_Customer = '"+customerID+"'";;
			KSQL.executeUpdate(sql,null, "/OA/CRM/data", null);
		}
	}
}