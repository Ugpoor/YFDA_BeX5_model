package com.justep.doc.attachment;

import com.justep.doc.AbstractDoc;
import com.justep.doc.exception.DocRTException;
import com.justep.message.DocMessages;
import com.justep.system.data.Row;
import com.justep.util.Utils;

public class Attachment extends AbstractDoc {

	private Attachments attachments;
	private DocLinkAttachments docLinkAttachments;

	public DocLinkAttachments getDocLinkAttachments() {
		return docLinkAttachments;
	}

	public Attachment(Row info, Attachments attachments) {
		super(info);
		this.attachments = attachments;
	}

	public Attachment(Row info, DocLinkAttachments docLinkAttachments) {
		super(info);
		this.docLinkAttachments = docLinkAttachments;
	}

	public Attachments getAttachments() {
		return attachments;
	}

	public String toJsonString() {
		return "{" + "\"docID\":\"" + getsID() + "\",\"docName\":\"" + getsDocName() + "\",\"size\":" + getsSize() + ",\"fileID\":\"" + getsFileID()
				+ "\",\"docPath\":\"" + getsDocPath() + "\",\"time\":\"" + com.justep.system.util.CommonUtils.getCurrentDateTime().toString() + "\"}";
	}

	@Override
	protected void checkDownloadAccess() {
		if (Utils.isNotNull(attachments)) {
			Integer access = attachments.getDefineItems().getAccess();
			if (access <= 1)
				throw new DocRTException(DocMessages.NODOWNLOADPERMISSION);
		}
	}
}
