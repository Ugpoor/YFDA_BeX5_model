import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Label;


public class ReportCellNormalFormatComposite extends Composite implements IReportCellFormatComposite{

	/**
	 * Create the composite
	 * @param parent
	 * @param style
	 */
	public ReportCellNormalFormatComposite(Composite parent, int style) {
		super(parent, style);

		final Label label = new Label(this, SWT.NONE);
		label.setText("常规单元格不包含任何特定\n格式,直接显示原始值。");
		label.setBounds(10, 10, 149, 27);
		//
	}

	@Override
	protected void checkSubclass() {
		// Disable the check that prevents subclassing of SWT components
	}

	public String getFormat() {
		// TODO Auto-generated method stub
		return null;
	}

}
