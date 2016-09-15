package com.justep.doc;

import java.sql.Timestamp;

import com.justep.system.data.Row;
import com.justep.util.Utils;

public class DocPermission {

	private Row info;
	private DocPermissions.DocPermissionsItem docPermissionsItem;
	private DocDirPermissions docDirPermissions;

	public DocPermission(Row info, DocPermissions.DocPermissionsItem docPermissionsItem) {
		this.info = info;
		this.docPermissionsItem = docPermissionsItem;
	}

	public DocPermission(Row info, DocDirPermissions docDirPermissions) {
		this.info = info;
		this.docDirPermissions = docDirPermissions;
	}

	protected DocPermission reRaload(Row info, DocPermissions.DocPermissionsItem docPermissionsItem) {
		this.info = info;
		this.docPermissionsItem = docPermissionsItem;
		return this;
	}

	public DocPermissions.DocPermissionsItem getDocPermissionsItem() {
		return docPermissionsItem;
	}

	public DocDirPermissions getDocDirPermissions() {
		return docDirPermissions;
	}

	public String getsID() {
		return info.getString("SA_DocAuth");
	}

	public void setsID(String sID) {
		info.setString("SA_DocAuth", sID);
	}

	public String getsDocPath() {
		return info.getString("sDocPath");
	}

	public void setsDocPath(String sDocPath) {
		info.setString("sDocPath", sDocPath);
	}

	public String getsAuthorizerFID() {
		return info.getString("sAuthorizerFID");
	}

	public void setsAuthorizerFID(String sAuthorizerFID) {
		info.setString("sAuthorizerFID", sAuthorizerFID);
	}

	public String getsAuthorizerName() {
		return info.getString("sAuthorizerName");
	}

	public void setsAuthorizerName(String sAuthorizerName) {
		info.setString("sAuthorizerName", sAuthorizerName);
	}

	public String getsAuthorizeeFID() {
		return info.getString("sAuthorizeeFID");
	}

	public void setsAuthorizeeFID(String sAuthorizeeFID) {
		info.setString("sAuthorizeeFID", sAuthorizeeFID);
	}

	public String getsAuthorizeeName() {
		return info.getString("sAuthorizeeName");
	}

	public void setsAuthorizeeName(String sAuthorizeeName) {
		info.setString("sAuthorizeeName", sAuthorizeeName);
	}

	public Timestamp getsGrantTime() {
		Timestamp t = info.getDateTime("sGrantTime");
		return Utils.isNull(t) ? t : com.justep.system.util.CommonUtils.getCurrentDateTime();
	}

	public void setsGrantTime(Timestamp sGrantTime) {
		info.setDateTime("sGrantTime", sGrantTime);
	}

	public int getsAccess() {
		return info.getInt("sAccess");
	}

	public void setsAccess(int sAccess) {
		info.setInt("sAccess", sAccess);
	}

}
