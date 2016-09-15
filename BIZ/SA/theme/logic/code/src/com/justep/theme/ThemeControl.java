package com.justep.theme;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.system.opm.OrgUtils;




public class ThemeControl {
	private static final String DATA_MODEL = "/SA/theme/data";
	private static final String SYSTEM_DATA_MODEL = "/system/data";
	public static String selectThemeByOrgID(String personID) {
		String ksql = "SELECT t1.sThemeLayoutInfo FROM SA_ThemeDefine t1 where t1.sCreatorID =:createid AND t1.sThemeActivity=:activitestate";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("createid", personID);
		vars.put("activitestate", "activity");
		Table table = KSQL.select(ksql, vars, DATA_MODEL, null);
		Iterator<Row> it = table.iterator();
		String value = "";
		if (it.hasNext()) {
			value = it.next().getString("sThemeLayoutInfo");
		} else {
			value = selectThemeByOrg(ContextHelper.getPersonMember().getID());
		}
		return value;
	}

	public static String selectThemeByOrg(String orgID){
		
		String sql = "SELECT t1.sThemeLayoutInfo FROM SA_ThemeDefine t1 where t1 IN (SELECT s1.sThemeID FROM SA_ThemeManager s1 where s1.sOrgID=:orgid)";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("orgid", orgID);
		Table table = KSQL.select(sql, vars, DATA_MODEL, null);
		Iterator<Row> it = table.iterator();
		String value ="";
		if (it.hasNext()) {
			value = it.next().getString("sThemeLayoutInfo");
		}else{	
			String sql2 = "SELECT s1.sParent FROM SA_OPOrg s1 where s1='"+orgID+"'";
			Table table2 = KSQL.select(sql2, null, SYSTEM_DATA_MODEL, null);
			Iterator<Row> it2 = table2.iterator();
			if(it2.hasNext()){
				value = selectThemeByOrg(it2.next().getString("sParent"));
				
			}
		}
		return value;
	}

	public static void savePersonTheme(String TemplateInfomation,String personID){
		 String selectsql =  "SELECT t1.sThemeLayoutInfo,t1 FROM SA_ThemeDefine t1 WHERE t1.sCreatorID ='"+personID+"' AND t1.sThemeActivity='activity'";
		 Table table = KSQL.select(selectsql,null,DATA_MODEL,null);
		 Iterator<Row> it = table.iterator();
		 if(it.hasNext()){//判断是否已经存在个人模板
			 String fid = it.next().getString("t1");
			 String updatasql = "UPDATE SA_ThemeDefine s1 SET s1.sThemeLayoutInfo=:info WHERE s1 = '"+fid+"'";
			 Map<String, Object> vars  = new HashMap<String, Object>();
			 vars.put("info", TemplateInfomation);
			 KSQL.executeUpdate(updatasql,vars, DATA_MODEL, null);
		 }else{
			 String fid = CommonUtils.createGUID();
			 String insertsql = "insert into SA_ThemeDefine s(s,s.version,s.sThemeName,s.sThemeLayoutInfo,s.sThemePublishType,s.sThemeActivity,s.sCreatorID) values (:var1,:var2,:var3,:var4,:var5,:var6,:var7)";
			 Map<String, Object> vars  = new HashMap<String, Object>();
			 vars.put("var1", fid);
			 vars.put("var2", 0);
			 vars.put("var3", "新建模板");
			 vars.put("var4", TemplateInfomation);
			 vars.put("var5", "person");
			 vars.put("var6", "activity");
			 vars.put("var7", personID);
			 KSQL.executeUpdate(insertsql, vars, DATA_MODEL, null);
		 }
	}
	
	public static Boolean removeThemeByPersonID(String personID){
		String deletesql = "DELETE FROM SA_ThemeDefine s1 WHERE s1.sCreatorID=:personID and s1.sThemePublishType='person'";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("personID", personID);
		KSQL.executeUpdate(deletesql,vars, DATA_MODEL, null);
		return true;
	}
}
