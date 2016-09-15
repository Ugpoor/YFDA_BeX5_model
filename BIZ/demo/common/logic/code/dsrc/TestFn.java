import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.justep.model.ModelUtils;
import com.justep.system.data.Expression;
import com.justep.system.opm.OrgUnit;
import com.justep.system.process.ProcessEngine;
import com.justep.system.process.ProcessUtils;
import com.justep.util.Utils;


public class TestFn {

	public static Object testFn(String fn, String fnModel) {
		if (Utils.isEmptyString(fnModel)) {
			fnModel = "/system/logic/fn";
		}
		Object result = Expression.evaluate(fn.trim(), null, ModelUtils.getModel(fnModel));
		return transformFnResult(result);
	}
	
	public static Object testProcessFn(String fn, String fnModel, String task){
		ProcessUtils.addProcessContext(new ProcessEngine(task, null));
		return testFn(fn, fnModel);
	}
	
	private static Map<String, String> orgUnit2Map(OrgUnit orgUnit) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("fid", orgUnit.getFID());
		map.put("fname", orgUnit.getFName());
		return map;
	}
	
	private static List<Map<String, String>> orgUnits2Maps(List<?> orgUnits) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (Object item : orgUnits) {
			if (item instanceof OrgUnit) {
				list.add(orgUnit2Map((OrgUnit) item));
			}
		}
		return list;
	}
	
	private static Object transformFnResult(Object result) {
		if (result instanceof OrgUnit){
			return orgUnit2Map((OrgUnit) result);
		} else if ((result instanceof List) && (((List<?>) result).size() > 0) && (((List<?>) result).get(0) instanceof OrgUnit)) {
			return orgUnits2Maps((List<?>) result);
		}
		return result;
	}

}
