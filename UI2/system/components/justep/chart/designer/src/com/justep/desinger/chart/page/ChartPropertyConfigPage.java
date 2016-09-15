package com.justep.desinger.chart.page;
//import java.util.HashMap;
import java.util.Iterator;

//import org.dom4j.DocumentException;
//import org.dom4j.DocumentHelper;
//import org.dom4j.Element;
import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.SashForm;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;

import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.property.config.composite.IChartCompositeContainer;
import com.justep.desinger.chart.property.config.composite.area.ChartAreaCompositeContainer;
import com.justep.desinger.chart.property.config.composite.bar.ChartBarCompositeContainer;
import com.justep.desinger.chart.property.config.composite.gantt.ChartGanttCompositeContainer;
import com.justep.desinger.chart.property.config.composite.general.ChartGeneralCommentComposite;
import com.justep.desinger.chart.property.config.composite.general.ChartGeneralLegendComposite;
import com.justep.desinger.chart.property.config.composite.general.ChartGeneralOtherComposite;
import com.justep.desinger.chart.property.config.composite.general.ChartGeneralSubTitleComposite;
import com.justep.desinger.chart.property.config.composite.general.ChartGenetalTitleComposite;
import com.justep.desinger.chart.property.config.composite.line.ChartLineCompositeContainer;
import com.justep.desinger.chart.property.config.composite.meter.ChartMeterCompositeContainer;
import com.justep.desinger.chart.property.config.composite.pie.ChartPieCompositeContainer;
import com.justep.desinger.chart.property.config.composite.radar.ChartRadarCompositeContainer;
import com.justep.desinger.chart.property.config.composite.time.ChartTimeCompositeContainer;
import com.justep.desinger.chart.property.config.composite.xyline.ChartXyLineCompositeContainer;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeContentProvider;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeLabelProvider;
import com.justep.desinger.chart.property.config.treeviewer.ChartTreeNode;
//import com.justep.desinger.chart.runtime.render.ChartRender;
//import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
//import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;


public class ChartPropertyConfigPage extends Composite implements IPropertyDialogPage {

	private StackLayout stackLayout = new StackLayout();
	private Composite rightComp;
	
	private Composite chartGenetalTitleComposite;
	private Composite chartGenetalSubTitleComposite;
	private Composite chartGenetalLegendComposite;
	private Composite chartGenetalCommentComposite;
	private Composite chartGenetalOtherComposite;
	
	//子页签 的集合
	private IChartCompositeContainer chartCompositeContainer;
	
	private TreeViewer treeViewer;
	private PropertyItem propertyItem;
	private String currentChartType = "";
	
//	private int chartWidth = 500;
//	private int chartHeight = 375;
	
	public ChartPropertyConfigPage(Composite parent, int style) {
		super(parent, style);
		this.setLayout(new FillLayout());
		this.setSize(710, 550);
		start(this);
	}
	
	public void start(Composite parent){
		SashForm sashForm = new SashForm(parent, SWT.NONE);		
		Composite composite = new Composite(sashForm, SWT.NONE);
		composite.setLayout(new FillLayout());

		treeViewer = new TreeViewer(composite, SWT.BORDER);
		treeViewer.setLabelProvider(new ChartTreeLabelProvider());
		treeViewer.setContentProvider(new ChartTreeContentProvider());
		treeViewer.setInput(ChartConstant.createDefaultTree(currentChartType,chartCompositeContainer));

		treeViewer.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(final SelectionChangedEvent event) {
				if (event.getSelection().isEmpty()) {
					System.out.println("Selected Nothing");
					return;
				}
				if (event.getSelection() instanceof IStructuredSelection) {
					IStructuredSelection selection = (IStructuredSelection) event.getSelection();
					StringBuffer selected = new StringBuffer();
					for (Iterator<?> iterator = selection.iterator(); iterator.hasNext();) {
						Object element = (ChartTreeNode) iterator.next();
						String cid = ((ChartTreeNode) element).getId();
						selected.append(""+cid);
						selected.append(", ");
					}
					if (selected.length() > 0) {
						selected.setLength(selected.length() - 2);
					}
					String cIndex = selected.toString();
					
					if(cIndex.equalsIgnoreCase("10") || cIndex.equalsIgnoreCase("101")){//标题设置			
						stackLayout.topControl = chartGenetalTitleComposite;
					}else if(cIndex.equalsIgnoreCase("103")){//子标题设置
						stackLayout.topControl = chartGenetalSubTitleComposite;
					}else if(cIndex.equalsIgnoreCase("105")){//图例设置
						stackLayout.topControl = chartGenetalLegendComposite;
					}else if(cIndex.equalsIgnoreCase("107")){//注释设置
						stackLayout.topControl = chartGenetalCommentComposite;
					}else if(cIndex.equalsIgnoreCase("109")){//其他设置
						stackLayout.topControl = chartGenetalOtherComposite;
					}else {
						stackLayout.topControl = chartCompositeContainer.findParticularComposite(cIndex);
					}
	                rightComp.layout();
				}
			}
		});
		
		rightComp = new Composite(sashForm, SWT.NONE);
		rightComp.setLayout(stackLayout);
		
		stackLayout.topControl = chartGenetalTitleComposite;

		sashForm.setWeights(new int[] { 50, 150 });
	}
	
	private void registerComposite(){
		XuiElement publicConfigE = ((XuiElement)this.propertyItem.getOwerElement()).getParentElement().getParentElement().getChildByTagName("config");
		
		chartGenetalTitleComposite = new ChartGenetalTitleComposite(rightComp,SWT.NONE,publicConfigE);
		chartGenetalSubTitleComposite = new ChartGeneralSubTitleComposite(rightComp,SWT.NONE,publicConfigE);
		chartGenetalLegendComposite = new ChartGeneralLegendComposite(rightComp,SWT.NONE,publicConfigE);
		chartGenetalCommentComposite = new ChartGeneralCommentComposite(rightComp,SWT.NONE,publicConfigE);
		chartGenetalOtherComposite = new ChartGeneralOtherComposite(rightComp,SWT.NONE,publicConfigE);
	}

	private void saveSelfConfig(){
		XuiElement publicConfigE = ((XuiElement)this.propertyItem.getOwerElement()).getParentElement().getParentElement().getChildByTagName("config");
		if(publicConfigE != null && publicConfigE.getChildren().size() >0){			
			//publicConfigE.removeAllChildren();
		}
		
		//公共部分
		((ChartGenetalTitleComposite)chartGenetalTitleComposite).saveSelfConfig();
		((ChartGeneralSubTitleComposite)chartGenetalSubTitleComposite).saveSelfConfig(); 
		((ChartGeneralLegendComposite)chartGenetalLegendComposite).saveSelfConfig();
		((ChartGeneralCommentComposite)chartGenetalCommentComposite).saveSelfConfig();
		((ChartGeneralOtherComposite)chartGenetalOtherComposite).saveSelfConfig();
		
		chartCompositeContainer.saveConfig();
		
	}
	
	public Object getReturnValue() {
		saveSelfConfig();		
		render();		
		return null;
	}

/*	
	private void resetChartWidthAndHeight(){
		BaseComponent com = (BaseComponent)propertyItem.getOwerElement().getXuiDataModel().getComponent(propertyItem.getOwerElement().getConfigElement());
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id",((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getDesignId());
		//{"x":4,"y":4,"w":491,"h":369}
		String chartBoundStr = com.getDesigner().executeJSMethod(com.getDesigner().JSMETHOD_TYPE_ID, "getChartBound", params);
		//System.out.println("===ChartPropertyConfigPage--getChartBound" + chartBoundStr);		

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
		XuiElement chartE = ((XuiElement)this.propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement();
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
//	@SuppressWarnings({ "unchecked", "static-access" })
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
		BaseComponent com = (BaseComponent)propertyItem.getOwerElement().getXuiDataModel().getComponent(propertyItem.getOwerElement().getConfigElement());
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id",((XuiElement)propertyItem.getOwerElement()).getParentElement().getParentElement().getParentElement().getDesignId());
		params.put("image", chartImageInfo);
		com.getDesigner().executeJSMethod(com.getDesigner().JSMETHOD_TYPE_ID, "paintComponent", params);
*/
	}
	
	
	public String isValid() {
		return null;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		ChartConstant.basePath = propertyItem.getOwnerElementBasePath();
		ChartConstant.initImages();
		
		this.propertyItem = propertyItem;
		currentChartType = propertyItem.getOwerElement().getProperyValue("chart-type");
		
		instanceSubCompositeContainer();
		
		treeViewer.setInput(ChartConstant.createDefaultTree(currentChartType,chartCompositeContainer));
		treeViewer.expandAll();
		
		registerComposite();
	}
	
	//初始化子试图 集合
	private void instanceSubCompositeContainer(){
		XuiElement privateOwerElement = ((XuiElement)this.propertyItem.getOwerElement());
		
		if(currentChartType.indexOf("pie")!= -1){
			chartCompositeContainer = new ChartPieCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		else if(currentChartType.indexOf("bar")!= -1){
			chartCompositeContainer = new ChartBarCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		else if(currentChartType.indexOf("area")!= -1){
			chartCompositeContainer = new ChartAreaCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}else if(currentChartType.indexOf("xy-line")!= -1){
			chartCompositeContainer = new ChartXyLineCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}else if(currentChartType.indexOf("line")!= -1){
			chartCompositeContainer = new ChartLineCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		else if(currentChartType.indexOf("time")!= -1){
			chartCompositeContainer = new ChartTimeCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}else if(currentChartType.indexOf("meter")!= -1){
			chartCompositeContainer = new ChartMeterCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		else if(currentChartType.indexOf("gantt")!= -1){
			chartCompositeContainer = new ChartGanttCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		else if(currentChartType.indexOf("radar")!= -1){
			chartCompositeContainer = new ChartRadarCompositeContainer(rightComp,SWT.NONE,privateOwerElement,currentChartType);
		}
		
	}

	public void setReturnValueStrategy(IPropertyValueStrategy arg0) {

	}

	public static String beforeOpen(PropertyItem propertyItem){
		return null;
	}
}
