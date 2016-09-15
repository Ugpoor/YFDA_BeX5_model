import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class CustomFn {
	static public Integer getStock(String productName) {
		String ksql = "SELECT DEMO_Products.fUnitsinstock " +
			" FROM DEMO_Products DEMO_Products " +
			" WHERE DEMO_Products.fProductName = :productName ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("productName", productName);
		Table table = KSQL.select(ksql, params, "/demo/common/data", null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row row = rows.next();
			return row.getInteger("fUnitsinstock");
		} else {
			throw new RuntimeException("无效的产品名称！");
		}
	}

	static public boolean isStockOver(String productName, Integer quantity) {
		Integer fUnitsinstock = getStock(productName);
		if(quantity > fUnitsinstock){
			return true;
		}else{
			return false;
		}
	}
}