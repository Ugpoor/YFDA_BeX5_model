import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.List;

/**
 * 日期配置页
 * @author xiangyaohua
 *
 */
public class ReportCellDateFormatComposite extends Composite implements IReportCellFormatComposite{

	private List typeList;
	private String format;
	private int typeIndex;
	public final static String[] types = new String[]{
			"yyyy/m/d", /**yyyy/m/d;@**/
			"yyyy&quot;年&quot;m&quot;月&quot;d&quot;日&quot;;@", /** yyyy&quot;年&quot;m&quot;月&quot;d&quot;日&quot;;@ **/
			"[DBNum1][$-804]yyyy&quot;年&quot;m&quot;月&quot;d&quot;日&quot;;@",
			"[DBNum1][$-804]yyyy&quot;年&quot;m&quot;月&quot;;@",
			"[DBNum1][$-804]m&quot;月&quot;d&quot;日&quot;;@",
			"yyyy&quot;年&quot;m&quot;月&quot;;@",
			"m&quot;月&quot;d&quot;日&quot;;@",
			"[$-804]dddd;@",
			"[$-804]ddd;@",
			
			"[$-409]yyyy/m/d h:mm AM/PM;@",
			"yyyy/m/d h:mm;@",
			"yy/m/d;@",
			"m/d;@",
			"m/d/yy;@",
			"mm/dd/yy;@",
			"[ENG][$-409]d/mmm;@",
			"[ENG][$-409]d/mmm/yy;@",
			"[ENG][$-409]mmm/yy;@",
			"[ENG][$-409]mmmm/yy;@",
			"[$-409]mmmmm;@",
			"[$-409]mmmmm/yy;@"
	};
	
	private String[] typeLabels = new String[]{
			"2001-3-14",
			"2001年3月14日",
			"二〇〇一年三月十四日",
			"二〇〇一年三月",
			"三月十四日",
			"2001年3月",
			"3月14日",
			"星期三",
			"三",
			
			"2001-3-14 1:30 PM",
			"2001-3-14 13:30",
			"01-3-14",
			"3-14",
			"3-14-01",
			"03-14-01",
			"14-Mar",
			"14-Mar-01",
			"Mar-01",
			"March-01",
			"M",
			"M-01"
	};
	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellDateFormatComposite(Composite parent, int style,String format) {
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
