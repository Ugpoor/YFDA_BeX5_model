package com.justep.desinger.chart.type.select;

import org.eclipse.jface.dialogs.Dialog;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Shell;

import com.justep.desinger.chart.common.ChartConstant;


public class ChartTypeSelectDialog extends Dialog{
	
	private int width = 720;
	private int height = 520;
	private String returnValue;
	private Composite chartTypeSelectCompsite;
	private String baseChartType;
	
	public ChartTypeSelectDialog(Shell parentShell ,String baseChartType) {
		super(parentShell);
		this.baseChartType = baseChartType;
	}
	
	protected int getShellStyle(){
		  //如果让此方法返回 SWT.NONE,则不显示标题栏。
		  //return SWT.NONE;
		  //return SWT.Resize ;  //此方法不仅没有标题栏，而且看不到边框。
		return super.getShellStyle() | SWT.RESIZE | SWT.MAX |SWT.MIN;
	}
		
	public void setSize(int width,int height){
		this.width = width;
		this.height = height;
	}

	protected Control createDialogArea(Composite parent) {
		Composite container = (Composite) super.createDialogArea(parent);
		container.setLayout(new FillLayout());
		chartTypeSelectCompsite = new ChartTypeSelectPage(container,SWT.NONE ,baseChartType);
		this.getShell().setText("图表类型选择");
		return container;
	}
	
	protected void createButtonsForButtonBar(Composite parent) {
		createButton(parent, IDialogConstants.OK_ID, IDialogConstants.OK_LABEL,true);
		createButton(parent, IDialogConstants.CANCEL_ID,IDialogConstants.CANCEL_LABEL, false);
	}
	
	protected void buttonPressed(int buttonId) {
		if (IDialogConstants.OK_ID == buttonId) {	
			this.returnValue = ((ChartTypeSelectPage)chartTypeSelectCompsite).getCurrentSelectedChartType();
			okPressed();
		}else if (IDialogConstants.CANCEL_ID == buttonId) {
			cancelPressed();
		}
	}
	
	protected Point getInitialSize() {
		return new Point(this.width, this.height);
	}

	public String getReturnValue(){
		return this.returnValue;
	}

	
}
