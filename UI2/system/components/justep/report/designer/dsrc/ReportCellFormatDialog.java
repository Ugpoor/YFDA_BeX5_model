import java.util.HashMap;

import org.eclipse.jface.dialogs.Dialog;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;
import org.eclipse.swt.widgets.Shell;

import com.justep.studio.ui.editors.xui.PropertyItem;
import com.justep.studio.ui.editors.xui.XuiElement;
import com.justep.studio.ui.editors.xui.designpanel.WindowDesignPanel;

/**
 * format 对话框
 * @author xiangyaohua
 *
 */
public class ReportCellFormatDialog extends Dialog {

	private List typeList;
	private PropertyItem propertyItem;
	private StackLayout stackLayout;
	private Composite containerPanel;
	private String format;
	private XuiElement xuiElement;

	ReportCellCurrencyFormatComposite reportCellCurrencyFormatComposite;
	ReportCellDateFormatComposite reportCellDateFormatComposite;
	ReportCellFractionFormatComposite reportCellFractionFormatComposite;
	ReportCellNormalFormatComposite reportCellNormalFormatComposite;
	ReportCellNumberFormatComposite reportCellNumberFormatComposite;
	ReportCellPerFormatComposite reportCellPerFormatComposite;
	ReportCellScienceFormatComposite reportCellScienceFormatComposite;
	ReportCellTimeFormatComposite reportCellTimeFormatComposite;

	public ReportCellFormatDialog(Shell parentShell, PropertyItem propertyItem) {

		super(parentShell);
		this.propertyItem = propertyItem;
		
//		this.getDesigner().executeJSMethod(WindowDesignPanel.JSMETHOD_TYPE_SELECTED_COMPONENT, "setCellStyle", paramMap);
//		this.propertyItem.get
		this.xuiElement = ((XuiElement)propertyItem.getOwerElement());
		
		this.format = this.xuiElement.getXuiDataModel().getDesigner().executeJSMethod(WindowDesignPanel.JSMETHOD_TYPE_SELECTED_COMPONENT, "getCellFormat", new HashMap<String, String>()); 
		if(this.format==null){
			this.format = "";
		}
		this.format = this.format.replace("__quot__", "&quot;");
		if(this.format.equals("Currency")){
			this.format = "&quot;￥&quot;#,##0.00;[Red]&quot;￥&quot;\\-#,##0.00";
		}else if(this.format.equals("Percent")){
			this.format = "0.00%";
		}else if(this.format.equals("Scientific")){
			this.format = "0.000E+00";
		}else if(this.format.equals("Short Date")){
			this.format = "yyyy/m/d";
		}
	}

	/**
	 * Create contents of the dialog
	 * @param parent
	 */
	@Override
	protected Control createDialogArea(Composite parent) {
		Composite container = (Composite) super.createDialogArea(parent);

		container.setLayout(new FormLayout());

		final Label label = new Label(container, SWT.NONE);
		final FormData fd_label = new FormData();
		fd_label.bottom = new FormAttachment(0, 17);
		fd_label.top = new FormAttachment(0, 5);
		fd_label.right = new FormAttachment(0, 35);
		fd_label.left = new FormAttachment(0, 5);
		label.setLayoutData(fd_label);
		label.setText("分类:");

		typeList = new List(container, SWT.BORDER);
		typeList.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(final SelectionEvent e) {
				String sel[] = typeList.getSelection();
				if (sel.length > 0) {
					changeFormatPanel(sel[0]);
				}
			}
		});
		

		typeList.removeAll();
		String displayType = xuiElement.getProperyValue("display-type");
		if("number".equals(displayType)){
			typeList.add("常规");
			typeList.add("数值");
			typeList.add("货币");
			typeList.add("百分比");
			typeList.add("分数");
			typeList.add("科学计数");
		}else if("datetime".equals(displayType)){
			typeList.add("常规");
			typeList.add("日期");
			typeList.add("时间");
		}
//		数值，货币，日期，时间，百分比，分数，科学技术
		
		
		final FormData fd_typeList = new FormData();
		fd_typeList.bottom = new FormAttachment(0, 200);
		fd_typeList.top = new FormAttachment(0, 22);
		fd_typeList.right = new FormAttachment(0, 97);
		fd_typeList.left = new FormAttachment(0, 5);
		typeList.setLayoutData(fd_typeList);

		containerPanel = new Composite(container, SWT.NONE);
		stackLayout = new StackLayout();
		containerPanel.setLayout(stackLayout);
		final FormData fd_composite = new FormData();
		fd_composite.bottom = new FormAttachment(typeList, 0, SWT.BOTTOM);
		fd_composite.top = new FormAttachment(typeList, 0, SWT.TOP);
		fd_composite.right = new FormAttachment(typeList, 181, SWT.RIGHT);
		fd_composite.left = new FormAttachment(typeList, 5, SWT.RIGHT);
		containerPanel.setLayoutData(fd_composite);
		// TODO Auto-generated constructor stub

		changeSelectFormat();
		
		return container;
	}

	private void changeSelectFormat() {
		int formatIndex = 0;
		if(this.format==null || this.format.trim().equals("")){
		
		}else if(this.format.contains("#")&&(this.format.contains("$")||this.format.contains("￥"))){
			//货币
			formatIndex = 2;
		}else if((this.format.contains("_")||this.format.contains("Red"))&&this.format.contains("0")){
			//判断有问题
			//数值
			formatIndex = 1;
		}else if(this.format.contains("%")){
			formatIndex = 3;
		}else if(this.format.startsWith("# ")&&this.format.contains("?/")){
			formatIndex = 4;
		}else if(this.format.endsWith("E+00")){
			formatIndex = 5;
		}else{
			String []types = ReportCellDateFormatComposite.types;
			for (String s : types) {
				if(this.format.equals(s)){
					formatIndex = 1;
					break;
				}
			}
			if(formatIndex ==0){
				types = ReportCellTimeFormatComposite.types;
				for (String s : types) {
					if(this.format.equals(s)){
						formatIndex = 2;
						break;
					}
				}
				
			}
			
		}
		
		typeList.select(formatIndex);
		changeFormatPanel(typeList.getItem(formatIndex));
		
	}

	protected void changeFormatPanel(String formatType) {
		System.out.println(formatType);

		if ("常规".equals(formatType)) {
			if (reportCellNormalFormatComposite == null) {
				reportCellNormalFormatComposite = new ReportCellNormalFormatComposite(containerPanel, SWT.NONE);
			}
			stackLayout.topControl = reportCellNormalFormatComposite;
		} else if ("数值".equals(formatType)) {
			if (reportCellNumberFormatComposite == null) {
				reportCellNumberFormatComposite = new ReportCellNumberFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellNumberFormatComposite;
		} else if ("货币".equals(formatType)) {
			if (reportCellCurrencyFormatComposite == null) {
				reportCellCurrencyFormatComposite = new ReportCellCurrencyFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellCurrencyFormatComposite;
		} else if ("百分比".equals(formatType)) {
			if (reportCellPerFormatComposite == null) {
				reportCellPerFormatComposite = new ReportCellPerFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellPerFormatComposite;
		} else if ("分数".equals(formatType)) {
			if (reportCellFractionFormatComposite == null) {
				reportCellFractionFormatComposite = new ReportCellFractionFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellFractionFormatComposite;
		} else if ("科学计数".equals(formatType)) {
			if (reportCellScienceFormatComposite == null) {
				reportCellScienceFormatComposite = new ReportCellScienceFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellScienceFormatComposite;
		} else if ("日期".equals(formatType)) {
			if (reportCellDateFormatComposite == null) {
				reportCellDateFormatComposite = new ReportCellDateFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellDateFormatComposite;
		} else if ("时间".equals(formatType)) {
			if (reportCellTimeFormatComposite == null) {
				reportCellTimeFormatComposite = new ReportCellTimeFormatComposite(containerPanel, SWT.NONE,this.format);
			}
			stackLayout.topControl = reportCellTimeFormatComposite;
		}

		//		typeList.add("常规");
		//		typeList.add("数值");
		//		typeList.add("货币");
		//		typeList.add("百分比");
		//		typeList.add("分数");
		//		typeList.add("科学计数");
		//	}else if("datetime".equals(displayType)){
		//		typeList.add("常规");
		//		typeList.add("日期");
		//		typeList.add("时间");

		containerPanel.layout();

	}

	/**
	 * Create contents of the button bar
	 * @param parent
	 */
	@Override
	protected void createButtonsForButtonBar(Composite parent) {
		createButton(parent, IDialogConstants.OK_ID, IDialogConstants.OK_LABEL, true);
		createButton(parent, IDialogConstants.CANCEL_ID, IDialogConstants.CANCEL_LABEL, false);
	}

	/**
	 * Return the initial size of the dialog
	 */
	@Override
	protected Point getInitialSize() {
		return new Point(288, 279);
	}
	protected void configureShell(Shell newShell) {
		super.configureShell(newShell);
		newShell.setText("格式化");
	}
	
	public String getFormat(){
		String format = ((IReportCellFormatComposite)stackLayout.topControl).getFormat();
		System.out.println("结果:"+format);
		return format;
	}

}
