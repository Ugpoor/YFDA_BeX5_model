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
		url += "_pagePattern=readonly" + "&process=" + process + "&task=" + task + "&activity=" + url.substring(url.lastIndexOf("/")+1, url.lastIndexOf("."));;
		url = this.addTaskData(url, row);
		justep.Shell.showPage({url:url, title: row.val("sName")});						
	};

	Model.prototype.modelActive = function(event){
		var data = this.comp("taskData");
		if (data){
			data.refreshData();
		}
	};
	
	Model.prototype.addTaskData = function(url, row){
		var data1 = row.val("sData1") || "";
		var data2 = row.val("sData2") || "";
		var data3 = row.val("sData3") || "";
		var data4 = row.val("sData4") || "";
		if (data1){
			url += "&sData1=" + data1;
		}
		if (data2){
			url += "&sData2=" + data2;
		}
		if (data3){
			url += "&sData3=" + data3;
		}
		if (data4){
			url += "&sData4=" + data4;
		}
		return url;
	}
	
	Model.prototype.modelLoad = function(event){
		if(window.__justep.__portalContext && window.__justep.__portalContext.data.submitTasks){
			this.comp("taskData").loadData(window.__justep.__portalContext.data.submitTasks.data.value);
			this.comp("taskData").autoLoad = true;
			this.comp("list").refresh();
			delete window.__justep.__portalContext.data.submitTasks;
		}else{
			this.comp("list").refresh();
		}
	};

	return Model;
});
