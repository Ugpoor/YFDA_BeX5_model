define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/system/lib/base/baas");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		// 新增分类数据并给出默认值
		this.comp("classData").newData({
			"defaultValues" : [ {
				"fID" : justep.UUID.createUUID(),
				"fType" : "支出"
			} ]
		});
	};

	Model.prototype.deleteBtnClick = function(event) {
		// 行删除
		var row = event.bindingContext.$object;
		this.comp("classData").deleteData(row);
	};

	Model.prototype.classDataCustomRefresh = function(event){
		var data = event.source;
		Baas.sendRequest({
			"url" : "/justep/account", 
			"action" : "queryAccount_class", 
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

	Model.prototype.classDataCustomSave = function(event){
		var data = event.source;
		var data2 = data.toJson({onlyChanged:true,excludeCalculateCol:true});
		data2.userdata["tableName"] = 'account_class';
		var saveParam = {};
		saveParam.tables = [];
		saveParam.tables.push(data2);

		Baas.sendRequest({
			"url" : "/justep/account", 
			"action" : "saveAccount_class", 
			"params" : saveParam
		});
	};

	Model.prototype.classDataSaveCommit = function(event){
		// 通过Shell发出一个消息，通知其他页面分类数据已改变，并且在消息中携带了改变后的分类数据
		var classData = this.comp("classData");
		justep.Shell.fireEvent("onClassChanged", {
			"classData" : classData.toJson()
		});
	};

	return Model;
});