import com.justep.model.ModelUtils;
import com.justep.system.util.BizUtils;


public class ModelFn {
	public static String labelOf(String thing, String type) {
		return BizUtils.getLabel(thing, type);
	}
	
	public static String labelOf2(String thing, String type, String language) {
		return ModelUtils.getLabel(thing, type, language);
	}
	

}
