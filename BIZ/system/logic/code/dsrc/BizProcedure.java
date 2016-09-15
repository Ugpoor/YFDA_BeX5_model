import java.util.List;
import java.util.Map;

import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.Table;

public class BizProcedure {
	public static Table query(String concept, String idColumn, String select, String from, String condition, List<DataPermission> range,
			String filter, Boolean distinct, int offset, int limit, String columns, String orderBy, String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel) {
		return BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
	}

	public static int save(Table table, String concept, List<DataPermission> insertRange, List<DataPermission> deleteRange,
			List<DataPermission> updateRange, String readOnly, String notNull, String dataModel, String fnModel) {
		return BizData.save(table, concept, insertRange, deleteRange, updateRange, readOnly, notNull, dataModel, fnModel);
	}

	public static Table create(Table table, String concept, Map<String, String> defaultValues, String fnModel) {
		return BizData.create(table, concept, defaultValues, fnModel);
	}
}
