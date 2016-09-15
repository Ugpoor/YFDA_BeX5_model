define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		// 调用对话框新增
		this.comp("detailDialog").open({
			"data" : {
				"operator" : "new"
			}
		});
	};

	Model.prototype.listLineClick = function(event) {
		// 调用对话框编辑，并传入当前行数据
		var row = event.bindingContext.$object;
		this.comp("detailDialog").open({
			"data" : {
				"operator" : "edit",
				"rowData" : row.toJson()
			}
		});
	};

	Model.prototype.deleteBtnClick = function(event) {
		// 行删除
		var data = this.comp("accountData");
		var row = event.bindingContext.$object;
		data.deleteData([ row ], {
			"async" : true,
			"onSuccess" : function() {
				data.saveData();
			}
		});
	};

	Model.prototype.detailDialogReceived = function(event) {
		// 对话框返回后保存数据
		this.comp("accountData").saveData();
	};

	Model.prototype.settingBtnClick = function(event) {
		// 通过Shell显示左边的设置
		justep.Shell.showLeft();
	};

	return Model;
});