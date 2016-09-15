package com.justep.studio.ui.editors.property.datasource;

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Element;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiDataSourceManager;
import com.justep.studio.ui.editors.xui.XuiElement;

import com.justep.design.model.ModelConstant;
import com.justep.studio.data.DataColumn;
import com.justep.studio.data.DataRecord;
import com.justep.studio.ui.editors.util.PropertyEditorUtil;
import com.justep.studio.ui.editors.util.XuiConstant;
import com.justep.studio.util.LogUtil;
import com.justep.studio.util.XPathUtil;

public class RefPropertyDatasource extends PropertyDatasource{

	@SuppressWarnings("unchecked")
	public DataSet getDatasource(PropertyItem propertyItem) {
		XuiElement xuiElement = (XuiElement)propertyItem.getOwerElement();
		Element currentE = xuiElement.getOriginElement();
		DataSet ds = new DataSet();

		ds.setDisplayStyle(DataSet.DISPLAY_STYLE_TREE);
		ds.addColumn("nodeType", "nodeType", "string").setVisible(false);

		DataColumn column = ds.addColumn("text", "text", "string").setLength(400);
		column.setTreeColumn(true);
		column.setSearchField(true);

		column = ds.addColumn("xid", "xid", "string");
		column.setVisible(false);

		ds.addColumn("asPath", "asPath", "string").setVisible(false);
		ds.addColumn("image", "image", "string").setVisible(false);

		 
		Element winE = PropertyEditorUtil.getCurrentWindowElement(currentE);
        try{
        	String modelUrl = "$UI/system/components/justep/model/model";
			List<Element> models = XPathUtil.selectNodes(winE, ".//*[@component='"+modelUrl+"']");//W3cDocumentHelper.getChildXmlElementList(winE,"model");
			List<Element> otherDataList = XPathUtil.selectNodes(winE, ".//*[@component='$UI/system/components/justep/data/bizData' or @component='$UI/system/components/justep/data/data' or @component='$UI/system/components/justep/data/baasData']");
			
			for (Element modelE : models) {
				String modelId = modelE.getAttribute("xid");
				DataRecord modelNode = ds.addRecord(new Object[] { "model", modelId == null ? modelE.getTagName() : modelId, modelId });
				modelNode.setValue("image", "model.gif");
				modelNode.setValue("asPath", "false");
	            XuiElement xuiModelE = (XuiElement) modelE.getUserData(XuiConstant.OWNER_XUIELEMENT);
	            List<XuiElement> dataList = xuiModelE.getAllChildrenByComponentType("data");
	            if(otherDataList != null){
	            	//获取不放在model下面的data
	            	for(Element otherData:otherDataList){
	            		if(!modelUrl.equals(((Element)otherData.getParentNode()).getAttribute("component"))){
	            			dataList.add((XuiElement)otherData.getUserData(XuiConstant.OWNER_XUIELEMENT));
	            		}
	            	}
	            	otherDataList = null;
	            }
				//List<Element> datas = XPathUtil.selectNodes(modelE, ".//*[local-name()='data']");
				for (XuiElement dataE : dataList) {
					String dataId = dataE.getProperyValue("xid");
					if (dataId != null) {
						
						DataRecord dataNode = new DataRecord(new Object[] { "data", dataId == null ? dataE.getTagName() : dataId, dataId }, modelNode);
						dataNode.setValue("image", "data.gif");
						String concept = dataE.getProperyValue("concept");
						if(concept != null && !concept.equals("")){
							new DataRecord(new Object[] { "relation", concept, concept }, dataNode).setValue("image", "concept.gif");							
						}
						
						DataSet relationDS = getDataRelationDataSet(dataE);
						List<DataRecord> rcList = relationDS.getData();
						for (DataRecord rc : rcList) {
							String localName = rc.getString(ModelConstant.ALIAS);
							String name = rc.getString(ModelConstant.NAME);
							DataRecord relNode = new DataRecord(new Object[] { "relation", localName, name }, dataNode);
							relNode.setValue("image", "relation.gif");
						}
						List<XuiElement> childList = dataE.getChildren();
						for(XuiElement child:childList){
							if(child.getTagName().equals("calculateRelation")){
								String relation = child.getProperyValue("relation");
								new DataRecord(new Object[] { "relation", relation, relation }, dataNode).setValue("image", "calculate-relation.png");
							}else if(child.getTagName().equals("aggregateRelation")){
								String relation = child.getProperyValue("relation");
								new DataRecord(new Object[] { "relation", relation, relation }, dataNode).setValue("image", "aggregate-relation.png");
							}
						}
					}
				}
			}
        }catch(Exception ex){
        	LogUtil.error("所有data的relation数据集出错。", ex);
        }
		return ds;
	}
	
	/**
	 * 获取data中的的关系信息,列名有：
	 * ModelConstant.ALIAS,ModelConstant.LABEL,ModelConstant.NAME,ModelConstant.DATA_TYPE,ModelConstant.OWNER,ModelConstant.TYPE
	 * @return
	 */
	public static DataSet getDataRelationDataSet(XuiElement dataE) {
		DataSet ds = XuiDataSourceManager.createHasRelationDataSet();
		LogUtil.debug("开始获取data关系信息");
		try{
			String component = dataE.getProperyValue(XuiConstant.P_COMPONENT);
			//常量数据  
			if (component.equals(XuiConstant.COMMON_DATA_URL) || component.equals("$UI/system/components/justep/data/baasData")) {
				List<XuiElement> childList = dataE.getChildListByTagName("column");
				//String columns = dataE.getProperyValue(XuiConstant.P_COLUMNS);
				if (childList.size() == 0) {
					System.out.println("没有设置列信息。");
					return ds;
				}
//				String[] cls = columns.split(",");
				for (XuiElement e:childList) {
					String label = e.getProperyValue("label");
					String name = e.getProperyValue("name");
					
					ds.addRecord(new Object[] { false, name, label, name,e.getProperyValue("type") ,null,"column"});
				}
				LogUtil.debug("常量数据列信息获取成功。");
				return ds;
			}
	
			//从后台中获取action中对应的主概念关系
			String[] readActionInfo = XuiDataSourceManager.getActionInfoOfData(dataE, XuiConstant.P_READER);
			LogUtil.debug("对应的Action:"+readActionInfo);
			if (readActionInfo[0] != null && !readActionInfo[0].equals("")) {
				ds = XuiDataSourceManager.getRelationsOfActionMainConcept(readActionInfo[0], readActionInfo[1],false);
			}
			//如果指定关系列表则屏蔽掉不在列表中的关系
			String relations = dataE.getProperyValue(XuiConstant.P_REALTIONS);
			if (relations != null && !relations.equals("")) {
				String[] sRelations = relations.split(",");
				List<String> list = new ArrayList<String>();
				for (String s : sRelations) {
					list.add(s);
				}
				
				//concept不屏蔽
                List<DataRecord> drList = ds.getData();
                for(DataRecord dr:drList){
                	if("concept".equals(dr.getString(ModelConstant.TYPE))){
                		list.add(dr.getString(ModelConstant.ALIAS));
                	}
                }
				ds.removeByCondition(ModelConstant.ALIAS, list, null);
			}
	
			//获取计算关系
			List<XuiElement> list = dataE.getChildListByName(XuiConstant.CALCULATE_RELATION);
			for (XuiElement relationE : list) {
				String r = relationE.getProperyValue("relation");
				String type = ModelConstant.DT_STRING;
				String tmp = relationE.getProperyValue("type");
				if(tmp!=null && !tmp.equals("")){
					tmp = tmp.replace("xsd:", "");
					type = tmp.substring(0,1).toUpperCase()+tmp.substring(1);
				}
				ds.addRecord(new Object[] { false, r, r, r, type,null,"relation" });
			}
	
			//获取统计关系
			list = dataE.getChildListByName(XuiConstant.AGGREGATE_RELATION);
			for (XuiElement relationE : list) {
				String r = relationE.getProperyValue(XuiConstant.P_REALTIONS);
				ds.addRecord(new Object[] { false, r, r, r, ModelConstant.DT_STRING,null,"relation" });
			}
		}catch(Exception ex){
			//LogUtil.error("获取data中的的关系信息出错。", ex);
			throw new RuntimeException("获取data中的的关系信息出错。",ex);
		}
		return ds;
	}
	
}
