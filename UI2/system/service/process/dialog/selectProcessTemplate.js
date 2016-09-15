define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");

	var Model = function() {
		this.callParent();
		this.process = "";
		this.type = "";
	};

	Model.prototype.OKBtnClick = function(event) {
		var dialogData = this.comp("dialogData");
		var result = {};
		if (dialogData.getCount() > 0){
			result.content = dialogData.getValue("sContent");
			result.content2 = dialogData.getValue("sContent2"); 
		}
		this.comp('windowReceiver').windowEnsure(result);
	};

	Model.prototype.windowReceiverReceive = function(event) {
		if (event.data) {
			this.process = event.data.process || "";
			this.type = event.data.type || "";
		} else {
			this.process = "";
			this.type = "";
		}
		this.comp("dialogData").refreshData();
	};

	Model.prototype.dialogDataRefreshCreateParam = function(event) {
		if (event.param) {
			var queryRange = "";
			if (this.type == "PROCESS_TEMPLATE") {
				// 新版本的流程模板查询所有的模板，不关联权限
				queryRange = "";
			} else {
				queryRange = "OWNER";
			}
			event.param.setString("queryRange", queryRange);
		} else {
			var msg = new justep.Message(justep.Message.JUSTEP230057);
			throw justep.Error.create(msg);
		}
	};

	Model.prototype.dialogDataBeforeRefresh = function(event) {
		var filter = "";
		if (this.type === "PROCESS_TEMPLATE") {
			filter = " SA_ProcessTemplate.sTypeID='PROCESS_TEMPLATE'";
		} else if (this.type === "graph") {
			filter = " SA_ProcessTemplate.sTypeID='graph' ";
		} else {
			filter = "(SA_ProcessTemplate.sTypeID='grid' or SA_ProcessTemplate.sTypeID is null)";
		}

		filter = "(" + filter + " and (SA_ProcessTemplate.sKindID='template') and (SA_ProcessTemplate.sProcess='" + this.process + "'))";
		event.source.setFilter("_customFilter", filter);
	};

	return Model;
});