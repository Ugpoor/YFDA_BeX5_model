import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class Common {
	
	public static Table queryDEMO_Orders(List<DataPermission> range, String concept, String select, String from, String aggregate, String dataModel,
			String fnModel, String condition, Boolean distinct, String idColumn, String filter, Integer limit, Integer offset, String columns,
			String orderBy, String aggregateColumns, Map<String, Object> variables) {
		Table table = BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			
			Collection<String> cols = table.getColumnNames();
			if (cols.containsAll(Arrays.asList("fTotalMoney", "fChineseTotalMoney"))) {
				BigDecimal totalMoney = row.getDecimal("fTotalMoney");
				row.setString("fChineseTotalMoney", totalMoney == null ? "" : CommonUtils.toChineseMoney(totalMoney.setScale(2, RoundingMode.HALF_UP)));
			}

			if (cols.containsAll(Arrays.asList("fFreght", "fChineseFreght"))) {
				BigDecimal freght = row.getDecimal("fFreght");
				row.setString("fChineseFreght", freght == null ? "" : CommonUtils.toChineseMoney(freght));
			}

			// 还原行编辑状态 
			row.setState(ModifyState.NONE);
		}
		return table;
	}

}