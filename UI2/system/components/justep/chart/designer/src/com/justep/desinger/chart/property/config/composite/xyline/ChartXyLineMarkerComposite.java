package com.justep.desinger.chart.property.config.composite.xyline;

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

public class ChartXyLineMarkerComposite extends Composite implements IChartComposite{

	Shell shell;
	private Button button_marker_visiable;
	private Button button_text_marker_color;
	
	private Text text_marker_label;
	private Text text_marker_color;
	private Text text_marker_value;

	private Combo combo_marker_label_fontName;
	private Combo combo_marker_label_fontStyle;
	private Combo combo_marker_label_fontSize;
	
	private XuiElement owerElement;
	private String currentChartType;
	
	public ChartXyLineMarkerComposite(Composite parent, int style,XuiElement owerElement ,String currentChartType) {
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
		button_marker_visiable.setSelection(false);
		combo_marker_label_fontName.select(ChartConstant.getSYSFontList().length-1);
		combo_marker_label_fontSize.select(5);
		combo_marker_label_fontStyle.select(0);
	}

	public void initLayout() {
		setLayout(new GridLayout());
		final CLabel label = new CLabel(this, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setLayoutData(new GridData(521, 21));
		label.setText("警戒线");

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false));

		button_marker_visiable = new Button(this, SWT.CHECK);
		button_marker_visiable.setText("图表是否显示警戒线");
		
		final Group group = new Group(this, SWT.NONE);
		group.setText("公共");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group.heightHint = 51;
		gd_group.widthHint = 510;
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginWidth = 1;
		gridLayout.marginTop = 1;
		gridLayout.marginRight = 1;
		gridLayout.marginLeft = 1;
		gridLayout.marginHeight = 1;
		gridLayout.marginBottom = 1;
		gridLayout.numColumns = 5;
		group.setLayout(gridLayout);

		final Label label_5 = new Label(group, SWT.NONE);
		label_5.setLayoutData(new GridData());
		label_5.setText("描述信息：");

		text_marker_label = new Text(group, SWT.BORDER);
		text_marker_label.setText("marker");
		final GridData gd_text_marker_label = new GridData(SWT.FILL, SWT.FILL, true, false, 4, 1);
		text_marker_label.setLayoutData(gd_text_marker_label);

		final Label label_7 = new Label(group, SWT.NONE);
		label_7.setLayoutData(new GridData());
		label_7.setText("警戒值：");

		text_marker_value = new Text(group, SWT.BORDER);
		text_marker_value.setText("100");
		final GridData gd_text_marker_value = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_marker_value.widthHint = 266;
		text_marker_value.setLayoutData(gd_text_marker_value);

		final Label label_8 = new Label(group, SWT.NONE);
		label_8.setLayoutData(new GridData());
		label_8.setText("警戒值字体颜色：");

		text_marker_color = new Text(group, SWT.BORDER);
		text_marker_color.setText("#EE0000");
		final GridData gd_text_marker_color = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_text_marker_color.widthHint = 38;
		text_marker_color.setLayoutData(gd_text_marker_color);
		text_marker_color.setBackground(ColorUtil.hexRGBToSWTColor("#EE0000",this.getDisplay()));
		text_marker_color.setForeground(ColorUtil.hexRGBToSWTColor("#EE0000",this.getDisplay()));
		
		button_text_marker_color = new Button(group, SWT.NONE);
		button_text_marker_color.setText("..");

		final Group group_3 = new Group(this, SWT.NONE);
		group_3.setText("描述信息");
		final GridData gd_group_3 = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_group_3.heightHint = 31;
		gd_group_3.widthHint = 510;
		group_3.setLayoutData(gd_group_3);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 1;
		gridLayout_3.marginTop = 1;
		gridLayout_3.marginRight = 1;
		gridLayout_3.marginLeft = 1;
		gridLayout_3.marginHeight = 1;
		gridLayout_3.marginBottom = 1;
		gridLayout_3.numColumns = 6;
		group_3.setLayout(gridLayout_3);

		final Label label_2 = new Label(group_3, SWT.NONE);
		label_2.setText("字体字体：");

		combo_marker_label_fontName = new Combo(group_3, SWT.NONE);
		final GridData gd_combo_marker_label_fontName = new GridData(SWT.FILL, SWT.CENTER, true, false);
		gd_combo_marker_label_fontName.widthHint = 62;
		combo_marker_label_fontName.setLayoutData(gd_combo_marker_label_fontName);
		combo_marker_label_fontName.setItems(ChartConstant.getSYSFontList());

		final Label label_3 = new Label(group_3, SWT.NONE);
		label_3.setText("字体样式：");

		combo_marker_label_fontStyle = new Combo(group_3, SWT.NONE);
		combo_marker_label_fontStyle.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_marker_label_fontStyle.setItems(new String[] {"正常", "粗体", "斜体", "粗斜体 "});
		
		final Label label_9 = new Label(group_3, SWT.NONE);
		label_9.setText("字体大小：");
		combo_marker_label_fontSize = new Combo(group_3, SWT.NONE);
		combo_marker_label_fontSize.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		combo_marker_label_fontSize.setItems(new String[] {"6", "8", "9", "10", "11", "12", "14", "16", "18", "20", "22", "24", "26", "28", "36", "48", "72"});
	}

	public void initSelfDefaultValue() {
		if (this.owerElement == null) return; //原则上不允许也不会出现NULL
		XuiElement configElement = this.owerElement.getChildByTagName("config");
		if(configElement==null) return;
		XuiElement markerE = configElement.getChildByTagName("marker");
		if(markerE!=null){
			
			boolean b = Boolean.parseBoolean(markerE.getProperyValue("visible"));
			button_marker_visiable.setSelection(b);
			
			text_marker_color.setText(markerE.getProperyValue("color"));
			text_marker_color.setBackground(ColorUtil.hexRGBToSWTColor(markerE.getProperyValue("color"),this.getDisplay()));
			text_marker_color.setForeground(ColorUtil.hexRGBToSWTColor(markerE.getProperyValue("color"),this.getDisplay()));
			text_marker_label.setText(markerE.getProperyValue("label"));
			text_marker_value.setText(markerE.getProperyValue("value"));
			
			button_text_marker_color.setEnabled(b);
			text_marker_label.setEnabled(b);
			text_marker_color.setEnabled(b);
			text_marker_value.setEnabled(b);
			combo_marker_label_fontName.setEnabled(b);
			combo_marker_label_fontStyle.setEnabled(b);
			combo_marker_label_fontSize.setEnabled(b);
			
			
		}else{
			button_text_marker_color.setEnabled(false);
			text_marker_label.setEnabled(false);
			text_marker_color.setEnabled(false);
			text_marker_value.setEnabled(false);
			combo_marker_label_fontName.setEnabled(false);
			combo_marker_label_fontStyle.setEnabled(false);
			combo_marker_label_fontSize.setEnabled(false);
		}
		
		XuiElement markerLabelFontE = configElement.getChildByTagName("marker-label-font");
		if(markerLabelFontE!=null){
			setDefaultComboValue(combo_marker_label_fontName,markerLabelFontE.getProperyValue("name"));
			combo_marker_label_fontStyle.select(Integer.parseInt(markerLabelFontE.getProperyValue("style")));
			setDefaultComboValue(combo_marker_label_fontSize,markerLabelFontE.getProperyValue("size"));
		}
	}

	public void registerEvent() {
		button_marker_visiable.addSelectionListener(new SelectionAdapter() {    
            public void widgetSelected(SelectionEvent e) {   
            	
            	text_marker_label.setEnabled(button_marker_visiable.getSelection());  
            	text_marker_color.setEnabled(button_marker_visiable.getSelection());  
            	text_marker_value.setEnabled(button_marker_visiable.getSelection());  
            	
            	combo_marker_label_fontStyle.setEnabled(button_marker_visiable.getSelection());  
            	combo_marker_label_fontSize.setEnabled(button_marker_visiable.getSelection());  
            	combo_marker_label_fontName.setEnabled(button_marker_visiable.getSelection());  
            	
            	button_text_marker_color.setEnabled(button_marker_visiable.getSelection());  
            	    	
            }    
        });   
		
		button_text_marker_color.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_marker_color.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_marker_color.setBackground(color);
					text_marker_color.setForeground(color);
					text_marker_color.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
	}

	public void saveSelfConfig() {
		
		XuiElement configElement = getXuiElement(this.owerElement,"config");
		String color = text_marker_color.getText();
		String label = text_marker_label.getText();
		String value = text_marker_value.getText();
		HashMap<String,String> attrMap = new HashMap<String,String>();
		attrMap.put("visible", ""+button_marker_visiable.getSelection());
		attrMap.put("color", color);
		attrMap.put("label", label);
		attrMap.put("value", value);
		this.saveSelf(configElement, "marker", "", attrMap);
		
		String fontName = combo_marker_label_fontName.getItem(combo_marker_label_fontName.getSelectionIndex());
		String fontStyle = combo_marker_label_fontStyle.getSelectionIndex()+"";
		String fontSize = combo_marker_label_fontSize.getItem(combo_marker_label_fontSize.getSelectionIndex());
		attrMap = new HashMap<String,String>();
		attrMap.put("name", fontName);
		attrMap.put("style", fontStyle);
		attrMap.put("size", fontSize);
		this.saveSelf(configElement, "marker-label-font", "", attrMap);
		
		
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
