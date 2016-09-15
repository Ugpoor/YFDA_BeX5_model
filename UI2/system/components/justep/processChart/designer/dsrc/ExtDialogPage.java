import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jface.window.Window;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.ToolBar;
import org.eclipse.swt.widgets.ToolItem;

import swing2swt.layout.BorderLayout;

import com.justep.design.model.ModelConstant;
import com.justep.design.model.element.HasRelation;
import com.justep.studio.StudioPlugin2;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.ui.dialog.CommonSelectorDialog;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiDataSourceManager;
import com.justep.studio.ui.exjface.DataSetTableViewer;
import com.justep.studio.ui.exjface.DatasetTableLabelProvider;

/**
 * 支持流程轨迹图中添加任务属性
 * @author hcr
 *
 */
public class ExtDialogPage extends Composite implements IPropertyDialogPage {

	private Table table;
	private DataSet dataset;
	private final DataSetTableViewer tableViewer ;
	private PropertyItem propertyItem;
	
	public ExtDialogPage(Composite parent, int style) {
		super(parent, style);
		setLayout(new BorderLayout(0, 0));

		tableViewer = new DataSetTableViewer(this, SWT.BORDER|SWT.FULL_SELECTION);
		dataset=new DataSet();
		tableViewer.setDataSet(dataset);
		table = tableViewer.getTable();
		table.setLinesVisible(true);
		table.setHeaderVisible(true);
	
		tableViewer.setLabelProvider(new DatasetTableLabelProvider(tableViewer){
			public Color getBackground(Object element, int columnIndex) {
				return new Color(null,211,226,243);
			}
		});
		
		final ToolBar toolBar = new ToolBar(this, SWT.NONE);
		toolBar.setLayoutData(BorderLayout.NORTH);

		final ToolItem newItemToolItem = new ToolItem(toolBar, SWT.PUSH);
		
		newItemToolItem.setText("添加关系");
		newItemToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				CommonSelectorDialog dlg = new CommonSelectorDialog(StudioPlugin2.getShell(), "选择关系");
				DataSet ds = XuiDataSourceManager.getRelationDataSet("/system/ontology", "SA_Task");
				List<DataRecord> records = ds.getDataRecords();
				int size = records.size();
				for (int i=size-1; i>=0; i--){
					DataRecord record = records.get(i);
					
					String name = record.getString(ModelConstant.NAME);
					if (name.equals("version") || name.equals("sParent")){
						ds.deleteRecord(record);
					} else {
						HasRelation r = (HasRelation)record.getValue(ModelConstant.OWNER);
						if (!r.getRelationAdapter().isSingleValued()){
							ds.removeRecord(i);
						}
					}
					
				}
				
				dlg.setDataSet(ds);
				dlg.open();
				if (dlg.getReturnCode() == Window.OK) {
					List<DataRecord> retrunData = dlg.getSelections();
					for (int i = 0; i < retrunData.size(); i++) {
						DataRecord record = retrunData.get(i);
						String name = record.getString(ModelConstant.NAME);
						String label = record.getString(ModelConstant.LABEL);
						dataset.addRecord(new Object[]{name, label});
					}
				}
			}
		});

		final ToolItem newItemToolItem_1 = new ToolItem(toolBar, SWT.PUSH);
		newItemToolItem_1.setText("删除关系");
		newItemToolItem_1.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				List<DataRecord> list = dataset.getSelectedRecord();
				if(list.size()>0){
					dataset.deleteRecord(dataset.getSelectedRecord().get(0));
				}
			}
		});

		final ToolItem newItemToolItem_2 = new ToolItem(toolBar, SWT.PUSH);
		newItemToolItem_2.setText("上移");
		newItemToolItem_2.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				List<DataRecord> list = dataset.getSelectedRecord();
				if(list.size()>0){
					DataRecord selectedData = list.get(0);
					
					List<DataRecord> allList = dataset.getData();
					int selectIndex = 0;
					for (int i = 0; i < allList.size(); i++) {
						if(allList.get(i) == selectedData){
							selectIndex = i;
							break;
						}
					}
					if(selectIndex>0){
						allList.set(selectIndex, allList.get(selectIndex-1));
						allList.set(selectIndex-1, selectedData);
						dataset.setData(allList);
						tableViewer.reloadDataSet(dataset);
					}
				}
			}
		});
		

		final ToolItem newItemToolItem_3 = new ToolItem(toolBar, SWT.PUSH);
		newItemToolItem_3.setText("下移");
		newItemToolItem_3.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				List<DataRecord> list = dataset.getSelectedRecord();
				if(list.size()>0){
					DataRecord selectedData = list.get(0);
					
					List<DataRecord> allList = dataset.getData();
					int selectIndex = 0;
					for (int i = 0; i < allList.size(); i++) {
						if(allList.get(i) == selectedData){
							selectIndex = i;
							break;
						}
					}
					if(selectIndex<allList.size()-1){
						allList.set(selectIndex, allList.get(selectIndex+1));
						allList.set(selectIndex+1, selectedData);
						dataset.setData(allList);
						tableViewer.reloadDataSet(dataset);
					}
				}
			}
		});
		
		String relationHeader = "关系标识";
		dataset.addColumn(relationHeader).setLength(150).setDataType("String").setHeader(relationHeader).setEditable(false);

		String labelHeader = "关系名称";
		dataset.addColumn(labelHeader).setLength(150).setDataType("String").setHeader(labelHeader).setEditable(true).setEditor("TextCellEditor");
		tableViewer.reloadDataSet(dataset);
		
	}

	public Object getReturnValue() {
		List<DataRecord> list = this.dataset.getData();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			DataRecord dataRecord = list.get(i);
			String relation = dataRecord.getString("关系标识");
			if (relation==null || relation.trim().equals("")){
				throw new RuntimeException("关系标识不允许为空！");
			}
			buffer.append(relation);
			buffer.append(",");
			String label = dataRecord.getString("关系名称");
			if (label==null || label.trim().equals("")){
				throw new RuntimeException("关系名称不允许为空！");
			}
			buffer.append(label);
			if(i<list.size()-1){
				buffer.append(";");
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("ext", buffer.toString());
		return map;
	}

	public String isValid() {
		List<DataRecord> list = this.dataset.getData();
		for (int i = 0; i < list.size(); i++) {
			DataRecord dataRecord = list.get(i);
			String relation = dataRecord.getString("关系标识");
			if (relation==null || relation.trim().equals("")){
				return "关系标识不允许为空！";
			}
			String label = dataRecord.getString("关系名称");
			if (label==null || label.trim().equals("")){
				return "关系名称不允许为空！";
			}
		}
		
		return null;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
		String columnValue = propertyItem.getValue();
		if (columnValue==null || columnValue.equals("")){
			
		}else{
			String[] columnValueArray = columnValue.split(";");
			for (int i = 0; i < columnValueArray.length; i++) {
				Object[] values = columnValueArray[i].split(","); 
				dataset.addRecord(values);
			}
		}
		this.tableViewer.setDataSet(this.dataset);
	}
	
	public PropertyItem getPropertyItem(){
		return this.propertyItem;
	}

	public void setReturnValueStrategy(IPropertyValueStrategy strategy) {

	}

}
