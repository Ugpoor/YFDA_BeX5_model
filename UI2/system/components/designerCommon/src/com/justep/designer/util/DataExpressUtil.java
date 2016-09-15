package com.justep.designer.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.data.ModelDataSourceManager;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiDataSourceManager;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.editors.xui.js.JsModelClass;
import com.justep.studio.util.FileHelper;
import com.justep.studio.util.LogUtil;

/**
 * 数据表达式工具类.
 * @author zmh
 *
 */
public class DataExpressUtil {
	
	private static DataSet createDataSet() {
		DataSet dataset = new DataSet();
		dataset.setFireDataChangedEvent(false);
		dataset.setDisplayStyle(DataSet.DISPLAY_STYLE_TREE);
		dataset.addColumn("nodeType", "nodeType", "string").setVisible(false);
		dataset.addColumn("name", "name", "string").setSearchField(true).setVisible(false);
		dataset.addColumn("text", "text", "string").setTreeColumn(true).setLength(1000);
		dataset.addColumn("asPath", "asPath", "string").setVisible(false);
		dataset.addColumn("image", "image", "string").setVisible(false);
		return dataset;
	}
	
	public static String[] getActionInfoOfData(String action) {
		String[] actionInfo = new String[2];
		if(action == null){
			LogUtil.warn("没有设置reader action。");
			return new String[]{"",""};
		}
		int idx = action.lastIndexOf("/");
		if (idx != -1) {
			actionInfo[0] = action.substring(0, idx);	 
			actionInfo[1] = action.substring(idx + 1);
		}
		return actionInfo;
	}
	
	public static DataSet buildVarDataset(XuiElement currentComp,String propName,boolean isRelation,String targetData){
		DataSet dataset = createDataSet();
		boolean onlyShowRef = false;
		//boolean showContext = true;//是否显示上下文变量
		if("bind-ref".equals(propName) || "bind-value".equals(propName)  || isRelation){
			onlyShowRef = true;
		}
	    boolean foreachRef = false;
		String params = currentComp.getPropertyItem(propName)!=null?currentComp.getPropertyItem(propName).getEditorParameter():null;
		DataSet $rowDs = null; 
		if(params != null && !params.equals("") && params.startsWith("{")){
			JSONObject jsonObj = JSON.parseObject(params);
			if(jsonObj.getBooleanValue("isFilter")){
				 
				String reader = jsonObj.getString("reader");
				String[] actionInfo = getActionInfoOfData(reader);
				$rowDs = ModelDataSourceManager.getRelationsOfActionMainConcept(actionInfo[0], actionInfo[1]);
			}
			if(jsonObj.getBooleanValue("isRelation")){
				isRelation = jsonObj.getBooleanValue("isRelation");
			}
			if("false".equals(jsonObj.getString("hasLabel"))){
				onlyShowRef = true;
			}else if("true".equals(jsonObj.getString("hasLabel"))){
				onlyShowRef = true;
			}
			if("foreachRef".equals(jsonObj.getString("type"))){
				foreachRef = true;
			}
		}
		if($rowDs != null){
			DataRecord varRecord = dataset.addRecord(new Object[]{"var","$row","$row(计算行)",true,"var.gif"});
			List<DataRecord> relationList = $rowDs.getData();
			createRelationNode(varRecord,relationList,!onlyShowRef);
		}else if("filter".equals(propName) && (currentComp.getOriginElement() != null )){
			String dataXId = currentComp.getProperyValue("data");
			XuiElement dataE = currentComp.getXuiDataModel().findElementById(dataXId);
			if(dataE != null){
				DataRecord varRecord = dataset.addRecord(new Object[]{"var","$row","$row(计算行)",true,"var.gif"});
				DataSet currentDataSet = XuiDataSourceManager.getDataRelationDataSet(dataE,true);
				List<DataRecord> relationList = currentDataSet.getData();
				createRelationNode(varRecord,relationList,!onlyShowRef);
			}
		}else if("dataColRule".equals(propName)){//列规则
			dataset.addRecord(new Object[]{"var","$col","$col(当前列的值)",true,"var.gif"});
			dataset.addRecord(new Object[]{"var","$colName","$colName(当前列名)",true,"var.gif"});

			DataRecord varRecord = dataset.addRecord(new Object[]{"var","$row","$row",true,"var.gif"});
			DataSet currentDataSet = XuiDataSourceManager.getDataRelationDataSet(currentComp,true);
			List<DataRecord> relationList = currentDataSet.getData();
			createRelationNode(varRecord,relationList,!onlyShowRef);
		
		}else if("dataRule".equals(propName)){//data上的规则
			String xid = currentComp.getProperyValue("xid");
		 
			DataRecord varRecord = dataset.addRecord(new Object[]{"var","$row","$row("+xid+"计算行)",true,"var.gif"});
			DataSet currentDataSet = XuiDataSourceManager.getDataRelationDataSet(currentComp,true);
			List<DataRecord> relationList = currentDataSet.getData();
			createRelationNode(varRecord,relationList,!onlyShowRef);
			
			varRecord = dataset.addRecord(new Object[]{"var","$data","$data("+xid+")",true,"var.gif"});
			createRelationNode(varRecord,relationList,!onlyShowRef);
		}
		
		//查找上下文中的foreach
		List<JSONObject> foreachList = getForeachList(currentComp);
		
		for(int i = 0;i<foreachList.size();i+=1){
			JSONObject dataitem = foreachList.get(i);
			String dataXid = dataitem.getString("data");
			if(targetData != null && !targetData.equals("") && !targetData.equals(dataXid)){
				continue;
			}
			XuiElement dataE = currentComp.getXuiDataModel().findElementById(dataXid);
			if(dataE != null){
				String text = dataXid;
				String dataItemAlias = dataitem.getString("dataItemAlias");//别名
				String xid = dataitem.getString("xid");//目标组件的xid
				if(xid == null || xid.equals("")){
					xid = "list";
				}
				boolean isPath = true;
				if(i == 0){
					//第一个表示当前的上下文
					dataItemAlias = dataXid;
					isPath = false;//当前的不需要前缀
				}else if(i>0 &&(dataItemAlias == null|| dataItemAlias.equals(""))){
					continue;
				} 
				text = dataItemAlias+"("+xid+"当前行)";
				DataRecord varRecord = dataset.addRecord(new Object[]{"var",dataItemAlias,text,isPath,"var.gif"});
				DataSet currentDataSet = XuiDataSourceManager.getDataRelationDataSet(dataE,true);
				List<DataRecord> relationList = currentDataSet.getData();
				createRelationNode(varRecord,relationList,!onlyShowRef);
				
				if(i == 0){
					varRecord = dataset.addRecord(new Object[]{"var","context","context(当前上下文变量)",false,"var.gif"});
					new DataRecord(new Object[]{"var","$index()","$index(当前索引)",true,"var.gif"},varRecord);
					new DataRecord(new Object[]{"var","$element","$element(当前dom节点)",true,"var.gif"},varRecord);
				}else{
					varRecord = dataset.addRecord(new Object[]{"var","$parentContext["+i+"]","$parentContext["+i+"]",true,"var.gif"});
					new DataRecord(new Object[]{"var","$index()","$index(当前索引)",true,"var.gif"},varRecord);
					new DataRecord(new Object[]{"var","$element","$element(当前dom节点)",true,"var.gif"},varRecord);				
				}
			}
		}
		
		DataRecord varRecord = dataset.addRecord(new Object[]{"var","$model","$model",!foreachRef,"var.gif"});
		DataSet tempDataset = XuiDataSourceManager.getAllDataRelationTreeDataSet(currentComp);
		List<DataRecord> rootList = tempDataset.getData();

		List<DataRecord> dataList = rootList.get(0).getChildList();
		for(DataRecord rc:dataList){
			if(targetData != null && !targetData.equals("") && !targetData.equals(rc.getString("xid"))){
				continue;
			}
			DataRecord dataRc = new DataRecord(new Object[]{"data",rc.getString("xid"),rc.getString("text"),!foreachRef,"data.gif"},varRecord);
			List<DataRecord> relationList = rc.getChildList();
			createRelationNode(dataRc,relationList,!onlyShowRef);
		}
		if(!onlyShowRef){
			buildModelFunction(varRecord,currentComp);			
		}
	
		return dataset;
	}
	
	/**
	 * 构建表达式数据集.
	 * @param currentComp
	 * @param propName
	 * @return
	 */
	public static DataSet buildVarDataset(XuiElement currentComp,String propName,boolean isRelation){
		return buildVarDataset(currentComp, propName, isRelation,null);
	}

	/**
	 * 获取model下的函数列表.
	 * @param parentRecord
	 */
	private static void buildModelFunction(DataRecord parentRecord,XuiElement ownerElement){
		String wContent = W3cDocumentHelper.asXML(ownerElement.getXuiDataModel().getRootElement().getOriginElement());
		String wFilePath = ownerElement.getXuiDataModel().getFilePath();
		String jsFilePath = wFilePath.substring(0,wFilePath.lastIndexOf("."))+".js";
		File jsFile = new File(jsFilePath);
		if(jsFile.exists()){
			String content = FileHelper.readFileAsStr(jsFile.getAbsolutePath(),"UTF-8",false);
			JsModelClass modeClass = new JsModelClass(content,new ArrayList<String>());
			List<String> methodList = modeClass.getMethodWithParamList(true);
			for(String method:methodList){
				if(method.indexOf("(") == -1){
					continue;
				}
				if(wContent.indexOf("\""+method.substring(0,method.indexOf("("))+"\"") == -1){//排除事件类型的函数
					new DataRecord(new Object[]{"method",method,method,true,"method.gif"},parentRecord);					
				}
			}
		}
	}
	
	/**
	 * 获取当前以及父的所有foreach组件。
	 * @param xuiE 当前节点
	 * @return
	 */
	private static List<JSONObject> getForeachList(XuiElement xuiE){
		List<JSONObject> foreachList = new ArrayList<JSONObject>();
		while(xuiE != null){
			if("foreach".equalsIgnoreCase(xuiE.getComponentType())){ 
				String PRange = xuiE.getConfigAttribute("parent-range");
				 JSONObject dataItem = new JSONObject();
				 fetchComponentData(xuiE,PRange,dataItem);
				 foreachList.add(dataItem);
			}
			xuiE = xuiE.getParentElement();
		}
		return foreachList;
	}

	/**
	 * 获取foreach组件上的data信息.
	 * @param xuiE 当前foreach组件
	 * @param PRange 组件的父范围--在组件配置中配置，只能配置一个
	 * @param dataItem 存储数据的数据项
	 */
	private static void fetchComponentData(XuiElement xuiE, String PRange,JSONObject dataItem){
		String data = "";
		if(null!=xuiE){
			org.w3c.dom.Element element = xuiE.getOriginElement();
			if(null!=PRange && !"".equals(PRange)){
				if(PRange.equals(element.getAttribute("component"))){
					data = element.getAttribute("data");
					dataItem.put("data", data);
					dataItem.put("xid", element.getAttribute("xid"));
					dataItem.put("dataItemAlias", element.getAttribute("dataItemAlias"));
				}else{
					 fetchComponentData(xuiE.getParentElement(), PRange, dataItem);
				}
			}else{
				data = element.getAttribute("data");
				dataItem.put("data", data);
				dataItem.put("xid", element.getAttribute("xid"));
				dataItem.put("dataItemAlias", element.getAttribute("dataItemAlias"));
			}
		}
	}
	
	/**
	 * 创建关系节点.
	 * @param parentRc 父记录
	 * @param relationList 原始的关系记录.
	 */
	private static void createRelationNode(DataRecord parentRc,List<DataRecord> relationList,boolean createMethodNode){
		for(DataRecord relation:relationList){
			String label = relation.getString("label");
			if(label == null || label.equals("")){
				label = relation.getString("text");
			}
			String name = relation.getString("name");
			if(name == null || name.equals("")){
				name = relation.getString("xid");
			}
			if(label == null || label.equals("")){
				label = name;
			}else if(!name.equals(label)){
				label = name+"("+label+")";
			}
			DataRecord relationRc = new DataRecord(new Object[]{"relation",name,label,true,"relation.gif"},parentRc);
			//relationRc.canFilt("false");
			if(createMethodNode){
			  relationRc.setAlwaysDisplayChild(true);
			  createMethodNode(relationRc);
			}
		}
	}
	
	/**
	 * 创建数据行常用方法节点.
	 * @param parentRc 数据行
	 */
	private static void createMethodNode(DataRecord parentRc){
		new DataRecord(new Object[]{"method","ref","ref",true,"relation.gif"},parentRc);
		new DataRecord(new Object[]{"method","val","val",true,"relation.gif"},parentRc);
		new DataRecord(new Object[]{"method","label","label",true,"relation.gif"},parentRc);
	}
	
	/**
	 * 获取带函数的路径.
	 * @param record
	 * @return
	 */
	public static String getFunPath(DataRecord record){
		return getFunPath(record,"val");
	}

	/**
	 * 获取带函数的路径.
	 * @param record
	 * @method 默认的方法
	 * @return
	 */
	public static String getFunPath(DataRecord record,String method){
		String path = "";
		String nodeType = record.getString("nodeType");
		if("method".equals(record.getString("nodeType"))){
			DataRecord pRecord = record.getParent();
			if(pRecord != null && "relation".equals(pRecord.getString("nodeType"))){
				String prefix = getPath(record.getParent().getParent());
				if(prefix !=null && !prefix.equals("")){
					prefix = prefix + ".";
				}
				path = prefix+record.getString("name")+"(\""+pRecord.getString("name")+"\")";
			}else{
				path = getPath(record);
			}
		}else if("relation".equals(nodeType)){
			String prefix = getPath(record.getParent());
			if(prefix !=null && !prefix.equals("")){
				prefix = prefix + ".";
			}
			path = prefix+method+"(\""+record.getString("name")+"\")";
		}else{
			path = getPath(record);
		}
		return path;
	}
	
	/**
	 * 获取对象引用路径.
	 * @param record
	 * @return
	 */
	public static String getRefPath(DataRecord record){
		return getFunPath(record,"ref");
	}
	
	/**
	 * 获取标签引用路径.
	 * @param record
	 * @return
	 */
	public static String getLabelPath(DataRecord record){
		return getFunPath(record,"label");
	}
	
	/**
	 * 获取数据记录的路径.
	 * @param record
	 * @return
	 */
	public static String getPath(DataRecord record){
		List<String> list = new ArrayList<String>();
		while(record != null){
			if(record.getBoolean("asPath")){
				list.add(record.getString("name"));
			}
			record = record.getParent();
		}
		StringBuffer sbf = new StringBuffer();
		for(int i = list.size()-1;i>=0;i-=1){
			sbf.append("."+list.get(i));
		}
		
		if(sbf.length()>0){
			return sbf.toString().substring(1);
		}
		return "";
	}
}
