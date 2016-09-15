import java.util.List;

import com.justep.system.context.*;
import com.justep.util.Utils;

public class ManagementProcess {

	public static void managementProcessBeforeQuerySendDocAction() {
		//获取当前操作员公文的业务管理权限
		String manageFilter = getManagementFilter("DOC", "doc.fCreateURL", null, true);
		System.out.println("管理权限表达式：" + manageFilter);
		//将过滤条件赋值到保护参数condition，condition会拼到QueryAction的SQL语句中
		ContextHelper.getActionContext().setParameter("condition", manageFilter);
	}
	
	private static String getManagementFilter(String manageTypeCode, String urlRelation, String psnRelation, boolean includeSelf) {
		Utils.check(Utils.isNotEmptyString(manageTypeCode), "必须指定管理权限的类型编码！");
		Utils.check(Utils.isNotEmptyString(urlRelation), "必须指定管理权限过滤的组织路径！");

		StringBuffer manageFilter = new StringBuffer();
		//包含本人
		if (includeSelf) {
			String psnID = ContextHelper.getPerson().getID();
			if (Utils.isNotEmptyString(psnRelation)) {
				manageFilter.append(String.format("(%s = '%s')", psnRelation, psnID));
			} else {
				manageFilter.append(String.format("(%s like '%%/%s@%%')", urlRelation, psnID));
			}
		}
		//管理权限过滤
		List<String> managers = ContextHelper.getRootManagementFIDs(manageTypeCode);
		for (String url : managers) {
			if (manageFilter.length() > 0) {
				manageFilter.append(" or ");
			}
			//按业务管理权限构造过滤条件
			manageFilter.append(String.format("(%s like '%s%%') ", urlRelation, url));
		}
		return manageFilter.toString();
	}
	
}