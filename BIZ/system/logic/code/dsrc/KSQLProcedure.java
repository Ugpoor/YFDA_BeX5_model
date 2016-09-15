

import java.util.Map;

import com.justep.message.CommonMessages;
import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class KSQLProcedure {

	public static Table query(String ksql, Map<String, Object> variables, String dataModel, String fnModel) {
	
		Utils.check(Utils.isNotEmptyString(ksql) && Utils.isNotEmptyString(dataModel),
				CommonMessages.class, CommonMessages.PARAM_NULL1, "ksql, dataModel");
		return KSQL.select(ksql, variables, dataModel, Utils.isEmptyString(fnModel) ? null : ModelUtils.getModel(fnModel));

	}
}
