import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;

/**
 * 时间配置页
 * @author xiangyaohua
 *
 */
public class ReportCellTimeFormatComposite extends Composite implements IReportCellFormatComposite{

	private List typeList;
	private String format;
	private int typeIndex;
	public final static String[] types = new String[]{
		"h:mm:ss;@",
		"h:mm;@",
		"[$-409]h:mm AM/PM;@",
		"[$-409]h:mm:ss AM/PM;@",
		
		"h&quot;时&quot;mm&quot;分&quot;;@",
		"h&quot;时&quot;mm&quot;分&quot;ss&quot;秒&quot;;@",
		"AM/PMh&quot;时&quot;mm&quot;分&quot;;@",
		"AM/PMh&quot;时&quot;mm&quot;分&quot;ss&quot;秒&quot;;@",
		"[DBNum1][$-804]h&quot;时&quot;mm&quot;分&quot;;@",
		"[DBNum1][$-804]AM/PMh&quot;时&quot;mm&quot;分&quot;;@"
	};
	
	private String[] typeLabels = new String[]{
		"13:30:55",
		"13:30",
		"1:30 PM",
		"1:30:55 PM",
		
		"13时30分",
		"13时30分55秒",
		"下午1时30分",
		"下午1时30分55秒",
		"十三时三十分",
		"下午一时三十分"
	};
	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellTimeFormatComposite(Composite parent, int style,String format) {
		super(parent, style);
		this.format =format;
		final GridLayout gridLayout = new GridLayout();
		setLayout(gridLayout);
	


		final Label label_1 = new Label(this, SWT.NONE);
		label_1.setLayoutData(new GridData());
		label_1.setText("类型:");

		typeList = new List(this, SWT.V_SCROLL | SWT.BORDER);
		final GridData gd_typeList = new GridData(SWT.FILL, SWT.CENTER, false, false);
		gd_typeList.heightHint = 145;
		gd_typeList.widthHint = 142;

		typeList.setLayoutData(gd_typeList);
		//负数
		for (String label : typeLabels) {
			typeList.add(label);
		}
		typeList.select(this.typeIndex);
		
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
				break;
			}
		}
		typeList.select(this.typeIndex);
		

	}

	@Override
	protected void checkSubclass() {
		// Disable the check that prevents subclassing of SWT components
	}

	public String getFormat() {
		return this.types[this.typeIndex];
	}

}
