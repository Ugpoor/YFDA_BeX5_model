import java.util.ArrayList;
import java.util.Collection;

import com.justep.common.SystemUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.OrgUtils;
import com.justep.system.social.SocialUtils;


public class SocialProcedure {
	public static void clearMessageNumber(String personID, String data){
		SocialUtils.clearMessageNumber(personID, data);
	}
	
	public static void updateMessageNumber(String data, String personID){
		if (SystemUtils.isEmptyString(personID)){
			personID = ContextHelper.getPersonMemberWithAgent().getPerson().getID();
		}
		Collection<String> exIncludeFidOrPersonIDs = new ArrayList<String>();
		exIncludeFidOrPersonIDs.add(personID);
		SocialUtils.updateMessageNumber(data, exIncludeFidOrPersonIDs);
	}
	
	public static void updateFocus(String name, String fid, String fname, String data, int focus, String process, String activity, String url){
		String fidOrPersonID = OrgUtils.getPersonIDByFID(fid);
		if (SystemUtils.isEmptyString(fidOrPersonID))
			fidOrPersonID = fid;
		if (SocialUtils.hasFocus(fidOrPersonID, data)){
			SocialUtils.updateFocus(fidOrPersonID, data, focus);
		}else{
			SocialUtils.addFocus(name, fid, fname, data, focus, process, activity, url);
		}
	}

}
