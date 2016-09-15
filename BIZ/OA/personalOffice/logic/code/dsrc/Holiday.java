import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Holiday {
	public static boolean checkDate(String date, String id) throws Exception {
		String sql = "";
		if (id != null && !"".equals(id)) {
			sql = "SELECT a FROM OA_WM_Holiday a WHERE a <> '" + id
					+ "' and a.fDate= stringToDate('" + date+ "')";
		} else {
			sql = "SELECT a FROM OA_WM_Holiday a WHERE a.fDate= stringToDateTime('"+ date + "')";
		}
		Table result = KSQL.select(sql, null, "/PEPM/project/data", null);
		Iterator<Row> rows = result.iterator();
		if (rows.hasNext()) {
			return true;
		} else {
			return false;
		}
	}
}