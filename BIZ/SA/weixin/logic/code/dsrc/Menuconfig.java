import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

import com.justep.system.data.Row;
import com.justep.system.data.SQL;
import com.justep.system.data.Table;


import org.dom4j.Document;   
import org.dom4j.DocumentHelper;   
import org.dom4j.Element; 
import com.justep.system.data.KSQL;

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;


public class Menuconfig {
	//获取菜单配置文件
		public static String getMenuConfig(String sCode,String isSingle){
			String wxMenuConfig = "invalid";
		    String ksql = "select sText AS STEXT from SA_Code where sType = 'wxMenuConfig' ";
		    if(!isSingle.equals("是"))
		    	ksql = ksql + " and sCode = '"+sCode+"'" ;
			Map<String, String> sql = new HashMap<String, String>();
			sql.put(SQL.DEFAULT_DB_NAME, ksql);
			
			
			Table table = SQL.select(sql, null, "/system/data");
			Iterator<Row> rows = table.iterator();
			if (rows.hasNext()) {
				Row row = rows.next();
			
				wxMenuConfig = row.getString("STEXT");
				
			}

			
			
			return wxMenuConfig;
		}
		
		

		public static void deleteMenuConfig(String sCode,String isSingle){
			Map<String, String> sql = new HashMap<String, String>();
			String ksql = "delete from SA_Code  where sType = 'wxMenuConfig' ";
			if(!isSingle.equals("是"))
		    	ksql = ksql + " and sCode = '"+sCode+"'" ;
			sql.clear();
			
			sql.put(SQL.DEFAULT_DB_NAME,ksql);
		
			SQL.executeUpdate(sql, null, "/system/data");
		}
		
		public static void modifyOrgwxDeptID(){
			Map<String, String> sql = new HashMap<String, String>();
			
			sql.clear();
			sql.put(SQL.DEFAULT_DB_NAME, "update SA_OPOrg SA_OPOrg  set SA_OPOrg.sWxDeptID = null  where SA_OPOrg.sOrgKindID in ('ogn','dpt') ");
		
			SQL.executeUpdate(sql, null, "/system/data");
		}
		
		
	public static void saveMenuConfig(String strJson,String angentID,String oldAngentID,String isSingle){
		String sjson = MenuMethod.GetData2(strJson);
     //   if(oldAngentID.equals(""))
        //	angentID = "wxMenuConfig";
		Map<String, String> sql = new HashMap<String, String>();
		String sConfig = getMenuConfig(oldAngentID,isSingle);
		
		List<Object> params = new ArrayList<Object>();
		params.add(sjson);
		if(sConfig.equals("invalid")){
			//新增配置数据
		    String GUID = com.justep.system.util.CommonUtils.createGUID();
			sql.clear();
			sql.put(SQL.DEFAULT_DB_NAME, "insert into SA_Code(sID,sType,sName,sCode,sText,version) " +
					"values('"+GUID+"','wxMenuConfig','微信菜单配置','"+angentID+"',?,0) ");		
		}else{
			//修改配置数据	
			sql.clear();
			String ksql = "update SA_Code set sCode = '"+angentID+"',sText = ? where sType = 'wxMenuConfig' ";
			if(!isSingle.equals("是"))	
				ksql = ksql + " and sCode = '"+oldAngentID+"'";
			sql.put(SQL.DEFAULT_DB_NAME, ksql);
		}
		SQL.executeUpdate(sql, params, "/system/data");
	}
	
	public static String getweixinSet() {
		   
		String ksql = "select SA_WeixinCp.sName,SA_WeixinCp.sCode,SA_WeixinCp.sText from SA_WeixinCp SA_WeixinCp ";
				
        String protocolXML = "";
		Table table = KSQL.select(ksql, null, "/SA/weixin/data", null);
		Iterator<Row> rows = table.iterator();
		Row row;
	
		while (rows.hasNext()){
			row = rows.next();	
			protocolXML = row.getString("sText")+"";
				
		}
		
	    if(protocolXML.equals(""))
	    	return "";
		 String jsonStr = "";
        try {   
  
             Document doc=(Document)DocumentHelper.parseText(protocolXML);  
          
             Element parentElement = doc.getRootElement();   

             Iterator<Element> Elements = parentElement.elementIterator();
          
            String rowsString = "";
            String rowStr = "";
       
			for (Iterator<Element> it = parentElement.elementIterator(); it.hasNext();) {
				Element corps = it.next();

				List  subElements = corps.elements();   
	         	
				 rowStr = "{\"id\":{\"value\" :\""+com.justep.system.util.CommonUtils.createGUID()+"\" }";
	             for( int i=0;i<subElements.size();i++){   
	                 Element ele = (Element)subElements.get(i); 
	                 rowStr = rowStr + ",\""+ele.getName()+"\":{\"value\" :\""+ele.getText()+"\" }";
	                 
	                
	              } 
	             rowStr = rowStr + "}";
	             if(rowsString.equals(""))
	             	rowsString = rowStr;
	             else
	             	rowsString = rowsString + ","+ rowStr;
			}   
             jsonStr = "{\"@type\" : \"table\",\"rows\" :["+rowsString+"]}" ;

         } catch (Exception e) {   
             e.printStackTrace();   
         }   
        return jsonStr;
     }   
	
	
	public static void reLoadWxCache(String sText){
			
		com.justep.weixin.cp.JustepCpConfigStorage.updateConfig(sText);
	}
	
	public static void setClipbordContents(String contents) {
		  StringSelection stringSelection = new StringSelection( contents );
		  // 系统剪贴板
		  Clipboard  clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
		  clipboard.setContents(stringSelection, null);
    }
	
}


class MenuRow
{
    public String type;
    public RowModel[] rows;
}




class RowModel{
	public ValueModel Name;
	public ValueModel id;
//	public ValueModel sType;
//	public ValueModel sKey;
	public ValueModel parent;
	public ValueModel URL;
	public ValueModel configKey;
	public ValueModel level;
//	public ValueModel corpId;
	public ValueModel path;
//	public ValueModel httpURL;
	public ValueModel funcURL;
	public UserData  userdata;
	
	public List<RowModel> rows;
	
	public RowModel()
	{
		this.rows = new  ArrayList<RowModel>();
		
	}
    		
}

class ValueModel{
	public String value;
}

class UserData{
	public ValueModel id;
}

class MenuMethod
{
	public static List<RowModel> GetData(String json)
	{
		List<RowModel> data = new ArrayList<RowModel>();
		data =JSONObject.parseArray(json,RowModel.class);
		return data;
	}
	
	public static String GetData2(String json)
	{	
		json = json.replace("{\"@type\":\"table\",\"rows\":","");
	
		json = json.substring(0, json.length()-1);
	
		List<RowModel> menurow = new ArrayList<RowModel>();
		menurow =JSONObject.parseArray(json,RowModel.class);
		//list对象转化为字典，因为字典可以进行查找 速度快
		Map<String,RowModel> data = new HashMap<String,RowModel>();
	    for(int i=0;i<= menurow.size()-1;i++)
	    {
	    	menurow.get(i).id= menurow.get(i).userdata.id;
	    	data.put(menurow.get(i).id.value, menurow.get(i));
	    	menurow.get(i).userdata= null;
	    }
	    //字典构造完毕后进行构建主要算法就在此处
	    List<RowModel> result = new ArrayList<RowModel>();
	    for (RowModel row : data.values()) 
	    {     
	    	if(data.containsKey(row.parent.value))
			{
	    		if(data.get(row.parent.value).rows==null)
	    		{
	    			data.get(row.parent.value).rows = new  ArrayList<RowModel>();
	    		}
	    		data.get(row.parent.value).rows.add(row);
			}
	    	else
	    	{
	    		result.add(data.get(row.id.value));
	    	}
	    }      
		return JSONObject.toJSONString(result);
		
	}

}

