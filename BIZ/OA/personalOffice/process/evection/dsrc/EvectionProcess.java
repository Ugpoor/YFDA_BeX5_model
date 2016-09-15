import com.justep.system.util.*;
import com.justep.system.process.*;
import com.justep.system.context.*;
import com.justep.system.opm.*;
import com.justep.system.data.*;
import com.justep.system.action.*;
import com.justep.model.*;
import com.justep.oa.OACommon;

public class EvectionProcess {

	public static void evectionProcessAfterSaveOA_EvectionAction() {
		Table table = (Table)ContextHelper.getActionContext().getParameter("table");
		com.justep.oa.OACommon.updateSocial(table);		
	}
}