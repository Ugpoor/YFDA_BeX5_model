import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.ExtendedModifyEvent;
import org.eclipse.swt.custom.ExtendedModifyListener;
import org.eclipse.swt.custom.StyledText;
import org.eclipse.swt.widgets.Composite;

public class SQLTextArea extends StyledText {

	public SQLTextArea(Composite parent, int style) {
		super(parent, style | SWT.V_SCROLL);
		this.setWordWrap(true);
		this.addExtendedModifyListener(new ExtendedModifyListener() {
			public void modifyText(ExtendedModifyEvent event) {
				SQLUtils.highLight(SQLTextArea.this, 0, 0);
			}
		});
		
	}

	
}
