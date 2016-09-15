package com.justep.doc.attachment;

import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;

@Deprecated
public class DocLinkDir {

	private Row info;

	public DocLinkDir(Row info) {
		this.info = info;
	}

	public ModifyState getState() {
		return info.getState();
	}

	public String getsID() {
		return info.getString("SA_DocNode");
	}

	public void setsID(String sID) {
		info.setString("SA_DocNode", sID);
	}

	public String getsParentID() {
		return info.getString("sParentID");
	}

	public void setsParentID(String sParentID) {
		info.setString("sParentID", sParentID);
	}

	public String getsDocName() {
		return info.getString("sDocName");
	}

	public void setsDocName(String sDocName) {
		info.setString("sDocName", sDocName);
	}

	public String getsKind() {
		return info.getString("sKind");
	}

	public void setsKind(String sKind) {
		info.setString("sKind", sKind);
	}

	public String getsDocPath() {
		return info.getString("sDocPath");
	}

	public void setsDocPath(String sDocPath) {
		info.setString("sDocPath", sDocPath);
	}

	public String getsDocDisplayPath() {
		return info.getString("sDocDisplayPath");
	}

	public void setsDocDisplayPath(String sDocDisplayPath) {
		info.setString("sDocDisplayPath", sDocDisplayPath);
	}

	public String getIsLinked() {
		return info.getString("is_linked");
	}

	public void setIsLinked(String isLinked) {
		info.setString("is_linked", isLinked);
	}

	public String getIsExist() {
		return info.getString("is_exist");
	}

	public void setIsExist(String isExist) {
		info.setString("is_exist", isExist);
	}

}
