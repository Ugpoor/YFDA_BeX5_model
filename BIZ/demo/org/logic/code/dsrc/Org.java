import java.util.*;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.*;

public class Org {

	public static void demoAction1() {
		System.out.println("demoAction1执行！--------------------------------");
	}

	public static void demoAction2() {
		System.out.println("demoAction2执行！--------------------------------");
	}

	public static void demoAction3() {
		System.out.println("demoAction3执行！--------------------------------");
	}

	private static double getMaxOfList(List<Object> list) {
		double max = 0;
		if (list != null) {
			for (Object s : list) {
				double d = 0;
				try {
					d = Double.parseDouble(s.toString());
				} catch (NumberFormatException e) {
					continue;
				}
				max = Math.max(max, d);
			}
		}
		return max;
	}
	
	private static double getFreghtOfOrder(String orderID) {
		double freght = 0;
		Table table = KSQL.select("select DEMO_ReportOrders.rFreght from DEMO_ReportOrders DEMO_ReportOrders where DEMO_ReportOrders = '" + orderID + "'", null, "/demo/org/data", null);
		if (table.iterator().hasNext()) {
			Row row = table.iterator().next();
			freght = row.getDecimal("rFreght").doubleValue();
		} else {
			throw new RuntimeException("无效的订单：" + orderID);
		}
		return freght;
	}
	
	public static void orderShipVerify(String orderID, List<Object> verifyLimit){
		for (Object o : verifyLimit) {
			System.out.println(o.toString());
		}
		
		// 获取被授权的最大审核额度
		double verifyMax = getMaxOfList(verifyLimit);

		// 获取订单运费
		double freght = getFreghtOfOrder(orderID);
		
		// 判断审核额度
		if (freght > verifyMax) {
			throw new RuntimeException("订单发货审核失败，您的最大审核额度：" + verifyMax);
		}
		
		// 发货审核...
	}
	

	public static void orderShipVerify1(String orderID){
		// 获取业务策略
		List<Object> verifyLimit = ContextHelper.getSemanticPermission("订单发货审核额度");

		for (Object o : verifyLimit) {
			System.out.println(o.toString());
		}
		
		// 获取被授权的最大审核额度
		double verifyMax = getMaxOfList(verifyLimit);

		// 获取订单运费
		double freght = getFreghtOfOrder(orderID);
		
		// 判断审核额度
		if (freght > verifyMax) {
			throw new RuntimeException("订单发货审核失败，您的最大审核额度：" + verifyMax);
		}
		
		// 发货审核...
	}
}