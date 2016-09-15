package com.justep.doc;

import com.justep.system.data.Row;

public class DocServerDefine {
	private Row info;
	private DocServerDefines defines;

	public DocServerDefine(Row info, DocServerDefines docServerDefines) {
		this.defines = docServerDefines;
		this.info = info;
	}

	public String getsRootDocId() {
		return info.getString("SA_DocNode");
	}

	public String getsID() {
		return info.getString("SA_DocNameSpace");
	}

	public void setsID(String sID) {
		info.setString("SA_DocNameSpace", sID);
	}

	public String getsDisplayName() {
		return info.getString("sDisplayName");
	}

	public void setsDisplayName(String sDisplayName) {
		info.setString("sDisplayName", sDisplayName);
	}

	public String getsUrl() {
		String sUrl = info.getString("sUrl");
		if (sUrl != null && sUrl.endsWith("/")) {
			return sUrl.substring(0, sUrl.length() - 1);
		}
		return sUrl;
	}

	public void setsUrl(String sUrl) {
		info.setString("sUrl", sUrl);
	}

	public String getsAccessMode() {
		return info.getString("sAccessMode");
	}

	public void setsAccessMode(String sAccessMode) {
		info.setString("sAccessMode", sAccessMode);
	}

	public int getsFlag() {
		return info.getInt("sFlag");
	}

	public void setsFlag(int sFlag) {
		info.setInt("sFlag", sFlag);
	}

	public DocServerDefines getDefines() {
		return defines;
	}
}
