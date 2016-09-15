define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.agentDataBeforeRefresh = function(event) {
		var data = event.source;
		data.setFilter("personFilter", "SA_OPAgent.sOrgFID like '%/" + this.getContext().getOperatorID() + "@%'");
	};

	Model.prototype.agentTableCellRender = function(event) {
		if (event.colName == "sValidState") {
			event.html = (event.colVal == 1) ? "有效" : "取消"
		} else if (event.colName == "sCanTranAgent") {
			event.html = (event.colVal == 1) ? "是" : "否"
		}
	};

	Model.prototype.newBtnClick = function(event) {
		this.comp("agentDetailDialog").open({
			"data" : {
				"openMode" : "new",
				"isMyself" : true
			}
		});
	};

	Model.prototype.editBtnClick = function(event) {
		var agentData = this.comp("agentData");
		if (agentData.getRowID()) {
			this.comp("agentDetailDialog").open({
				"data" : {
					"openMode" : "edit",
					"isMyself" : true,
					"agentID" : agentData.getRowID()
				}
			});
		}
	};

	Model.prototype.agentDetailDialogReceive = function(event){
		var agentData = this.comp("agentData");
		agentData.refreshData();
		var row = agentData.getRowByID(event.data.agentID);
		if (row) {
			agentData.to(row);
		}
	};

	Model.prototype.deleteBtnClick = function(event){
		var agentData = this.comp("agentData");
		var agentTable = this.comp("agentTable");
		var rows = agentTable.getCheckeds();
		if (rows.length > 0) {
			justep.Util.confirm("确实要删除选择的委托代理？", function() {
				agentData.deleteData(rows);
			});
		}
	};

	Model.prototype.modelLoad = function(event){
		if (this.getContext().getCurrentPersonID() != this.getContext().getOperatorID()) {
			justep.Util.hint("代理模式下不能使用个人委托代理功能", {"type": "danger"});
			window.setTimeout(function(){justep.Shell.closePage();}, 1);
		}
	};

	return Model;
});