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

public class ChartGanttClassComposite extends Composite implements IChartComposite{

	private Combo combo_category_tick_label_fontSize;
	private Combo combo_category_tick_label_fontStyle;
	private Combo combo_category_tick_label_fontName;
	private Text text_category_tick_labelColor;
	
	private Text text_category_item_labelAngle;
	
	private Combo combo_category_title_fontSize;
	private Combo combo_category_title_fontStyle;
	private Combo combo_category_title_fontName;
	
	private Text text_category_titleColor;
	private Text text_category_title;
	
	Shell shell;
	private Button button_text_category_titleColor;
	private Button button_text_category_tick_labelColor;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartGanttClassComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
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
	
		text_category_title.setText("时间");
		text_category_titleColor.setText("#000000");
		
		combo_category_title_fontSize.select(5);
		combo_category_title_fontStyle.select(0);
		combo_category_title_fontName.select(ChartConstant.getSYSFontList().length-1);

		text_category_item_labelAngle.setText("0");
		text_category_tick_labelColor.setText("#000000");
				
		combo_category_tick_label_fontSize.select(5);
		combo_category_tick_label_fontStyle.select(0);
		combo_category_tick_label_fontName.select(ChartConstant.getSYSFontList().length-1);
	}

	public void saveSelfConfig() {
		XuiElement configElement = getXuiElement(this.owerElement,"config");

		this.saveSelf(configElement, "category-title", text_category_title.getText());
		this.saveSelf(configElement, "category-title-color", text_category_titleColor.getText());
		this.saveSelf(configElement, "category-tick-label-color", text_category_tick_labelColor.getText());
		this.saveSelf(configElement, "category-item-label-angle", text_category_item_labelAngle.getText());
				
		String fontName = combo_category_title_fontName.getItem(combo_category_title_fontName.getSelectionIndex());
		String fontStyle = combo_category_title_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_category_title_fontSize.getItem(combo_category_title_fontSize.getSelectionIndex());
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "category-title-font", "", attrMap);
				
		fontName = combo_category_tick_label_fontName.getItem(combo_category_tick_label_fontName.getSelectionIndex());
		fontStyle = combo_category_tick_label_fontStyle.getSelectionIndex()+"";
		fontSize = combo_category_tick_label_fontSize.getItem(combo_category_tick_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "category-tick-label-font", "", attrMap);
		
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
		
		XuiElement categoryTitleE = configElement.getChildByTagName("category-title");
		if(categoryTitleE!=null){
			text_category_title.setText(W3cDocumentHelper.getText(categoryTitleE.getOriginElement()));
		}
		
		XuiElement categoryTitleCE = configElement.getChildByTagName("category-title-color");
		if(categoryTitleCE!=null){
			text_category_titleColor.setText(W3cDocumentHelper.getText(categoryTitleCE.getOriginElement()));
			text_category_titleColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTitleCE.getOriginElement()),this.getDisplay()));
			text_category_titleColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTitleCE.getOriginElement()),this.getDisplay()));
		}else{
			text_category_titleColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
			text_category_titleColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		}

		XuiElement categoryTitleFontE = configElement.getChildByTagName("category-title-font");
		if(categoryTitleFontE!=null){
			setDefaultComboValue(combo_category_title_fontName,categoryTitleFontE.getProperyValue("name"));
			combo_category_title_fontStyle.select(Integer.parseInt(categoryTitleFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_title_fontSize,categoryTitleFontE.getProperyValue("size"));
		}
		
		XuiElement categoryAngleCE = configElement.getChildByTagName("category-item-label-angle");
		if(categoryAngleCE!=null){
			text_category_item_labelAngle.setText(W3cDocumentHelper.getText(categoryAngleCE.getOriginElement()));
		}
		
		XuiElement categoryTickCE = configElement.getChildByTagName("category-tick-label-color");
		if(categoryTickCE!=null){
			text_category_tick_labelColor.setText(W3cDocumentHelper.getText(categoryTickCE.getOriginElement()));
			text_category_tick_labelColor.setBackground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTickCE.getOriginElement()),this.getDisplay()));
			text_category_tick_labelColor.setForeground(ColorUtil.hexRGBToSWTColor(W3cDocumentHelper.getText(categoryTickCE.getOriginElement()),this.getDisplay()));
		}else{
			text_category_tick_labelColor.setBackground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
			text_category_tick_labelColor.setForeground(ColorUtil.hexRGBToSWTColor("#000000",this.getDisplay()));
		}
		
		XuiElement categoryTickFontE = configElement.getChildByTagName("category-tick-label-font");
		if(categoryTickFontE!=null){
			setDefaultComboValue(combo_category_tick_label_fontName,categoryTickFontE.getProperyValue("name"));
			combo_category_tick_label_fontStyle.select(Integer.parseInt(categoryTickFontE.getProperyValue("style")));
			setDefaultComboValue(combo_category_tick_label_fontSize,categoryTickFontE.getProperyValue("size"));
		}
		
		
	}
	
	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(508, 23));
		label.setText("分类轴");
		
		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));
		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setText("分类轴描述信息");
		final GridData gd_group_2 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_2.heightHint = 54;
		gd_group_2.widthHint = 510;
		group_2.setLayoutData(gd_group_2);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.numColumns = 9;
		group_2.setLayout(gridLayout_2);

		final Label label_6 = new Label(group_2, SWT.NONE);
		label_6.setLayoutData(new GridData());
		label_6.setText("标题：");

		text_category_title = new Text(group_2, SWT.BORDER);
		text_category_title.setText("时间");
		final GridData gd_text_category_title = new GridData(SWT.FILL, SWT.CENTER, true, false, 8, 1);
		text_category_title.setLayoutData(gd_text_category_title);

		final Label label_8 = new Label(group_2, SWT.NONE);
		label_8.setLayoutData(new GridData());
		label_8.setText("字体名称：");

		combo_category_title_fontName = new Combo(group_2, SWT.NONE);
		combo_category_title_fontName.select(0);
		final GridData gd_combo_category_title_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_title_fontName.widthHint = 40;
		combo_category_title_fontName.setLayoutData(gd_combo_category_title_fontName);
		combo_category_title_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_9 = new Label(group_2, SWT.NONE);
		label_9.setText("字体样式：");

		combo_category_title_fontStyle = new Combo(group_2, SWT.NONE);
		combo_category_title_fontStyle.select(0);
		final GridData gd_combo_category_title_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontStyle.setLayoutData(gd_combo_category_title_fontStyle);
		combo_category_title_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_10 = new Label(group_2, SWT.NONE);
		label_10.setText("字体大小：");

		combo_category_title_fontSize = new Combo(group_2, SWT.NONE);
		combo_category_title_fontSize.select(5);
		final GridData gd_combo_category_title_fontSize = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_category_title_fontSize.setLayoutData(gd_combo_category_title_fontSize);
		combo_category_title_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_7 = new Label(group_2, SWT.NONE);
		label_7.setLayoutData(new GridData());
		label_7.setText("字体颜色：");

		text_category_titleColor = new Text(group_2, SWT.BORDER);
		text_category_titleColor.setText("#000000");
		final GridData gd_text_category_titleColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_category_titleColor.widthHint = 24;
		text_category_titleColor.setLayoutData(gd_text_category_titleColor);

		button_text_category_titleColor = new Button(group_2, SWT.NONE);
		button_text_category_titleColor.setText("..");
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("分类轴各组信息");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 57;
		gd_group.widthHint = 507;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 9;
		group.setLayout(gridLayout);

		final Label label_13 = new Label(group, SWT.NONE);
		label_13.setText("字体名称：");

		combo_category_tick_label_fontName = new Combo(group, SWT.NONE);
		final GridData gd_combo_category_tick_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_tick_label_fontName.widthHint = 42;
		combo_category_tick_label_fontName.setLayoutData(gd_combo_category_tick_label_fontName);
		combo_category_tick_label_fontName.select(0);
		combo_category_tick_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_14 = new Label(group, SWT.NONE);
		label_14.setText("字体样式：");

		combo_category_tick_label_fontStyle = new Combo(group, SWT.NONE);
		final GridData gd_combo_category_tick_label_fontStyle = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_category_tick_label_fontStyle.widthHint = 44;
		combo_category_tick_label_fontStyle.setLayoutData(gd_combo_category_tick_label_fontStyle);
		combo_category_tick_label_fontStyle.select(0);
		combo_category_tick_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_15 = new Label(group, SWT.NONE);
		label_15.setText("字体大小：");

		combo_category_tick_label_fontSize = new Combo(group, SWT.NONE);
		combo_category_tick_label_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_category_tick_label_fontSize.select(5);
		combo_category_tick_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});

		final Label label_12 = new Label(group, SWT.NONE);
		label_12.setText("字体颜色：");

		text_category_tick_labelColor = new Text(group, SWT.BORDER);
		final GridData gd_text_category_tick_labelColor = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_category_tick_labelColor.widthHint = 25;
		text_category_tick_labelColor.setLayoutData(gd_text_category_tick_labelColor);
		text_category_tick_labelColor.setText("#000000");

		button_text_category_tick_labelColor = new Button(group, SWT.NONE);
		button_text_category_tick_labelColor.setText("..");

		final Label label_11 = new Label(group, SWT.NONE);
		label_11.setText("偏移度：");

		text_category_item_labelAngle = new Text(group, SWT.BORDER);
		text_category_item_labelAngle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		text_category_item_labelAngle.setText("0");
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		new Label(group, SWT.NONE);
		
	}

	public void registerEvent() {
		button_text_category_titleColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_category_titleColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_category_titleColor.setBackground(color);
					text_category_titleColor.setForeground(color);
					text_category_titleColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_category_tick_labelColor.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_category_tick_labelColor.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_category_tick_labelColor.setBackground(color);
					text_category_tick_labelColor.setForeground(color);
					text_category_tick_labelColor.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
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
