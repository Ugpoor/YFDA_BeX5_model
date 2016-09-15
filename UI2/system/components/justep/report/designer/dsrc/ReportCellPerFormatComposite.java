import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Spinner;

/**
 * 百分数格式化配置页
 * @author xiangyaohua
 * 
 *
 */
public class ReportCellPerFormatComposite extends Composite implements IReportCellFormatComposite{

	private Spinner decimalText;
	private String format;
	
	private int decimal;
	

	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellPerFormatComposite(Composite parent, int style,String format) {
		super(parent, style);
		this.format =format;
		final GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 2;
		setLayout(gridLayout);

		final Label label = new Label(this, SWT.NONE);
		label.setText("小数位数:");

		decimalText = new Spinner(this, SWT.BORDER|SWT.READ_ONLY);
		final GridData gd_decimalText = new GridData(SWT.LEFT, SWT.CENTER, true, false);
		gd_decimalText.widthHint = 40;
		decimalText.setLayoutData(gd_decimalText);
	
		//		decimalText.setText(2+"");
		decimalText.setValues(2, 0, 30, 0, 1, 1);
		this.decimal = 2;
		//负数
		
		new Label(this, SWT.NONE);
		
		if(!this.format.equals("")){
			this.initData();
		}
		
		initEvent();
		//
	}
	
	private void initEvent() {
		decimalText.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				decimal = decimalText.getSelection();
			}
		
		});
		
	}

	private void initData(){

		//小数位数
		this.decimal = 0;
		int decimalBegin = this.format.indexOf(".");
		if(decimalBegin!=-1){
			int decimalEnd = this.format.indexOf("%");
			this.decimal = decimalEnd-decimalBegin-1;
		}
		this.decimalText.setSelection(this.decimal);
		


	}

	@Override
	protected void checkSubclass() {
		// Disable the check that prevents subclassing of SWT components
	}

	public String getFormat() {
		StringBuffer sbf = new StringBuffer();
//		0.000%
//		0%
		sbf.append("0");
		if(this.decimal>0){
			sbf.append(".");
			for (int i = 0; i < this.decimal; i++) {
				sbf.append("0");
			}
		}

		sbf.append("%");
		
		return sbf.toString();
	}

}
