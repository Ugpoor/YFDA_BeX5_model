import java.util.HashMap;
import java.util.Map;


import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.XuiElement;

public class ReportData extends BaseComponent {

	@SuppressWarnings("rawtypes")
	public Map editRule(XuiElement currentElement) {
		Map conifgMap = new HashMap();
		return conifgMap;
	}

	public boolean validate(XuiElement xuiElement) {
		boolean result = true;
		String dataId = xuiElement.getId();
		if(dataId.equals("")){
			this.addError(xuiElement,"reportData组件xid属性不能为空!");
			result = false;
		}
		XuiElement sourceE = xuiElement.getChildByTagName("source");
		if(sourceE == null){
			this.addError(xuiElement,"reportData组件source子节点不存在!");
			result = false;
		}
		/*
		String ksqlText = "";
		XuiElement ksqlE = xuiElement.getChildByTagName("source").getChildByTagName("KSQL");
		if(ksqlE != null){
			ksqlText = ksqlE.getText();
		}
		
		String sqlText = "";
		XuiElement sqlE = xuiElement.getChildByTagName("source").getChildByTagName("SQL");
		if(sqlE!=null){
			XuiElement defaultE = sqlE.getChildByTagName("DEFAULT");
			if(defaultE != null){
				sqlText = defaultE.getText();
			}
			
			XuiElement oracleE = sqlE.getChildByTagName("ORACLE");
			if(oracleE != null){
				sqlText = oracleE.getText();
			}
			
			XuiElement mssqlE = sqlE.getChildByTagName("MSSQL");
			if(mssqlE != null){
				sqlText = mssqlE.getText();
			}
			
			XuiElement db2E = sqlE.getChildByTagName("DB2");
			if(db2E != null){
				sqlText = db2E.getText();
			}
			
			XuiElement sybaseE = sqlE.getChildByTagName("SYBASE");
			if(sybaseE != null){
				sqlText = sybaseE.getText();
			}
			
		}
		
		//可以为空 JS 中填充SQL 或KSQL 语句
		if(ksqlText.equals("") && sqlText.equals("")){
			this.addError(xuiElement,"reportData组件("+dataId+")查询语句不能为空!");
		}
		*/
		
		/*
		XuiElement actionE = xuiElement.getChildByTagName("source").getChildByTagName("ACTION");
		if(actionE != null){
			
		}*/
		
		
		return result;
	}
	
}
