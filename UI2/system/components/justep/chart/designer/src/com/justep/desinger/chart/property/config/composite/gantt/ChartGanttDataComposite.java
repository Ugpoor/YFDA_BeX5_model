package com.justep.desinger.chart.property.config.composite.gantt;

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

public class ChartGanttDataComposite extends Composite implements IChartComposite{

	private Text text_date_format;
	private Text text_serie_tick_labelColor;
	
	private Combo combo_serie_tickLabel_fontSize;
	private Combo combo_serie_tickLabel_fontStyle;
	private Combo combo_serie_tickLabel_fontName;
	
	private Combo combo_serie_twoAxis_location;
	private Combo combo_serie_oneAxis_location;
	
	private Combo combo_serie_title_fontSize;
	private Combo combo_serie_title_fontStyle;
	private Combo combo_serie_title_fontName;
	
	private Text text_serie_title_color;
	private Text text_serie_title;
	
	Shell shell;
	private Button button_text_serie_tick_labelColor;
	private Button button_text_serie_title_color;
	private Button button_serie_double_axis_visible;
	
	
	private XuiElement owerElement;
	private String currentChartType;

	public ChartGanttDataComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
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

		text_serie_tick_labelColor.setText("#000000");
		combo_serie_tickLabel_fontSize.select(5);
		combo_serie_tickLabel_fontStyle.select(0);
		combo_serie_tickLabel_fontName.select(ChartConstant.getSYSFontList().length-1);
		
		combo_serie_twoAxis_location.select(3);
		combo_serie_oneAxis_location.select(0);
		
		combo_serie_title_fontSize.select(5);
		combo_serie_title_fontStyle.select(0);
		combo_serie_title_fontName.select(ChartConstant.getSYSFontList().length-1);
		
		text_serie_title_color.setText("#000000");
		text_serie_title.setText("任务");
		text_date_format.setText("yyyy-MM-dd");
		
		button_serie_double_axis_visible.setSelection(false);
		combo_serie_twoAxis_location.setEnabled(false);
	}
	
	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");

		String doubleAxis = "" + button_serie_double_axis_visible.getSelection();
		String oneAxis = combo_serie_oneAxis_location.getItem(combo_serie_oneAxis_location.getSelectionIndex());
		String towAxis = combo_serie_twoAxis_location.getItem(combo_serie_twoAxis_location.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("double-axis", doubleAxis);
		attrMap.put("one-axis-location", oneAxis);
		attrMap.put("two-axis-location", towAxis);
		this.saveSelf(configElement, "serie", "", attrMap);

		this.saveSelf(configElement, "serie-title", text_serie_title.getText());
		
		this.saveSelf(configElement, "serie-title-color", text_serie_title_color.getText());
		
		String fontName = combo_serie_title_fontName.getItem(combo_serie_title_fontName.getSelectionIndex());
		String fontStyle = combo_serie_title_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_serie_title_fontSize.getItem(combo_serie_title_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "serie-title-font", "", attrMap);
		
		fontName = combo_serie_tickLabel_fontName.getItem(combo_serie_tickLabel_fontName.getSelectionIndex());
		fontStyle = combo_serie_tickLabel_fontStyle.getSelectionIndex()+"";
		fontSize = combo_serie_tickLabel_fontSize.getItem(combo_serie_tickLabel_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "serie-tick-label-font", "", attrMap);
		
		this.saveSelf(configElement, "serie-tick-label-color", text_serie_tick_labelColor.getText());
		
		boolean b = ChartConfigHelper.getChartConfigHelper().compare(this.currentChartType, "date-format",  text_date_format.getText(), new HashMap<String,String>());
		if(b){
			XuiElement dfE = getXuiElement(configElement, "date-format");
			W3cDocumentHelper.setElementText(dfE.getOriginElement(), text_date_format.getText());
		}else{
			configElement.removeChildren("date-format");
		}
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
	
	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		
		XuiElement serieE = configElement.getChildByTagName("serie");
		if(serieE!=null){
			boolean b = Boolean.parseBoolean(serieE.getProperyValue("double-axis"));
			button_serie_double_axis_visible.setSelection(b);
			setDefaultComboValue(combo_serie_oneAxis_location,serieE.getProperyValue("one-axis-location"));
			setDefaultComboValue(combo_serie_twoAxis_location,serieE.getProperyValue("two-axis-location"));
			if(b){
				combo_serie_twoAxis_location.setEnabled(true);
			}else{
				combo_serie_twoAxis_location.setEnabled(false);
			}
		}else{
			button_serie_double_axis_visible.setSelection(false);
			combo_serie_twoAxis_location.setEnabled(false);
		}
		
		
		XuiElement serieTitleE = configElement.getChildByTagName("serie-title");
		if(serieTitleE!=null){
			text_serie_title.setText(W3cDocumentHelper.getText(serieTitleE.getOriginElement()));
		}
		
		XuiElement serieTitleColorE = configElement.getChildByTagName("serie-title-color");
		if(serieTitleColorE!=null){
			text_serie_title_color.setText(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()));
			text_serie_title_color.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()),this.getDisplay()));
			text_serie_title_color.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTitleColorE.getOriginElement()),this.getDisplay()));
		}
		
		XuiElement serieTitleFontE = configElement.getChildByTagName("serie-title-font");
		if(serieTitleFontE!=null){
			setDefaultComboValue(combo_serie_title_fontName,serieTitleFontE.getProperyValue("name"));
			combo_serie_title_fontStyle.select(Integer.parseInt(serieTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_title_fontSize,serieTitleFontE.getProperyValue("size"));
		}

		XuiElement serieTickLabelFontE = configElement.getChildByTagName("serie-tick-label-font");
		if(serieTickLabelFontE!=null){
			setDefaultComboValue(combo_serie_tickLabel_fontName,serieTickLabelFontE.getProperyValue("name"));
			combo_serie_tickLabel_fontStyle.select(Integer.parseInt(serieTickLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_serie_tickLabel_fontSize,serieTickLabelFontE.getProperyValue("size"));
		}
		
		XuiElement serieTickLabelFontColorE = configElement.getChildByTagName("serie-tick-label-color");
		if(serieTickLabelFontColorE!=null){
			text_serie_tick_labelColor.setText(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()));
			text_serie_tick_labelColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()),this.getDisplay()));
			text_serie_tick_labelColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(serieTickLabelFontColorE.getOriginElement()),this.getDisplay()));
		}
		
		XuiElement dfE = configElement.getChildByTagName("date-format");
		if(dfE!=null){
			text_date_format.setText(W3cDocumentHelper.getText(dfE.getOriginElement()));
		}
		
		
	}
	
	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(506, 22));
		label.setText("数据轴");
		
		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		final Group group = new Group(this, SWT.NONE);
		group.setText("数据轴描述信息");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_group.heightHint = 54;
		gd_group.widthHint = 509;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginTop = 1;
		gridLayout.marginRight = 1;
		gridLayout.marginLeft = 1;
		gridLayout.marginHeight = 1;
		gridLayout.marginBottom = 1;
		gridLayout.numColumns = 9;
		group.setLayout(gridLayout);

		final Label label_16 = new Label(group, SWT.NONE);
		label_16.setText("描述信息：");

		text_serie_title = new Text(group, SWT.BORDER);
		final GridData gd_text_serie_title = new GridData(SWT.FILL, SWT.CENTER, true, false, 8, 1);
		gd_text_serie_title.widthHint = 431;
		text_serie_title.setLayoutData(gd_text_serie_title);
		text_serie_title.setText("任务");

		final Label label_18 = new Label(group, SWT.NONE);
		label_18.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_18.setText("字体名称：");

		combo_serie_title_fontName = new Combo(group, SWT.NONE);
		final GridData gd_combo_serie_title_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_title_fontName.widthHint = 44;
		combo_serie_title_fontName.setLayoutData(gd_combo_serie_title_fontName);
		combo_serie_title_fontName.select(0);
		combo_serie_title_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_19 = new Label(group, SWT.NONE);
		label_19.setText("字体样式：");

		combo_serie_title_fontStyle = new Combo(group, SWT.NONE);
		final GridData gd_combo_serie_title_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_title_fontStyle.widthHint = 32;
		combo_serie_title_fontStyle.setLayoutData(gd_combo_serie_title_fontStyle);
		combo_serie_title_fontStyle.select(0);
		combo_serie_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_20 = new Label(group, SWT.NONE);
		label_20.setText("字体大小：");

		combo_serie_title_fontSize = new Combo(group, SWT.NONE);
		final GridData gd_combo_serie_title_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_title_fontSize.widthHint = 20;
		combo_serie_title_fontSize.setLayoutData(gd_combo_serie_title_fontSize);
		combo_serie_title_fontSize.select(5);
		combo_serie_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_17 = new Label(group, SWT.NONE);
		label_17.setLayoutData(new GridData());
		label_17.setText("描述颜色：");

		text_serie_title_color = new Text(group, SWT.BORDER);
		final GridData gd_text_serie_title_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_serie_title_color.widthHint = 27;
		text_serie_title_color.setLayoutData(gd_text_serie_title_color);
		text_serie_title_color.setText("#000000");
		text_serie_title_color.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_serie_title_color.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_serie_title_color = new Button(group, SWT.NONE);
		button_text_serie_title_color.setText("..");

		final Group group_5 = new Group(this, SWT.NONE);
		group_5.setText("数据坐标刻度值");
		final GridData gd_group_5 = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_group_5.heightHint = 52;
		gd_group_5.widthHint = 510;
		group_5.setLayoutData(gd_group_5);
		final GridLayout gridLayout_5 = new GridLayout();
		gridLayout_5.marginWidth = 1;
		gridLayout_5.marginTop = 1;
		gridLayout_5.marginRight = 1;
		gridLayout_5.marginLeft = 1;
		gridLayout_5.marginHeight = 1;
		gridLayout_5.marginBottom = 1;
		gridLayout_5.numColumns = 9;
		group_5.setLayout(gridLayout_5);

		final Label label_25 = new Label(group_5, SWT.NONE);
		label_25.setLayoutData(new GridData(66, SWT.DEFAULT));
		label_25.setText("字体名称：");

		combo_serie_tickLabel_fontName = new Combo(group_5, SWT.NONE);
		combo_serie_tickLabel_fontName.select(0);
		final GridData gd_combo_serie_tickLabel_fontName = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_combo_serie_tickLabel_fontName.widthHint = 40;
		combo_serie_tickLabel_fontName.setLayoutData(gd_combo_serie_tickLabel_fontName);
		combo_serie_tickLabel_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_19_1 = new Label(group_5, SWT.NONE);
		label_19_1.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_19_1.setText("字体样式：");

		combo_serie_tickLabel_fontStyle = new Combo(group_5, SWT.NONE);
		combo_serie_tickLabel_fontStyle.select(0);
		final GridData gd_combo_serie_tickLabel_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_tickLabel_fontStyle.widthHint = 31;
		combo_serie_tickLabel_fontStyle.setLayoutData(gd_combo_serie_tickLabel_fontStyle);
		combo_serie_tickLabel_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_20_1 = new Label(group_5, SWT.NONE);
		label_20_1.setText("字体大小：");

		combo_serie_tickLabel_fontSize = new Combo(group_5, SWT.NONE);
		combo_serie_tickLabel_fontSize.select(5);
		final GridData gd_combo_serie_tickLabel_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_serie_tickLabel_fontSize.widthHint = 22;
		combo_serie_tickLabel_fontSize.setLayoutData(gd_combo_serie_tickLabel_fontSize);
		combo_serie_tickLabel_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_24 = new Label(group_5, SWT.NONE);
		label_24.setLayoutData(new GridData());
		label_24.setText("字体颜色：");

		text_serie_tick_labelColor = new Text(group_5, SWT.BORDER);
		final GridData gd_text_serie_tick_labelColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_serie_tick_labelColor.widthHint = 27;
		text_serie_tick_labelColor.setLayoutData(gd_text_serie_tick_labelColor);
		text_serie_tick_labelColor.setText("#000000");
		text_serie_tick_labelColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		text_serie_tick_labelColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		
		button_text_serie_tick_labelColor = new Button(group_5, SWT.NONE);
		button_text_serie_tick_labelColor.setText("..");

		final Label label_2 = new Label(group_5, SWT.NONE);
		label_2.setText("日期格式：");

		text_date_format = new Text(group_5, SWT.BORDER);
		final GridData gd_text_date_format = new GridData(SWT.FILL, SWT.CENTER, true, false, 2, 1);
		text_date_format.setLayoutData(gd_text_date_format);
		new Label(group_5, SWT.NONE);
		new Label(group_5, SWT.NONE);
		new Label(group_5, SWT.NONE);
		new Label(group_5, SWT.NONE);
		new Label(group_5, SWT.NONE);
		new Label(group_5, SWT.NONE);
		
		
		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("双数据轴");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, false, false);
		gd_group_3.heightHint = 79;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 1;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 2;
		group_3.setLayout(gridLayout_3);

		button_serie_double_axis_visible = new Button(group_3, SWT.CHECK);
		button_serie_double_axis_visible.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		button_serie_double_axis_visible.setText("是否采用双数据轴描述数据");

		final Label label_22 = new Label(group_3, SWT.NONE);
		label_22.setLayoutData(new GridData());
		label_22.setText("主轴位置：");

		combo_serie_oneAxis_location = new Combo(group_3, SWT.NONE);
		combo_serie_oneAxis_location.select(0);
		final GridData gd_combo_serie_oneAxis_location = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_oneAxis_location.setLayoutData(gd_combo_serie_oneAxis_location);
		combo_serie_oneAxis_location.setItems(new String[]{"TOP_OR_LEFT","TOP_OR_RIGHT","BOTTOM_OR_LEFT","BOTTOM_OR_RIGHT"});

		final Label label_23 = new Label(group_3, SWT.NONE);
		label_23.setLayoutData(new GridData());
		label_23.setText("副轴位置：");

		combo_serie_twoAxis_location = new Combo(group_3, SWT.NONE);
		combo_serie_twoAxis_location.select(3);
		final GridData gd_combo_serie_twoAxis_location = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_serie_twoAxis_location.setLayoutData(gd_combo_serie_twoAxis_location);
		combo_serie_twoAxis_location.setItems(new String[]{"TOP_OR_LEFT","TOP_OR_RIGHT","BOTTOM_OR_LEFT","BOTTOM_OR_RIGHT"});
		
	}

	public void registerEvent() {
		
		button_text_serie_title_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_serie_title_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_serie_title_color.setBackground(color);
					text_serie_title_color.setForeground(color);
					text_serie_title_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_text_serie_tick_labelColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_serie_tick_labelColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_serie_tick_labelColor.setBackground(color);
					text_serie_tick_labelColor.setForeground(color);
					text_serie_tick_labelColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		
		button_serie_double_axis_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {             	
            	combo_serie_twoAxis_location.setEnabled(button_serie_double_axis_visible.getSelection());            	
            }    
        });   
		
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
