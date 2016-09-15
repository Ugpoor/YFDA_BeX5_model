import java.util.List;
import java.util.Map;

import com.justep.model.Model;
import com.justep.model.ModelObject;
import com.justep.model.ModelUtils;
import com.justep.model.Store;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.export.ExportDataHelper;
import com.justep.util.InitUtils;


public class ExportData {
	public static void exportDataFromDB(List<String> concepts, String model){
		ExportDataHelper.exportDataFromDB(concepts, model);
	}
	
	public static void exportDataFromDB2(Map<String, List<String>> config){
		ExportDataHelper.exportDataFromDB(config);
	}
	
	public static Table getDataModels(String model){
		Table result = TableUtils.createTable(ModelUtils.getModel("/system/data"), "path", "String");
		for (String path : InitUtils.getDataModels("/")){
			if ((model==null) || (path.startsWith(model))){
				Model m = ModelUtils.getModel(path);
				if(!m.getLocalObjectsByType(Store.TYPE).isEmpty()){
					Row r = result.appendRow();
					r.setString("path", path);
				}
			}
		}
		return result;
	}
	
	

	public static Table getConceptsInModel(String model){
		Model m = ModelUtils.getModel("/system/data");
		Table result = TableUtils.createTable(m, "selected", "String", "name", "String");
		Model curModel = ModelUtils.getModel(model);
		for (ModelObject mo : curModel.getLocalObjectsByType(Store.TYPE)){
			Row r = result.appendRow();
			r.setString("selected", "0");
			r.setString("name", mo.getName());
		}
		return result;
	}	
}
