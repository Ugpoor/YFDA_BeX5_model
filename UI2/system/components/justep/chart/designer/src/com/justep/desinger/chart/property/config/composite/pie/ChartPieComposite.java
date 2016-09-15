package com.justep.desinger.chart.property.config.composite.pie;

import java.util.HashMap;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.ColorDialog;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartPieComposite extends Composite implements IChartComposite{

	Shell shell;
	
	//绘图区域
	private Text text_pie_percentFormat;
	private Text text_pie_numberFormat;
	private Text text_pie_labelStyle;
	private Combo combo_is_circular;
	private Text text_bgcolor;
	private Button button_text_bgcolor;
	private Combo combo_background_alpha;
	private Text text_noDataMsg;
	private Combo combo_foreground_alpha;
	
	//标题区域
	private Combo combo_label_gap;
	private Combo combo_label_fontSize;
	private Combo combo_label_fontStyle;
	private Combo combo_label_fontName;
	
	//弹出区域
	private Combo combo_explode_all_percent_value;
	private Combo combo_explode_percent_value;
	private Text text_explode_percent_index;
	private Text text_explode_all_percent_range;
	
	//热点部分
	private Text text_map_percent_format;
	private Text text_map_number_format;
	private Text text_map_label_style;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartPieComposite(Composite parent, int style,XuiElement owerElement,String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		text_bgcolor.setText("#FFFFFF");
		text_explode_all_percent_range.setText("100");
		text_explode_percent_index.setText("0");
		text_map_label_style.setText("{0}: ({1}, {2})");
		text_map_number_format.setText("######");
		text_map_percent_format.setText("##.00%");
		
		combo_background_alpha.select(5);
		combo_foreground_alpha.select(8);
		combo_label_gap.select(4);
		combo_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_label_fontStyle.select(0);
		combo_label_fontSize.select(5);
		combo_explode_percent_value.select(0);
		combo_explode_all_percent_value.select(0);
		combo_is_circular.select(0);
	}

	

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		
		XuiElement bgColorE = configElement.getChildByTagName("background-color");
		if(bgColorE!=null){
			String textBgc = W3cDocumentHelper.getText(bgColorE.getOriginElement());
			this.text_bgcolor.setText(textBgc);
			this.text_bgcolor.setForeground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
			this.text_bgcolor.setBackground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
		}
		
		XuiElement bgAlphaE = configElement.getChildByTagName("background-alpha");
		if(bgAlphaE!=null){
			setDefaultComboValue(combo_background_alpha,W3cDocumentHelper.getText(bgAlphaE.getOriginElement()));
		}
		
		XuiElement fgAlphaE = configElement.getChildByTagName("foreground-alpha");
		if(fgAlphaE!=null){
			setDefaultComboValue(combo_foreground_alpha,W3cDocumentHelper.getText(fgAlphaE.getOriginElement()));
		}
		
		XuiElement noDataMsgE = configElement.getChildByTagName("no-data-message");
		if(noDataMsgE!=null){
			text_noDataMsg.setText(W3cDocumentHelper.getText(noDataMsgE.getOriginElement()));
		}
		
		XuiElement isCircularE = configElement.getChildByTagName("is-circular");
		if(isCircularE!=null){
			setDefaultComboValue(combo_is_circular,W3cDocumentHelper.getText(isCircularE.getOriginElement()));
		}
		
		XuiElement labelGapE = configElement.getChildByTagName("label-gap");
		if(labelGapE!=null){
			setDefaultComboValue(combo_label_gap,W3cDocumentHelper.getText(labelGapE.getOriginElement()));
		}
		
		XuiElement labelFontE = configElement.getChildByTagName("label-font");
		if(labelFontE!=null){
			setDefaultComboValue(combo_label_fontName,labelFontE.getProperyValue("name"));
			combo_label_fontStyle.select(Integer.parseInt(labelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_label_fontSize,labelFontE.getProperyValue("size"));
		}
		
		XuiElement pieLabelStyleE = configElement.getChildByTagName("pie-label-style");
		if(pieLabelStyleE!=null){
			text_pie_labelStyle.setText(W3cDocumentHelper.getText(pieLabelStyleE.getOriginElement()));
		}
		XuiElement pieLabelNmE = configElement.getChildByTagName("pie-label-number-format");
		if(pieLabelNmE!=null){
			text_pie_numberFormat.setText(W3cDocumentHelper.getText(pieLabelNmE.getOriginElement()));
		}
		XuiElement pieLabelPmE = configElement.getChildByTagName("pie-label-percent-format");
		if(pieLabelPmE!=null){
			text_pie_percentFormat.setText(W3cDocumentHelper.getText(pieLabelPmE.getOriginElement()));
		}
		
		if(!this.currentChartType.equalsIgnoreCase("pie-3d")) {
			XuiElement explodeE = configElement.getChildByTagName("explode-all-percent");
			if(explodeE!=null){
				text_explode_all_percent_range.setText(explodeE.getProperyValue("range"));
				setDefaultComboValue(combo_explode_all_percent_value,explodeE.getProperyValue("value"));
			}
			XuiElement explodePE = configElement.getChildByTagName("explode-percent");
			if(explodePE!=null){
				text_explode_percent_index.setText(explodePE.getProperyValue("index"));
				setDefaultComboValue(combo_explode_percent_value,explodePE.getProperyValue("value"));
			}
		}
		
		XuiElement mlsE = configElement.getChildByTagName("map-tool-tip-label-style");
		if(mlsE!=null){
			text_map_label_style.setText(W3cDocumentHelper.getText(mlsE.getOriginElement()));
		}
		XuiElement mufE = configElement.getChildByTagName("map-tool-tip-number-format");
		if(mufE!=null){
			text_map_number_format.setText(W3cDocumentHelper.getText(mufE.getOriginElement()));
		}
		XuiElement mpfE = configElement.getChildByTagName("map-tool-tip-percent-format");
		if(mpfE!=null){
			text_map_percent_format.setText(W3cDocumentHelper.getText(mpfE.getOriginElement()));
		}
	}
	
	public void saveSelfConfig() {
		
		
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		//背景色
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "background-color",  text_bgcolor.getText(), new HashMap<String,String>());
		if(b){
			XuiElement bgColorE = getXuiElement(configElement, "background-color");
			W3cDocumentHelper.setElementText(bgColorE.getOriginElement(), text_bgcolor.getText());
		}else{
			configElement.removeChildren("background-color");
		}
		
		//背景透明
		String bga = combo_background_alpha.getItem(combo_background_alpha.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "background-alpha",  bga, new HashMap<String,String>());
		if(b){
			XuiElement bgAlphaE = getXuiElement(configElement, "background-alpha");
			W3cDocumentHelper.setElementText(bgAlphaE.getOriginElement(),bga);
		}else{
			configElement.removeChildren("background-alpha");
		}
		
		//前景透明
		String fga = combo_foreground_alpha.getItem(combo_foreground_alpha.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "foreground-alpha",  fga, new HashMap<String,String>());
		if(b){
			XuiElement fgAlphaE = getXuiElement(configElement, "foreground-alpha");
			W3cDocumentHelper.setElementText(fgAlphaE.getOriginElement(), fga);
		}else{
			configElement.removeChildren("foreground-alpha");
		}
		
		//无数据提示信息
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "no-data-message",  text_noDataMsg.getText(), new HashMap<String,String>());
		if(b){
			XuiElement noDataMsgE = getXuiElement(configElement, "no-data-message");
			W3cDocumentHelper.setElementText(noDataMsgE.getOriginElement(), text_noDataMsg.getText());
		}else{
			configElement.removeChildren("no-data-message");
		}
		
		//是否圆形
		String isCircular = combo_is_circular.getItem(combo_is_circular.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "is-circular",  isCircular, new HashMap<String,String>());
		if(b){
			XuiElement isCircularE = getXuiElement(configElement, "is-circular");
			W3cDocumentHelper.setElementText(isCircularE.getOriginElement(), isCircular);
		}else{
			configElement.removeChildren("is-circular");
		}
		
		//扇区
		String gap = combo_label_gap.getItem(combo_label_gap.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "label-gap",  gap, new HashMap<String,String>());
		if(b){
			XuiElement labelGapE = getXuiElement(configElement, "label-gap");
			W3cDocumentHelper.setElementText(labelGapE.getOriginElement(),gap );
		}else{
			configElement.removeChildren("label-gap");
		}
		
		//字体
		String fontName = combo_label_fontName.getItem(combo_label_fontName.getSelectionIndex());
		String fontStyle = combo_label_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_label_fontSize.getItem(combo_label_fontSize.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "label-font",  "", attrMap);
		if(b){
			XuiElement labelFontE = getXuiElement(configElement, "label-font");
			labelFontE.getXuiDataModel().setPropertyValue(labelFontE, "name", fontName);
			labelFontE.getXuiDataModel().setPropertyValue(labelFontE, "style", fontStyle);
			labelFontE.getXuiDataModel().setPropertyValue(labelFontE, "size", fontSize);
		}else{
			configElement.removeChildren("label-font");
		}
		
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "pie-label-style",  text_pie_labelStyle.getText(), new HashMap<String,String>());
		if(b){
			XuiElement pieLabelStyleE = getXuiElement(configElement, "pie-label-style");
			W3cDocumentHelper.setElementText(pieLabelStyleE.getOriginElement(), text_pie_labelStyle.getText());
		}else{
			configElement.removeChildren("pie-label-style");
		}
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "pie-label-number-format",  text_pie_numberFormat.getText(), new HashMap<String,String>());
		if(b){
			XuiElement pieLabelNmE = getXuiElement(configElement, "pie-label-number-format");
			W3cDocumentHelper.setElementText(pieLabelNmE.getOriginElement(), text_pie_numberFormat.getText());
		}else{
			configElement.removeChildren("pie-label-number-format");
		}
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "pie-label-percent-format",  text_pie_percentFormat.getText(), new HashMap<String,String>());
		if(b){
			XuiElement pieLabelPmE = getXuiElement(configElement, "pie-label-percent-format");
			W3cDocumentHelper.setElementText(pieLabelPmE.getOriginElement(), text_pie_percentFormat.getText());
		}else{
			configElement.removeChildren("pie-label-percent-format");
		}
		
		
		if (!this.currentChartType.equalsIgnoreCase("pie-3d")) {
			
			String range = text_explode_all_percent_range.getText();
			String value = combo_explode_all_percent_value.getItem(combo_explode_all_percent_value.getSelectionIndex());
			attrMap = new HashMap<String,String>();
			attrMap.put("range", range);
			attrMap.put("value", value);
			b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "explode-all-percent",  "", attrMap);
			if(b){
				XuiElement explodeE = getXuiElement(configElement, "explode-all-percent");
				explodeE.getXuiDataModel().setPropertyValue(explodeE, "range", range);
				explodeE.getXuiDataModel().setPropertyValue(explodeE, "value", value );
			}else{
				configElement.removeChildren("explode-all-percent");
			}
			
			range = text_explode_percent_index.getText();
			value = combo_explode_percent_value.getItem(combo_explode_percent_value.getSelectionIndex());
			attrMap = new HashMap<String,String>();
			attrMap.put("range", range);
			attrMap.put("value", value);
			b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "explode-percent",  "", attrMap);
			if(b){
				XuiElement explodePE = getXuiElement(configElement, "explode-percent");
				explodePE.getXuiDataModel().setPropertyValue(explodePE, "index", range);
				explodePE.getXuiDataModel().setPropertyValue(explodePE, "value", value);
			}else{
				configElement.removeChildren("explode-percent");
			}
		}
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "map-tool-tip-label-style",  text_map_label_style.getText(), new HashMap<String,String>());
		if(b){
			XuiElement mlsE = getXuiElement(configElement, "map-tool-tip-label-style");
			W3cDocumentHelper.setElementText(mlsE.getOriginElement(), text_map_label_style.getText());
		}else{
			configElement.removeChildren("map-tool-tip-label-style");
		}
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "map-tool-tip-number-format",  text_map_number_format.getText(), new HashMap<String,String>());
		if(b){
			XuiElement mnfE = getXuiElement(configElement, "map-tool-tip-number-format");
			W3cDocumentHelper.setElementText(mnfE.getOriginElement(), text_map_number_format.getText());
		}else{
			configElement.removeChildren("map-tool-tip-number-format");
		}
		
		b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "map-tool-tip-percent-format",  text_map_percent_format.getText(), new HashMap<String,String>());
		if(b){
			XuiElement mpfE = getXuiElement(configElement, "map-tool-tip-percent-format");
			W3cDocumentHelper.setElementText(mpfE.getOriginElement(), text_map_percent_format.getText());
		}else{
			configElement.removeChildren("map-tool-tip-percent-format");
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

	public void registerEvent() {
		if (this.currentChartType.equalsIgnoreCase("pie-3d")) {
			text_explode_all_percent_range.setEnabled(false);
			combo_explode_all_percent_value.setEnabled(false);
			text_explode_percent_index.setEnabled(false);
			combo_explode_percent_value.setEnabled(false);
		}
		
		button_text_bgcolor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_bgcolor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_bgcolor.setBackground(color);
					text_bgcolor.setForeground(color);
					text_bgcolor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		final GridData gd_label = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_label.heightHint = 21;
		gd_label.widthHint = 503;
		label.setLayoutData(gd_label);
		label.setText("饼图");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("公共参数");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 56;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginWidth = 1;
		gridLayout.marginTop = 1;
		gridLayout.marginRight = 1;
		gridLayout.marginLeft = 1;
		gridLayout.marginHeight = 1;
		gridLayout.marginBottom = 1;
		gridLayout.numColumns = 9;
		group.setLayout(gridLayout);

		final Label label_17 = new Label(group, SWT.NONE);
		label_17.setLayoutData(new GridData());
		label_17.setText("是否圆形：");

		combo_is_circular = new Combo(group, SWT.NONE);
		combo_is_circular.select(0);
		final GridData gd_combo_is_circular = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_is_circular.setLayoutData(gd_combo_is_circular);
		combo_is_circular.setItems(new String[]{"true","false"});

		final Label label_3 = new Label(group, SWT.NONE);
		label_3.setLayoutData(new GridData());
		label_3.setText("背景透明度：");

		combo_background_alpha = new Combo(group, SWT.NONE);
		combo_background_alpha.select(5);
		final GridData gd_combo_background_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_background_alpha.setLayoutData(gd_combo_background_alpha);
		combo_background_alpha.setItems(new String[] {"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_4 = new Label(group, SWT.NONE);
		label_4.setLayoutData(new GridData());
		label_4.setText("前景透明度：");

		combo_foreground_alpha = new Combo(group, SWT.NONE);
		combo_foreground_alpha.select(8);
		final GridData gd_combo_foreground_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_foreground_alpha.setLayoutData(gd_combo_foreground_alpha);
		combo_foreground_alpha.setItems(new String[] {"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f"});

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("背景色：");

		text_bgcolor = new Text(group, SWT.BORDER);
		text_bgcolor.setText("#FFFFFF");
		final GridData gd_ffffffText = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_ffffffText.widthHint = 24;
		text_bgcolor.setLayoutData(gd_ffffffText);
		text_bgcolor.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_bgcolor.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_bgcolor = new Button(group, SWT.NONE);
		button_text_bgcolor.setText("..");

		final Label label_5 = new Label(group, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("无数据显示：");

		text_noDataMsg = new Text(group, SWT.BORDER);
		text_noDataMsg.setText("无数据");
		final GridData gd_text_noDataMsg = new GridData(SWT.FILL, SWT.CENTER, true, false, 8, 1);
		gd_text_noDataMsg.widthHint = 103;
		text_noDataMsg.setLayoutData(gd_text_noDataMsg);

		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("扇区描述信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 80;
		gd_group_1.widthHint = 510;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginWidth = 1;
		gridLayout_1.marginTop = 1;
		gridLayout_1.marginRight = 1;
		gridLayout_1.marginLeft = 1;
		gridLayout_1.marginHeight = 1;
		gridLayout_1.marginBottom = 1;
		gridLayout_1.numColumns = 6;
		group_1.setLayout(gridLayout_1);

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setText("字体名称：");

		combo_label_fontName = new Combo(group_1, SWT.NONE);
		combo_label_fontName.select(0);
		final GridData gd_combo_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_label_fontName.widthHint = 143;
		combo_label_fontName.setLayoutData(gd_combo_label_fontName);
		combo_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setText("字体样式：");

		combo_label_fontStyle = new Combo(group_1, SWT.NONE);
		combo_label_fontStyle.select(0);
		final GridData gd_combo_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_label_fontStyle.setLayoutData(gd_combo_label_fontStyle);
		combo_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setText("字体大小：");

		combo_label_fontSize = new Combo(group_1, SWT.NONE);
		combo_label_fontSize.select(5);
		combo_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		final GridData gd_combo_label_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_label_fontSize.setLayoutData(gd_combo_label_fontSize);

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setToolTipText("饼图扇区与扇区说明信息之间距离");
		label_6.setLayoutData(new GridData());
		label_6.setText("信息距离：");

		combo_label_gap = new Combo(group_1, SWT.NONE);
		combo_label_gap.setToolTipText("扇区与扇区描述信息之间距离");
		final GridData gd_combo_label_gap = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_label_gap.setLayoutData(gd_combo_label_gap);
		combo_label_gap.setItems(new String[] {"0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09","0.1"});
		combo_label_gap.select(4);
		

		final Label label_19 = new Label(group_1, SWT.NONE);
		label_19.setLayoutData(new GridData());
		label_19.setText("数值格式：");

		text_pie_numberFormat = new Text(group_1, SWT.BORDER);
		text_pie_numberFormat.setToolTipText("#与0均为占位符,#表明数据可有可无,0表明没有数据则以0填充");
		text_pie_numberFormat.setText("######");
		final GridData gd_text_pie_numberFormat = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_pie_numberFormat.setLayoutData(gd_text_pie_numberFormat);

		final Label label_20 = new Label(group_1, SWT.NONE);
		label_20.setLayoutData(new GridData());
		label_20.setText("百分比格式：");

		text_pie_percentFormat = new Text(group_1, SWT.BORDER);
		text_pie_percentFormat.setToolTipText("#与0均为占位符,#表明数据可有可无,0表明没有数据则以0填充");
		text_pie_percentFormat.setText("##.00%");
		final GridData gd_text_pie_percentFormat = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_pie_percentFormat.setLayoutData(gd_text_pie_percentFormat);

		final Label label_18 = new Label(group_1, SWT.NONE);
		label_18.setLayoutData(new GridData());
		label_18.setText("信息格式：");

		text_pie_labelStyle = new Text(group_1, SWT.BORDER);
		text_pie_labelStyle.setToolTipText("{0}=描述信息 {1}=数据 {2}=百分比");
		text_pie_labelStyle.setText("{0} {2}");
		final GridData gd_text_pie_labelStyle = new GridData(SWT.FILL, SWT.CENTER, true, false, 5, 1);
		text_pie_labelStyle.setLayoutData(gd_text_pie_labelStyle);

		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("扇区热点提示相关参数");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 54;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 1;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 4;
		group_3.setLayout(gridLayout_3);

		final Label label_15 = new Label(group_3, SWT.NONE);
		label_15.setLayoutData(new GridData());
		label_15.setText("数据格式：");

		text_map_number_format = new Text(group_3, SWT.BORDER);
		text_map_number_format.setToolTipText("#与0均为占位符,#表明数据可有可无,0表明没有数据则以0填充");
		text_map_number_format.setText("######");
		text_map_number_format.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));

		final Label label_16 = new Label(group_3, SWT.NONE);
		label_16.setLayoutData(new GridData());
		label_16.setText("百分比格式：");

		text_map_percent_format = new Text(group_3, SWT.BORDER);
		text_map_percent_format.setToolTipText("#与0均为占位符,#表明数据可有可无,0表明没有数据则以0填充");
		text_map_percent_format.setText("##.00%");
		final GridData gd_text_map_percent_format = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_map_percent_format.setLayoutData(gd_text_map_percent_format);

		final Label label_14 = new Label(group_3, SWT.NONE);
		label_14.setLayoutData(new GridData());
		label_14.setText("信息格式：");

		text_map_label_style = new Text(group_3, SWT.BORDER);
		text_map_label_style.setText("{0}: ({1}, {2})");
		final GridData gd_text_map_label_style = new GridData(SWT.FILL, SWT.CENTER, true, false, 3, 1);
		text_map_label_style.setLayoutData(gd_text_map_label_style);
		text_map_label_style.setToolTipText("{0}=描述信息 {1}=数据 {2}=百分比" );
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("扇区着重区域控制(3D饼图不支持)");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 60;
		gd_group_2.widthHint = 510;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginWidth = 1;
		gridLayout_2.marginTop = 1;
		gridLayout_2.marginRight = 1;
		gridLayout_2.marginLeft = 1;
		gridLayout_2.marginHeight = 1;
		gridLayout_2.marginBottom = 1;
		gridLayout_2.numColumns = 4;
		group_2.setLayout(gridLayout_2);

		final Label label_10 = new Label(group_2, SWT.NONE);
		label_10.setText("扇区索引范围：");

		text_explode_all_percent_range = new Text(group_2, SWT.BORDER);
		text_explode_all_percent_range.setToolTipText("扇区个数(默认100)");
		text_explode_all_percent_range.setText("100");
		
		final GridData gd_text_explode_all_percent_range = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_explode_all_percent_range.setLayoutData(gd_text_explode_all_percent_range);

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setText("扇区均分突出率：");

		combo_explode_all_percent_value = new Combo(group_2, SWT.NONE);
		combo_explode_all_percent_value.select(0);
		combo_explode_all_percent_value.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_explode_all_percent_value = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_explode_all_percent_value.setLayoutData(gd_combo_explode_all_percent_value);

		final Label label_12 = new Label(group_2, SWT.NONE);
		label_12.setText("特定扇区索引：");

		text_explode_percent_index = new Text(group_2, SWT.BORDER);
		text_explode_percent_index.setToolTipText("突出着重显示,根据数据顺序,索引从0开始");
		text_explode_percent_index.setText("0");
		final GridData gd_text_explode_percent_index = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_explode_percent_index.setLayoutData(gd_text_explode_percent_index);

		final Label label_13 = new Label(group_2, SWT.NONE);
		label_13.setText("特定扇区突出率：");
		combo_explode_percent_value = new Combo(group_2, SWT.NONE);
		combo_explode_percent_value.select(0);
		combo_explode_percent_value.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_explode_percent_value = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_explode_percent_value.setLayoutData(gd_combo_explode_percent_value);
		
	}
}
