import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;
import org.eclipse.swt.widgets.Spinner;

/**
 * 数值格式化配置页面
 * @author xiangyaohua
 *
 */
public class ReportCellNumberFormatComposite extends Composite implements IReportCellFormatComposite{

	private List negativeList;
	private Spinner decimalText;
	private String format;
	private Button thousandsCheck ;
	
	private int decimal; 
	private boolean isThousands;
	private int negativeIndex;
	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellNumberFormatComposite(Composite parent, int style,String format) {
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

		
		thousandsCheck = new Button(this, SWT.CHECK);
		thousandsCheck.setLayoutData(new GridData(SWT.LEFT, SWT.CENTER, false, false, 2, 1));
		thousandsCheck.setText("使用千分位分隔符(,)");

		final Label label_1 = new Label(this, SWT.NONE);
		label_1.setLayoutData(new GridData());
		label_1.setText("负数:");
		new Label(this, SWT.NONE);

		negativeList = new List(this, SWT.BORDER);
		final GridData gd_list = new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1);

		negativeList.setLayoutData(gd_list);
		//负数
		negativeList.add("-123.10");
		negativeList.add("-123.10 红色");
		negativeList.add("(123.10)");
		negativeList.add("(123.10) 红色");
		negativeList.add("123.10 红色");
		negativeList.setSelection(0);
		
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
		
		thousandsCheck.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				isThousands = thousandsCheck.getSelection();
			}
		});
		
		negativeList.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				negativeIndex = negativeList.getSelectionIndex();
			}
		});
		
	}

	private void initData(){
//		0 _
//		0.00_ 
//		0.000_ 
//		#,##0.00_ 
//		#,##0.000_ 
//
//		0.00_ ;[Red]\-0.00\ 
//		0.00_);\(0.00\)
//		0.00_);[Red]\(0.00\)
//		0.000_);[Red]\(0.000\)
//		#,##0.000_);[Red]\(#,##0.000\)
//		0;[Red]0
//		0.00;[Red]0.00
		//千分位
		if(this.format.contains("#,##")){
			this.thousandsCheck.setSelection(true);
			this.isThousands = true;
		}
		
		//小数位数
		this.decimal = 0;
		int decimalBegin = this.format.indexOf(".");
		if(decimalBegin!=-1){
			int decimalEnd = this.format.indexOf("_");
			if(decimalEnd==-1){
				decimalEnd=this.format.indexOf("[");
			}
			this.decimal = decimalEnd-decimalBegin-1;
		}
		this.decimalText.setSelection(this.decimal);
		
		this.negativeIndex = 0;
		if(this.format.contains(";")){//货币不适用
//			0.00_ ;[Red]\-0.00\ 
//			0.00_);\(0.00\)
//			0.00_);[Red]\(0.00\)
//			0.000_);[Red]\(0.000\)
//			#,##0.000_);[Red]\(#,##0.000\)
			String tmp = this.format.substring(this.format.indexOf(";"));
			if(tmp.contains("Red")&&tmp.contains("-")){
				this.negativeIndex = 1;
			}else if(tmp.contains("(")){
				if(!tmp.contains("Red")){
					this.negativeIndex = 2;
				}else{
					this.negativeIndex=3;
				}
			}else if(tmp.contains("Red")){
				this.negativeIndex = 4;
			}
		}
		negativeList.setSelection(this.negativeIndex);
		

	}

	@Override
	protected void checkSubclass() {
		// Disable the check that prevents subclassing of SWT components
	}

	public String getFormat() {
		StringBuffer sbf = new StringBuffer();
		
		StringBuffer mainSbf = new StringBuffer();
		//千分位
		if(isThousands){
			mainSbf.append("#,##");
		}
		//小数
		mainSbf.append("0");
		if(this.decimal>0){
			mainSbf.append(".");
			for (int i = 0; i < this.decimal; i++) {
				mainSbf.append("0");
			}
		}
		sbf.append(mainSbf);
		

		
		//		负数
		if(this.negativeIndex!=0){
			boolean isPos = this.negativeIndex==4;//显示为红色正数
			boolean hasBracket = this.negativeIndex==2||this.negativeIndex==3;
		
			sbf.append(isPos?"":(hasBracket?"_)":"_ "));
			sbf.append(";");
			//红色
			if(this.negativeIndex==1 || this.negativeIndex==3||this.negativeIndex==4){
				sbf.append("[Red]");
			}
			sbf.append(isPos?"":(hasBracket?"\\(":"\\-"));
			sbf.append(mainSbf.toString());
			sbf.append(isPos?"":(hasBracket?"\\)":"\\ "));
		}else{
			sbf.append("_ ");
		}
		
		return sbf.toString();
	}

}
