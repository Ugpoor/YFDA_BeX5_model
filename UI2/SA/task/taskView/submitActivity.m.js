define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.li2Click = function(event) {
		var row = event.bindingContext.$object;
		var task = row.val("SA_Task");
		var process = row.val("sProcess");
		/*var activity = row.val("sActivity");*/
		var url = row.val("sCURL");
		if (url.charAt(0) === "/"){
			if (url.indexOf(".a") !== -1){
				url = "$UI" + url;
			}else{
				url = "$model/UI" + url;
			}
		}
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "_pagePattern=readonly" + "&process=" + process + "&task=" + task;
		justep.Shell.showPage({url:url, title: row.val("sName")});						
	};

	Model.prototype.modelActive = function(event){
		var data = this.comp("taskData");
		if (data){
			data.refreshData();
		}
	};

	return Model;
});
