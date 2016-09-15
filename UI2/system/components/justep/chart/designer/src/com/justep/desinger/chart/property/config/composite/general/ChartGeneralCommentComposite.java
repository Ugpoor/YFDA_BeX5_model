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

public class ChartGeneralCommentComposite extends Composite implements IChartComposite{

	Shell shell;
	
	private Button button_comment_visible;
	
	private Text text_comment;
	private Combo combo_comment_p;
	private Text text_comment_bgc;
	private Button button_text_comment_bgc; //颜色选择
	
	private Combo combo_padding_bottom;
	private Combo combo_margin_bottom;
	private Combo combo_padding_right;
	private Combo combo_margin_right;
	private Combo combo_padding_top;
	private Combo combo_padding_left;
	private Combo combo_margin_left;
	private Combo combo_margin_top;
	private Combo combo_border_bottom;
	private Combo combo_border_right;
	private Combo combo_border_left;
	private Combo combo_border_top;

	private Combo combo_v;
	private Combo combo_h;
	
	private Combo combo_comment_font_size;
	private Combo combo_comment_font_style;
	private Combo combo_comment_font_name;
	
	private XuiElement configE;
	
	public ChartGeneralCommentComposite(Composite parent, int style,XuiElement configE) {
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
		button_comment_visible.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {    

            	text_comment.setEnabled(button_comment_visible.getSelection());  
            	combo_comment_p.setEnabled(button_comment_visible.getSelection());  
            	text_comment_bgc.setEnabled(button_comment_visible.getSelection());  
            	button_text_comment_bgc.setEnabled(button_comment_visible.getSelection());  
            	
            	combo_padding_bottom.setEnabled(button_comment_visible.getSelection());  
            	combo_margin_bottom.setEnabled(button_comment_visible.getSelection());  
            	combo_padding_right.setEnabled(button_comment_visible.getSelection());  
            	combo_margin_right.setEnabled(button_comment_visible.getSelection());  
            	combo_padding_top.setEnabled(button_comment_visible.getSelection());  
            	combo_padding_left.setEnabled(button_comment_visible.getSelection());  
            	combo_margin_left.setEnabled(button_comment_visible.getSelection());  
            	combo_margin_top.setEnabled(button_comment_visible.getSelection());  
            	combo_border_bottom.setEnabled(button_comment_visible.getSelection());  
            	combo_border_right.setEnabled(button_comment_visible.getSelection());  
            	combo_border_left.setEnabled(button_comment_visible.getSelection());  
            	combo_border_top.setEnabled(button_comment_visible.getSelection());  

            	combo_v.setEnabled(button_comment_visible.getSelection());  
            	combo_h.setEnabled(button_comment_visible.getSelection());  
            	
            	combo_comment_font_size.setEnabled(button_comment_visible.getSelection());  
            	combo_comment_font_style.setEnabled(button_comment_visible.getSelection());  
            	combo_comment_font_name.setEnabled(button_comment_visible.getSelection());  
            	
            }    
        });    	
		
		button_text_comment_bgc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_comment_bgc.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_comment_bgc.setBackground(color);
					text_comment_bgc.setForeground(color);
					text_comment_bgc.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
	}
	
	public void initDefaultValue(){		
		
		text_comment.setText("");
		text_comment_bgc.setText("#FFFFFF");
		
		combo_comment_p.select(3);
    	
    	combo_padding_bottom.select(1);
    	combo_margin_bottom.select(1);
    	combo_padding_right.select(1);
    	combo_margin_right.select(1);
    	combo_padding_top.select(1);
    	combo_padding_left.select(1);
    	combo_margin_left.select(1);
    	combo_margin_top.select(1);
    	
    	combo_border_bottom.select(0);
    	combo_border_right.select(0);
    	combo_border_left.select(0);
    	combo_border_top.select(0);

    	combo_v.select(1);
    	combo_h.select(1);
    	
    	combo_comment_font_size.select(6);
    	combo_comment_font_style.select(0);
    	combo_comment_font_name.select(ChartConstant.getSYSFontList().length-1);
	
    	button_comment_visible.setSelection(false);
    	
    	
    	text_comment.setEnabled(false);  
    	combo_comment_p.setEnabled(false);  
    	text_comment_bgc.setEnabled(false);
    	button_text_comment_bgc.setEnabled(false);
    	combo_padding_bottom.setEnabled(false);  
    	combo_margin_bottom.setEnabled(false);  
    	combo_padding_right.setEnabled(false);  
    	combo_margin_right.setEnabled(false);  
    	combo_padding_top.setEnabled(false);  
    	combo_padding_left.setEnabled(false);  
    	combo_margin_left.setEnabled(false);  
    	combo_margin_top.setEnabled(false);  
    	combo_border_bottom.setEnabled(false);  
    	combo_border_right.setEnabled(false);  
    	combo_border_left.setEnabled(false);  
    	combo_border_top.setEnabled(false);  
    	combo_v.setEnabled(false);  
    	combo_h.setEnabled(false);      	
    	combo_comment_font_size.setEnabled(false);  
    	combo_comment_font_style.setEnabled(false);  
    	combo_comment_font_name.setEnabled(false);  
    	
	}
	
	
	/**
	 * 根据用户自定义配置初始化属性配置面板
	 */
	public void initSelfDefaultValue(){
		if(this.configE == null){//原则上不允许也不会出现NULL
			return;
		}
		
		XuiElement titleE = this.configE.getChildByTagName("comment");
		if(titleE != null){
			String titleVisible = titleE.getProperyValue("visible");
			if(titleVisible == null || titleVisible.equalsIgnoreCase("true") || titleVisible.equals("")){
				this.button_comment_visible.setSelection(true);
			}else{
				this.button_comment_visible.setSelection(false);
				text_comment_bgc.setEnabled(false);  
				button_text_comment_bgc.setEnabled(false);
				text_comment.setEnabled(false);  
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
            	combo_comment_font_size.setEnabled(false); 
            	combo_comment_font_style.setEnabled(false); 
            	combo_comment_font_name.setEnabled(false); 
            	combo_comment_p.setEnabled(false); 
			}
			
			String titlePosition = titleE.getProperyValue("position");
			if(titlePosition == null || titlePosition.equals("")){
			}else{
				setDefaultComboValue(this.combo_comment_p,titlePosition);
			}
			
			this.text_comment.setText(W3cDocumentHelper.getText(titleE.getOriginElement()));
			
		}
		
		XuiElement cBgcE = this.configE.getChildByTagName("comment-background-color");
		if(cBgcE != null){
			String textBgc = W3cDocumentHelper.getText(cBgcE.getOriginElement());
			this.text_comment_bgc.setText(textBgc);
			this.text_comment_bgc.setForeground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
			this.text_comment_bgc.setBackground(ColorUtil.hexRGBToSWTColor(textBgc,this.getDisplay()));
		}
		
		
		XuiElement titleValignmentE = this.configE.getChildByTagName("comment-vertical-alignment");
		if(titleValignmentE != null){
			setDefaultComboValue(this.combo_v,W3cDocumentHelper.getText(titleValignmentE.getOriginElement()));
		}
		
		XuiElement titleHalignmentE = this.configE.getChildByTagName("comment-horizontal-alignment");
		if(titleHalignmentE != null){
			setDefaultComboValue(this.combo_h,W3cDocumentHelper.getText(titleHalignmentE.getOriginElement()));
		}
		
		
		XuiElement titleBorderE = this.configE.getChildByTagName("comment-border");
		if(titleBorderE != null){
			setDefaultComboValue(this.combo_border_top,titleBorderE.getProperyValue("top"));
			setDefaultComboValue(this.combo_border_left,titleBorderE.getProperyValue("left"));
			setDefaultComboValue(this.combo_border_right,titleBorderE.getProperyValue("right"));
			setDefaultComboValue(this.combo_border_bottom,titleBorderE.getProperyValue("bottom"));
		}

		XuiElement titleMarginE = this.configE.getChildByTagName("comment-margin");
		if(titleMarginE != null){
			setDefaultComboValue(this.combo_margin_top,titleMarginE.getProperyValue("top"));
			setDefaultComboValue(this.combo_margin_left,titleMarginE.getProperyValue("left"));
			setDefaultComboValue(this.combo_margin_right,titleMarginE.getProperyValue("right"));
			setDefaultComboValue(this.combo_margin_bottom,titleMarginE.getProperyValue("bottom"));
		}
		
		XuiElement titlePaddingE = this.configE.getChildByTagName("comment-padding");
		if(titlePaddingE != null){
			setDefaultComboValue(this.combo_padding_top,titlePaddingE.getProperyValue("top"));
			setDefaultComboValue(this.combo_padding_left,titlePaddingE.getProperyValue("left"));
			setDefaultComboValue(this.combo_padding_right,titlePaddingE.getProperyValue("right"));
			setDefaultComboValue(this.combo_padding_bottom,titlePaddingE.getProperyValue("bottom"));
		}
		
		XuiElement titleFontE = this.configE.getChildByTagName("comment-font");
		if(titleFontE != null){
			setDefaultComboValue(this.combo_comment_font_name,titleFontE.getProperyValue("name"));
			this.combo_comment_font_style.select(Integer.parseInt(titleFontE.getProperyValue("style")));
			setDefaultComboValue(this.combo_comment_font_size,titleFontE.getProperyValue("size"));
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
		
		//子标题
		String commonText = text_comment.getText();
		String commonP = combo_comment_p.getItem(combo_comment_p.getSelectionIndex());
		boolean visible =this.button_comment_visible.getSelection();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("position", commonP);
		if(visible){
			attrMap.put("visible", "true");
		}else{
			attrMap.put("visible", "false");
		}		
		boolean b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment", commonText, attrMap);
		if(b){			
			XuiElement titleE = getXuiElement("comment");	
			W3cDocumentHelper.setElementText(titleE.getOriginElement(), commonText);
			if(this.button_comment_visible.getSelection()){
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "true");
			}else{
				titleE.getXuiDataModel().setPropertyValue(titleE, "visible", "false");
			}
			titleE.getXuiDataModel().setPropertyValue(titleE, "position", commonP);
		}else{
			this.configE.removeChildren("comment");
		}
		
		//背景色
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-background-color",  text_comment_bgc.getText(), new HashMap<String,String>());
		if(b){
			XuiElement titleBackgroundColorE = getXuiElement("comment-background-color");		
			W3cDocumentHelper.setElementText(titleBackgroundColorE.getOriginElement(), text_comment_bgc.getText());
		}else{
			this.configE.removeChildren("comment-background-color");
		}
		
		//垂直校正
		String c_v =  combo_v.getItem(combo_v.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-vertical-alignment", c_v , new HashMap<String,String>());
		if(b){
			XuiElement titleValignmentE = getXuiElement("comment-vertical-alignment");
			W3cDocumentHelper.setElementText(titleValignmentE.getOriginElement(), c_v);
		}else{
			this.configE.removeChildren("comment-vertical-alignment");
		}
		
		//水平校正
		String c_h = combo_h.getItem(combo_h.getSelectionIndex());
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-horizontal-alignment", c_h , new HashMap<String,String>());
		if(b){
			XuiElement titleHalignmentE = getXuiElement("comment-horizontal-alignment");
			W3cDocumentHelper.setElementText(titleHalignmentE.getOriginElement(), c_h);
		}else{
			this.configE.removeChildren("comment-horizontal-alignment");
		}
		
		
		//子标题边框
		String borderTop=this.combo_border_top.getItem(this.combo_border_top.getSelectionIndex());
		String borderLeft=this.combo_border_left.getItem(this.combo_border_left.getSelectionIndex());
	    String borderRight=this.combo_border_right.getItem(this.combo_border_right.getSelectionIndex());
		String borderBottom=this.combo_border_bottom.getItem(this.combo_border_bottom.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("top", borderTop);
		attrMap.put("left", borderLeft);
		attrMap.put("right", borderRight);
		attrMap.put("bottom", borderBottom);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-border", "" , attrMap);
		if(b){
			XuiElement titleBorderE = getXuiElement("comment-border");
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "top", borderTop);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "left",borderLeft );
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "right", borderRight);
			titleBorderE.getXuiDataModel().setPropertyValue(titleBorderE, "bottom", borderBottom);
		}else{
			this.configE.removeChildren("comment-border");
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
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-margin", "" , attrMap);
		if(b){
			XuiElement titleMarginE = getXuiElement("comment-margin");
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "top", marginTop);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "left", marginLeft);
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "right",marginRight );
			titleMarginE.getXuiDataModel().setPropertyValue(titleMarginE, "bottom", marginBottom);
		}else{
			this.configE.removeChildren("comment-margin");
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
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-padding", "" , attrMap);
		if(b){
			XuiElement titlePaddingE = getXuiElement("comment-padding");
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "top", paddingTop);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "left", paddingLeft);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "right", paddingRight);
			titlePaddingE.getXuiDataModel().setPropertyValue(titlePaddingE, "bottom",paddingBottom);
		}else{
			this.configE.removeChildren("comment-padding");
		}
		
		//字体
		String fontName = this.combo_comment_font_name.getItem(this.combo_comment_font_name.getSelectionIndex());
		String fontStyle =  ""+this.combo_comment_font_style.getSelectionIndex();
		String fontSize = this.combo_comment_font_size.getItem(this.combo_comment_font_size.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		b = ChartConfigHelper.getChartConfigHelper().compare("common", "comment-font", "" , attrMap);
		if(b){
			XuiElement titleFontE = getXuiElement("comment-font");
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "name", fontName);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "style", fontStyle);
			titleFontE.getXuiDataModel().setPropertyValue(titleFontE, "size", fontSize);
		}else{
			this.configE.removeChildren("comment-font");
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
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 2;
		setLayout(gridLayout);

		final Label label = new Label(this, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setText("注释");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1));
		
		button_comment_visible = new Button(this, SWT.CHECK);
		final GridData gd_botton_title_visible = new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1);
		gd_botton_title_visible.heightHint = 23;
		gd_botton_title_visible.widthHint = 247;
		button_comment_visible.setLayoutData(gd_botton_title_visible);
		button_comment_visible.setText("图表是否显示注释信息");

		final Label label_24 = new Label(this, SWT.NONE);
		label_24.setText("注释：");

		text_comment = new Text(this, SWT.BORDER);
		final GridData gd_text_comment = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_comment.widthHint = 463;
		text_comment.setLayoutData(gd_text_comment);
	

		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("标准");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		gd_group_1.heightHint = 58;
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

		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setLayoutData(new GridData());
		label_3.setText("注释位置：");

		combo_comment_p = new Combo(group_1, SWT.NONE);
		combo_comment_p.select(3);
		combo_comment_p.setItems(new String[] {"TOP", "LEFT", "RIGHT", "BOTTOM"});
		final GridData gd_combo_comment_p = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_comment_p.widthHint = 48;
		combo_comment_p.setLayoutData(gd_combo_comment_p);

		final Label label_7 = new Label(group_1, SWT.NONE);
		label_7.setLayoutData(new GridData());
		label_7.setText("水平对齐：");

		combo_h = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_h = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_h.widthHint = 34;
		combo_h.setLayoutData(gd_combo_h);
		combo_h.select(1);
		combo_h.setItems(new String[] {"LEFT", "CENTER", "RIGHT"});

		final Label label_8 = new Label(group_1, SWT.NONE);
		label_8.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_8.setText("垂直对齐：");

		combo_v = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_v = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_v.widthHint = 36;
		combo_v.setLayoutData(gd_combo_v);
		combo_v.select(1);
		combo_v.setItems(new String[] {"TOP", "CENTER", "BOTTOM"});

		final Label label_2 = new Label(group_1, SWT.NONE);
		label_2.setLayoutData(new GridData());
		label_2.setText("背景色：");

		text_comment_bgc = new Text(group_1, SWT.BORDER);
		text_comment_bgc.setText("#FFFFFF");
		final GridData gd_text_comment_bgc = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_comment_bgc.widthHint = 27;
		text_comment_bgc.setLayoutData(gd_text_comment_bgc);
		text_comment_bgc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_comment_bgc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_comment_bgc = new Button(group_1, SWT.NONE);
		button_text_comment_bgc.setLayoutData(new GridData());
		button_text_comment_bgc.setText("..");

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setLayoutData(new GridData());
		label_4.setText("字体名称：");

		combo_comment_font_name = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_comment_font_name = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_comment_font_name.widthHint = 39;
		combo_comment_font_name.setLayoutData(gd_combo_comment_font_name);
		combo_comment_font_name.select(0);
		combo_comment_font_name.setItems(ChartConstant.getSYSFontList());

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("字体样式：");

		combo_comment_font_style = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_comment_font_style = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_comment_font_style.widthHint = 40;
		combo_comment_font_style.setLayoutData(gd_combo_comment_font_style);
		combo_comment_font_style.select(0);
		combo_comment_font_style.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体"});

		final Label label_6 = new Label(group_1, SWT.NONE);
		label_6.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		label_6.setText("字体大小：");

		combo_comment_font_size = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_comment_font_size = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_comment_font_size.widthHint = 37;
		combo_comment_font_size.setLayoutData(gd_combo_comment_font_size);
		combo_comment_font_size.select(6);
		combo_comment_font_size.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);
		new Label(group_1, SWT.NONE);

		final Group group_4 = new Group(this, SWT.NONE);
		group_4.setText("边距：");
		final GridData gd_group_4 = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		gd_group_4.heightHint = 86;
		gd_group_4.widthHint = 494;
		group_4.setLayoutData(gd_group_4);
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 1;
		gridLayout_4.marginTop = 1;
		gridLayout_4.marginRight = 1;
		gridLayout_4.marginLeft = 1;
		gridLayout_4.marginHeight = 1;
		gridLayout_4.marginBottom = 1;
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

		final Label label_16 = new Label(group_4, SWT.NONE);
		label_16.setText("上：");

		combo_margin_top = new Combo(group_4, SWT.NONE);
		combo_margin_top.select(1);
		combo_margin_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_top.setLayoutData(gd_combo_margin_top);

		final Label label_18 = new Label(group_4, SWT.NONE);
		label_18.setText("左：");

		combo_margin_left = new Combo(group_4, SWT.NONE);
		combo_margin_left.select(1);
		combo_margin_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_left.setLayoutData(gd_combo_margin_left);

		final Label label_20 = new Label(group_4, SWT.NONE);
		label_20.setText("右：");

		combo_margin_right = new Combo(group_4, SWT.NONE);
		combo_margin_right.select(1);
		combo_margin_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_right.setLayoutData(gd_combo_margin_right);

		final Label label_21 = new Label(group_4, SWT.NONE);
		label_21.setText("下：");

		combo_margin_bottom = new Combo(group_4, SWT.NONE);
		combo_margin_bottom.select(1);
		combo_margin_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_margin_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_margin_bottom.setLayoutData(gd_combo_margin_bottom);

		final Label label_15 = new Label(group_4, SWT.NONE);
		label_15.setText("间隙");

		final Label label_17 = new Label(group_4, SWT.NONE);
		label_17.setText("上：");

		combo_padding_top = new Combo(group_4, SWT.NONE);
		combo_padding_top.select(1);
		combo_padding_top.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_top = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_top.setLayoutData(gd_combo_padding_top);

		final Label label_19 = new Label(group_4, SWT.NONE);
		label_19.setText("左：");

		combo_padding_left = new Combo(group_4, SWT.NONE);
		combo_padding_left.select(1);
		combo_padding_left.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_left = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_left.setLayoutData(gd_combo_padding_left);

		final Label label_23 = new Label(group_4, SWT.NONE);
		label_23.setText("右：");

		combo_padding_right = new Combo(group_4, SWT.NONE);
		combo_padding_right.select(1);
		combo_padding_right.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_right = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_right.setLayoutData(gd_combo_padding_right);

		final Label label_22 = new Label(group_4, SWT.NONE);
		label_22.setText("下：");

		combo_padding_bottom = new Combo(group_4, SWT.NONE);
		combo_padding_bottom.select(1);
		combo_padding_bottom.setItems(new String[] {"0.0D", "0.1D", "0.2D", "0.3D", "0.4D", "0.5D", "0.6D", "0.7D", "0.8D", "0.9D", "1.0D"});
		final GridData gd_combo_padding_bottom = new GridData(SWT.FILL, SWT.CENTER, true, false);
		combo_padding_bottom.setLayoutData(gd_combo_padding_bottom);
		
	}

	
}
