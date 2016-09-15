/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("w!$UI/system/service/doc/office/officeEditorDialog.w");
	var justep = require('$UI/system/lib/justep'),
	WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog"),
	WindowOpener = require("$UI/system/components/justep/windowOpener/windowOpener"),
	$ = require('jquery');
	return {
		parentNode : $('body').find('.window').get(0),
		docInfoDialog : null,
		openDocInfoDialog : function(data, afterEnsureFun, caller) {
			if (!this.docInfoDialog) {
				this.docInfoDialog = new WindowDialog("docInfoDialog", "/system/service/doc/dialog/docInfoDialog.w", "文件属性", true, null, 544, 545, 0, 0, true);
				this.docInfoDialog.on("onSend", function(event) {
					return this.data;
				}, this.docInfoDialog);
				this.docInfoDialog.on("onReceive", function(event) {
					afterEnsureFun.call(caller, event);
				}, this.docInfoDialog);
			}
			this.docInfoDialog.data = data;
			this.docInfoDialog.open();
		},
		dirInfoDialog : null,
		openDocDirInfoDialog : function(data, afterEnsureFun, caller) {
			if (!this.dirInfoDialog) {
				this.dirInfoDialog = new WindowDialog("docInfoDialog", "/system/service/doc/dialog/dirInfoDialog.w", "文件夹属性", true, null, 440, 525, 0, 0, true);
				this.dirInfoDialog.on("onSend", function(event) {
					return this.data;
				}, this.dirInfoDialog);
				this.dirInfoDialog.on("onReceive", function(event) {
					afterEnsureFun.call(caller, event);
				}, this.dirInfoDialog);
			}
			this.dirInfoDialog.data = data;
			this.dirInfoDialog.open();
		},
		historyDialog : null,
		openDocHistoryDialog : function(docID, fileID, docPath, access, isPrint) {
			if (!this.historyDialog) {
				var url = require.toUrl("$UI/system/service/doc/dialog/docHistoryDialog.w");
				this.historyDialog = new WindowDialog({
						title : '历史版本',
						forceRefreshOnOpen:true,
						showTitle : true,
						status: '',
						src : url,
						parentNode : this.parentNode
				});
			}
			this.historyDialog.open({data:{
				docID : docID,
				fileID : fileID,
				docPath : docPath,
				access : access,
				isPrint : isPrint
			}});
		},
		downloadHistoryDialog : null,
		openDocDownloadHistoryDialog : function(docID) {
			if (!this.downloadHistoryDialog) {
				this.downloadHistoryDialog = new WindowDialog("docDownloadHistoryDialog", "/system/service/doc/dialog/docDownloadHistoryDialog.w", "下载记录", true, true, 644, 445, 0, 0, true);
				this.downloadHistoryDialog.on("onSend", function(event) {
					return this.data;
				}, this.downloadHistoryDialog);
			}
			this.downloadHistoryDialog.data = {
				docID : docID
			};
			this.downloadHistoryDialog.open();
		},
		templateDialog : null,
		openDocTemplateDialog : function(data, afterSelectFun, caller) {
			if (!this.templateDialog) {
				var url = require.toUrl("$UI/system/service/doc/dialog/docTemplateDialog.w");
				this.templateDialog = new WindowDialog({
						title : "模版选择",
						forceRefreshOnOpen:true,
						showTitle : true,
						status: '',
						src : url,
						parentNode : this.parentNode
				});
				this.templateDialog.on("onReceive", function(event) {
					afterSelectFun.call(caller, event);
				});
			}
			this.templateDialog.open({
				data:data
			});
		},
		officeFieldDialog : null,
		openOfficeFieldDialog : function(data, afterSelectFun, caller) {
			if (!this.officeFieldDialog) {
				this.officeFieldDialog = new WindowDialog("officeFieldDialog", "/system/service/doc/office/officeViewerFieldDialog.w", "文档域编辑", true, null, 550, 350, 0, 0, true);
				this.officeFieldDialog.on("onSend", function(event) {
					return this.data;
				}, this.officeFieldDialog);
				this.officeFieldDialog.on("onReceive", function(event) {
					afterSelectFun.call(caller, event);
				}, this.officeFieldDialog);
			}
			this.officeFieldDialog.data = data;
			this.officeFieldDialog.open();
		},
		getOfficeEditorUrl : function(customUrl) {
			var url = window.location.protocol + "//" + window.location.host
					+ require.toUrl((customUrl || "$UI/system/service/doc/office/officeEditorDialog.w") + "?process=/SA/doc/system/systemProcess&activity=mainActivity");
			return url;
		},
		openOfficeEditorDialog : function(callback, OVP, caller) {
			var self = this;
			if (!caller.officeEditor) {
				var option = {
					url : self.getOfficeEditorUrl(caller ? caller.officeEditorUrl : ""),
					modal : "true",
					resizable : "true",
					status : "fullscreen"
				};
				caller.officeEditor = new WindowOpener(option);
			}
			if (caller.officeEditor) {
				caller.officeEditor.off("onReceive", caller.officeEditor._callback, self);
				caller.officeEditor._callback = callback;
				caller.officeEditor.on("onReceive", callback, self);
				caller.officeEditor.open({
					data : JSON.stringify(OVP)
				});
			}
		}
	}
});
