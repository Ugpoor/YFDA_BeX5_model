import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.justep.design.model.ModelParser;
import com.justep.design.model.ModelUtil;
import com.justep.studio.data.DataRecord;
import com.justep.studio.data.DataSet;
import com.justep.studio.data.ModelDataSourceManager;
import com.justep.studio.ui.dialog.CommonSelectorDialog;
import com.justep.studio.ui.editors.xui.IPropertyDialogPage;
import com.justep.studio.ui.editors.xui.IPropertyValueStrategy;
import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.W3cDocumentHelper;
import com.justep.studio.ui.editors.xui.XuiDataModel;
import com.justep.studio.ui.editors.xui.XuiDataModelChangedEvent;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.util.ExtSpaceUIUtil;

public class ReportDataDataSourceDialog extends Composite implements IPropertyDialogPage {
	
	private Shell shell;
	private Text text_data_model;
	private Button button_data_model;
	private Text text_fn_model;
	private Button button_fn_model;
	private Combo combo_data_type;
	private Label label_fn_label;
	private Label label_data_model;
	private Button button_isValid;
	private PropertyItem propertyItem;
	private String datasourceType = "ksql";

	private String ksqlDataModel = "",fnModel = "",ksqText = "";
	private String sqlDataModel = "";

	private Composite comp;
	private Composite ksqlDataSourceComposite;
	private Composite sqlDataSourceComposite;
	private Composite actionDataSourceComposite;
	private StackLayout stackLayout = new StackLayout();

	private XuiElement sourceE = null;

	public ReportDataDataSourceDialog(Composite parent, int style) {
		super(parent, style);
		initLayout();
		initEvent();
		this.setSize(880, 620);
		shell = this.getShell();
	}

	private void initLayout() {
		final GridLayout gridLayout = new GridLayout();
		gridLayout.marginTop = 0;
		gridLayout.marginWidth = 0;
		setLayout(gridLayout);

		final Composite composite = new Composite(this, SWT.NONE);
		final GridData gd_composite_1 = new GridData(SWT.FILL, SWT.CENTER, false, false);
		composite.setLayoutData(gd_composite_1);
		final GridLayout gridLayout_2 = new GridLayout();
		gridLayout_2.numColumns = 9;
		gridLayout_2.marginHeight = 0;
		gridLayout_2.marginWidth = 0;
		composite.setLayout(gridLayout_2);
		final Label label_1 = new Label(composite, SWT.NONE);
		label_1.setText("数据源类型：");

		combo_data_type = new Combo(composite, SWT.NONE);
		final GridData gd_combo_data_type = new GridData(70, SWT.DEFAULT);
		combo_data_type.setLayoutData(gd_combo_data_type);
		combo_data_type.select(0);
		combo_data_type.setItems(new String[] { "KSQLAction","ACTION","KSQL", "SQL"});
		combo_data_type.setItems(new String[] { "KSQLAction","ACTION"});

		label_data_model = new Label(composite, SWT.NONE);
		label_data_model.setText("    数据模型：");

		text_data_model = new Text(composite, SWT.BORDER);

		final GridData gd_text_data_model = new GridData(125, SWT.DEFAULT);
		text_data_model.setLayoutData(gd_text_data_model);

		button_data_model = new Button(composite, SWT.NONE);
		button_data_model.setText("选择");

		label_fn_label = new Label(composite, SWT.NONE);
		label_fn_label.setText("    函数模型：");

		text_fn_model = new Text(composite, SWT.BORDER);
		final GridData gd_text_fn_model = new GridData(131, SWT.DEFAULT);
		text_fn_model.setLayoutData(gd_text_fn_model);

		button_fn_model = new Button(composite, SWT.NONE);
		button_fn_model.setText("选择");

		button_isValid = new Button(composite, SWT.CHECK);
		button_isValid.setText("是否检查语句合法性");
		button_isValid.setSelection(true);

		final Label label = new Label(this, SWT.SEPARATOR | SWT.HORIZONTAL);
		label.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false));

		comp = new Composite(this, SWT.NONE);
		comp.setLayout(stackLayout);
		final GridData gd_composite = new GridData(SWT.FILL, SWT.FILL, true, true);
		gd_composite.heightHint = 265;
		comp.setLayoutData(gd_composite);

	}

	private void initEvent() {
		combo_data_type.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				Combo combo = (Combo) e.getSource();
				String temp = combo.getItem(combo.getSelectionIndex());
				if (temp.equalsIgnoreCase("KSQL")) {
					datasourceType = "ksql";
					changeVisable("ksql");
					text_data_model.setText(ksqlDataModel);
					stackLayout.topControl = ksqlDataSourceComposite;
					comp.layout();
				} else if (temp.equalsIgnoreCase("SQL")) {
					datasourceType = "sql";
					changeVisable("sql");
					text_data_model.setText(sqlDataModel);
					stackLayout.topControl = sqlDataSourceComposite;
					comp.layout();
				} else if (temp.equalsIgnoreCase("ACTION")) {
					datasourceType = "action";
					changeVisable("action");
					((ActionDataSourceComposite) actionDataSourceComposite).setType(datasourceType);
					stackLayout.topControl = actionDataSourceComposite;
					comp.layout();
				} else if (temp.equalsIgnoreCase("KSQLAction") || temp.equalsIgnoreCase("SQLAction")) {
					datasourceType = "ksqlaction";
					changeVisable(datasourceType);
					((ActionDataSourceComposite) actionDataSourceComposite).setType(datasourceType);
					stackLayout.topControl = actionDataSourceComposite;
					comp.layout();					
				}
			}
		});

		button_data_model.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				CommonSelectorDialog dlg = new CommonSelectorDialog(shell, false, true, "选择数据模型");
				DataSet ds = ModelDataSourceManager.getModelTreeDataSet(null);
				dlg.setDataSet(ds);
				if (dlg.open() == 1)
					return;
				List<DataRecord> returndatas = dlg.getSelections();
				for (DataRecord dataRecord : returndatas) {
					String model = (String) dataRecord.getValue("name");
					text_data_model.setText(model);
				}
				//ksqlDataModel='' 时 报nullPoint 只能在这里单独处理
				if(ksqlDataSourceComposite == null) {
					ksqlDataSourceComposite = new KSQLDataSourceComposite(comp, SWT.NONE, propertyItem, ksqlDataModel, text_fn_model.getText(), ksqText);
					stackLayout.topControl = ksqlDataSourceComposite;
					comp.layout();
				}
			}
		});

		button_fn_model.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				CommonSelectorDialog dlg = new CommonSelectorDialog(shell, false, true, "选择函数模型");
				DataSet ds = ModelDataSourceManager.getModelTreeDataSet(null);
				dlg.setDataSet(ds);
				if (dlg.open() == 1)
					return;
				List<DataRecord> returndatas = dlg.getSelections();
				for (DataRecord dataRecord : returndatas) {
					String model = (String) dataRecord.getValue("name");
					text_fn_model.setText(model);
				}
			}
		});

		text_data_model.addModifyListener(new ModifyListener() {
			public void modifyText(final ModifyEvent e) {
				String dataModel = text_data_model.getText();
				String fnModel = text_fn_model.getText();
				if (datasourceType.equals("ksql")) {
					if (!ksqlDataModel.equals(dataModel)) {
						ksqlDataModel = dataModel;
						
						if (ExtSpaceUIUtil.isInExtSpace(propertyItem.getOwerElement().getXuiDataModel().getFilePath())) {
							dataModel = ModelParser.getExtFileName(dataModel);
							fnModel = ModelParser.getExtFileName(fnModel);
						}

						if (ksqlDataSourceComposite != null) {
							((KSQLDataSourceComposite) ksqlDataSourceComposite).getKsqlComposite().setModel(dataModel);
							((KSQLDataSourceComposite) ksqlDataSourceComposite).getKsqlComposite().setFunModel(fnModel);
							((KSQLDataSourceComposite) ksqlDataSourceComposite).getKsqlComposite().clear();  
						}

					}
				} else if (datasourceType.equals("sql")) {
					sqlDataModel = dataModel;
				}
			}
		});

		text_fn_model.addModifyListener(new ModifyListener() {
			public void modifyText(final ModifyEvent e) {
				String dataModel = text_data_model.getText();
				String fnModel = text_fn_model.getText();
				if (datasourceType.equals("ksql")) {
					if (fnModel == null || fnModel.equals("")) {
						if (dataModel != null) {
							fnModel = dataModel;
						} else {
							fnModel = "";
						}
					}
					
					if (ExtSpaceUIUtil.isInExtSpace(propertyItem.getOwerElement().getXuiDataModel().getFilePath())) {
						fnModel = ModelParser.getExtFileName(fnModel);
					}

					if (ksqlDataSourceComposite != null) {
						((KSQLDataSourceComposite) ksqlDataSourceComposite).getKsqlComposite().setFunModel(fnModel);
					}

				}
			}
		});

	}

	public Object getReturnValue() {
		XuiElement dataE = ((XuiElement) this.propertyItem.getOwerElement());
		dataE.setPropertyValue("data-model", "");
		dataE.setPropertyValue("fn-model", "");

		//检查是否有source节点,没有就加一个
		if (this.sourceE == null) {
			XuiDataModel model = propertyItem.getOwerElement().getXuiDataModel();
			model.addElement("source", dataE, null, null, "<source></source>", null);
			sourceE = dataE.getChildByTagName("source");
		}

		if (datasourceType.equals("ksql")) {
			XuiElement ksqlE = sourceE.getChildByTagName("KSQL");

			if (ksqlE == null) {
				sourceE.getXuiDataModel().addElement("KSQL", sourceE, null, null, "<KSQL></KSQL>", null);
				ksqlE = sourceE.getChildByTagName("KSQL");
			}

			ksqlE.setPropertyValue("data-model", text_data_model.getText());
			ksqlE.setPropertyValue("fn-model", text_fn_model.getText());

			((KSQLDataSourceComposite) ksqlDataSourceComposite).saveSelfConfig(ksqlE);
		} else if (datasourceType.equals("sql")) {
			XuiElement sqlE = sourceE.getChildByTagName("SQL");

			if (sqlE == null) {
				sourceE.getXuiDataModel().addElement("SQL", sourceE, null, null, "<SQL></SQL>", null);
				sqlE = sourceE.getChildByTagName("SQL");
			}
			sqlE.setPropertyValue("data-model", text_data_model.getText());

			((SQLDataSourceComposite) sqlDataSourceComposite).saveSelfConfig(sqlE);
		} else if (datasourceType.equals("action") || datasourceType.equals("ksqlaction")) {
			XuiElement actionE = sourceE.getChildByTagName("action");

			if (actionE == null) {
				sourceE.getXuiDataModel().addElement("ACTION", sourceE, null, null, "<action></action>", null);
				actionE = sourceE.getChildByTagName("action");
			}

			((ActionDataSourceComposite) actionDataSourceComposite).saveSelfConfig(actionE);
			
			actionE.setPropertyValue("fn-model", text_fn_model.getText());
			actionE.setPropertyValue("type", datasourceType);
		}
		XuiDataModelChangedEvent event = new XuiDataModelChangedEvent(this, dataE, dataE.getPropertyItem("source"), "");
		sourceE.getXuiDataModel().fireEvent(event);
		Map<String, String> map = new HashMap<String, String>();
		return map;
	}

	public void setPropertyItem(PropertyItem propertyItem) {
		this.propertyItem = propertyItem;
		this.sourceE = ((XuiElement) this.propertyItem.getOwerElement()).getChildByTagName("source");

		//画面板，ksql、sql、action
		render();
	}

	private void render() {
		datasourceType = "ksqlaction";
		combo_data_type.select(0);
		
		String defaultDataModel = getDefaultDataModel();
		String sqlText = "";
		String actionName = "";
		String dataModel = "";

		if (this.sourceE != null) {
			XuiElement ksqlE = sourceE.getChildByTagName("KSQL");
			XuiElement sqlE = sourceE.getChildByTagName("SQL");
			XuiElement actionE = sourceE.getChildByTagName("action");

			if (actionE != null) {
				actionName = actionE.getProperyValue("name");
				String type = actionE.getProperyValue("type");
				fnModel = actionE.getProperyValue("fn-model");
				text_fn_model.setText(fnModel == null ? "" : fnModel);
				if (actionName != null && !actionName.equals("")) {
					if("ksqlaction".equals(type)){
						datasourceType = "ksqlaction";
						combo_data_type.select(0);
						changeVisable("ksqlaction");						
					}else if("sqlaction".equals(type)){
						datasourceType = "ksqlaction";
						combo_data_type.select(0);
						changeVisable("ksqlaction");												
					}else{
						datasourceType = "action";
						combo_data_type.select(1);
						changeVisable("action");																		
					}
				}
			}
			
			if (ksqlE != null) {
				ksqText = W3cDocumentHelper.getText(ksqlE.getOriginElement());
				if (ksqText != null && !ksqText.equals("")) {
					datasourceType = "ksql";
					combo_data_type.select(2);
					changeVisable("ksql");
					dataModel = ksqlE.getProperyValue("data-model");
					fnModel = ksqlE.getProperyValue("fn-model");
					text_fn_model.setText(fnModel == null ? "" : fnModel);
					this.ksqlDataModel = dataModel == null ? "" : dataModel;
				}
			}

			if (sqlE != null) {
				dataModel = sqlE.getProperyValue("data-model");
				this.sqlDataModel = dataModel == null ? "" : dataModel;

				List<XuiElement> cList = sqlE.getChildren();
				for (XuiElement e : cList) {
					sqlText = W3cDocumentHelper.getText(e.getOriginElement());
					if (sqlText != null && !sqlText.equals("")) {
						datasourceType = "sql";
						combo_data_type.select(3);
						changeVisable("sql");
						break;
					}
				}
			}

		}
		if(ksqlDataModel == null || ksqlDataModel.equals("")){
			ksqlDataModel = defaultDataModel;
		}
		if(sqlDataModel == null || sqlDataModel.equals("")){
			sqlDataModel = defaultDataModel;
		}
		if(!"".equals(this.ksqlDataModel)) 
			ksqlDataSourceComposite = new KSQLDataSourceComposite(comp, SWT.NONE, propertyItem, this.ksqlDataModel, fnModel, ksqText);
		
		sqlDataSourceComposite = new SQLDataSourceComposite(comp, SWT.NONE, propertyItem);
		actionDataSourceComposite = new ActionDataSourceComposite(comp, SWT.NONE, propertyItem);

		if (sqlText != null && !sqlText.equals("")) {
			stackLayout.topControl = sqlDataSourceComposite;
			text_data_model.setText(this.sqlDataModel);
		} else if (ksqText != null && !ksqText.equals("")) {
			text_data_model.setText(this.ksqlDataModel);
			if(ksqlDataSourceComposite != null) stackLayout.topControl = ksqlDataSourceComposite;
		} else {
			((ActionDataSourceComposite) actionDataSourceComposite).setType(datasourceType);
			stackLayout.topControl = actionDataSourceComposite;
			changeVisable("ksqlaction");
		}
		comp.layout();
	}

	private void changeVisable(String type) {
		if ("ksql".equalsIgnoreCase(type)) {
			text_data_model.setVisible(true);
			text_fn_model.setVisible(true);
			button_data_model.setVisible(true);
			button_fn_model.setVisible(true);
			label_fn_label.setVisible(true);
			label_data_model.setVisible(true);
			button_isValid.setVisible(true);
		} else if ("sql".equalsIgnoreCase(type)) {
			button_data_model.setVisible(true);
			text_data_model.setVisible(true);
			label_data_model.setVisible(true);
			button_fn_model.setVisible(false);
			text_fn_model.setVisible(false);
			label_fn_label.setVisible(false);
			button_isValid.setVisible(true);
		} else if ("action".equalsIgnoreCase(type)) {
			button_data_model.setVisible(false);
			text_data_model.setVisible(false);
			label_data_model.setVisible(false);
			button_fn_model.setVisible(false);
			text_fn_model.setVisible(false);
			label_fn_label.setVisible(false);
			button_isValid.setVisible(false);
		} else if ("ksqlaction".equalsIgnoreCase(type)) {
			button_data_model.setVisible(false);
			text_data_model.setVisible(false);
			label_data_model.setVisible(false);
			button_fn_model.setVisible(false);
			text_fn_model.setVisible(false);
			label_fn_label.setVisible(false);
			button_isValid.setVisible(false);
		}
	}

	public String isValid() {
		if (button_isValid.getSelection()) {
			if (datasourceType.equals("ksql")) {
				return ((KSQLDataSourceComposite) ksqlDataSourceComposite).getKsqlComposite().isValid();
			} else if (datasourceType.equals("sql")) {
				return ((SQLDataSourceComposite) sqlDataSourceComposite).isValid(text_data_model.getText());
			} else if (datasourceType.equals("action")) {
				return null;
			}
		}
		return null;
	}

	public void setReturnValueStrategy(IPropertyValueStrategy arg0) {

	}
	
	private String getDefaultDataModel(){
		return ModelUtil.findDefaultDataModel(new File(sourceE.getXuiDataModel().getFilePath()).getParent());
	}
}
