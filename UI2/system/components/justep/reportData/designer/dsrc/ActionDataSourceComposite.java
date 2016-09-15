import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import com.justep.design.model.Model;
import com.justep.design.model.element.Action;
import com.justep.design.model.element.HasAction;
import com.justep.design.model.element.Process;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.data.DataSetChangedEvent;
import com.justep.studio.data.DataSetChangedListener;
import com.justep.studio.model.ModelManager;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiDataSourceManager;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.commonpanel.CommonSelectorComposite;
import com.justep.studio.util.StudioConfig;

public class ActionDataSourceComposite  extends Composite{
	
	private PropertyItem propertyItem;
	private DataSet dataset;
	private Button displayAllCheck;
	private Text displayText;
	private Text displayColumns;
	private String actionFilter,actiontype;
	private Label columnlabel;
	
	private CommonSelectorComposite commonComposite;
	public ActionDataSourceComposite(Composite parent, int style ,PropertyItem propertyItem) {
		super(parent, style);
		this.propertyItem = propertyItem;		
		this.dataset = getHasActionDatasource(propertyItem);
		initLayout();
		displayAll();
	}

	private void initLayout() {
		final GridLayout gridLayout0 = new GridLayout();
		gridLayout0.numColumns = 1;
		setLayout(gridLayout0);
		
		commonComposite = new CommonSelectorComposite(this,SWT.NONE,false,true);
		commonComposite.getTreeViewer().getTree().setLinesVisible(false);
		commonComposite.getTreeViewer().getTree().setHeaderVisible(false);
		commonComposite.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));
		if(this.dataset != null){
		  commonComposite.setDataSet(this.dataset);
		  commonComposite.getTreeViewer().expandAll();
		}
		

		Composite composite = new Composite(this, SWT.NONE);
		GridData gd_composite = new GridData(SWT.FILL, SWT.FILL, true, false);

		composite.setLayoutData(gd_composite);
		GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 3;
		gridLayout.marginWidth = 0;
		gridLayout.marginHeight = 0;
		composite.setLayout(gridLayout);

		displayAllCheck = new Button(composite, SWT.CHECK);
		displayAllCheck.setText("显示所有");
		displayAllCheck.addSelectionListener(new SelectionAdapter(){
			public void widgetSelected(final SelectionEvent e){
				displayAll();
			}
		});	
		
		Label label = new Label(composite, SWT.NONE);
		label.setText("属性值");
		displayText = new Text(composite, SWT.BORDER);
		displayText.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));

		displayText.setEditable(false);
		
		this.dataset.addDataSetChangedListener(new DataSetChangedListener(){
			public void dataSetChanged(DataSetChangedEvent event) {
				if(event.getEventType() == DataSetChangedEvent.DATACHANGED || event.getEventType() == DataSetChangedEvent.SELECTIONCHANGED){
					String str = transformPropertyValue(dataset);
					if(!"UNCHANGED".equals(str)){
						displayText.setText(str);
					}
				}
		}});

		columnlabel = new Label(composite, SWT.NONE);
		columnlabel.setText("业务字段（逗号分隔）");
		columnlabel.setToolTipText("报表中使用的数据字段，只用于报表设计，可以不定义");
		
		displayColumns = new Text(composite, SWT.BORDER);
		displayColumns.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, true, 2, 1));
		
		if(this.propertyItem != null){
			XuiElement sourceE = ((XuiElement)this.propertyItem.getOwerElement()).getChildByTagName("source");

			if(sourceE != null){
				XuiElement actionE = sourceE.getChildByTagName("action");
				if(actionE != null){
					displayText.setText(actionE.getProperyValue("name"));
					actiontype = actionE.getProperyValue("type");
					displayColumns.setText(actionE.getProperyValue("columns"));
				}
			}
		}
		
	}

	public void setType(String type){
		actiontype = type;
		if("ksqlaction".equals(actiontype)){
			displayColumns.setVisible(false);
			columnlabel.setVisible(false);
		}else{
			displayColumns.setVisible(true);
			columnlabel.setVisible(true);			
		}
	}
	
	public DataSet getHasActionDatasource(PropertyItem propertyItem) {
		XuiElement ownerE = (XuiElement)propertyItem.getOwerElement();
		XuiDataModel model = ownerE.getXuiDataModel();
		String modelName = model.getModuleName();
		Model mod = ModelManager.parseModel(StudioConfig.getBIZPath(), modelName);
		DataSet ds = XuiDataSourceManager.createTreeDataSet();
		ds.addColumn("hasAction", "false", "string").setVisible(false);
		
		if(mod != null){
			List<Process> processList = mod.getProcessList();
			List<String> haList = new ArrayList<String>();
			for(Process p:processList){
				List<HasAction> has = p.getHasActionList();
				for(HasAction ha:has){
					haList.add(ha.getAction());
				}
			}
			
			List<Action> actionList = mod.getActionList();
			Map<String, List<String>> map = new LinkedHashMap<String, List<String>>();
			for (Action action : actionList) {
				String mdlName = action.getOwnerModelName();
				List<String> list = map.get(mdlName);
				if (list != null) {
					list.add(action.getName());
				} else {
					list = new ArrayList<String>();
					list.add(action.getName());
					map.put(mdlName, list);
				}
			}
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String mdlName = (String) it.next();
				DataRecord mdlNode = ds.addRecord(new Object[] {"module", mdlName, mdlName, "true", "folder.gif"});
				List<String> atnList = map.get(mdlName);
				for (String atnName : atnList) {
					DataRecord atnNode = new DataRecord(new Object[] { "action", atnName, atnName }, mdlNode);
					atnNode.setValue("image", "relation.gif");
					for(String haName:haList){					
						if(atnName.equals(haName)){
							atnNode.setValue("hasAction", "true");
						}
					}
				}
			}		
		}
		
		return ds;
	}
	
	public void saveSelfConfig(XuiElement actionE){
		actionE.setPropertyValue("name", displayText.getText());
		if("action".equals(actiontype)){
			actionE.setPropertyValue("columns", displayColumns.getText());
		}
	}

	private void displayAll(){
		boolean b = this.displayAllCheck == null?false:displayAllCheck.getSelection();	
		String filterText = commonComposite.getFilterText();
		String filter = filterText==null?actionFilter.toLowerCase():filterText.toLowerCase();
		List<DataRecord> drl = dataset.getDataRecords();
		for(DataRecord dr:drl){
			List<DataRecord> chDrL = dr.getChildList(); 
			boolean root = false;
			for(DataRecord chDr:chDrL){
				boolean flag = chDr.getString("name").toLowerCase().indexOf(filter) != -1 && (chDr.getString("hasAction").equals("true") || b);
				chDr.setVisible(flag);
				chDr.setMatch(flag);
				root = flag || root;
			}
			
			dr.setVisible(root);
			dr.setMatch(root);
		} 
		commonComposite.getTreeViewer().refresh();
		commonComposite.getTreeViewer().expandAll();
	}
	
	private String transformPropertyValue(DataSet dataset) {
		List<DataRecord> rcList = dataset.getSelectedRecord();
		if(rcList.size()>0){
			return rcList.get(0).getString("name");
/*			String nodeType = rcList.get(0).getString("nodeType");
			if(!("false".equals(rcList.get(0).getString("asPath")))){
				return getPath(rcList.get(0));
			}
*/		}
		return "";
	}
	
/*	private String getPath(DataRecord record){
		List<DataRecord> valueList = new ArrayList<DataRecord>();
		buildPath(record,valueList);
		StringBuilder path = new StringBuilder();
		for(int i=valueList.size()-1;i>=0;i--){
			DataRecord tmpRecord = valueList.get(i);
			String name = tmpRecord.getString("name");
			if(name == null || "".equals(name)){
				name = record.getString("text");
			}
			String type = tmpRecord.getString("nodeType");			
			if("module".equals(type)){
				path.append(name);
			}else{
				path.append("/"+name);
			}			
		}		
		return path.toString();
	}
	
	private void  buildPath(DataRecord record,List<DataRecord> valueList){		
		valueList.add(record);
		DataRecord pNode = record.getParent();
		if(pNode != null && !("false".equals(pNode.getString("asPath")))){
			buildPath(pNode,valueList);
		}
	}
*/}
