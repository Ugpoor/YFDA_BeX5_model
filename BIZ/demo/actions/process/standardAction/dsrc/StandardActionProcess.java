import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class StandardActionProcess {
	public static void standardActionProcessBeforeSaveDEMO_OrderDetailsAction() {
		Table table = (Table)ContextHelper.getActionContext().getParameter("table");
		// 从Table中获取新增和修改的数据
		Iterator<Row> rows = table.iterator(ModifyState.NEW, ModifyState.EDIT);
		Map<String, Integer> products = new HashMap<String, Integer>();
		while (rows.hasNext()) {
			Row row = rows.next();
			String productID = row.getString("fProductID");
			int quantity = row.getInt("fQuantity");
			// 不允许负数量
			if (quantity < 0) {
				throw new RuntimeException("数量不能小于零");
			}
			// 记录变更的产品ID和数量
			products.put(productID, quantity);
		}
		if (products.size() > 0) {
			// 获取产品当前库存
			String ids = Arrays.toString(products.keySet().toArray()).replaceAll(", ", "', '").replaceAll("\\u005B|]", "'");
			String ksql = "SELECT product, product.fProductName, product.fUnitsinstock " +
				" FROM DEMO_Products product " +
				" WHERE product IN (" + ids + ")";	
			Table instock = KSQL.select(ksql, null, "/demo/common/data", null);
			// 检查订单数量是否大于库存数量
			for (String productID : products.keySet()) {
				Row row = instock.getRow("product", productID);
				if (row == null) {
					throw new RuntimeException("无效的产品ID：" + productID);
				}
				if (products.get(productID) > row.getInt("fUnitsinstock")) {
					throw new RuntimeException(row.getString("fProductName") + "的订单数量" + products.get(productID) + "大于库存数量" + row.getInt("fUnitsinstock"));
				}
			}
		}
	}
}