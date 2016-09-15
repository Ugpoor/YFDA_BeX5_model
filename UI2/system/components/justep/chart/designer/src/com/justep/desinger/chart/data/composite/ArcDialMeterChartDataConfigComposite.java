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
public class ArcDialMeterChartDataConfigComposite extends Composite implements IChartComposite{

	private TableTree tableTree;
	private XuiElement cSeriesE ;
	private HashMap<String ,String []> dataMap = new HashMap<String ,String []>();
	private String [] dataIds;
	
	private Combo combo_dataset_value;
	private Combo combo_dataset_ref;
	private Text dial_scale_upper;
	private Text dial_scale_lower;

	private Text dial_rangle_lower;
	private Text dial_rangle_upper;
	private Text dial_rangle_c;
	
	private Text text_hidden_data;
	
	private Button button_add;
	private Button button_delete;
	private Button button_apply;
	
	Shell shell;
	private Button button_dial_rangle_c;
	
	private TableTreeViewer ttv;
	private DataTableModel dataTableModel = new DataTableModel();
	
	public ArcDialMeterChartDataConfigComposite(Composite parent, int style ,XuiElement cSeriesE ,String [] dataIds,HashMap<String ,String []> dataMap) {
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
		if(dataIds != null) combo_dataset_ref.setItems(dataIds);		
		
		dial_scale_lower.setText("");
		dial_scale_upper.setText("");

		dial_rangle_lower.setText("");
		dial_rangle_upper.setText("");
		dial_rangle_c.setText("#FFFFFF");
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

		XuiElement dialScaleE = configE.getChildByTagName("arc-dial-scale");
		if(dialScaleE != null){
			String lower = dialScaleE.getProperyValue("lower-bound");
			String upper = dialScaleE.getProperyValue("upper-bound");			
			dial_scale_lower.setText(lower);
			dial_scale_upper.setText(upper);		
		}
		
		
		List<?> dialRangeList = configE.getChildListByTagName("arc-dial-rangle");
		for(int i=0; i< dialRangeList.size(); i++){
			XuiElement dialRangeE = (XuiElement)dialRangeList.get(i);

			String lower = dialRangeE.getProperyValue("lower");
			String upper = dialRangeE.getProperyValue("upper");
			String c = dialRangeE.getProperyValue("color");
			
			
			Team team = new Team();
			team.setId(UUID.randomUUID().toString().replaceAll("-", ""));	
			
			team.add(new DataEntry("arc-dial-rangle",lower,upper,c,"","",""));
			
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
		
		button_dial_rangle_c.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				ColorDialog dlg = new ColorDialog(shell);
				dlg.setRGB(dial_rangle_c.getBackground().getRGB());
				dlg.setText("颜色选择框");
				RGB rgb = dlg.open();
				if (rgb != null) {
					Color color = new Color(shell.getDisplay(), rgb);
					dial_rangle_c.setBackground(color);
					dial_rangle_c.setForeground(color);
					dial_rangle_c.setText(ColorUtil.SWTColorToHexRGB(color).toUpperCase());
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
                dial_rangle_lower.setText("");
        		dial_rangle_upper.setText("");
        		dial_rangle_c.setText("#FFFFFF");
				dial_rangle_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
				dial_rangle_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
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
                	dial_rangle_lower.setText("");
            		dial_rangle_upper.setText("");
            		dial_rangle_c.setText("#FFFFFF");
    				dial_rangle_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
    				dial_rangle_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
                	
                	ttv.refresh();
                	ttv.expandAll();   
            	}              
		    }
		});
		
		//应用
		button_apply.addSelectionListener(new SelectionAdapter(){
            public void widgetSelected(SelectionEvent e){
            	String lower = dial_rangle_lower.getText();
        		String upper = dial_rangle_upper.getText();
        		String c = dial_rangle_c.getText();
        		 
             	String hiddenData = text_hidden_data.getText();
            	if(hiddenData != null && !hiddenData.equals("")){
            		Team team = dataTableModel.findTeam(hiddenData);
            		team.updateDataByDialMeter(lower, upper, c);
            	}else{
            		String newIndex = UUID.randomUUID().toString().replaceAll("-", "");
            		Team team = new Team();
            		team.setId(newIndex);           		
            		team.add(new DataEntry("arc-dial-rangle",lower, upper, c,"","",""));      		
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
				if(type.equals("arc-dial-rangle")){
					String lower = entry.getParam1();
					String upper = entry.getParam2();
					String c = entry.getParam3();

					if(lower != null && !lower.equals("")){
						dial_rangle_lower.setText(lower);
					}else{
						dial_rangle_lower.setText("");
					}
					
					if(upper != null && !upper.equals("")){
						dial_rangle_upper.setText(upper);
					}else{
						dial_rangle_upper.setText("");
					}
					
					if(c != null && !c.equals("")){
						dial_rangle_c.setText(c);
						dial_rangle_c.setBackground(ColorUtil.hexRGBToSWTColor(c,shell.getDisplay()));
						dial_rangle_c.setForeground(ColorUtil.hexRGBToSWTColor(c,shell.getDisplay()));
					}else{
						dial_rangle_c.setText("#FFFFFF");
						dial_rangle_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
						dial_rangle_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
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
		configE.removeChildren("arc-dial-scale");
		XuiElement dialScaleE = configE.getXuiDataModel().addElement("arc-dial-scale", configE,null,null, "<arc-dial-scale visible=\"true\"  lower-bound=\"0\" upper-bound=\"100\" start-angle=\"115.0\" extent=\"-50\" major-tick-increment=\"10.0\" minor-tick-count=\"4\"/>",null); 		
		dialScaleE.getXuiDataModel().setPropertyValue(dialScaleE, "lower-bound", this.dial_scale_lower.getText());
		dialScaleE.getXuiDataModel().setPropertyValue(dialScaleE, "upper-bound", this.dial_scale_upper.getText());
		
		
		configE.removeChildren("arc-dial-rangle");

		ArrayList<Team> teamList = dataTableModel.getTeamList();
		for(int i=0; i<teamList.size(); i++){
			Team team = teamList.get(i);			
			XuiElement dialRangeE = configE.getXuiDataModel().addElement("arc-dial-rangle", configE,null,null, "<arc-dial-rangle lower=\"\" upper=\"\" color=\"\" />",null); 
			ArrayList<DataEntry> dataEntryList = team.getDataEntrys();
			for(int j=0; j<dataEntryList.size(); j++){
				DataEntry entry = dataEntryList.get(j);
				String type = entry.getType();
				if(type.equalsIgnoreCase("arc-dial-rangle")){
					dialRangeE.getXuiDataModel().setPropertyValue(dialRangeE, "lower", entry.getParam1());
					dialRangeE.getXuiDataModel().setPropertyValue(dialRangeE, "upper", entry.getParam2());
					dialRangeE.getXuiDataModel().setPropertyValue(dialRangeE, "color", entry.getParam3());
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
		setLayout(new GridLayout());
	    
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

		dial_scale_lower = new Text(group_1, SWT.BORDER);
		final GridData gd_dial_scale_lower = new GridData(SWT.FILL, SWT.CENTER, true, true);
		dial_scale_lower.setLayoutData(gd_dial_scale_lower);

		final Label label_5 = new Label(group_1, SWT.NONE);
		label_5.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_5.setText("终止值：");

		dial_scale_upper = new Text(group_1, SWT.BORDER);
		final GridData gd_dial_scale_upper = new GridData(SWT.FILL, SWT.CENTER, true, true);
		dial_scale_upper.setLayoutData(gd_dial_scale_upper);

		
		final Group group_2 = new Group(this, SWT.NONE);
		group_2.setLayoutData(new GridData(SWT.FILL, SWT.FILL, false, true));
		final GridLayout gridLayout_3 = new GridLayout();
		gridLayout_3.marginWidth = 0;
		gridLayout_3.marginHeight = 0;
		gridLayout_3.horizontalSpacing = 0;
		group_2.setLayout(gridLayout_3);
		

		ttv = new TableTreeViewer(group_2, SWT.FULL_SELECTION);
		tableTree = ttv.getTableTree();
		tableTree.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));

		// Set the content and label providers
		ttv.setContentProvider(new DataTreeContentProvider());
		ttv.setLabelProvider(new DataTreeLabelProvider());
		ttv.setInput(dataTableModel);

		// Set up the table
		final Table table = ttv.getTableTree().getTable();
		final TableColumn column1 = new TableColumn(table, SWT.CENTER);
		final TableColumn column2 = new TableColumn(table, SWT.CENTER);
		final TableColumn column3 = new TableColumn(table, SWT.CENTER);
		
		column1.setText("起始位");
		column2.setText("终止位");
		column3.setText("区域颜色");
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
		        column3.setWidth(width - (column1.getWidth()+column2.getWidth()));
		        table.setSize(area.width, area.height);
		      } else {
		        table.setSize(area.width, area.height);
		        column1.setWidth(width/5);
		        column2.setWidth(width/5);
		        column3.setWidth(width - (column1.getWidth()+column2.getWidth()));
		      }
		    }
		  });
		

		final Composite composite = new Composite(this, SWT.NONE);
		composite.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.numColumns = 5;
		composite.setLayout(gridLayout_2);
		//new Label(group, SWT.NONE);
		
		text_hidden_data = new Text(composite, SWT.BORDER);
		text_hidden_data.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		text_hidden_data.setVisible(false);

		final Label label = new Label(composite, SWT.NONE);
		label.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, true, true));
		label.setText(" ");

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
		group.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));
		group.setText("刻度区域");
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 7;
		group.setLayout(gridLayout);

		final Label label_6 = new Label(group, SWT.NONE);
		label_6.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_6.setText("起始位：");

		dial_rangle_lower = new Text(group, SWT.BORDER);
		final GridData gd_dial_rangle_lower = new GridData(SWT.FILL,
				SWT.CENTER, true, true);
		dial_rangle_lower.setLayoutData(gd_dial_rangle_lower);
		
		final Label label_1 = new Label(group, SWT.NONE);
		label_1.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_1.setText("终止位：");

		dial_rangle_upper = new Text(group, SWT.BORDER);
		final GridData gd_dial_rangle_upper = new GridData(SWT.FILL, SWT.CENTER, true, true);
		dial_rangle_upper.setLayoutData(gd_dial_rangle_upper);

		final Label label_2 = new Label(group, SWT.NONE);
		label_2.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		label_2.setText("颜色：");

		dial_rangle_c = new Text(group, SWT.BORDER);
		final GridData gd_dial_rangle_c = new GridData(SWT.FILL, SWT.CENTER, true, true);
		dial_rangle_c.setLayoutData(gd_dial_rangle_c);
		dial_rangle_c.setBackground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
		dial_rangle_c.setForeground(ColorUtil.hexRGBToSWTColor("#FFFFFF",shell.getDisplay()));
		
		button_dial_rangle_c = new Button(group, SWT.NONE);
		button_dial_rangle_c.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, true));
		button_dial_rangle_c.setText("..");
	}

}
