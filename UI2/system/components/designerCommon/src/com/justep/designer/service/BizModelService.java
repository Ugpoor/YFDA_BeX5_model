package com.justep.designer.service;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.db.model.TableColumn;
import com.justep.db.service.AbstractDBService;
import com.justep.db.service.IDBService;
import com.justep.db.util.ConnectionUtil;
import com.justep.design.model.Model;
import com.justep.design.model.ModelParser;
import com.justep.design.model.element.BaseMElement;
import com.justep.design.model.element.RelationAdapter;
import com.justep.studio.data.DSUtil;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.util.XuiDynJavaManager;
import com.justep.studio.ui.views.ConsoleView;
import com.justep.studio.util.StudioConfig;

public class BizModelService {
 
	static String bizPath = StudioConfig.getBIZPath();///"D:/x5version/X5.3.0.3005_trunk/model/BIZ";
 
	/**
	 * 设置是否需要缓存.
	 * @param context
	 */
	public static void setCacheFlag(final Map<String,Object> context){
		ModelParser.setCacheFlag("true".equals(context.get("cacheFlag")));
	}
 
	public static Model getModel(String modelPath){
		Model model = ModelParser.parseModel(bizPath, modelPath);
		return model;
	}

	private static boolean hasMethod(Class<?> cls,String sMethod){
		Method[] methods = cls.getMethods();
		for(Method method:methods){
			if(method.getName().equals(sMethod)){
			   return true;
			} 
		}
		return false;
    }
	
	@SuppressWarnings("unchecked")
	private static Object toJSON(Object obj,boolean returnAllProperty,Set<Object> cache){
		if(obj == null){
			return null;
		}
		if(cache == null){
			cache = new HashSet<Object>();
		}
		if(cache.contains(obj)){//防止相互引用导致死循环
			return null;
		}
		cache.add(obj);
		if(obj instanceof String || obj instanceof Integer){
			return obj+"";
		}else if(obj instanceof Map){
			JSONObject jsonObj = new JSONObject();
			Map<String,Object> map = (Map<String,Object>)obj;
			Set<String> keySet = map.keySet();
			for(String key:keySet){
				Object targetObj = map.get(key);
				Object value = toJSON(targetObj,returnAllProperty,cache);
				if(value != null){
					jsonObj.put(key, value);
				}
			}
			
		}else if(obj instanceof List){
			JSONArray array = new JSONArray();
			List<Object> list = (List<Object>)obj;
			for(Object item:list){
				Object value = toJSON(item,returnAllProperty,cache);
				if(value != null){
					array.add(value);
				}
			}
			return array;
		}else if(obj instanceof BaseMElement || obj instanceof RelationAdapter){
			JSONObject jsonObj = new JSONObject();
			if( obj instanceof BaseMElement){
				BaseMElement mElement = (BaseMElement)obj;
				jsonObj.put("tagName", mElement.getTagName());
				if(!returnAllProperty || cache.size() == 1){
				  jsonObj.put("ownerModelName", mElement.getOwnerModelName());
				  jsonObj.put("ownerFile", mElement.getOwnerFile());
				}
			}

			Field[] fields = obj.getClass().getDeclaredFields();
			for(Field field:fields){
				try{
					String name = field.getName();
					String methodName = "get"+name.substring(0,1).toUpperCase()+name.substring(1);
					if(field.getType().getName() == "java.lang.String"){
						if(!hasMethod(obj.getClass(), methodName)){
							continue;
						}
						String value = (String)XuiDynJavaManager.executeMethod(obj, methodName, new Object[]{});//obj.getProperty(field.getName());
						if(value != null && !value.equals("")){
							jsonObj.put(field.getName(), value);
						}
					}else if(field.getType() == Boolean.class){
						methodName = "is"+name.substring(0,1).toUpperCase()+name.substring(1);
						if(!hasMethod(obj.getClass(), methodName)){
							continue;
						}
						Object value =  XuiDynJavaManager.executeMethod(obj, "is"+name.substring(0,1).toUpperCase()+name.substring(1), new Object[]{});//obj.getProperty(field.getName());
						if(value != null && !value.equals("")){
							jsonObj.put(field.getName(), ""+value);
						}
					}else if(returnAllProperty){
						if(!hasMethod(obj.getClass(), methodName)){
							continue;
						}
						Object value = (Object)XuiDynJavaManager.executeMethod(obj, methodName, new Object[]{});
						value = toJSON(value,returnAllProperty,cache);
						if(value != null){
							jsonObj.put(field.getName(), value);							
						}
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
				
			}
			return jsonObj;
		}
		return null;
	}
	
	private static String toJSONString(Object obj){
		if(obj != null){
			if(obj instanceof String){
				return obj.toString();
			}else if(obj instanceof JSONObject){
				return ((JSONObject)obj).toJSONString();
			}else if(obj instanceof JSONArray){
				return ((JSONArray)obj).toJSONString();
			}
		}
		return "";
	}
	
	/**
	 * 获取模型元素的属性.
	 * @param context
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String get(Map<String,Object> context){
		Map<String,String>  ownerMElement = (Map<String,String>)context.get("ownerMElement"); //模型元素信息
		String propName = (String)context.get("propName");//属性名
		String returnAllProperty  = ""+context.get("returnAllProperty");//返回所有属性
		String modelPath  = (String) context.get("modelPath");//模块路径
		Model model = getModel(modelPath);
		String tagName = ownerMElement.get("tagName");//对应xml中的tagName
		String name = ownerMElement.get("name");
		Object obj = XuiDynJavaManager.executeMethod(model, "find"+tagName.substring(0,1).toUpperCase()+tagName.substring(1), new String[]{name});
		if(obj != null){
			obj = XuiDynJavaManager.executeMethod(obj,"getProperty",new String[]{propName});		
			if(obj != null){
				return toJSONString(toJSON(obj,("true".equals(returnAllProperty))?true:false,null));
			}
		}
		return "";
	}
	
	/**
	 * 调用模型中的方法.
	 * @param context
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String callMethod(Map<String,Object> context){
		String modelPath  = (String) context.get("modelPath");//模块路径
		String returnAllProperty  = ""+context.get("returnAllProperty");//返回所有属性
		String targetMethod  = (String) context.get("targetMethod");//要调用方法名称
		List<Object> params = (List<Object>)context.get("params");//方法参数
		if(params == null){
			params = new ArrayList<Object>();
		}
		Object[] arguments = new Object[params.size()];
		for(int i = 0;i<params.size();i+=1){
			arguments[i] = params.get(i);
		}
		Model model = getModel(modelPath);
		Object obj = XuiDynJavaManager.executeMethod(model, targetMethod, arguments);
		if(obj != null){
			Object value = toJSON(obj,("true".equals(returnAllProperty))?true:false,null);
			if(value != null){
				return toJSONString(value);
			}
		}
		return "";
	}
	
	/**
	 * 获取biz下的所有应用名称.
	 * @param context
	 * @return
	 */
	public static String getAllAppNames(Map<String,Object> context){
		JSONArray array = new JSONArray();
	    File bizDir = new File(bizPath);
	    File[] files = bizDir.listFiles();
	    for(File file:files){
	    	String name = file.getName();
	    	if(file.isFile() || name.startsWith(".") || name.endsWith("_X")){
	    		continue;
	    	}
	    	array.add(name);
	    }
	    return array.toJSONString();
	    
	}
	
	/**
	 * 根据数据源获取数据库表信息.
	 * @param context
	 * @return
	 */
	public static String getDBTables(Map<String,Object> context){
		String dsName = (String)context.get("dsName");
		try {
			Connection connection = ConnectionUtil.getConnectionByDsName(dsName);
			DataSet dataSet = new DataSet();
			DSUtil.createSelectedColumn(dataSet);
			
			dataSet.addColumn("name").setLength(200).setHeader("表名").setSearchField(true);
			dataSet.addColumn("type").setLength(50).setHeader("类型");
			dataSet.addColumn("remarks").setLength(200).setHeader("备注");
			IDBService dbService = AbstractDBService.getService(connection);
			String userName = connection.getMetaData().getUserName();
			List<com.justep.db.model.Table> tables = dbService.getTables(connection,userName,new String[]{"TABLE"});
			
			for (com.justep.db.model.Table table : tables) {
				dataSet.addRecord(new Object[]{"",table.getTableName(),"TABLE",dbService.getTableRemarks(connection, userName, table.getTableName())});
			}
			
			tables = dbService.getTables(connection,userName,new String[]{"VIEW"});
			
			for (com.justep.db.model.Table table : tables) {
				dataSet.addRecord(new Object[]{"",table.getTableName(),"VIEW",dbService.getTableRemarks(connection, userName, table.getTableName())});
			}
			return dataSet.toJsonString();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return "[]";
	}
	
	/**
	 * 根据数据源和表名获取字段信息.
	 * @param context
	 * @return
	 */
	public static String getTableFields(Map<String,Object> context){
		String dsName = (String)context.get("dsName");
		String tableName = (String)context.get("tableName");
		try {
			Connection connection = ConnectionUtil.getConnectionByDsName(dsName);
		 
			IDBService dbService = AbstractDBService.getService(connection);
			String userName = connection.getMetaData().getUserName();
			List<com.justep.db.model.Table> tables = dbService.getTables(connection,userName,new String[]{"TABLE","VIEW"});
			com.justep.db.model.Table tagetTable = null;
			for (com.justep.db.model.Table table : tables) {
				if(table.getTableName().equals(tableName)){
					tagetTable = table;
					break;
				}
				 
			}
			if(tagetTable != null){
				DataSet ds = new DataSet();
				DSUtil.createSelectedColumn(ds);
				ds.addColumn("name").setLength(130).setHeader("字段名").setSearchField(true);
				ds.addColumn("type").setLength(80).setHeader("类型");
				ds.addColumn("pk").setLength(70).setHeader("是否主键");
				ds.addColumn("sqlType").setVisible(false);
				ds.addColumn("size").setLength(50).setHeader("长度");
				ds.addColumn("decimalDigits").setLength(50).setHeader("精度");
				ds.addColumn("required").setLength(50).setHeader("非空");
				ds.addColumn("remarks").setLength(90).setHeader("备注");
			 
				List<TableColumn> columns = dbService.getColumns(connection, connection.getMetaData().getUserName(), tableName, true);
				
				for (TableColumn c : columns) {
					int size = 0;
					int decimalDigits=0;
					if(dbService.isVisibleColumnSize(c.getTypeName())){
						size = c.getColumnSize();
						decimalDigits = c.getDecimalDigits();
					}
					String typeName = c.getTypeName();
					int dataType = c.getDataType();
					if(typeName.toUpperCase().equals("NUMBER")&& size==22 && decimalDigits==0){
						typeName = "INTEGER";
						dataType = Types.INTEGER;
					}
					ds.addRecord(new Object[]{"",c.getColumnName(),typeName,c.isPrimaryKey()?"true":"",dataType,size>0?size:"",decimalDigits>0?decimalDigits:"",c.isNotNull()?"true":"",c.getRemarks()});
				}
				
				return ds.toJsonString();
			}
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			ConsoleView.println("获取表字段失败："+e.getMessage());
			e.printStackTrace();
		}
		return "[]";
	}
	
	public static void main(String[] args){
		Map<String,Object> context = new HashMap<String,Object>();
		context.put("dsName", "demo");
		context.put("tableName", "demo_asset");
		System.out.println(BizModelService.getTableFields(context));
	}
 
}
