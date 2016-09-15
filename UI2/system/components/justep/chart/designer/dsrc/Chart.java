import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.eclipse.jface.dialogs.MessageDialog;

import com.justep.chart.validate.ValidateHelper;
import com.justep.chart.validate.ValidateResult;
import com.justep.design.model.Model;
import com.justep.design.model.ModelParser;
import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.runtime.render.ChartRender;
import com.justep.desinger.chart.type.select.ChartTypeSelectDialog;
import com.justep.studio.StudioPlugin2;
import com.justep.studio.ui.editors.xui.BaseComponent;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
//import com.justep.studio.ui.editors.xui.designpanel.ComponentStyleChangedEvent;
//import com.justep.studio.ui.editors.xui.designpanel.ComponentStyleChangedListener;
import com.justep.studio.util.XPathUtil;

public class Chart extends BaseComponent {
	public static void main(String[] args){
		Model model = ModelParser.parseModel("E:/x5runtime/x5.2.1.1811/model/BIZ", "/demo/process/process/and");
		System.out.println(model.findAction("queryOrderAction"));
	}
	
	/*
	public Chart(){
		super();
		ChartConstant.initImages();
	}
	*/
	
	//private XuiElement cE;
	
	@SuppressWarnings("rawtypes")
	public Map editRule(XuiElement currentElement) {
		Map conifgMap = new HashMap();
		return conifgMap;
	}
	
	public void repaint(){
		render(this.getXuiElement());
	}

	public void repaint(XuiElement xuiElement){
		render(xuiElement);
	}

	public void afterSetProperty(String prop,String v){
    	if("style".equals(prop) || this.getXuiElement().isStyleProp(prop)){
    	//	this.getXuiElement().getCssStyle("width")
    	   render(this.getXuiElement());
    	}
    }

    /*
	 public void afterCreate(XuiElement currentElement) {
		 ChartConstant.basePath = currentElement.getBasePath();
		 ChartConstant.initImages();
		 cE = currentElement;
		 
		 render(cE);		

	    currentElement.getXuiDataModel().getDesigner().addComponentStyleChangedListener(new ComponentStyleChangedListener(){
	    	public void styleChanged(ComponentStyleChangedEvent event) {
	    		List<XuiElement> eList = event.getEList();
	    		for(XuiElement e : eList){
	    			String id = W3cDocumentHelper.getAttribute(e.getOriginElement(), "id");
	    			String cid = W3cDocumentHelper.getAttribute(cE.getOriginElement(),"id");
	    			if(id.equals(cid)){	    				
	    				render(cE);
	    			}
	    		}
	    	}
		});
	 }
*/

	/**
	 * 添加子图表
	 * @param currentElement
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map appendChart(XuiElement currentElement){
		
		//System.out.println("tempdir::"+System.getProperty("java.io.tmpdir"));
		XuiElement seriesSetE = currentElement.getChildByTagName("chart").getChildByTagName("series-set");
		
		String baseChartType = "";
		List seriesList = seriesSetE.getChildListByTagName("series");
		if(seriesList.size() > 0){
			XuiElement seriesE = (XuiElement)seriesList.get(0);
			baseChartType = seriesE.getPropertyItem("chart-type").getValue();
		}
		
		if(baseChartType.indexOf("pie")!= -1){
			MessageDialog.openInformation(StudioPlugin2.getShell(), "提示", "饼图不支持混合图！");
			return null;
		}else if(baseChartType.indexOf("gantt")!= -1){
			MessageDialog.openInformation(StudioPlugin2.getShell(), "提示", "甘特图不支持混合图！");
			return null;
		}else if(baseChartType.indexOf("radar")!= -1){
			MessageDialog.openInformation(StudioPlugin2.getShell(), "提示", "雷达图不支持混合图！");
			return null;
		}else if(baseChartType.indexOf("thermometer-meter")!= -1){
			MessageDialog.openInformation(StudioPlugin2.getShell(), "提示", "温度计不支持混合图！");
			return null;
		}

		//System.out.println("Path=" + currentElement.getBasePath());
		
		ChartConstant.basePath = currentElement.getBasePath();
		ChartConstant.initImages();
	
		ChartTypeSelectDialog dlg = new ChartTypeSelectDialog(StudioPlugin2.getShell(),baseChartType);
		dlg.setSize(750, 550);
		dlg.open();
		
		String rv = dlg.getReturnValue();
		if(rv == null || rv.equals("")){
			//TODO:
		}else{			
			String [] temp = rv.split("~");	
			XuiElement chartXuiE = currentElement.getXuiDataModel().addElement("$UI/system/components/justep/chart/chart#chartSeries",seriesSetE, null);
			chartXuiE.setDir(false);
			chartXuiE.setNew(true);
			
			chartXuiE.setPropertyValue("chart-type", temp[0]);
			chartXuiE.setPropertyValue("name", temp[1]);
			chartXuiE.setPropertyValue("ref", "");
			
			//刷新导航Tree
			//this.repaint(currentElement);
			this.getDesigner().getEditorPart().getTreeViewer().refresh();
			render(currentElement);

		}
		
		//MessageDialog.openInformation(StudioPlugin.getShell(), "提示", "OK！");
		/*if(dlg.getReturnCode() == SWT.OK){
			String rv = dlg.getReturnValue();
			System.out.println("" + rv);
		}*/
		
		//不需要再刷新组件了
		//this.repaint(currentElement);
		
		return null;
	}
	
	/**
	 * 前台渲染
	 * @param currentElement
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void render(XuiElement currentElement){
		HashMap ps = new HashMap();
		ps.put("d_id",currentElement.getDesignId());
		//{"x":4,"y":4,"w":491,"h":369}
		this.getDesigner().excuteCompMethod(currentElement.getDesignId(), "getChartBound", ps);
		//System.out.println("===Chart===getChartBound" + chartBoundStr);
	
		int chartWidth = 500;
		int chartHeight = 375;
		
		
		if(ps.containsKey("bound")){
			Map<String,Object> bound = (Map<String,Object>)ps.get("bound");
			chartWidth = (Integer)bound.get("w");
			chartHeight = (Integer)bound.get("h");
		}
		
		//取设计器操作后的 高度宽度 作为 图表的 高度 宽度
		XuiElement placeE = currentElement.getXuiDataModel().getObjectElement(currentElement);
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
		
		String info = W3cDocumentHelper.asXML(currentElement.getOriginElement());
		//System.out.println(info);
		
		String chartImageInfo = "";
		Element chartComponentE = null;
		try {
			//TODO:设计器获取到 的 信息  &amp;  都被转换成了 & 
			//DOM4J  解析时  & 需转义
			info = info.replaceAll("&", "&amp;");
			chartComponentE = (Element) DocumentHelper.parseText(info).getRootElement();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		//System.out.println("======"+chartComponentE.asXML());
		
		ChartRender chartRender = new ChartRender(chartComponentE ,chartWidth,chartHeight);
		chartImageInfo = chartRender.executeChart();
		
		//触发前台渲染		
		HashMap params = new HashMap();
		params.put("d_id",currentElement.getDesignId());
		params.put("image", chartImageInfo);
		this.getDesigner().excuteCompMethod(currentElement.getDesignId(), "_repaintChart", params);
		
		
		/*
		String returnChartFileAbsPath = chartRender.getReturnChartFileAbsPath();
		File f = new File(returnChartFileAbsPath);
		if(f.exists()){
			f.deleteOnExit();
		}*/
			
	}
	
	public boolean validate(XuiElement xuiElement) {
		boolean result = true;

		String info = W3cDocumentHelper.asXML(xuiElement.getOriginElement());
		info = info.replaceAll("&", "&amp;");
		ValidateHelper cvh = new ValidateHelper(info,"error");
		cvh.executeValidate();
		ArrayList<ValidateResult> vrList = cvh.getValidateList();
		for(ValidateResult vr : vrList){
			this.addError(xuiElement, vr.getPath() + vr.getInfo());
			result = false;
		}
		
		org.w3c.dom.Element rootE = xuiElement.getXuiDataModel().getRootElement().getOriginElement();
		String dataList = xuiElement.getOriginElement().getAttribute("dataList");
		if(dataList != null && !dataList.equals("")){
			String [] datas = dataList.split(",");
			for(String id : datas){
				String sXpath = "//*[@xid='"+id+"']";
				List<?> list = XPathUtil.selectNodes(rootE, sXpath);
				int count = list.size();
				if(count == 0){
					this.addError(xuiElement, "chart组件引用的data("+id.toString()+")不存在!");
					result = false;
				}
			}			
		}
		
		return result;
	}
	
} 
