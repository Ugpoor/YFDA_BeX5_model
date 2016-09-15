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
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ChartConfigHelper;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.swtdesigner.SWTResourceManager;

public class ChartGeneralOtherComposite extends Composite implements IChartComposite{
	Shell shell;
	
	private Text text_chart_bgc;
	private Button button_text_chart_bgc; //颜色选择
	
	private XuiElement configE;
	
	public ChartGeneralOtherComposite(Composite parent, int style,XuiElement configE) {
		super(parent, style);		
		this.configE = configE;
		shell = this.getShell();
		initLayout();
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
	}

	public void registerEvent(){	
		button_text_chart_bgc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_chart_bgc.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_chart_bgc.setBackground(color);
					text_chart_bgc.setForeground(color);
					text_chart_bgc.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
	}
	
	public void initDefaultValue(){		
		text_chart_bgc.setText("#FFFFFF");
	}
	
	public void initSelfDefaultValue(){
		if(this.configE == null){
			return;
		}
		
		XuiElement chartbgcE = this.configE.getChildByTagName("chart-background-color");
		if(chartbgcE != null){
			String bgc = W3cDocumentHelper.getText(chartbgcE.getOriginElement());
			this.text_chart_bgc.setText(bgc);
			this.text_chart_bgc.setForeground(ColorUtil.hexRGBToSWTColor(bgc,this.getDisplay()));
			this.text_chart_bgc.setBackground(ColorUtil.hexRGBToSWTColor(bgc,this.getDisplay()));
		}

	}
	

	public void saveSelfConfig() {
		
		//背景色
		boolean b = ChartConfigHelper.getChartConfigHelper().compare("common", "chart-background-color",  this.text_chart_bgc.getText(), new HashMap<String,String>());
		if(b){
			XuiElement chartbgcE = getXuiElement("chart-background-color");	
			W3cDocumentHelper.setElementText(chartbgcE.getOriginElement(), this.text_chart_bgc.getText());
		}else{
			this.configE.removeChildren("chart-background-color");
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
		gridLayout.numColumns = 3;
		setLayout(gridLayout);

		final Label label = new Label(this, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		label.setFont(SWTResourceManager.getFont("", 12, SWT.BOLD));
		label.setText("其他");
		new Label(this, SWT.NONE);

		final Label label_1 = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label_1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, false, 3, 1));

		final Label label_2 = new Label(this, SWT.NONE);
		label_2.setText("背景色：");

		text_chart_bgc = new Text(this, SWT.BORDER);
		final GridData gd_text_chart_bgc = new GridData(SWT.FILL, SWT.FILL, true, false);
		gd_text_chart_bgc.widthHint = 424;
		text_chart_bgc.setLayoutData(gd_text_chart_bgc);
		text_chart_bgc.setText("#FFFFFF");
		text_chart_bgc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_chart_bgc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_chart_bgc = new Button(this, SWT.NONE);
		button_text_chart_bgc.setText("..");
	}

	

}
