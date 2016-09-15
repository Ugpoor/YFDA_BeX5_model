package com.justep.desinger.chart.property.config.composite.time;

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

public class ChartTimeMapComposite extends Composite implements IChartComposite{

	private Text text_map_tool_tip_serie_format;
	private Combo combo_map_tool_tip_serie_formatType;
	
	private Text yyyymmddText;
	private Combo combo_map_tool_tip_category_formatType;
	
	private Text text_map_tool_tip_label_style;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartTimeMapComposite(Composite parent, int style,XuiElement owerElement  ,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		combo_map_tool_tip_category_formatType.select(1);
		combo_map_tool_tip_serie_formatType.select(0);
		
		text_map_tool_tip_label_style.setText("{0}: ({1}, {2})");
		
		yyyymmddText.setText("yyyy-MM-dd");
		text_map_tool_tip_serie_format.setText("######.00");
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		

		XuiElement mapLabelStyleE = configElement.getChildByTagName("map-tool-tip-label-style");
		if(mapLabelStyleE!=null){
			text_map_tool_tip_label_style.setText(W3cDocumentHelper.getText(mapLabelStyleE.getOriginElement()));
		}
		
		XuiElement mapTipcFormatE = configElement.getChildByTagName("map-tool-tip-category-format");
		if(mapTipcFormatE!=null){
			setDefaultComboValue(combo_map_tool_tip_category_formatType,mapTipcFormatE.getProperyValue("type"));
			yyyymmddText.setText(W3cDocumentHelper.getText(mapTipcFormatE.getOriginElement()));
		}
		
		XuiElement mapTipsFormatE = configElement.getChildByTagName("map-tool-tip-serie-format");
		if(mapTipcFormatE!=null){
			setDefaultComboValue(combo_map_tool_tip_serie_formatType,mapTipsFormatE.getProperyValue("type"));
			text_map_tool_tip_serie_format.setText(W3cDocumentHelper.getText(mapTipsFormatE.getOriginElement()));
		}
		
	}

	public void registerEvent() {
		
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");

		this.saveSelf(configElement, "map-tool-tip-label-style", text_map_tool_tip_label_style.getText());
		
		String cft = combo_map_tool_tip_category_formatType.getItem(combo_map_tool_tip_category_formatType.getSelectionIndex());
		String cf = yyyymmddText.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("type", cft);
		this.saveSelf(configElement, "map-tool-tip-category-format", cf, attrMap);
		
		String sft = combo_map_tool_tip_serie_formatType.getItem(combo_map_tool_tip_serie_formatType.getSelectionIndex());
		String sf = text_map_tool_tip_serie_format.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("type", sft);
		this.saveSelf(configElement, "map-tool-tip-serie-format", sf, attrMap);
		
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
	
	
	public void initLayout() {
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 4;
		setLayout(gridLayout_1);
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.LEFT, SWT.CENTER, false, false, 4, 1);
		gd_label.heightHint = 22;
		gd_label.widthHint = 510;
		label.setLayoutData(gd_label);
		label.setText("热点");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 4, 1));

		final Label label_6 = new Label(this, SWT.NONE);
		label_6.setText("热点信息格式 ：");

		text_map_tool_tip_label_style = new Text(this, SWT.BORDER);
		text_map_tool_tip_label_style.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 3, 1));
		text_map_tool_tip_label_style.setToolTipText("{0}组 {1}分类轴描述信息 {2}数据轴数据值");
		text_map_tool_tip_label_style.setText("{0}: ({1}, {2})");

		final Label label_5 = new Label(this, SWT.NONE);
		label_5.setText("分类轴数据类型：");

		combo_map_tool_tip_category_formatType = new Combo(this, SWT.NONE);
		combo_map_tool_tip_category_formatType.setToolTipText("热点提示信息中分类轴信息数据类型(数值与日期)");
		final GridData gd_combo_map_tool_tip_category_formatType = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_map_tool_tip_category_formatType.widthHint = 131;
		combo_map_tool_tip_category_formatType.setLayoutData(gd_combo_map_tool_tip_category_formatType);
		combo_map_tool_tip_category_formatType.setItems(new String[]{"number","date"});
		
		
		final Label label_7 = new Label(this, SWT.NONE);
		label_7.setText("数据格式：");

		yyyymmddText = new Text(this, SWT.BORDER);
		final GridData gd_yyyymmddText = new GridData(SWT.FILL, SWT.CENTER, true, false);
		yyyymmddText.setLayoutData(gd_yyyymmddText);
		yyyymmddText.setText("yyyy-MM-dd");

		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("数据轴数据类型：");

		combo_map_tool_tip_serie_formatType = new Combo(this, SWT.NONE);
		combo_map_tool_tip_serie_formatType.setToolTipText("热点提示信息中数据轴信息数据类型(数值与日期)");
		combo_map_tool_tip_serie_formatType.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_map_tool_tip_serie_formatType.setItems(new String[]{"number","date"});
		
		final Label label_3 = new Label(this, SWT.NONE);
		label_3.setText("数据格式：");

		text_map_tool_tip_serie_format = new Text(this, SWT.BORDER);
		text_map_tool_tip_serie_format.setText("######.00");
		text_map_tool_tip_serie_format.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
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
