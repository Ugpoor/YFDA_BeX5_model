package com.justep.desinger.chart.type.select;

import java.util.ArrayList;
import java.util.Iterator;

import org.eclipse.jface.viewers.ColumnWeightData;
import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.TableLayout;
import org.eclipse.jface.viewers.TableViewer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;

import swing2swt.layout.BorderLayout;

import com.justep.desinger.chart.common.ChartConstant;
import com.justep.desinger.chart.type.select.ChartMajorType;
import com.justep.desinger.chart.type.select.ChartSelectTableViewerContentProvider;
import com.justep.desinger.chart.type.select.ChartSelectTableViewerLabelProvider;
import com.justep.desinger.chart.type.select.composite.ChartTypeButtonImage;

public class ChartTypeSelectPage extends Composite{

	private Composite rightComp;
	private ChartTypeButtonImage chartNameComposite;
	
	private String baseChartType;
	private ArrayList<ChartMajorType> nodeList;
	
	public ChartTypeSelectPage(Composite parent,int style ,String baseChartType) {
		super(parent,style);
		this.baseChartType = baseChartType;
		start(this);
		registerComposite();
	}
	
	private void registerComposite(){
		chartNameComposite = new ChartTypeButtonImage(rightComp, SWT.NONE, ChartConstant.PIE_CHART);		
	}

	public void start(Composite parent){

		BorderLayout borderLayout = new BorderLayout(0,0);
		parent.setLayout(borderLayout);
		
		Composite com = new Composite(parent, SWT.NONE);
		com.setLayout(new FillLayout());
		com.setLayoutData(BorderLayout.WEST);

		final Composite composite = new Composite(parent, SWT.NONE);
		composite.setLayout(new FillLayout(SWT.VERTICAL));
		composite.setLayoutData(BorderLayout.CENTER);
		
		
		TableViewer tv=new TableViewer(com, SWT.BORDER);   
		Table table = tv.getTable();   
        table.setHeaderVisible(false); // 显示表头   
        table.setLinesVisible(false); // 显示表格线   
        TableLayout layout = new TableLayout(); // 专用于表格的布局   
        table.setLayout(layout);
        
        layout.addColumnData(new ColumnWeightData(200));    
        new TableColumn(table, SWT.NONE).setText("");   
		
        tv.setContentProvider(new ChartSelectTableViewerContentProvider());   
        tv.setLabelProvider(new ChartSelectTableViewerLabelProvider());  
        nodeList = (ArrayList<ChartMajorType>) ChartConstant.createChartMajorTypeList(baseChartType);
        tv.setInput(nodeList);  
        
        table.setSelection(0);
        
        tv.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(final SelectionChangedEvent event) {
				if (event.getSelection().isEmpty()) {
					System.out.println("Selected Nothing");
					return;
				}
				if (event.getSelection() instanceof IStructuredSelection) {
					IStructuredSelection selection = (IStructuredSelection) event.getSelection();
					StringBuffer selected = new StringBuffer();
					for (Iterator<?> iterator = selection.iterator(); iterator.hasNext();) {
						Object element = (ChartMajorType) iterator.next();
						String cid = ((ChartMajorType) element).getId();
						selected.append(""+cid);
						selected.append(", ");
					}
					if (selected.length() > 0) {
						selected.setLength(selected.length() - 2);
					}
					String cIndex = selected.toString();	
					chartNameComposite.createImage(cIndex);
				}
			}
		});
		
		rightComp = new Composite(composite, SWT.NONE);
		rightComp.setLayout(new FillLayout());
	}

	public Composite getRightComp() {
		return rightComp;
	}

	public void setRightComp(Composite rightComp) {
		this.rightComp = rightComp;
	}
	
	public String getCurrentSelectedChartType(){
		String returnV="";
		String chartType = chartNameComposite.getChartType();
		returnV = chartType+"~"+chartType.replaceAll("-", "")+"chart";

		return returnV;
	}
	
}
