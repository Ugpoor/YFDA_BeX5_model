

import java.util.ArrayList;
import java.util.Map;



import com.justep.system.data.Table;
import com.justep.system.data.SQL;

public class SQLProcedure {
	public static Table query(Map<String, String> sql, String dataModel) {
		return SQL.select(sql, new ArrayList<Object>(), dataModel);
	}
}
