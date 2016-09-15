package com.justep.desinger.chart.data.composite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.TableTreeViewer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.TableTree;
import org.eclipse.swt.events.ControlAdapter;
import org.eclipse.swt.events.ControlEvent;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.ColorDialog;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;
import org.eclipse.swt.widgets.Text;

import com.justep.desinger.chart.data.composite.datatree.DataEntry;
import com.justep.desinger.chart.data.composite.datatree.DataTableModel;
import com.justep.desinger.chart.data.composite.datatree.DataTreeContentProvider;
import com.justep.desinger.chart.data.composite.datatree.DataTreeLabelProvider;
import com.justep.desinger.chart.data.composite.datatree.Team;
import com.justep.desinger.chart.property.config.composite.IChartComposite;
import com.justep.desinger.chart.util.ColorUtil;
import com.justep.studio.ui.editors.xui.XuiElement;

@SuppressWarnings("deprecation")
public class SimpleMeterChartDataConfigComposite extends Composite implements IChartComposite{

	private TableTree tableTree;
	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	

	private Combo combo_dataset_ref;
	private Combo combo_dataset_value;
	private Text text_range_lower;
	private Text text_range_upper;

	private Text text_interval_lable;
	private Text text_interval_gbc;
	private Text text_interval_lower;
	private Text text_interval_upper;
	private Text text_interval_outline_c;
	private Combo combo_interval_outline_stroke;
	
	private Text text_hidden_data;
	
	private Button button_add;
	private Button button_delete;
	private Button button_apply;
	
	Shell shell;
	private Button button_text_interval_gbc;
	private Button button_text_interval_outline_c;
	
	private TableTreeViewer ttv;
	private DataTableModel dataTableModel = new DataTableModel();
	
	public SimpleMeterChartDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
		super(parent, style);		
		this.cSeriesE = cSeriesE;	
		this.dataIds = dataIds;
		this.dataMap = dataMap;
		this.shell = this.getShell();
		
		initLayout();
		registerEvent();
		initDefaultValue();	
		initSelfDefaultValue();
	}

	public void initDefaultValue() {
		combo_interval_outline_stroke.select(1);
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);
		
		text_range_lower.setText("0");
		text_range_upper.setText("100");

		text_interval_lable.setText("");
		text_interval_gbc.setText("#FFFFFF");
		text_interval_lower.setText("");
		text_interval_upper.setText("");
		text_interval_outline_c.setText("#FFFFFF");

	}

	public void initSelfDefaultValue() {
		String baseRef = cSeriesE.getProperyValue("ref");
		String ref = baseRef;
		
		XuiElement dataE = this.cSeriesE.getChildByTagName("data");
		if(dataE != null){
			String sRef = dataE.getProperyValue("ref");
			String value = dataE.getProperyValue("value");
			
			if(sRef != null && !sRef.equals("")){
				ref = sRef;
			}
			
			if(ref != null && !ref.equals("")){
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
				combo_dataset_value.setItems(dataMap.get(ref));
				if(value != null && !value.equals("")){
					combo_dataset_value.select(getIndex(value, this.dataMap.get(ref)) );
				}
			}
		}else{
			if(ref != null && !ref.equals("")){			
				combo_dataset_ref.select(getIndex(ref,this.dataIds));
			}
		}
		
		XuiElement configE = getChildXuiElement("config",this.cSeriesE);

		XuiElement simpleRangeE = configE.getChildByTagName("simple-range");
		if(simpleRangeE != null){
			String lower = simpleRangeE.getProperyValue("lower");
			String upper = simpleRangeE.getProperyValue("upper");			
			text_range_lower.setText(lower);
			text_range_upper.setText(upper);		
		}
		
		
		List<?> simpleIntervalList = configE.getChildListByTagName("simple-interval");
		for(int i=0; i< simpleIntervalList.size(); i++){
			XuiElement simpleIntervalE = (XuiElement)simpleIntervalList.get(i);

			String label = simpleIntervalE.getProperyValue("label");
			String lower = simpleIntervalE.getProperyValue("lower");
			String upper = simpleIntervalE.getProperyValue("upper");
			String bgc = simpleIntervalE.getProperyValue("background-color");
			String oc = simpleIntervalE.getProperyValue("outline-color");
			String os = simpleIntervalE.getProperyValue("outline-stroke");
			
			Team team = new Team();
			team.setId(UUID.randomUUID().toString().replaceAll("-", ""));	
			
			team.add(new DataEntry("simple-interval",label,lower,upper,bgc,oc,os));
			
			dataTableModel.getTeamList().add(team);			
		}
		
		ttv.refresh();
		ttv.expandAll();
		
		
	}
	
	private XuiElement getChildXuiElement(String tagName ,XuiElement cxuiE){
		XuiElement xuiE = cxuiE.getChildByTagName(tagName);
		if(xuiE == null){
			xuiE = cxuiE.getXuiDataModel().addElement(tagName, cxuiE, tagName);
		}
		return xuiE;
	}
	
	private int getIndex(String key , String [] infos){
		if(key == null || key.equals("")){
			return -1;
		}
		for(int i=0; i<infos.length; i++){
			if(infos[i].equalsIgnoreCase(key)){
				return i;
			}
		}
		return -1;
	}
	

	public void registerEvent() {

		button_text_interval_gbc.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_interval_gbc.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_interval_gbc.setBackground(color);
					text_interval_gbc.setForeground(color);
					text_interval_gbc.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		button_text_interval_outline_c.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(text_interval_outline_c.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					text_interval_outline_c.setBackground(color);
					text_interval_outline_c.setForeground(color);
					text_interval_outline_c.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
				}
			}
		});
		
		combo_dataset_ref.addSelectionListener(new SelectionListener() {   	           
            public void widgetDefaultSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());   
            }             
            public void widgetSelected(SelectionEvent e) {   
                setSelectedValue(((Combo)e.widget).getSelectionIndex());                
                String cdataId = dataIds[((Combo)e.widget).getSelectionIndex()];
                String [] fields = dataMap.get(cdataId);
                combo_dataset_value.setItems(fields);
            }            
            private void setSelectedValue(int value) {    
            }   
        });   

		ttv.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(SelectionChangedEvent event) {
				if (event.getSelection().isEmpty()) {
					System.out.println("Selected Nothing");
					return;
				}
				if (event.getSelection() instanceof IStructuredSelection) {
					IStructuredSelection selection = (IStructuredSelection) event.getSelection();
					StringBuffer selected = new StringBuffer();
					for (Iterator<?> iterator = selection.iterator(); iterator.hasNext();) {
						Object element = iterator.next();
						String cid = "";
						if (element instanceof Team) {
							cid = ((Team) element).getId();
						} else if (element instanceof DataEntry) {
							// cid = ((DataEntry) element).getCategoryAxis();
							cid = ((DataEntry) element).getTeam().getId();
						}
						selected.append("" + cid);
						selected.append(", ");
					}
					if (selected.length() > 0) {
						selected.setLength(selected.length() - 2);
					}
					
					rander(selected.toString());
					
				}
			}
		});
		
		
		//新增
		button_add.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){               
                text_hidden_data.setText("");
            	text_interval_lable.setText("");
            	text_interval_gbc.setText("#FFFFFF");
            	
            	text_interval_lower.setText("");
            	text_interval_upper.setText("");
            	text_interval_outline_c.setText("#FFFFFF");

            	text_interval_gbc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            	text_interval_gbc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            	text_interval_outline_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            	text_interval_outline_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
            	
            	combo_interval_outline_stroke.setItems(new String[] {"1.0f", "2.0f", "3.0f", "4.0f", "5.0f", "6.0f", "7.0f", "8.0f", "9.0f", "10.0f"});
            	combo_interval_outline_stroke.select(1);
		    }
		});
		
		button_delete.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){           	
            	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		dataTableModel.getTeamList().remove(team);
//            		ttv.setInput(dataTableModel);
                	 
                	
                	text_hidden_data.setText("");
                	text_interval_lable.setText("");
                	text_interval_gbc.setText("");
                	text_interval_lower.setText("");
                	text_interval_upper.setText("");
                	text_interval_outline_c.setText("");
                	
                	text_interval_gbc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                	text_interval_gbc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                	text_interval_outline_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                	text_interval_outline_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                	
                	combo_interval_outline_stroke.setItems(new String[] {"1.0f", "2.0f", "3.0f", "4.0f", "5.0f", "6.0f", "7.0f", "8.0f", "9.0f", "10.0f"});
                	combo_interval_outline_stroke.select(-1);
                	
                	ttv.refresh();
                	ttv.expandAll();   
            	}              
		    }
		});
		
		//应用
		button_apply.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){
            	String label = text_interval_lable.getText();
				String lower = text_interval_lower.getText();
				String upper = text_interval_upper.getText();
				String bgc = text_interval_gbc.getText();
				String oc = text_interval_outline_c.getText();
				String os = "";
             	if(combo_interval_outline_stroke.getSelectionIndex()!= -1){          
             		os = combo_interval_outline_stroke.getItem(combo_interval_outline_stroke.getSelectionIndex());
             		
             	}   
             	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		team.updateDataBySimpleMeter(label, lower, upper, bgc, oc, os);
            	}else{
            		String newIndex = UUID.randomUUID().toString().replaceAll("-", "");
            		Team team = new Team();
            		team.setId(newIndex);           		
            		team.add(new DataEntry("simple-interval",label, lower, upper, bgc,oc, os));      		
            		text_hidden_data.setText(newIndex);
            		dataTableModel.getTeamList().add(team);
            	}
            	
            	ttv.refresh();
        		ttv.expandAll();
        		
		    }
		});

	}
	
	public void rander(String teamId) {		
		Team team = dataTableModel.findTeam(teamId);
		this.text_hidden_data.setText(teamId);		
		if(team != null){
			ArrayList<DataEntry> entryList = (ArrayList<DataEntry>) team.getDataEntrys();
			for(int i=0; i<entryList.size(); i++){
				DataEntry entry = entryList.get(i);
				String type = entry.getType();
				if(type.equals("simple-interval")){
					String label = entry.getParam1();
					String lower = entry.getParam2();
					String upper = entry.getParam3();
					String bgc = entry.getParam4();
					String oc = entry.getParam5();
					String os = entry.getParam6();
										
					
					if(label != null && !label.equals("")){
						text_interval_lable.setText(label);
					}else{
						text_interval_lable.setText("");
					}
					
					if(lower != null && !lower.equals("")){
						text_interval_lower.setText(lower);
					}else{
						text_interval_lower.setText("");
					}
					
					if(upper != null && !upper.equals("")){
						text_interval_upper.setText(upper);
					}else{
						text_interval_upper.setText("");
					}
					
					if(bgc != null && !bgc.equals("")){
						text_interval_gbc.setText(bgc);
						text_interval_gbc.setBackground(ColorUtil.hexRGBToSWTColor(bgc,this.getDisplay()));
						text_interval_gbc.setForeground(ColorUtil.hexRGBToSWTColor(bgc,this.getDisplay()));
					}else{
						text_interval_gbc.setText("");
						text_interval_gbc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
						text_interval_gbc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
					}
					
					if(oc != null && !oc.equals("")){
						text_interval_outline_c.setText(oc);
						text_interval_outline_c.setBackground(ColorUtil.hexRGBToSWTColor(oc,this.getDisplay()));
						text_interval_outline_c.setForeground(ColorUtil.hexRGBToSWTColor(oc,this.getDisplay()));	
					}else{
						text_interval_outline_c.setText("");
						text_interval_outline_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
						text_interval_outline_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));	
					}
					
					if(os !=null && !os.equals("")){
						combo_interval_outline_stroke.select(getIndex(os,new String[] {"1.0f", "2.0f", "3.0f", "4.0f", "5.0f", "6.0f", "7.0f", "8.0f", "9.0f", "10.0f"}));
					}else{
						combo_interval_outline_stroke.select(1);
					}
				}
			}
		}
	}
	
	public void saveSelfConfig() {
			
		this.cSeriesE.removeChildren("data");

		XuiElement dataE = cSeriesE.getXuiDataModel().addElement("data", cSeriesE,null,null, "<data value=\"\" ref=\"\" ></data>",null); 		
		dataE.getXuiDataModel().setPropertyValue(dataE, "ref", getComboSelectedValue(this.combo_dataset_ref));
		dataE.getXuiDataModel().setPropertyValue(dataE, "value", getComboSelectedValue(this.combo_dataset_value));
		
		
		XuiElement configE = this.cSeriesE.getChildByTagName("config");
		configE.removeChildren("simple-range");
		XuiElement simpleRangeE = configE.getXuiDataModel().addElement("simple-range", configE,null,null, "<simple-range lower=\"\" upper=\"\" ></simple-range>",null); 		
		simpleRangeE.getXuiDataModel().setPropertyValue(simpleRangeE, "lower", this.text_range_lower.getText());
		simpleRangeE.getXuiDataModel().setPropertyValue(simpleRangeE, "upper", this.text_range_upper.getText());
		
		configE.removeChildren("simple-interval");
		
		
		ArrayList<Team> teamList = dataTableModel.getTeamList();
		for(int i=0; i<teamList.size(); i++){
			Team team = teamList.get(i);			
			XuiElement simpleIntervalE = configE.getXuiDataModel().addElement("simple-interval", configE,null,null, "<simple-interval label=\"\" lower=\"\" upper=\"\" outline-color=\"\" outline-stroke=\"\" background-color=\"\" ></simple-interval>",null); 
			ArrayList<DataEntry> dataEntryList = team.getDataEntrys();
			for(int j=0; j<dataEntryList.size(); j++){
				DataEntry entry = dataEntryList.get(j);
				String type = entry.getType();
				if(type.equalsIgnoreCase("simple-interval")){
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "label", entry.getParam1());
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "lower", entry.getParam2());
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "upper", entry.getParam3());
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "background-color", entry.getParam4());
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "outline-color", entry.getParam5());
					simpleIntervalE.getXuiDataModel().setPropertyValue(simpleIntervalE, "outline-stroke", entry.getParam6());
				}
			}
		}
		
	}
	
	private String getComboSelectedValue(Combo combo){
		int n = combo.getSelectionIndex();
		if(n == -1){
			return "";
		}
		return combo.getItem(n);
	}
	
	public void initLayout() {
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.marginWidth = 0;
		gridLayout_2.horizontalSpacing = 0;
		gridLayout_2.marginHeight = 0;
		setLayout(gridLayout_2);
	    
		final Group group_1 = new Group(this, SWT.NONE);
		group_1.setText("数据");
		final GridData gd_group_1 = new GridData(SWT.FILL, SWT.FILL, true, false);
		group_1.setLayoutData(gd_group_1);
		final GridLayout gridLayout_1 = new GridLayout();
		gridLayout_1.numColumns = 4;
		group_1.setLayout(gridLayout_1);

		final Label label_3 = new Label(group_1, SWT.NONE);
		label_3.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_3.setText("数据源：");

		combo_dataset_ref = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_dataset_ref = new GridData(SWT.FILL, SWT.CENTER, true, true);
		combo_dataset_ref.setLayoutData(gd_combo_dataset_ref);

		final Label label_9 = new Label(group_1, SWT.NONE);
		label_9.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_9.setText("数据值：");

		combo_dataset_value = new Combo(group_1, SWT.NONE);
		final GridData gd_combo_dataset_value = new GridData(SWT.FILL, SWT.CENTER, true, true);
		combo_dataset_value.setLayoutData(gd_combo_dataset_value);

		final Label label_4 = new Label(group_1, SWT.NONE);
		label_4.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_4.setText("起始位：");

		text_range_lower = new Text(group_1, SWT.BORDER);
		final GridData gd_text_range_lower = new GridData(SWT.FILL, SWT.CENTER, true, true);
		text_range_lower.setLayoutData(gd_text_range_lower);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_5.setText("终止值：");

		text_range_upper = new Text(group_1, SWT.BORDER);
		final GridData gd_text_range_upper = new GridData(SWT.FILL, SWT.CENTER, true, true);
		text_range_upper.setLayoutData(gd_text_range_upper);

		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setLayoutData(new GridData(SWT.FILL, SWT.FILL, false, true));
		final GridLayout gridLayout_4 = new GridLayout();
		gridLayout_4.marginWidth = 0;
		gridLayout_4.marginHeight = 0;
		gridLayout_4.horizontalSpacing = 0;
		group_2.setLayout(gridLayout_4);
		//group_2.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));

		ttv = new TableTreeViewer(group_2, SWT.FULL_SELECTION);
		tableTree = ttv.getTableTree();
		tableTree.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));

		// Set the content and label providers
		ttv.setContentProvider(new DataTreeContentProvider());
		ttv.setLabelProvider(new DataTreeLabelProvider());
		ttv.setInput(dataTableModel);

		// Set up the table
		final Table table = ttv.getTableTree().getTable();
		final TableColumn column1 = new TableColumn(table, SWT.LEFT);
		final TableColumn column2 = new TableColumn(table, SWT.LEFT);
		final TableColumn column3 = new TableColumn(table, SWT.RIGHT);
		final TableColumn column4 = new TableColumn(table, SWT.RIGHT);
		final TableColumn column5 = new TableColumn(table, SWT.RIGHT);
		final TableColumn column6 = new TableColumn(table, SWT.RIGHT);
		
		ttv.expandAll();
		
		for (int i = 0, n = table.getColumnCount(); i < n; i++) {
			table.getColumn(i).pack();
		}

		table.setHeaderVisible(true);
		table.setLinesVisible(true);
		
		group_2.addControlListener(new ControlAdapter() {
		    public void controlResized(ControlEvent e) {
		      Rectangle area = group_2.getClientArea();
		      Point preferredSize = table.computeSize(SWT.DEFAULT, SWT.DEFAULT);
		      int width = area.width - 2*table.getBorderWidth();
		      if (preferredSize.y > area.height + table.getHeaderHeight()) {
		        Point vBarSize = table.getVerticalBar().getSize();
		        width -= vBarSize.x;
		      }
		      Point oldSize = table.getSize();
		      if (oldSize.x > area.width) {
		        column1.setWidth(width/5);
		        column2.setWidth(width/5);
		        column3.setWidth(width/5);
		        column4.setWidth(width/5);
		        column5.setWidth(width/5);
		        column6.setWidth(width - (column1.getWidth()+column2.getWidth()+column3.getWidth()+column4.getWidth()+column5.getWidth()));
		        table.setSize(area.width, area.height);
		      } else {
		        table.setSize(area.width, area.height);
		        column1.setWidth(width/5);
		        column2.setWidth(width/5);
		        column3.setWidth(width/5);
		        column4.setWidth(width/5);
		        column5.setWidth(width/5);
		        column6.setWidth(width - (column1.getWidth()+column2.getWidth()+column3.getWidth()+column4.getWidth()+column5.getWidth()));
		      }
		    }
		  });
		

		final Composite composite = new Composite(this, SWT.NONE);
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.numColumns = 5;
		composite.setLayout(gridLayout_3);
		final GridData gd_composite = new GridData(SWT.FILL, SWT.FILL, true, false);
		composite.setLayoutData(gd_composite);
		//new Label(group, SWT.NONE);
		
		text_hidden_data = new Text(composite, SWT.BORDER);
		text_hidden_data.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		text_hidden_data.setVisible(false);

		final Label label_10 = new Label(composite, SWT.NONE);
		label_10.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, true, true));
		label_10.setText("  ");

		button_add = new Button(composite, SWT.NONE);
		button_add.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_add.setText("新增");

		button_delete = new Button(composite, SWT.NONE);
		button_delete.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_delete.setText("删除");

		button_apply = new Button(composite, SWT.NONE);
		button_apply.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_apply.setText("应用");
		

		final Group group = new Group(this, SWT.NONE);
		group.setText("刻度区域");
		final GridData gd_group = new GridData(SWT.FILL, SWT.FILL, true,false);
		group.setLayoutData(gd_group);
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 5;
		group.setLayout(gridLayout);

		final Label label = new Label(group, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label.setText("区域描述信息：");

		text_interval_lable = new Text(group, SWT.BORDER);
		final GridData gd_text_interval_lable = new GridData(SWT.FILL, SWT.CENTER, true, true);
		text_interval_lable.setLayoutData(gd_text_interval_lable);

		final Label label_7 = new Label(group, SWT.NONE);
		label_7.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_7.setText("背景色：");

		text_interval_gbc = new Text(group, SWT.BORDER);
		final GridData gd_text_interval_gbc = new GridData(SWT.FILL, SWT.CENTER, true,
				true);
		text_interval_gbc.setLayoutData(gd_text_interval_gbc);
		text_interval_gbc.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_interval_gbc.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_interval_gbc = new Button(group, SWT.NONE);
		button_text_interval_gbc.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_text_interval_gbc.setText("..");

		final Label label_6 = new Label(group, SWT.NONE);
		label_6.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_6.setText("起始位：");

		text_interval_lower = new Text(group, SWT.BORDER);
		final GridData gd_text_interval_lower = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		text_interval_lower.setLayoutData(gd_text_interval_lower);
		
		final Label label_1 = new Label(group, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_1.setText("终止位：");

		text_interval_upper = new Text(group, SWT.BORDER);
		final GridData gd_text_interval_upper = new GridData(SWT.FILL, SWT.CENTER, true, true, 2, 1);
		text_interval_upper.setLayoutData(gd_text_interval_upper);

		final Label label_8 = new Label(group, SWT.NONE);
		label_8.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_8.setText("轮廓线描边特效：");

		combo_interval_outline_stroke = new Combo(group, SWT.NONE);
		combo_interval_outline_stroke.select(1);
		combo_interval_outline_stroke.setItems(new String[] {"1.0f", "2.0f", "3.0f", "4.0f", "5.0f", "6.0f", "7.0f", "8.0f", "9.0f", "10.0f"});
		final GridData gd_text_interval_outline_stroke = new GridData(SWT.FILL, SWT.CENTER, true, true);
		combo_interval_outline_stroke.setLayoutData(gd_text_interval_outline_stroke);

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_2.setText("轮廓线颜色：");

		text_interval_outline_c = new Text(group, SWT.BORDER);
		final GridData gd_text_interval_outline_c = new GridData(SWT.FILL, SWT.CENTER, true, true);
		text_interval_outline_c.setLayoutData(gd_text_interval_outline_c);		
		text_interval_outline_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		text_interval_outline_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",this.getDisplay()));
		
		button_text_interval_outline_c = new Button(group, SWT.NONE);
		button_text_interval_outline_c.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_text_interval_outline_c.setText("..");
	}

}
