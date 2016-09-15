import com.justep.system.context.ContextHelper;
import com.justep.system.process.TemplateHelper;


public class ProcessTemplateFn {
	public static String findTemplateByPerson(String personID){
		return TemplateHelper.findTemplateByPerson(personID, ContextHelper.getActionContext().getProcess().getFullName());
	}
	
	public static String findTemplateByPersonMember(String fid){
		return TemplateHelper.findTemplateByPersonMember(fid, ContextHelper.getActionContext().getProcess().getFullName());
	}
	
	public static String findTemplateByCurrentPerson(){
		return TemplateHelper.findTemplateByCurrentPerson(ContextHelper.getActionContext().getProcess().getFullName());
	}

	public static String findTemplateByCurrentPersonMember(){
		return TemplateHelper.findTemplateByCurrentPersonMember(ContextHelper.getActionContext().getProcess().getFullName());
	}
}
