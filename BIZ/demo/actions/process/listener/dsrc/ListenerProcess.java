import java.math.BigDecimal;
import java.util.Iterator;

import com.justep.system.context.*;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.Utils;
import com.justep.system.util.CommonUtils;

public class ListenerProcess {

	public static void listenerProcessBeforeQueryDEMO_OrdersAction() {
		// 获取动作的参数condition
		String condition = (String) ContextHelper.getActionContext().getParameter("condition");
		// 在已有condition的基础上，限定只能显示华北地区的数据
		condition = (Utils.isNotEmptyString(condition) ? "(" + condition + ") AND " : "") 
			+ "(DEMO_Orders.fShipRegion = '华北')";
		// 设置动作的参数condition
		ContextHelper.getActionContext().setParameter("condition", condition);
	}

	public static void listenerProcessAfterQueryDEMO_OrdersAction() {
		// 获取动作的返回结果
		Table table = (Table) ContextHelper.getActionContext().getActionResult();
		// 扩展一个字符串列，用于显示组织类型的名称
		table.addColumn("chineseFreght", "String");
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			BigDecimal freght = row.getDecimal("fFreght");
			// 为扩展列赋值
			row.setString("chineseFreght", CommonUtils.toChineseMoney(freght));
			// 还原行编辑状态 
			row.setState(ModifyState.NONE);
		}
		// 设置动作的返回结果
		ContextHelper.getActionContext().setActionResult(table);
	}
}