import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;

/**
 * 分数格式化配置页
 * @author xiangyaohua
 * 
 *
 */
public class ReportCellFractionFormatComposite extends Composite implements IReportCellFormatComposite{

	private List typeList;
	private String format;
	private int typeIndex;
	private String[] types = new String[]{"# ?/?","# ??/??","# ???/???",
			   "# ?/2","# ?/4","# ?/8","# ??/16","# ?/10","# ??/100"};
	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellFractionFormatComposite(Composite parent, int style,String format) {
		super(parent, style);
		this.format =format;
		final GridLayout gridLayout = new GridLayout();
		setLayout(gridLayout);
	


		final Label label_1 = new Label(this, SWT.NONE);
		label_1.setLayoutData(new GridData());
		label_1.setText("类型:");

		typeList = new List(this, SWT.BORDER);
		final GridData gd_typeList = new GridData(SWT.FILL, SWT.CENTER, false, false);

		typeList.setLayoutData(gd_typeList);
		//负数
		typeList.add("分母为一位数(1/4)");
		typeList.add("分母为两位数(21/25)");
		typeList.add("分母为三位数(312/943)");
		typeList.add("以 2 为分母(1/2)");
		typeList.add("以 4 为分母(2/4)");
		typeList.add("以 8 为分母(4/8)");
		typeList.add("以 16 为分母(8/16)");
		typeList.add("以 10 为分母(5/10)");
		typeList.add("以 100 为分母(50/100)");
		typeList.setSelection(0);
		
		new Label(this, SWT.NONE);
		
		if(!this.format.equals("")){
			this.initData();
		}
		
		initEvent();
		//
	}
	
	private void initEvent() {
		
		typeList.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				typeIndex = typeList.getSelectionIndex();
			}
		});
		
	}

	private void initData(){

		
		
		this.typeIndex = 0;
		for (int i = 0; i < this.types.length; i++) {
			if(this.types[i].equals(this.format)){
				this.typeIndex = i;
			}
		}
		typeList.setSelection(this.typeIndex);
		

	}

	@Override
	protected void checkSubclass() {
		// Disable the check that prevents subclassing of SWT components
	}

	public String getFormat() {
		return this.types[this.typeIndex];
	}

}
