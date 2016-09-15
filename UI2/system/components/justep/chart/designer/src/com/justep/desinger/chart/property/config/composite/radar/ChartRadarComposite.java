package com.justep.desinger.chart.property.config.composite.radar;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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

public class ChartRadarComposite extends Composite implements IChartComposite{
	
	private Text text_gap;
	private Text text_ticks_count;
	
	private Combo combo_map_tool_tipFformatType;
	
	private Combo combo_label_fontSize;
	private Combo combo_label_fontStyle;
	private Combo combo_label_fontName;
	
	private Text text_map_tool_tipFformat;
	private Text text_map_tool_tip_labelStyle;
	
	private Text text_label_color;
	
	private Text text_background_color;
	private Combo combo_background_alpha;
	private Combo combo_foreground_alpha;
	
	Shell shell;
	private Button button_text_background_color;
	private Button button_text_label_color;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartRadarComposite(Composite parent, int style,XuiElement owerElement , String currentChartType) {
		super(parent, style);
		this.owerElement = owerElement;
		this.currentChartType = currentChartType;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
		
		
	}
	
	public void initDefaultValue() {
		text_background_color.setText("#FFFFFF");
		combo_background_alpha.select(5);
		combo_foreground_alpha.select(8);
		
		text_label_color.setText("#000000");
		combo_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_label_fontStyle.select(0);
		combo_label_fontSize.select(5);
		combo_map_tool_tipFformatType.select(0);
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(75, 24));
		label.setText("雷达图");
		
		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("雷达图参数信息");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 50;
		gd_group_1.widthHint = 509;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.marginWidth = 1;
		gridLayout_1.marginTop = 1;
		gridLayout_1.marginRight = 1;
		gridLayout_1.marginLeft = 1;
		gridLayout_1.marginHeight = 1;
		gridLayout_1.marginBottom = 1;
		gridLayout_1.numColumns = 9;
		group_1.setLayout(gridLayout_1);

		final Label label_30 = new Label(group_1, SWT.NONE);
		label_30.setText("刻度个数：");

		text_ticks_count = new Text(group_1, SWT.BORDER);
		final GridData gd_text_ticks_count = new GridData(SWT.FILL, SWT.BOTTOM, true, false);
		gd_text_ticks_count.widthHint = 43;
		text_ticks_count.setLayoutData(gd_text_ticks_count);
		text_ticks_count.setText("5");

		final Label label_31 = new Label(group_1, SWT.NONE);
		label_31.setLayoutData(new GridData());
		label_31.setText("线条距离：");

		text_gap = new Text(group_1, SWT.BORDER);
		text_gap.setToolTipText("刻度值 与线条的距离");
		final GridData gd_text_gap = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_gap.widthHint = 28;
		text_gap.setLayoutData(gd_text_gap);
		text_gap.setText("10");
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);

		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setText("字体名称：");

		combo_label_fontName = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_label_fontName = new GridData(SWT.FILL, SWT.BOTTOM, true, false);
		gd_combo_label_fontName.widthHint = 37;
		combo_label_fontName.setLayoutData(gd_combo_label_fontName);
		combo_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setText("字体样式：");

		combo_label_fontStyle = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_label_fontStyle.widthHint = 23;
		combo_label_fontStyle.setLayoutData(gd_combo_label_fontStyle);
		combo_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_10 = new Label(group_1, SWT.NONE);
		label_10.setText("字体大小：");

		combo_label_fontSize = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_label_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_label_fontSize.widthHint = 34;
		combo_label_fontSize.setLayoutData(gd_combo_label_fontSize);
		combo_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("字体颜色：");

		text_label_color = new Text(group_1, SWT.BORDER);
		final GridData gd_text_label_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_label_color.widthHint = 25;
		text_label_color.setLayoutData(gd_text_label_color);
		text_label_color.setText("#000000");
		text_label_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_label_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_label_color = new Button(group_1, SWT.NONE);
		button_text_label_color.setText("..");
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("热点");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 59;
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

		final Label label_6 = new Label(group_2, SWT.NONE);
		label_6.setText("信息格式：");

		text_map_tool_tip_labelStyle = new Text(group_2, SWT.BORDER);
		text_map_tool_tip_labelStyle.setToolTipText("热点描述信息：{0}组 {1}分类轴信息 {2}数据轴信息");
		text_map_tool_tip_labelStyle.setText("({0}, {1}) = {2}");
		final GridData gd_text_map_tool_tip_labelStyle = new GridData(SWT.FILL, SWT.CENTER, true, false, 3, 1);
		text_map_tool_tip_labelStyle.setLayoutData(gd_text_map_tool_tip_labelStyle);

		final Label label_11 = new Label(group_2, SWT.NONE);
		label_11.setText("信息类型：");

		combo_map_tool_tipFformatType = new Combo(group_2, SWT.NONE);
		combo_map_tool_tipFformatType.setToolTipText("热点数据轴数据类型");
		combo_map_tool_tipFformatType.select(0);
		final GridData gd_combo_map_tool_tipFformatType = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_map_tool_tipFformatType.setLayoutData(gd_combo_map_tool_tipFformatType);
		combo_map_tool_tipFformatType.setItems(new String[]{"number","date"});

		final Label label_7 = new Label(group_2, SWT.NONE);
		label_7.setLayoutData(new GridData());
		label_7.setText("信息格式：");

		text_map_tool_tipFformat = new Text(group_2, SWT.BORDER);
		text_map_tool_tipFformat.setToolTipText("热点数据轴数据格式");
		text_map_tool_tipFformat.setText("######.00");
		final GridData gd_text_map_tool_tipFformat = new GridData(SWT.FILL, SWT.CENTER, true, false);
		text_map_tool_tipFformat.setLayoutData(gd_text_map_tool_tipFformat);
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("其他");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 36;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginWidth = 1;
		gridLayout.marginTop = 1;
		gridLayout.marginRight = 1;
		gridLayout.marginLeft = 1;
		gridLayout.marginBottom = 1;
		gridLayout.marginHeight = 1;
		gridLayout.numColumns = 7;
		group.setLayout(gridLayout);
		
		final Label label_3 = new Label(group, SWT.NONE);
		label_3.setText("前景透明度：");

		combo_foreground_alpha = new Combo(group, SWT.NONE);
		combo_foreground_alpha.select(5);
		final GridData gd_combo_foreground_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_foreground_alpha.widthHint = 83;
		combo_foreground_alpha.setLayoutData(gd_combo_foreground_alpha);
		combo_foreground_alpha.setItems(new String[]{"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_4 = new Label(group, SWT.NONE);
		label_4.setLayoutData(new GridData());
		label_4.setText("背景透明度：");

		combo_background_alpha = new Combo(group, SWT.NONE);
		combo_background_alpha.select(8);
		final GridData gd_combo_background_alpha = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_background_alpha.widthHint = 82;
		combo_background_alpha.setLayoutData(gd_combo_background_alpha);
		combo_background_alpha.setItems(new String[]{"0.1f","0.2f","0.3f","0.4f","0.5f","0.6f","0.7f","0.8f","0.9f","1.0f"});

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("背景色：");

		text_background_color = new Text(group, SWT.BORDER);
		text_background_color.setText("#FFFFFF");
		final GridData gd_text_background_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_background_color.widthHint = 17;
		text_background_color.setLayoutData(gd_text_background_color);
		text_background_color.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_background_color.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_background_color = new Button(group, SWT.NONE);
		button_text_background_color.setLayoutData(new GridData(SWT.RIGHT, SWT.CENTER, false, false));
		button_text_background_color.setText("..");
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement bgColorE = configElement.getChildByTagName("background-color");
		if(bgColorE!=null){
			text_background_color.setText(W3cDocumentHelper.getText(bgColorE.getOriginElement()));
			text_background_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
			text_background_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(bgColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement bgAlphaE = configElement.getChildByTagName("background-alpha");
		if(bgAlphaE!=null){
			setDefaultComboValue(combo_background_alpha,W3cDocumentHelper.getText(bgAlphaE.getOriginElement()));
		}
		XuiElement fgAlphaE = configElement.getChildByTagName("foreground-alpha");
		if(fgAlphaE!=null){
			setDefaultComboValue(combo_foreground_alpha,W3cDocumentHelper.getText(fgAlphaE.getOriginElement()));
		}
		XuiElement labelColorE = configElement.getChildByTagName("label-color");
		if(labelColorE!=null){
			text_label_color.setText(W3cDocumentHelper.getText(labelColorE.getOriginElement()));
			text_label_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(labelColorE.getOriginElement()),this.getDisplay()));
			text_label_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(labelColorE.getOriginElement()),this.getDisplay()));
		}
		XuiElement labelFontE = configElement.getChildByTagName("label-font");
		if(labelFontE!=null){
			setDefaultComboValue(combo_label_fontName,labelFontE.getProperyValue("name"));
			combo_label_fontStyle.select(Integer.parseInt(labelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_label_fontSize,labelFontE.getProperyValue("size"));
		}
		XuiElement ticksCountE = configElement.getChildByTagName("ticks-count");
		if(ticksCountE!=null){
			text_ticks_count.setText(W3cDocumentHelper.getText(ticksCountE.getOriginElement()));
		}
		XuiElement gapE = configElement.getChildByTagName("gap");
		if(gapE!=null){
			text_gap.setText(W3cDocumentHelper.getText(gapE.getOriginElement()));
		}
		XuiElement maplabelStyleE = configElement.getChildByTagName("map-tool-tip-label-style");
		if(maplabelStyleE!=null){
			text_map_tool_tip_labelStyle.setText(W3cDocumentHelper.getText(maplabelStyleE.getOriginElement()));
		}
		XuiElement mapTipFormatE = configElement.getChildByTagName("map-tool-tip-format");
		if(mapTipFormatE!=null){
			text_map_tool_tipFformat.setText(W3cDocumentHelper.getText(mapTipFormatE.getOriginElement()));
			setDefaultComboValue(combo_map_tool_tipFformatType,mapTipFormatE.getProperyValue("type"));
		}
		
	}

	public void registerEvent() {
		button_text_background_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_background_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_background_color.setBackground(color);
					text_background_color.setForeground(color);
					text_background_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_text_label_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_label_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_label_color.setBackground(color);
					text_label_color.setForeground(color);
					text_label_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
	}

	public void saveSelfConfig() {
		
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		
		this.saveSelf(configElement, "background-color", text_background_color.getText());
		
		this.saveSelf(configElement, "background-alpha", combo_background_alpha.getItem(combo_background_alpha.getSelectionIndex()));
		
		this.saveSelf(configElement, "foreground-alpha", combo_foreground_alpha.getItem(combo_foreground_alpha.getSelectionIndex()));
		
		this.saveSelf(configElement, "label-color", text_label_color.getText());
		
		String fontName = combo_label_fontName.getItem(combo_label_fontName.getSelectionIndex());
		String fontStyle =  combo_label_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_label_fontSize.getItem(combo_label_fontSize.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "label-font", "", attrMap);
		
		
		this.saveSelf(configElement, "ticks-count", text_ticks_count.getText());

		this.saveSelf(configElement, "gap", text_gap.getText());
		
		this.saveSelf(configElement, "map-tool-tip-label-style", text_map_tool_tip_labelStyle.getText());
		
		String type = combo_map_tool_tipFformatType.getItem(combo_map_tool_tipFformatType.getSelectionIndex());
		String v = text_map_tool_tipFformat.getText();
		attrMap = new HashMap<String,String>();
		attrMap.put("type", type);
		this.saveSelf(configElement, "map-tool-tip-format", v, attrMap);
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
