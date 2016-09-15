package com.justep.doc;

import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.util.Utils;

public class Doc extends AbstractDoc {

	private Docs docs;
		
	public Doc(Row info, Docs docs) {
		super(info);
		this.docs = docs;
	}

	public Docs getDocs() {
		return docs;
	}

	public ModifyState getState() {
		return docs.getIsLogicDelete() && getsFlag() == 0 ? ModifyState.DELETE : info.getState();
	}

	public void setState(ModifyState state) {
		if (docs.getIsLogicDelete() && state == ModifyState.DELETE) {
			info.setState(ModifyState.EDIT);
			setsFlag(0);
			return;
		}
		info.setState(state);
	}

	@Override
	protected void checkDownloadAccess() {
		if (Utils.isNotNull(docs) && Utils.isNotNull(docs.getPermissions())) {
			DocPermission p = docs.getPermissions().queryPermissionById(getsID(), getsDocPath());
			if (p.getsAccess() <= 1)
				throw new DocRTException(DocMessages.NODOWNLOADPERMISSION);
		}
	}

}
