import java.io.File;
import java.io.FileFilter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import com.justep.filesystem.FileSystemWrapper;
import com.justep.system.opm.OrgUtils;
import com.justep.system.opm.api.OrgHelper;
import com.justep.util.InitUtils;


public class Init {

	// 初始化演示数据
	public static void initDemoDB() throws Exception {
		clearDemoOrgs();
		createTableByOntology("/demo/common");
		executeInitSQL("/demo/common");
		
		InitUtils.createAppDb("/demo");
		InitUtils.initAppDb(null, "/demo");
	}

	// 按概念创建物理表
	private static void createTableByOntology(String model) throws Exception {
		String path = FileSystemWrapper.instance().getBase() + model + "/data";
		Class<?> c = Class.forName("com.justep.db.util.CreateDbTableUtil");
		Method m = c.getMethod("createTable", new Class[] {String.class});
		m.invoke(c, new Object[] {path});
	}
	
	// 执行初始化脚本
	private static void executeInitSQL(String model) {
		File[] files = new File(FileSystemWrapper.instance().getBase() + model + "/data/init").listFiles(
			new FileFilter() {
				public boolean accept(File file) {
					return file.getName().toLowerCase().endsWith("._ksql");
				}
			}
		);
		for (File file : files) {
			file.renameTo(new File(file.getAbsolutePath().toLowerCase().replace("._ksql", ".ksql")));
		}
		
		try {
			InitUtils.initAppDb(null, model);
		} finally {
			for (File file : files) {
				new File(file.getAbsolutePath().toLowerCase().replace("._ksql", ".ksql")).renameTo(file);
			}
		}
	}

	// 清除组织演示数据
	private static void clearDemoOrgs() {
		Map<String, Integer> orgs = new HashMap<String, Integer>();
		if (OrgUtils.findOrgUnitsByID("F92C257AEA094865A96").size() > 0) {
			orgs.put("F92C257AEA094865A96", null);
		}
		if (OrgUtils.findOrgUnitsByID("9EDE6548885F45ECB57").size() > 0) {
			orgs.put("9EDE6548885F45ECB57", null);
		}
		if (orgs.size() > 0) {
			OrgHelper.logicDeleteOrgs(orgs);
			OrgHelper.physicalDeleteOrgs(orgs, true);
		}
	}
	
}
