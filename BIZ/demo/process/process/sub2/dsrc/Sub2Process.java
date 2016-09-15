import com.justep.process.master.MasterProcessUtils;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.Task;

public class Sub2Process {

	public static void sub2ProcessAfterFinish() {
		Task task = ProcessUtils.getTaskInProcessContext();
		MasterProcessUtils.resumeMaster(task.getFlow());
	}
}