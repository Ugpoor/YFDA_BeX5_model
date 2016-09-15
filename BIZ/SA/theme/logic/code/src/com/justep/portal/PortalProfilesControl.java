package com.justep.portal;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
public class PortalProfilesControl {
	private static final String DATA_MODEL = "/SA/theme/data";
	
	public static Boolean savePortalProfiles(String name,String value,String personID){
		Boolean result = false;
		String ksql = "SELECT s1.* FROM SA_PortalProfiles s1 where s1.sName=:name and s1.sPersonID=:personID";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("name",name);
		vars.put("personID", personID);
		Table table = KSQL.select(ksql, vars, DATA_MODEL, null);
		if(table.size()>0){
			String updateksql = "UPDATE SA_PortalProfiles s1 SET s1.sValue=:value where s1.sName=:name and s1.sPersonID=:personID";
			Map<String,Object> updatevars = new HashMap<String,Object>();
			updatevars.put("value", value);
			updatevars.put("name",name);
			updatevars.put("personID", personID);
			KSQL.executeUpdate(updateksql, updatevars, DATA_MODEL, null);
		}else{
			String insertksql = "INSERT INTO SA_PortalProfiles s1(s1,s1.version,s1.sName,s1.sPersonID,s1.sValue) values (:id,:version,:name,:personID,:value)";
			Map<String,Object> insertvars = new HashMap<String,Object>();
			insertvars.put("id",CommonUtils.createGUID());
			insertvars.put("version", 0);
			insertvars.put("value", value);
			insertvars.put("name",name);
			insertvars.put("personID", personID);
			KSQL.executeUpdate(insertksql, insertvars, DATA_MODEL, null);
		}
		return true;
	}
	public static String selectPortalProfiles(String name,String personID){
		String ksql = "SELECT s1.sValue FROM SA_PortalProfiles s1 where s1.sName=:name and s1.sPersonID=:personID";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("name",name);
		vars.put("personID", personID);
		Table table = KSQL.select(ksql, vars, DATA_MODEL, null);
		Iterator<Row> it = table.iterator();
		String value = "";
		if (it.hasNext()) {
			value = it.next().getString("sValue");
		}
		
		return value;
	}
	public static Boolean removePortalProfiles(String name,String personID){
		String deletesql = "DELETE FROM SA_PortalProfiles s1 WHERE s1.sName=:name and s1.sPersonID=:personID";
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("name",name);
		vars.put("personID", personID);
		KSQL.executeUpdate(deletesql,vars, DATA_MODEL, null);
		return true;
	}
}
