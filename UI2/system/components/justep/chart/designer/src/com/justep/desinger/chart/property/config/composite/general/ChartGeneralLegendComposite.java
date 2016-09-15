package com.justep.desinger.chart.property.config.composite.general;

import java.util.HashMap;

import org.eclipse.swt.SWT;
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

public class ChartGeneralLegendComposite extends Composite implements IChartComposite{
	
	Shell shell;
	private Button button_legend_visible;
	
	private Combo combo_v;
	private Combo combo_h;
	
	private Combo combo_legend_font_size;
	private Combo combo_legend_font_style;
	private Combo combo_legend_font_name;
	
	private Combo combo_legend_p;
	private Text text_legend_bgc;
	private Button button_text_legend_bgc; //颜色选择
	
	private Combo combo_padding_bottom;
	private Combo combo_margin_bottom;
	private Combo combo_padding_right;
	private Combo combo_margin_right;
	private Combo combo_padding_left;
	private Combo combo_margin_left;
	private Combo combo_padding_top;
	private Combo combo_margin_top;
	private Combo combo_border_bottom;
	private Combo combo_border_right;
	private Combo combo_border_left;
	private Combo combo_border_top;
	
	private XuiElement configE;
	
	public ChartGeneralLegendComposite(Composite parent, int style,XuiElement configE) {
		super(parent, style);
		this.configE = configE;
		shell = this.getShell();
		initLayout();
		//
		registerEvent();
		initDefaultValue();
		initSelfDefaultValue();
	}

	public void registerEvent(){
		//有效性控制
		button_legend_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {    

            	text_legend_bgc.setEnabled(button_legend_visible.getSelection());  
            	button_text_legend_bgc.setEnabled(button_legend_visible.getSelection());  
            	
            	combo_v.setEnabled(button_legend_visible.getSelection());  
            	combo_h.setEnabled(button_legend_visible.getSelection());  
            	
            	combo_legend_font_size.setEnabled(button_legend_visible.getSelection());  
            	combo_legend_font_style.setEnabled(button_legend_visible.getSelection());  
            	combo_legend_font_name.setEnabled(button_legend_visible.getSelection());  
            	
            	combo_legend_p.setEnabled(button_legend_visible.getSelection());  

            	combo_padding_bottom.setEnabled(button_legend_visible.getSelection());  
            	combo_margin_bottom.setEnabled(button_legend_visible.getSelection());  
            	combo_padding_right.setEnabled(button_legend_visible.getSelection());  
            	combo_margin_right.setEnabled(button_legend_visible.getSelection());  
            	combo_padding_left.setEnabled(button_legend_visible.getSelection());  
            	combo_margin_left.setEnabled(button_legend_visible.getSelection());  
            	combo_padding_top.setEnabled(button_legend_visible.getSelection());  
            	combo_margin_top.setEnabled(button_legend_visible.getSelection());  
            	combo_border_bottom.setEnabled(button_legend_visible.getSelection());  
            	combo_border_right.setEnabled(button_legend_visible.getSelection());  
            	combo_border_left.setEnabled(button_legend_visible.getSelection());  
            	combo_border_top.setEnabled(button_legend_visible.getSelection());  
            }    
        });    
		
		button_text_legend_bgc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_legend_bgc.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_legend_bgc.setBackground(color);
					text_legend_bgc.setForeground(color);
					text_legend_bgc.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
	}
	
	public void initDefaultValue(){		
		text_legend_bgc.setText("#FFFFFF");
    	
    	combo_v.select(1);
    	combo_h.select(1);
    	
    	combo_legend_font_size.select(6);
    	combo_legend_font_style.select(0);
    	combo_legend_font_name.select(ChartConstant.getSYSFontList().length-1);
    	
    	combo_legend_p.select(3);

    	combo_padding_bottom.select(1);
    	combo_margin_bottom.select(1);
    	combo_padding_right.select(1);
    	combo_margin_right.select(1);
    	combo_padding_left.select(1);
    	combo_margin_left.select(1);
    	combo_padding_top.select(1);
    	combo_margin_top.select(1);
    	
    	combo_border_bottom.select(0);
    	combo_border_right.select(0);
    	combo_border_left.select(0);
    	combo_border_top.select(0);
    	
    	button_legend_visible.setSelection(true);
	}
	
	/**
	 * 根据用户自定义配置初始化属性配置面板
	 */
	public void initSelfDefaultValue(){
		if(this.configE == null){//原则上不允许也不会出现NULL
			return;
		}
		
		XuiElement titleE = this.configE.getChildByTagName("legend");
		if(titleE != null){
			String titleVisible = titleE.getProperyValue("visible");
			if(titleVisible == null || titleVisible.equalsIgnoreCase("true") || titleVisible.equals("")){
				this.button_legend_visible.setSelection(true);
			}else{
				this.button_legend_visible.setSelection(false);
				text_legend_bgc.setEnabled(false);  
				button_text_legend_bgc.setEnabled(false);
            	combo_padding_right.setEnabled(false); 
            	combo_padding_bottom.setEnabled(false); 
            	combo_margin_bottom.setEnabled(false); 
            	combo_margin_right.setEnabled(false); 
            	combo_padding_left.setEnabled(false); 
            	combo_padding_top.setEnabled(false); 
            	combo_margin_left.setEnabled(false); 
            	combo_margin_top.setEnabled(false); 
            	combo_border_bottom.setEnabled(false); 
            	combo_border_right.setEnabled(false); 
            	combo_border_left.setEnabled(false); 
            	combo_border_top.setEnabled(false); 
            	combo_v.setEnabled(false); 
            	combo_h.setEnabled(false); 
            	combo_legend_font_size.setEnabled(false); 
            	combo_legend_font_style.setEnabled(false); 
            	combo_legend_font_name.setEnabled(false); 
            	combo_legend_p.setEnabled(false); 
			}
			
			String titlePosition = titleE.getProperyValue("position");
			if(titlePosition == null || titlePosition.equals("")){
			}else{
				setDefaultComboValue(this.combo_legend_p,titlePosition);
			}
			
		}
		
		XuiElement lBgcE = this.configE.getChildByTagName("legend-background-color");
		if(lBgcE != null){
			String textBgc = W3cDocumentHelper.getText(lBgcE.getOriginElement());
			this.text_legend_bgc.setText(textBgc);
			this.text_legend_bgc.setForeground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
			this.text_legend_bgc.setBackground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
		}
		
		XuiElement titleValignmentE = this.configE.getChildByTagName("legend-vertical-alignment");
		if(titleValignmentE != null){
			setDefaultComboValue(this.combo_v,W3cDocumentHelper.getText(titleValignmentE.getOriginElement()));
		}
		
		XuiElement titleHalignmentE = this.configE.getChildByTagName("legend-horizontal-alignment");
		if(titleHalignmentE != null){
			setDefaultComboValue(this.combo_h,W3cDocumentHelper.getText(titleHalignmentE.getOriginElement()));
		}

		XuiElement titleBorderE = this.configE.getChildByTagName("legend-border");
		if(titleBorderE != null){
			setDefaultComboValue(this.combo_border_top,titleBorderE.getProperyValue("top"));
			setDefaultComboValue(this.combo_border_left,titleBorderE.getProperyValue("left"));
			setDefaultComboValue(this.combo_border_right,titleBorderE.getProperyValue("right"));
			setDefaultComboValue(this.combo_border_bottom,titleBorderE.getProperyValue("bottom"));
		}

		XuiElement titleMarginE = this.configE.getChildByTagName("legend-margin");
		if(titleMarginE != null){
			setDefaultComboValue(this.combo_margin_top,titleMarginE.getProperyValue("top"));
			setDefaultComboValue(this.combo_margin_left,titleMarginE.getProperyValue("left"));
			setDefaultComboValue(this.combo_margin_right,titleMarginE.getProperyValue("right"));
			setDefaultComboValue(this.combo_margin_bottom,titleMarginE.getProperyValue("bottom"));
		}
		
		XuiElement titlePaddingE = this.configE.getChildByTagName("legend-padding");
		if(titlePaddingE != null){
			setDefaultComboValue(this.combo_padding_top,titlePaddingE.getProperyValue("top"));
			setDefaultComboValue(this.combo_padding_left,titlePaddingE.getProperyValue("left"));
			setDefaultComboValue(this.combo_padding_right,titlePaddingE.getProperyValue("right"));
			setDefaultComboValue(this.combo_padding_bottom,titlePaddingE.getProperyValue("bottom"));
		}
		
		XuiElement titleFontE = this.configE.getChildByTagName("legend-font");
		if(titleFontE != null){
			setDefaultComboValue(this.combo_legend_font_name,titleFontE.getProperyValue("name"));
			this.combo_legend_font_style.select(Integer.parseInt(titleFontE.getProperyValue("style")));
			setDefaultComboValue(this.combo_legend_font_size,titleFontE.getProperyValue("size"));
		}
	}
	
	/**
	 * 
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
	
	/**
	 * 保存用户自定义
	 */
	public void saveSelfConfig() {
		
		String legendP = combo_legend_p.getItem(combo_legend_p.getSelectionIndex());
		boolean visible =this.button_legend_visible.getSelection();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("position", legendP);
		if(visible){
			attrMap.put("visible", "true");
		}else{
			attrMap.put("visible", "false");
		}		
		boolean b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend", "", attrMap);
		if(b){	
			XuiElement titleE = getXuiElement("legend");	
			if(this.button_legend_visible.getSelection()){
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "true");
			}else{
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "false");
			}
			titleE.getXuiDataModel().setPropertyValue(titleE, "position", legendP);
		}else{
			this.configE.removeChildren("legend");
		}
		
		//背景色
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-background-color",  text_legend_bgc.getText(), new HashMap<String,String>());
		if(b){
			XuiElement titleBackgroundColorE = getXuiElement("legend-background-color");		
			W3cDocumentHelper.setElementText(titleBackgroundColorE.getOriginElement(), text_legend_bgc.getText());
		}else{
			this.configE.removeChildren("legend-background-color");
		}
		
		//垂直校正
		String l_v =  combo_v.getItem(combo_v.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-vertical-alignment", l_v , new HashMap<String,String>());
		if(b){
			XuiElement titleValignmentE = getXuiElement("legend-vertical-alignment");
			W3cDocumentHelper.setElementText(titleValignmentE.getOriginElement(), l_v);
		}else{
			this.configE.removeChildren("legend-vertical-alignment");
		}
		
		//水平校正
		String c_h = combo_h.getItem(combo_h.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-horizontal-alignment", c_h , new HashMap<String,String>());
		if(b){
			XuiElement titleHalignmentE = getXuiElement("legend-horizontal-alignment");
			W3cDocumentHelper.setElementText(titleHalignmentE.getOriginElement(), c_h);
		}else{
			this.configE.removeChildren("legend-horizontal-alignment");
		}
		
		String borderTop=this.combo_border_top.getItem(this.combo_border_top.getSelectionIndex());
		String borderLeft=this.combo_border_left.getItem(this.combo_border_left.getSelectionIndex());
	    String borderRight=this.combo_border_right.getItem(this.combo_border_right.getSelectionIndex());
		String borderBottom=this.combo_border_bottom.getItem(this.combo_border_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", borderTop);
		attrMap.put("left", borderLeft);
		attrMap.put("right", borderRight);
		attrMap.put("bottom", borderBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-border", "" , attrMap);
		if(b){
			XuiElement titleBorderE = getXuiElement("legend-border");
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "top", borderTop);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "left", borderLeft);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "right", borderRight);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "bottom", borderBottom);
		}else{
			this.configE.removeChildren("legend-border");
		}
		
		//边距
		String marginTop = this.combo_margin_top.getItem(this.combo_margin_top.getSelectionIndex());
		String marginLeft = this.combo_margin_left.getItem(this.combo_margin_left.getSelectionIndex());
		String marginRight = this.combo_margin_right.getItem(this.combo_margin_right.getSelectionIndex());
		String marginBottom = this.combo_margin_bottom.getItem(this.combo_margin_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", marginTop);
		attrMap.put("left", marginLeft);
		attrMap.put("right", marginRight);
		attrMap.put("bottom", marginBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-margin", "" , attrMap);
		if(b){
			XuiElement titleMarginE = getXuiElement("legend-margin");
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "top", marginTop);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "left", marginLeft);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "right",marginRight );
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "bottom", marginBottom);
		}else{
			this.configE.removeChildren("legend-margin");
		}
		
		
		//填充
		String paddingTop = this.combo_padding_top.getItem(this.combo_padding_top.getSelectionIndex());
		String paddingLeft = this.combo_padding_left.getItem(this.combo_padding_left.getSelectionIndex());
		String paddingRight = this.combo_padding_right.getItem(this.combo_padding_right.getSelectionIndex());
		String paddingBottom =  this.combo_padding_bottom.getItem(this.combo_padding_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", paddingTop);
		attrMap.put("left", paddingLeft);
		attrMap.put("right", paddingRight);
		attrMap.put("bottom", paddingBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-padding", "" , attrMap);
		if(b){
			XuiElement titlePaddingE = getXuiElement("legend-padding");
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "top", paddingTop);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "left", paddingLeft);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "right", paddingRight);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "bottom",paddingBottom);
		}else{
			this.configE.removeChildren("legend-padding");
		}
		
		
		//字体
		String fontName = this.combo_legend_font_name.getItem(this.combo_legend_font_name.getSelectionIndex());
		String fontStyle =  ""+this.combo_legend_font_style.getSelectionIndex();
		String fontSize = this.combo_legend_font_size.getItem(this.combo_legend_font_size.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "legend-item-font", "" , attrMap);
		if(b){
			XuiElement titleFontE = getXuiElement("legend-item-font");
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "name", fontName);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "style", fontStyle);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "size", fontSize);
		}else{
			this.configE.removeChildren("legend-item-font");
		}

	}

	private XuiElement getXuiElement(String tagName){
		XuiElement xuiE = this.configE.getChildByTagName(tagName);
		if(xuiE == null){
			xuiE = this.configE.getXuiDataModel().addElement(tagName, this.configE, tagName);
		}
		return xuiE;
	}
	
	
	public void initLayout(){
		setLayout(new GridLayout());
		final Label label = new Label(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setText("图例");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		button_legend_visible = new Button(this, SWT.CHECK);
		final GridData gd_botton_title_visible = new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1);
		gd_botton_title_visible.heightHint = 23;
		gd_botton_title_visible.widthHint = 247;
		button_legend_visible.setLayoutData(gd_botton_title_visible);
		button_legend_visible.setText("图表是否显示图例信息");
		
		
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("标准");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_1.heightHint = 60;
		gd_group_1.widthHint = 506;
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 9;
		group_1.setLayout(gridLayout_1);

		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setLayoutData(new GridData());
		label_3.setText("图例位置：");

		combo_legend_p = new Combo(group_1, SWT.NONE);
		combo_legend_p.select(3);
		combo_legend_p.setItems(new String[] {"TOP", "LEFT", "RIGHT", "BOTTOM"});
		final GridData gd_combo_legend_p = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_legend_p.widthHint = 36;
		combo_legend_p.setLayoutData(gd_combo_legend_p);

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setLayoutData(new GridData());
		label_7.setText("水平对齐：");

		combo_h = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_h = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_h.widthHint = 37;
		combo_h.setLayoutData(gd_combo_h);
		combo_h.select(1);
		combo_h.setItems(new String[] {"LEFT", "CENTER", "RIGHT"});

		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setLayoutData(new GridData());
		label_8.setText("垂直对齐：");

		combo_v = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_v = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_v.widthHint = 31;
		combo_v.setLayoutData(gd_combo_v);
		combo_v.select(1);
		combo_v.setItems(new String[] {"TOP", "CENTER", "BOTTOM"});

		final Label label_2 = new Label(group_1, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("背景色：");

		text_legend_bgc = new Text(group_1, SWT.BORDER);
		text_legend_bgc.setText("#FFFFFF");
		final GridData gd_text_legend_bgc = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_legend_bgc.widthHint = 26;
		text_legend_bgc.setLayoutData(gd_text_legend_bgc);
		text_legend_bgc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_legend_bgc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_legend_bgc = new Button(group_1, SWT.NONE);
		button_text_legend_bgc.setText("..");

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setLayoutData(new GridData());
		label_4.setText("字体名称：");

		combo_legend_font_name = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_legend_font_name = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_legend_font_name.widthHint = 29;
		combo_legend_font_name.setLayoutData(gd_combo_legend_font_name);
		combo_legend_font_name.select(0);
		combo_legend_font_name.setItems(ChartConstant.getSYSFontList());
		
		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("字体样式：");

		combo_legend_font_style = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_legend_font_style = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_legend_font_style.widthHint = 31;
		combo_legend_font_style.setLayoutData(gd_combo_legend_font_style);
		combo_legend_font_style.select(0);
		combo_legend_font_style.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setLayoutData(new GridData());
		label_6.setText("字体大小：");

		combo_legend_font_size = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_legend_font_size = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_legend_font_size.widthHint = 37;
		combo_legend_font_size.setLayoutData(gd_combo_legend_font_size);
		combo_legend_font_size.select(6);
		combo_legend_font_size.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);

		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("边距");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_4.heightHint = 83;
		gd_group_4.widthHint = 508;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.numColumns = 9;
		group_4.setLayout(gridLayout_4);

		final Label label_9 = new Label(group_4, SWT.NONE);
		label_9.setText("边框");

		final Label label_10 = new Label(group_4, SWT.NONE);
		label_10.setText("上：");

		combo_border_top = new Combo(group_4, SWT.NONE);
		combo_border_top.select(0);
		combo_border_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_border_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_border_top.setLayoutData(gd_combo_border_top);

		final Label label_11 = new Label(group_4, SWT.NONE);
		label_11.setText("左：");

		combo_border_left = new Combo(group_4, SWT.NONE);
		combo_border_left.select(0);
		combo_border_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_border_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_border_left.setLayoutData(gd_combo_border_left);

		final Label label_12 = new Label(group_4, SWT.NONE);
		label_12.setText("右：");

		combo_border_right = new Combo(group_4, SWT.NONE);
		combo_border_right.select(0);
		combo_border_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_border_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_border_right.setLayoutData(gd_combo_border_right);

		final Label label_13 = new Label(group_4, SWT.NONE);
		label_13.setText("下：");

		combo_border_bottom = new Combo(group_4, SWT.NONE);
		combo_border_bottom.select(0);
		combo_border_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_border_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_border_bottom.setLayoutData(gd_combo_border_bottom);

		final Label label_14 = new Label(group_4, SWT.NONE);
		label_14.setText("边距");

		final Label label_15 = new Label(group_4, SWT.NONE);
		label_15.setText("上：");

		combo_margin_top = new Combo(group_4, SWT.NONE);
		combo_margin_top.select(1);
		combo_margin_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_top.setLayoutData(gd_combo_margin_top);

		final Label label_16 = new Label(group_4, SWT.NONE);
		label_16.setText("左：");

		combo_margin_left = new Combo(group_4, SWT.NONE);
		combo_margin_left.select(1);
		combo_margin_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_left.setLayoutData(gd_combo_margin_left);

		final Label label_17 = new Label(group_4, SWT.NONE);
		label_17.setText("右：");

		combo_margin_right = new Combo(group_4, SWT.NONE);
		combo_margin_right.select(1);
		combo_margin_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_right.setLayoutData(gd_combo_margin_right);

		final Label label_18 = new Label(group_4, SWT.NONE);
		label_18.setText("下：");

		combo_margin_bottom = new Combo(group_4, SWT.NONE);
		combo_margin_bottom.select(1);
		combo_margin_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_bottom.setLayoutData(gd_combo_margin_bottom);

		final Label label_19 = new Label(group_4, SWT.NONE);
		label_19.setText("间隙");

		final Label label_20 = new Label(group_4, SWT.NONE);
		label_20.setText("上：");

		combo_padding_top = new Combo(group_4, SWT.NONE);
		combo_padding_top.select(1);
		combo_padding_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_top.setLayoutData(gd_combo_padding_top);

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setText("左：");

		combo_padding_left = new Combo(group_4, SWT.NONE);
		combo_padding_left.select(1);
		combo_padding_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_left.setLayoutData(gd_combo_padding_left);

		final Label label_22 = new Label(group_4, SWT.NONE);
		label_22.setText("右：");

		combo_padding_right = new Combo(group_4, SWT.NONE);
		combo_padding_right.select(1);
		combo_padding_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_right.setLayoutData(gd_combo_padding_right);

		final Label label_23 = new Label(group_4, SWT.NONE);
		label_23.setText("下：");

		combo_padding_bottom = new Combo(group_4, SWT.NONE);
		combo_padding_bottom.select(1);
		combo_padding_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_bottom.setLayoutData(gd_combo_padding_bottom);
		
	}

}
