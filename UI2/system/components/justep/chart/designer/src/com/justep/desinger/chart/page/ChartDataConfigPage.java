package com.justep.desinger.chart.page;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//import org.dom4j.DocumentException;
//import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;

import com.justep.db.util.ConnectionUtil;
import com.justep.design.model.Model;
import com.justep.studio.model.ModelManager;
import com.justep.design.model.ModelParser;
import com.justep.design.model.element.Action;
import com.justep.design.model.element.Private;
import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.data.composite.ArcDialMeterChartDataConfigComposite;
import com.justep.desinger.chart.data.composite.ChartGeneralDataConfigComposite;
import com.justep.desinger.chart.data.composite.DialMeterChartDataConfigComposite;
import com.justep.desinger.chart.data.composite.GanttChartDataConfigComposite;
import com.justep.desinger.chart.data.composite.PieChartDataConfigComposite;
import com.justep.desinger.chart.data.composite.SimpleMeterChartDataConfigComposite;
import com.justep.desinger.chart.data.composite.ThermometerlMeterChartDataConfigComposite;
//import com.justep.desinger.chart.runtime.render.ChartRender;
import com.justep.studio.preference.config.DatasourceModel;
import com.justep.studio.ui.editors.xui.XuiDataModel;
//import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.editors.xui.report.ReportDataFeild;
import com.justep.studio.ui.editors.xui.report.ReportDataSource;
import com.justep.studio.ui.editors.xui.report.ReportDataSourceHelper;
import com.justep.studio.util.StudioConfig;


public class ChartDataConfigPage extends Composite implements IPropertyDialogPage {

	private Composite comp;
	
	private PropertyItem propertyItem;
	private String currentChartType = "";
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Composite pieChartDataConfigComposite;
	private Composite chartGeneralDataConfigComposite;
	private Composite ganttChartDataConfigComposite;
	private Composite simpleMeterChartDataConfigComposite;
	private Composite dialMeterChartDataConfigComposite;
	private Composite arcDialMeterChartDataConfigComposite;
	private Composite thermometerlMeterChartDataConfigComposite;
	
	private static final String COMPONENT_BIZ_DATA = "$UI/system/components/justep/data/bizData";
	private static final String COMPONENT_COMMON_DATA = "$UI/system/components/justep/data/data";
	private static final String COMPONENT_REPORT_DATA = "$UI/system/components/justep/reportData/reportData";
	
//	private int chartWidth = 500;
//	private int chartHeight = 375;
	
	public ChartDataConfigPage(Composite parent, int style) {
		super(parent, style);
		this.setLayout(new FillLayout());
		this.setSize(500, 400);
		start(this);
	}
	
	public void start(Composite parent){
		comp = new Composite(parent, SWT.NONE);
		comp.setLayout(new FillLayout());
		comp.layout();
	}

	public static String beforeOpen(PropertyItem propertyItem){
		String dataListStr = ((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getOriginElement().getAttribute("dataList");
		XuiElement xuiWindowE = getWindowXuiElement((XuiElement)propertyItem.getOwerElement());
		XuiElement modelE = xuiWindowE.getChildListByTagName("model").get(0);		
		List<XuiElement> dataXuiList = modelE.getAllChildrenByComponentType("data");
		if(dataXuiList.size() ==0){
			return "请首先设置图表数据源!";
		}
		
		String temp ="";
		if(dataListStr != null && !dataListStr.equals("")){			
			String [] dids = dataListStr.split(",");
			for(String did : dids){				
				for(int i=0; i<dataXuiList.size(); i++){
					XuiElement dataXuiE = dataXuiList.get(i);
					String dataId = dataXuiE.getProperyValue("id");
					if(did.equals(dataId)){
						temp += dataId;
						temp += ",";
					}
				}
			}
		}
		if(!temp.equals("")){
			temp = temp.substring(0, temp.length()-1);
			((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getOriginElement().setAttribute("dataList", temp);
		}
		
		//验证当前DATA定义中 引用数据源是否正确可用 SQL 情况  设计时依赖于运行时数据库连接 
		dataListStr = ((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getOriginElement().getAttribute("dataList");
		String defaultModelName = ((XuiElement)propertyItem.getOwerElement()).getXuiDataModel().getModuleName();
		for(int i=0; i<dataXuiList.size(); i++){
			XuiElement dataXuiE = dataXuiList.get(i);
			String dataId = dataXuiE.getProperyValue("id");
			String component = dataXuiE.getProperyValue("component");
			String [] dids = dataListStr.split(",");
			for(String did : dids){
				if(did.equals(dataId)){	
					 if(component.indexOf(COMPONENT_REPORT_DATA)!= -1){
							//KSQL优先级大于SQL
							String dataModel = null;
							String ksqlText =W3cDocumentHelper.getText(dataXuiE.getChildByTagName("source").getChildByTagName("KSQL").getOriginElement());
							if(ksqlText != null && !ksqlText.equals("")){
								dataModel = dataXuiE.getChildByTagName("source").getChildByTagName("KSQL").getOriginElement().getAttribute("data-model");
								//KSQL 不验证
							}else{							
								if(dataModel ==null || dataModel.equals("")){
									dataModel = dataXuiE.getChildByTagName("source").getChildByTagName("SQL").getOriginElement().getAttribute("data-model");
								}							
								if(dataModel ==null || dataModel.equals("")){
									dataModel = defaultModelName;
								}
								
								String basePath = StudioConfig.getBIZPath();
								String filePath = ((XuiDataModel)dataXuiE.getDataModel()).getFilePath();
								boolean extSpace = ModelManager.isInExtSpace(filePath, true);							
								Model model = ModelParser.parseModel(basePath, dataModel, new HashMap<String, Model>(), true, true,true,null,extSpace);

								DatasourceModel dsModel = new DatasourceModel();							
								String dsName = model.getDataSource().getText();
								dsName = dsName.substring(14, dsName.length());	
								String dsType = dsModel.getDsTypeByDsName(dsName);
								Element dsE = dsModel.getDatasourceTemplateByDsType(dsType);
								if(dsE == null){
									return "ReportData组件["+did+"]使用的数据源["+dsName+"]配置错误!";
								}else{
									Connection conn = null;
									try {
										conn = ConnectionUtil.getConnectionByDsName(dsName);
									}catch(Exception e){
										//e.printStackTrace();
										return "ReportData组件["+did+"]使用的数据源["+dsName+"]配置错误!";
									}finally{
										if(conn != null){
											try {
												conn.close();
											} catch (SQLException e) {
												e.printStackTrace();
											}
										}
									}
								}
							}//end sql						
						 }
				}
			}
		}
		
		return null;
	 }

	public void setPropertyItem(PropertyItem propertyItem) {
		ChartConstant.basePath = propertyItem.getOwnerElementBasePath();
		ChartConstant.initImages();
		
		this.propertyItem = propertyItem;
		currentChartType = propertyItem.getOwerElement().getProperyValue("chart-type");
				
		String defaultModelName = ((XuiElement)this.propertyItem.getOwerElement()).getXuiDataModel().getModuleName();
		String dataListStr = ((XuiElement)this.propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getOriginElement().getAttribute("dataList");
		XuiElement xuiWindowE = getWindowXuiElement((XuiElement)this.propertyItem.getOwerElement());
		//XuiElement modelE = xuiWindowE.getChildByName("$UI/system/components/justep/model/model");		
		List<XuiElement> dataXuiList = xuiWindowE.getAllChildrenByComponentType("data");
		
		if(dataListStr == null || dataListStr.equals("")){ //所有DATA
			for(int i=0; i<dataXuiList.size(); i++){
				XuiElement dataXuiE = dataXuiList.get(i);
				String dataId = dataXuiE.getProperyValue("xid");
				dataListStr += dataId;
				dataListStr += ",";
			}
			if(!dataListStr.equals("")){
				dataListStr = dataListStr.substring(0, dataListStr.length()-1);
			}
		}
		
		//TODO:如果用户设置了data-list 然后又删除了 data组件  需要用户重新设置data-list 程序未做删除联动 
		
		ArrayList<String> didList = new ArrayList<String>();
		int x = 0;
		for(int i=0; i<dataXuiList.size(); i++){
			XuiElement dataXuiE = dataXuiList.get(i);
			String dataId = dataXuiE.getProperyValue("xid");
			String component = dataXuiE.getProperyValue("component");
			
			String [] dids = dataListStr.split(",");
			for(String did : dids){
				if(did.equals(dataId)){	
					
					ReportDataSource rds = new ReportDataSource();					
					if(component.indexOf(COMPONENT_BIZ_DATA)!= -1){
						rds = ReportDataSourceHelper.analyseBIZData(dataXuiE, did);
					}else if(component.indexOf(COMPONENT_COMMON_DATA)!= -1){
						rds = ReportDataSourceHelper.analyseCommonData(dataXuiE, did);
					}else if(component.indexOf(COMPONENT_REPORT_DATA)!= -1){
						
						String basePath = StudioConfig.getBIZPath();				
						String filePath = ((XuiDataModel)dataXuiE.getDataModel()).getFilePath();
						boolean extSpace = ModelManager.isInExtSpace(filePath, true);	
						
						XuiElement sourceXuiE = dataXuiE.getChildByTagName("source");
						if(sourceXuiE != null){
							XuiElement ksqlXuiE = sourceXuiE.getChildByTagName("KSQL");
							XuiElement actionE = sourceXuiE.getChildByTagName("action");
							XuiElement sqlXuiE = sourceXuiE.getChildByTagName("SQL");
							String ksqlText = "";
							
							if(actionE != null){
								org.w3c.dom.Element actionEO = actionE.getOriginElement();
								String actionName = actionEO.getAttribute("name");
								String type = actionEO.getAttribute("type");
								String columns = actionEO.getAttribute("columns");

								if(columns != null && !"".equals(columns)){
									List<ReportDataFeild> actionfeildList = new ArrayList<ReportDataFeild>();
									String[] cs = columns.split(",");
									for(String s : cs){
										ReportDataFeild rdf = new ReportDataFeild();
										rdf.setLabel(s);
										rdf.setName(s);
										actionfeildList.add(rdf);										
									}
									
									rds.setFeildList(actionfeildList);									
								}
								
								if(actionName != null && !"".equals(actionName) && "ksqlaction".equals(type)){
									Model model = ModelParser.parseModel(basePath, defaultModelName, new HashMap<String, Model>(), true, true,true,null,extSpace);
									
									Action action = model.findAction(actionName);
									List<Private> privateParmas = action.getPrivateList();
									String dataModel = "";
									
									for (Private param : privateParmas) {
										String paramname = param.getName();
										if("ksql".equals(paramname)){
											ksqlText = param.getValue();
										}else if("dataModel".equals(paramname)){
											dataModel = param.getValue();
										}
										
									}
									
									if(dataModel == null || dataModel.equals("")){
										dataModel = defaultModelName;
									}		
									
									if(!defaultModelName.equals(dataModel)) 
										model = ModelParser.parseModel(StudioConfig.getBIZPath(), dataModel);
									if(ksqlText != null && !ksqlText.equals(""))
										rds = ReportDataSourceHelper.analyseKSQL(ksqlText, did, model);
									
								}
							}
							
							if(ksqlXuiE != null){
								ksqlText = W3cDocumentHelper.getText(ksqlXuiE.getOriginElement());
								if(ksqlText != null && !ksqlText.equals("")){
									String dataModel = ksqlXuiE.getOriginElement().getAttribute("data-model");
									if(dataModel ==null || dataModel.equals("")){
										dataModel = defaultModelName;
									}	
									Model model = ModelParser.parseModel(basePath, dataModel, new HashMap<String, Model>(), true, true,true,null,extSpace);
									rds = ReportDataSourceHelper.analyseKSQL(ksqlText, did,model);
								}
							}
							
							if(sqlXuiE != null){
								String dataModel = sqlXuiE.getOriginElement().getAttribute("data-model");
								if(dataModel ==null || dataModel.equals("")){
									dataModel = defaultModelName;
								}	
								Model model = ModelParser.parseModel(basePath, dataModel, new HashMap<String, Model>(), true, true,true,null,extSpace);
								DatasourceModel dsModel = new DatasourceModel();
								if(model.getDataSource() != null){								
									String dsName = model.getDataSource().getText();
									dsName = dsName.substring(14, dsName.length());	
									String dsType = dsModel.getDsTypeByDsName(dsName);
									Element dsE = dsModel.getDatasourceTemplateByDsType(dsType);
									String templateREF = dsE.attributeValue(DatasourceModel.TEMPLATE_REF);
									
									String sqlText = getReportDataSQL(dataXuiE,templateREF);
									if(sqlText.equals("")){
									}else{
										String newSql = "SELECT * FROM (" + sqlText + ") a WHERE 1=0 ";	
										Connection conn = null;
										try {
											conn = ConnectionUtil.getConnectionByDsName(dsName);
											rds = ReportDataSourceHelper.analyseSQL(conn, newSql,dataId);
											conn.close();
										} catch (Exception e) {
											e.printStackTrace();
										}finally{
											if(conn != null){
												try {
													conn.close();
												} catch (SQLException e) {
													e.printStackTrace();
												}
											}
										}
									}
									
								}
							}
							
						}
						
					}//end reportData
					
					didList.add(dataId);
					String [] fields = new String[rds.getFeildList().size()];
					for(int j=0; j<rds.getFeildList().size(); j++){
						ReportDataFeild rdf = rds.getFeildList().get(j);
						fields[j] = rdf.getName();
					}
					this.dataMap.put(dataId, fields);
					x++;
					
				}
			}
		}
		
		dataIds = new String [didList.size()];
		for(int i=0; i<didList.size(); i++){
			dataIds[i] = didList.get(i);
		}
		
		if(dataIds.length == 0 ){		
		}else{
			registerComposite();
		}
	}

	
	private void registerComposite(){
		XuiElement cSeriesE = (XuiElement)this.propertyItem.getOwerElement();
		if(currentChartType.indexOf("pie")!= -1){
			pieChartDataConfigComposite = new PieChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}else if(currentChartType.indexOf("bar")!= -1 || currentChartType.indexOf("xy-line")!= -1 || 
				currentChartType.indexOf("line")!= -1||currentChartType.indexOf("area")!= -1 
				|| currentChartType.indexOf("time")!= -1 || currentChartType.indexOf("radar")!= -1){
			this.setSize(615, 540);
			chartGeneralDataConfigComposite = new ChartGeneralDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}else if(currentChartType.indexOf("simple-meter")!= -1){
			this.setSize(620, 540);
			simpleMeterChartDataConfigComposite = new SimpleMeterChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}else if(currentChartType.indexOf("arc-dial-meter")!= -1){
			this.setSize(620, 520);
			arcDialMeterChartDataConfigComposite = new ArcDialMeterChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}else if(currentChartType.indexOf("dial-meter")!= -1){
			this.setSize(620, 520);
			dialMeterChartDataConfigComposite = new DialMeterChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}else if(currentChartType.indexOf("thermometer-meter")!= -1){		
			this.setSize(620, 520);
			thermometerlMeterChartDataConfigComposite = new ThermometerlMeterChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();			
		}else if(currentChartType.indexOf("gantt")!= -1){
			this.setSize(620, 540);
			ganttChartDataConfigComposite = new GanttChartDataConfigComposite(comp,SWT.NONE,cSeriesE,dataIds,dataMap);
			comp.layout();
		}
		//comp.layout();
	}

	public Object getReturnValue() {
		if(currentChartType.indexOf("pie")!= -1){			
			((PieChartDataConfigComposite)pieChartDataConfigComposite).saveSelfConfig();			
		}else if(currentChartType.indexOf("bar")!= -1 || currentChartType.indexOf("xy-line")!= -1 || 
				currentChartType.indexOf("line")!= -1||currentChartType.indexOf("area")!= -1 
				|| currentChartType.indexOf("time")!= -1 || currentChartType.indexOf("radar")!= -1){			
			((ChartGeneralDataConfigComposite)chartGeneralDataConfigComposite).saveSelfConfig();			
		}else if(currentChartType.indexOf("simple-meter")!= -1){			
			((SimpleMeterChartDataConfigComposite)simpleMeterChartDataConfigComposite).saveSelfConfig();			
		}else if(currentChartType.indexOf("arc-dial-meter")!= -1){			
			((ArcDialMeterChartDataConfigComposite)arcDialMeterChartDataConfigComposite).saveSelfConfig();			
		}else if(currentChartType.indexOf("dial-meter")!= -1){			
			((DialMeterChartDataConfigComposite)dialMeterChartDataConfigComposite).saveSelfConfig();			
		}else if(currentChartType.indexOf("thermometer-meter")!= -1){
			((ThermometerlMeterChartDataConfigComposite)thermometerlMeterChartDataConfigComposite).saveSelfConfig();
		}else if(currentChartType.indexOf("gantt")!= -1){
			((GanttChartDataConfigComposite)ganttChartDataConfigComposite).saveSelfConfig();
		}
		render();
		return null;
	}
	
/*	
	@SuppressWarnings("static-access")
	private void resetChartWidthAndHeight(){
		BaseComponent com = (BaseComponent)propertyItem.getOwerElement().getXuiDataModel().getComponent(propertyItem.getOwerElement().getConfigElement());
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id",((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getDesignId());
		//{"x":4,"y":4,"w":491,"h":369}
		String chartBoundStr = com.getDesigner().executeJSMethod(com.getDesigner().JSMETHOD_TYPE_ID, "getChartBound", params);
		//System.out.println("===ChartDataConfigPage--getChartBound" + chartBoundStr);		

		if(chartBoundStr != null && !chartBoundStr.equals("")){
			chartBoundStr = chartBoundStr.substring(1, chartBoundStr.length()-1);
			String [] cbs = chartBoundStr.split(",");
			for(String t : cbs){
				String [] ts = t.split(":");
				String f = ts[0];
				if(f.equals("\"w\"")){
					chartWidth = Integer.parseInt(ts[1]) ==0 ? 500 : Integer.parseInt(ts[1]);
				}else if(f.equals("\"h\"")){
					chartHeight = Integer.parseInt(ts[1]) ==0 ? 375 : Integer.parseInt(ts[1]);
				}
			}
		}
		
		//取设计器操作后的 高度宽度 作为 图表的 高度 宽度
		XuiElement chartE = ((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement();		
		XuiElement placeE = chartE.getXuiDataModel().getObjectElement(chartE);
		if(placeE != null){
			String style = placeE.getProperyValue("style");
			if(style != null && !style.equals("")){							
				String cw = "";
				String ch = "";
				String [] temp = style.split(";");
				for(String t : temp){
					if(t.indexOf(":")!= -1){
						String [] tt = t.split(":");
						if(tt[0].trim().equalsIgnoreCase("width")){
							cw = tt[1].trim();
						}else if(tt[0].trim().equalsIgnoreCase("height")){
							ch = tt[1].trim();
						}
					}
				}						
				if(!cw.equals("") && cw.indexOf("%") == -1){
					cw = cw.substring(0, cw.length()-2);
					chartWidth = Integer.parseInt(cw);
				}				
				if(!ch.equals("") && ch.indexOf("%") == -1){
					ch = ch.substring(0, ch.length()-2);
					chartHeight = Integer.parseInt(ch);
				}
			}
		}
		
	}
*/
	
	/**
	 * 组件设计界面渲染
	 */
	//@SuppressWarnings("static-access")
	private void render(){
		((XuiElement)propertyItem.getOwerElement()).getComponent().repaint();
		/*
		resetChartWidthAndHeight();
		
		
		//图表-资源文件更新
		org.w3c.dom.Element chartE = (org.w3c.dom.Element)propertyItem.getOwerElement().getOriginElement().getParentNode().getParentNode().getParentNode();
		String info = W3cDocumentHelper.asXML(chartE);
		String chartImageInfo = "";
		Element chartComponentE = null;
		try {
			info = info.replaceAll("&", "&amp;");
			chartComponentE = (Element) DocumentHelper.parseText(info).getRootElement();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		ChartRender chartRender = new ChartRender(chartComponentE ,chartWidth ,chartHeight);
		chartImageInfo = chartRender.executeChart();
		
		//触发前台渲染		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("image", chartImageInfo);
		BaseComponent com = (BaseComponent)propertyItem.getOwerElement().getXuiDataModel().getComponent(propertyItem.getOwerElement().getConfigElement());

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id",((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getDesignId());
		params.put("image", chartImageInfo);
		com.getDesigner().executeJSMethod(com.getDesigner().JSMETHOD_TYPE_ID, "paintComponent", params);
		*/
			
	}
	
	
	private String getReportDataSQL(XuiElement dataXuiE,String dbType){
		String sql = "";
		XuiElement sqlE = dataXuiE.getChildByTagName("source").getChildByTagName("SQL");
		
		XuiElement defaultE = sqlE.getChildByTagName("DEFAULT");
		if(defaultE != null){
			sql = W3cDocumentHelper.getText(defaultE.getOriginElement());
		}
		
		if(dbType.equalsIgnoreCase("ORACLE")){
			XuiElement oracleSql = sqlE.getChildByTagName("ORACLE");
			if(oracleSql != null){				
				String oSql = W3cDocumentHelper.getText(oracleSql.getOriginElement());
				if(oSql == null || oSql.equals("")){				
				}else{
					sql = oSql;
				}
			}
		}else if(dbType.equalsIgnoreCase("MSSQL")){
			XuiElement msSql = sqlE.getChildByTagName("MSSQL");
			if(msSql != null){
				String mSql = W3cDocumentHelper.getText(msSql.getOriginElement());
				if(mSql == null || mSql.equals("")){				
				}else{
					sql = mSql;
				}
			}
		}else if(dbType.equalsIgnoreCase("DB2")){
			XuiElement db2Sql = sqlE.getChildByTagName("DB2");
			if(db2Sql != null){
				String dSql = W3cDocumentHelper.getText(db2Sql.getOriginElement());
				if(dSql == null || dSql.equals("")){				
				}else{
					sql = dSql;
				}
			}
		}else if(dbType.equalsIgnoreCase("SYBASE")){
			XuiElement sybaseSql = sqlE.getChildByTagName("SYBASE");
			if(sybaseSql != null){
				String sSql = W3cDocumentHelper.getText(sybaseSql.getOriginElement());
				if(sSql == null || sSql.equals("")){				
				}else{
					sql = sSql;
				}
			}
		}
		
		return sql;
	}
	
	private static XuiElement getWindowXuiElement(XuiElement xuiChildE){
		if(xuiChildE == null){
			return null;
		}
		String bindingComponent = xuiChildE.getBindingComponent();
		if(null!=bindingComponent && bindingComponent.equalsIgnoreCase("$UI/system/components/justep/window/window")){
			return xuiChildE;
		}else{
			return getWindowXuiElement(xuiChildE.getParentElement());
		}
	}
	
	
	public String isValid() {
		return null;
	}

	public void setReturnValueStrategy(IPropertyValueStrategy arg0) {
		
	}

}
