/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.button1Click = function(event) {
		var dlg = this.comp('orgDialog');
		dlg.open();
		// dlg.open({data:{selected:{kind:'sName',value:[]}}});//通过传参数方式可以控制选中
	};
	Model.prototype.orgDialogReceive = function(event) {
		var rows = event.data;
		var orgData = this.comp('OrgData');
		orgData.clear();
		for ( var i in rows) {
			orgData.add({
				fID : rows[i].val('SA_OPOrg'),
				fName: rows[i].val('sName'),
				fFID: rows[i].val('sFID')
			});
		}
	};
	Model.prototype.showOrgDialogSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/org/demo/orgDialog.w&xid=orgDialog"
		});
	};
	Model.prototype.showJsSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/components/justep/org/demo/orgDialog.js"
		});
	};
	Model.prototype.closeWin = function(event) {
		justep.Shell.closePage();
	};
	Model.prototype.modelLoad = function(event){
		var isPC = justep.Browser.isPC;
		if (isPC) {
			this.comp("windowDialog").set({'status':'normal'});
		}
	};
	return Model;
});