package com.justep.desinger.chart.property.config.composite.gantt;

import java.util.HashMap;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartGanttMapComposite extends Composite implements IChartComposite{

	private Text text_map_tool_tip_dateFormat;
	private Text text_map_tool_tip_labelFormat;
	
	private XuiElement owerElement;
	private String currentChartType ;
	
	public ChartGanttMapComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		text_map_tool_tip_dateFormat.setText("yyyy-MM-dd");
		text_map_tool_tip_labelFormat.setText("{0}: ({1}, {2})");
	}

	public void initLayout() {
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 2;
		setLayout(gridLayout);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1);
		gd_label.heightHint = 24;
		gd_label.widthHint = 62;
		label.setLayoutData(gd_label);
		label.setText("热点");
		
		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1));

		final Label label_26 = new Label(this, SWT.NONE);
		label_26.setText("信息格式：");

		text_map_tool_tip_labelFormat = new Text(this, SWT.BORDER);
		final GridData gd_text_map_tool_tip_labelFormat = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_map_tool_tip_labelFormat.widthHint = 438;
		text_map_tool_tip_labelFormat.setLayoutData(gd_text_map_tool_tip_labelFormat);
		text_map_tool_tip_labelFormat.setText("{0}: ({1}, {2})");

		final Label label_27 = new Label(this, SWT.NONE);
		label_27.setText("日期格式：");

		text_map_tool_tip_dateFormat = new Text(this, SWT.BORDER);
		text_map_tool_tip_dateFormat.setToolTipText("热点中日期数据格式信息");
		final GridData gd_text_map_tool_tip_dateFormat = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_map_tool_tip_dateFormat.widthHint = 333;
		text_map_tool_tip_dateFormat.setLayoutData(gd_text_map_tool_tip_dateFormat);
		text_map_tool_tip_dateFormat.setText("yyyy-MM-dd");
		
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
				
		XuiElement mapLabelFormatE = configElement.getChildByTagName("map-tool-tip-label-format");
		if(mapLabelFormatE!=null){
			text_map_tool_tip_labelFormat.setText(W3cDocumentHelper.getText(mapLabelFormatE.getOriginElement()));
		}
		XuiElement mapTipDateFormatE = configElement.getChildByTagName("map-tool-tip-date-format");
		if(mapTipDateFormatE!=null){
			text_map_tool_tip_dateFormat.setText(W3cDocumentHelper.getText(mapTipDateFormatE.getOriginElement()));
		}
		
	}

	public void registerEvent() {
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		this.saveSelf(configElement, "map-tool-tip-label-format", text_map_tool_tip_labelFormat.getText());
		this.saveSelf(configElement, "map-tool-tip-date-format", text_map_tool_tip_dateFormat.getText());
	}
	
	
	private void saveSelf(XuiElement configElement ,String tagName ,String tagValue){
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType,tagName, tagValue, new HashMap<String,String>());
		if(b){
			XuiElement eE = getXuiElement(configElement,tagName);
			W3cDocumentHelper.setElementText(eE.getOriginElement(), tagValue);
		}else{
			configElement.removeChildren(tagName);
		}
	}
	
	private XuiElement getXuiElement(XuiElement parentElement,String tagName){
		XuiElement xuiE = parentElement.getChildByTagName(tagName);
		if(xuiE == null){
			if("config".equals(tagName)){
				xuiE = parentElement.getXuiDataModel().addElement(tagName, parentElement, null, null, "<config></config>", null);
			}else{
				xuiE = parentElement.getXuiDataModel().addElement(tagName, parentElement, tagName);
			}
		}
		return xuiE;
	}
}
