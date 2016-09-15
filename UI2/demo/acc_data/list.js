define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/system/lib/base/baas");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		// 调用对话框新增
		this.comp("detailDialog").open({
			"params" : {
				"operator" : "new"
			}
		});
	};

	Model.prototype.listLineClick = function(event) {
		// 调用对话框编辑，并传入当前行数据
		var row = event.bindingContext.$object;
		this.comp("detailDialog").open({
			"params" : {
				"operator" : "edit",
				"rowData" : row.toJson()
			}
		});
	};

	Model.prototype.deleteBtnClick = function(event) {
		// 行删除
		var data = this.comp("accountData");
		var row = event.bindingContext.$object;
		data.deleteData(row);
		data.saveData();
	};

	Model.prototype.detailDialogReceived = function(event) {
		// 对话框返回后保存数据
		this.comp("accountData").saveData();
	};

	Model.prototype.settingBtnClick = function(event) {
		// 通过Shell显示左边的设置
		justep.Shell.showLeft();
	};

	Model.prototype.accountDataCustomRefresh = function(event){
		var data = event.source;
		Baas.sendRequest({
			"url" : "/justep/account", 
			"action" : "queryAccount", 
			"params" : {
				"columns" : Baas.getDataColumns(data), 
				"limit" : event.limit,
				"offset" : event.offset
			}, 
			"success" : function(resultData) {
				var append = event.options && event.options.append;
				data.loadData(resultData, append);
			} 
		});	
	};

	Model.prototype.accountDataCustomSave = function(event){
		var data = event.source;
		var data2 = data.toJson({onlyChanged:true,excludeCalculateCol:true});
		data2.userdata["tableName"] = 'account';  //写入表名
		var saveParam = {};
		saveParam.tables = [];
		saveParam.tables.push(data2);

		Baas.sendRequest({
			"url" : "/justep/account", 
			"action" : "saveAccount", 
			"params" : saveParam
		});	
	};

	Model.prototype.accountDataBeforeNew = function(event){
		event.option.index = 0;

	};

	return Model;
});