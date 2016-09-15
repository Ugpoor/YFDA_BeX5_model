import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.dom4j.QName;

import com.alibaba.fastjson.JSONObject;
import com.justep.ui.component.ComponentContext;
import com.justep.ui.component.ComponentTemplate;
import com.justep.ui.system.SystemComponentException;
import com.justep.ui.system.UISystemMessages;

/**
 * 
 * 转换为 commonData 模式存储数据
 */
public class ReportData implements ComponentTemplate {
	
	private Map<String, Object> context;
	private Element dataDef;
	private String dataId;
	
	public void execute(Element bound, Map<String, String> dataItems, Map<String, Object> props, Map<String, String> events,
			Map<String, Object> context){
		bound.addAttribute(new QName("__delete_node__"), "true");
		this.dataDef = bound;
		this.dataId = dataDef.attributeValue("xid");
		
		this.context = context;
		@SuppressWarnings("unchecked")
		List<String> init = (List<String>) context.get(ComponentContext.INIT);
		String js = processData();
		init.add(js);
		this.processData();
		this.context.put("data." + this.dataId, bound.elements());
	}
	
	protected String getReportDataClassName() {
		return "__Report_Data__";
	}

	private String processData() {
		JSONObject cfg = processDataConfig();
		String require = "";
		String Url = "$UI/system/components/justep/reportData/reportData";
		if(!this.context.containsKey(Url)){
			this.context.put(Url, Url);
			require = "var "+getReportDataClassName()+" = require(\""+Url+"\");";
		}
		return require + "new "+getReportDataClassName()+"(this," + cfg.toJSONString() + ");";
	}
	
	private JSONObject processDataConfig() {
		String src = dataDef.attributeValue("src") != null?dataDef.attributeValue("src"):"";
		String defaultSql = "", oracle = "",mssql = "",sybase = "",db2 = "",ksql="",dataModel = "",fnModel = "",action = "",columns = "";
		String type = "sql";

		//运行期兼容旧版本
		String dm = dataDef.attributeValue("dataModel");
		if(dm != null && !"".equals(dm)){
			dataModel = dm;
		}
		
		Element sourceE = dataDef.element("source");
		if(sourceE == null) 
			throw SystemComponentException.create(UISystemMessages.XBL_REPORT_DATA_ERROR);
		
		String beforeR = dataDef.attributeValue("onBeforeRefresh") == null ? "" :dataDef.attributeValue("onBeforeRefresh");
		String afterR = dataDef.attributeValue("onAfterRefresh") == null ? "" :dataDef.attributeValue("onAfterRefresh");
		
		JSONObject cfg = new JSONObject();
		cfg.put("xid", dataId);
		cfg.put("autoLoad", false);
		cfg.put("src", src);
		cfg.put("onBeforeRefresh", beforeR);
		cfg.put("onAfterRefresh", afterR);

		Element sqlE = sourceE.element("SQL");
		if(sqlE != null && sqlE.elements().size() > 0){
			Element element = sqlE.element("DEFAULT");
			defaultSql = element != null ? element.getText() : "";
			element = sqlE.element("ORACLE");
			oracle = element != null ? element.getText() : "";
			element = sqlE.element("MSSQL");
			mssql = element != null ? element.getText() : "";
			element = sqlE.element("SYBASE");
			sybase = element != null ? element.getText() : "";
			element = sqlE.element("DB2");
			db2 = element != null ? element.getText() : "";
			
			dataModel = sqlE.attributeValue("data-model");
			dataModel = dataModel==null?"":dataModel;

			oracle = oracle==null?"":oracle;
			mssql = mssql==null?"":mssql;
			db2 = db2==null?"":db2;
			sybase = sybase==null?"":sybase;
			
			JSONObject sql = new JSONObject();
			sql.put("oracle", oracle);
			sql.put("mssql", mssql);
			sql.put("db2", db2);
			sql.put("sybase", sybase);
			sql.put("defaultSql", defaultSql);
			cfg.put("sql", sql);
		}
		
		Element ksqlE = sourceE.element("KSQL");
		if(ksqlE != null && ksqlE.getText() != null && !"".equals(ksqlE.getText())){
			dataModel = ksqlE.attributeValue("data-model");
			fnModel = ksqlE.attributeValue("fn-model");	
			ksql = ksqlE.getText();
			dataModel = dataModel==null?"":dataModel;
			fnModel = fnModel==null?"":fnModel;
			ksql = ksql==null?"":ksql;
			cfg.put("ksql", ksql);
			if(!"".equals(ksql)) type = "ksql";
		}
		cfg.put("dataModel", dataModel);
		cfg.put("fnModel", fnModel);
		
		Element actionE = sourceE.element("action");
		if(actionE != null){
			action = actionE.attributeValue("name");
			action = action == null?"":action;
			
			if(!"".equalsIgnoreCase(action)){
				type = actionE.attributeValue("type");
				type = type == null?"action":type;				

				fnModel = actionE.attributeValue("fn-model");	
				fnModel = fnModel==null?"":fnModel;
			}
			
			columns = actionE.attributeValue("columns");
			columns = columns == null?"":columns;
			
			cfg.put("action", action);
			cfg.put("columns", columns);
		}
		cfg.put("type", type);
		
		return cfg;		
	}
}