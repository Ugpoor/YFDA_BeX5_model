package com.justep.desinger.chart.property.config.composite.bar;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartBarMapComposite extends Composite implements IChartComposite{

	private Combo combo_map_tool_tip_formatType;
	private Text text_map_tool_tip_label_style;
	private Text text_marker_value;
	
	private XuiElement owerElement;
	private String currentChartType ;
	
	public ChartBarMapComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		combo_map_tool_tip_formatType.select(0);
	}

	public void initLayout() {
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 2;
		setLayout(gridLayout);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(55, 21));
		label.setText("热点");
		new Label(this, SWT.NONE);

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		final GridData gd_label_1 = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		gd_label_1.widthHint = 169;
		label_1.setLayoutData(gd_label_1);

		final Label label_6 = new Label(this, SWT.NONE);
		label_6.setLayoutData(new GridData());
		label_6.setText("信息格式 ：");

		text_map_tool_tip_label_style = new Text(this, SWT.BORDER);
		text_map_tool_tip_label_style.setToolTipText("{0}组 {1}分类轴信息 {2}数据轴数据");
		final GridData gd_text_map_tool_tip_label_style = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_text_map_tool_tip_label_style.widthHint = 402;
		text_map_tool_tip_label_style.setLayoutData(gd_text_map_tool_tip_label_style);
		text_map_tool_tip_label_style.setText("({0}, {1}) = {2}");

		final Label label_5 = new Label(this, SWT.NONE);
		label_5.setLayoutData(new GridData(95, SWT.DEFAULT));
		label_5.setText("数值数据格式：");

		combo_map_tool_tip_formatType = new Combo(this, SWT.NONE);
		combo_map_tool_tip_formatType.setToolTipText("数据轴数据格式类型(数值类型或日期类型)");
		combo_map_tool_tip_formatType.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		combo_map_tool_tip_formatType.setItems(new String[] {"number", "date"});
		
		
		final Label label_7 = new Label(this, SWT.NONE);
		label_7.setText("数据格式：");

		text_marker_value = new Text(this, SWT.BORDER);
		text_marker_value.setToolTipText("数据轴数据值格式(数值或日期)");
		text_marker_value.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		text_marker_value.setText("######.00");
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		
		XuiElement mapLabelStyleE = configElement.getChildByTagName("map-tool-tip-label-style");
		if(mapLabelStyleE!=null){
			text_map_tool_tip_label_style.setText(W3cDocumentHelper.getText(mapLabelStyleE.getOriginElement()));
		}
		XuiElement mapTipFormatE = configElement.getChildByTagName("map-tool-tip-format");
		if(mapTipFormatE!=null){
			setDefaultComboValue(combo_map_tool_tip_formatType,mapTipFormatE.getProperyValue("type"));
			text_marker_value.setText(W3cDocumentHelper.getText(mapTipFormatE.getOriginElement()));
		}
		
	}

	public void registerEvent() {
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		this.saveSelf(configElement, "map-tool-tip-label-style", text_map_tool_tip_label_style.getText());
		
		String type = combo_map_tool_tip_formatType.getItem(combo_map_tool_tip_formatType.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("type", type);
		this.saveSelf(configElement, "map-tool-tip-format", text_marker_value.getText(), attrMap);
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
			Iterator<?> it = attrMap.entrySet().iterator();
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
	
	

	/**
	 * @param combo
	 * @param v
	 */
	private void setDefaultComboValue(Combo combo , String v){
		String [] items = combo.getItems();
		for(int i=0; i<items.length; i++){
			if(items[i].equalsIgnoreCase(v)){
				combo.select(i);
				break;
			}
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
