package com.justep.desinger.chart.property.config.composite.meter;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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

public class ChartThermometerMeterComposite extends Composite implements IChartComposite{

	
	private Text text_thermometer_units;
	private Text text_thermometer_range_upper;
	private Text text_thermometer_range_lower;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartThermometerMeterComposite(Composite parent, int style,XuiElement owerElement,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}
	
	public void initDefaultValue() {
	}

	public void initLayout() {
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 2;
		setLayout(gridLayout_1);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1);
		gd_label.heightHint = 22;
		gd_label.widthHint = 56;
		label.setLayoutData(gd_label);
		label.setText("温度计");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1));
		
		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("起始位温度：");

		text_thermometer_range_lower = new Text(this, SWT.BORDER);
		final GridData gd_text_thermometer_range_lower = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_thermometer_range_lower.widthHint = 425;
		text_thermometer_range_lower.setLayoutData(gd_text_thermometer_range_lower);
		text_thermometer_range_lower.setText("0");

		final Label label_3 = new Label(this, SWT.NONE);
		label_3.setText("终止位温度：");

		text_thermometer_range_upper = new Text(this, SWT.BORDER);
		text_thermometer_range_upper.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		text_thermometer_range_upper.setText("100");

		final Label label_4 = new Label(this, SWT.NONE);
		label_4.setText("单位：");

		text_thermometer_units = new Text(this, SWT.BORDER);
		text_thermometer_units.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return;
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement thermometerRangeE = configElement.getChildByTagName("thermometer-range");
		if (thermometerRangeE!=null) {
			text_thermometer_range_lower.setText(thermometerRangeE.getProperyValue("lower"));
			text_thermometer_range_upper.setText(thermometerRangeE.getProperyValue("upper"));
		}
		XuiElement thermometerUnitsE = configElement.getChildByTagName("thermometer-units");
		if (thermometerUnitsE!=null) {
			text_thermometer_units.setText(W3cDocumentHelper.getText(thermometerUnitsE.getOriginElement()));
		}
	}

	public void registerEvent() {
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		String lower = text_thermometer_range_lower.getText();
		String upper = text_thermometer_range_upper.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("lower", lower);
		attrMap.put("upper", upper);
		this.saveSelf(configElement, "thermometer-range", "", attrMap);
		
		this.saveSelf(configElement, "thermometer-units",text_thermometer_units.getText());
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
	
	@SuppressWarnings("unchecked")
	private void saveSelf(XuiElement configElement ,String tagName ,String tagValue, HashMap<String,String> attrMap){
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, tagName, tagValue, attrMap);
		if(b){			
			XuiElement eE = getXuiElement(configElement, tagName);
			Iterator it = attrMap.entrySet().iterator();
			while(it.hasNext()){
				Map.Entry<String,String> entry = (Map.Entry<String,String>)it.next();
				String key = entry.getKey();
				String value = entry.getValue();				
				eE.getXuiDataModel().setPropertyValue(eE, key, value);
			}
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
