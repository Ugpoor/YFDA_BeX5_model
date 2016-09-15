import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;
import org.eclipse.swt.widgets.Spinner;

/**
 * 货币格式化配置页
 * @author xiangyaohua
 * 
 *
 */
public class ReportCellCurrencyFormatComposite extends Composite implements IReportCellFormatComposite{

	private List negativeList;
	private Spinner decimalText;
	private String format;
	private Combo unitList ;
	
	private int decimal; 
	private String unitStr;
	private int negativeIndex;
	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellCurrencyFormatComposite(Composite parent, int style,String format) {
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
		
		final Label label1 = new Label(this, SWT.NONE);
		label1.setText("货币符号:");
		
		unitList = new Combo(this, SWT.BORDER|SWT.READ_ONLY);
		final GridData gd_unitList = new GridData(SWT.LEFT, SWT.CENTER, false, false);
		unitList.setLayoutData(gd_unitList);
//		CNY #	USD #	HKD #	EUR #S
//		unitList.add("无");
		unitList.add("￥");
		unitList.add("$");
		unitList.add("CNY");
		unitList.add("USD");
		unitList.add("HKD");
		unitList.add("EUR");
		unitList.select(0);
		this.unitStr = "￥";

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
		
		unitList.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				unitStr = unitList.getText();
			}
		});
		
		negativeList.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent arg0) {
				negativeIndex = negativeList.getSelectionIndex();
			}
		});
		
	}

	private void initData(){
//	    &quot;￥&quot;	#,##0.00		;			&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00	_)	;\(			&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00	_)	;[Red]\(	&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;		#,##0.00
		
//		\$				#,##0.00		;\-			\$					#,##0.00
//		\$				#,##0.00		;[Red]\-	\$					#,##0.00
//		\$				#,##0.00	_)	;[Red]\(	\$					#,##0.00	\)
//		\$				#,##0.00	_)	;\(			\$					#,##0.00	\)
//		\$				#,##0.00		;[Red]		\$					#,##0.00
		
//		[$ZWD]\空		#,##0.00		;			[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00	_)	;\(			[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00	_)	;[Red]\(	[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空			#,##0.00
		
		String tmpFormat = this.format;
		tmpFormat = tmpFormat.replace("&quot;", "\"");
		
		//货币单位
		String[] units = this.unitList.getItems();
		for (int i = units.length-1; i >0; i--) {
			if(this.format.contains(units[i])){
				this.unitList.select(i);
				break;
			}
		}
		
		//小数位数
		this.decimal = 0;
		int decimalBegin = tmpFormat.indexOf(".");
		if(decimalBegin!=-1){
			int decimalEnd = tmpFormat.indexOf("_");
			if(decimalEnd==-1){
				decimalEnd=tmpFormat.indexOf(";"); 
			}
			this.decimal = decimalEnd-decimalBegin-1;
		}
		this.decimalText.setSelection(this.decimal);
		
		this.negativeIndex = 0;

		if(tmpFormat.contains(";")){

			String tmp = tmpFormat.substring(tmpFormat.indexOf(";"));
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

//	    &quot;￥&quot;	#,##0.00		;			&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00	_)	;\(			&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00	_)	;[Red]\(	&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;		#,##0.00
		
//		\$				#,##0.00		;\-			\$					#,##0.00
//		\$				#,##0.00		;[Red]\-	\$					#,##0.00
//		\$				#,##0.00	_)	;[Red]\(	\$					#,##0.00	\)
//		\$				#,##0.00	_)	;\(			\$					#,##0.00	\)
//		\$				#,##0.00		;[Red]		\$					#,##0.00
		
//		[$ZWD]\空		#,##0.00		;			[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00	_)	;\(			[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00	_)	;[Red]\(	[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空			#,##0.00
		
		boolean isPos = this.negativeIndex==4;//显示为红色正数
		boolean hasBracket = this.negativeIndex==2||this.negativeIndex==3;
		boolean isRed = this.negativeIndex==1||this.negativeIndex==3||this.negativeIndex==4;
		boolean hasNegative = this.negativeIndex==0||this.negativeIndex==1;
		
		//货币单位
		if(this.unitStr.equals("￥")){
			unitStr = "&quot;￥&quot;";
		}else if(this.unitStr.equals("$")){
			unitStr = "\\$";
		}else{
			unitStr = "[$"+unitStr+"]\\ ";;
		}
		sbf.append(unitStr);
		
		
		//分数小数
		mainSbf.append("#,##");
		mainSbf.append("0");
		if(this.decimal>0){
			mainSbf.append(".");
			for (int i = 0; i < this.decimal; i++) {
				mainSbf.append("0");
			}
		}
		sbf.append(mainSbf);
		if(hasBracket){
			sbf.append("_)");
		}
		sbf.append(";");
		
//	    &quot;￥&quot;	#,##0.00		;			&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;	\-	#,##0.00
//	    &quot;￥&quot;	#,##0.00	_)	;\(			&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00	_)	;[Red]\(	&quot;￥&quot;		#,##0.00	\)
//		&quot;￥&quot;	#,##0.00		;[Red]		&quot;￥&quot;		#,##0.00
		
//		\$				#,##0.00		;\-			\$					#,##0.00
//		\$				#,##0.00		;[Red]\-	\$					#,##0.00
//		\$				#,##0.00	_)	;[Red]\(	\$					#,##0.00	\)
//		\$				#,##0.00	_)	;\(			\$					#,##0.00	\)
//		\$				#,##0.00		;[Red]		\$					#,##0.00
		
//		[$ZWD]\空		#,##0.00		;			[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空		\-	#,##0.00
//		[$ZWD]\空		#,##0.00	_)	;\(			[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00	_)	;[Red]\(	[$ZWD]\空			#,##0.00	\)
//		[$ZWD]\空		#,##0.00		;[Red]		[$ZWD]\空			#,##0.00
		//负数
		if(isRed){
			sbf.append("[Red]");
		}
		if(hasBracket){
			sbf.append("\\(");
		}else if(hasNegative && this.unitStr.equals("$")){
			sbf.append("\\-");
		}
		sbf.append(unitStr);
		if(!this.unitStr.equals("$") && hasNegative){
			sbf.append("\\-");
		}
		sbf.append(mainSbf);
		
		if(hasBracket){
			sbf.append("\\)");
		}
		return sbf.toString();
	}

}
