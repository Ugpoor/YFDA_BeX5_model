define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/system/lib/base/baas");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event){
		// 对话框接收参数后，新增或编辑
		var accountData = this.comp("accountData");
		accountData.clear();
		this.operator = event.params.operator;
		if (this.operator == "new") {
			accountData.newData({
				"defaultValues" : [ {
					"fID" : justep.UUID.createUUID(),
					"fCreateTime" : new Date(),
					"fDate" : new Date(),
					"fType" : "支出",
					"fClass" : this.getDefaultClass("支出")
				} ]
			});
		} else if (this.operator == "edit") {
			accountData.loadData([ event.params.rowData ]);
			accountData.first();
		}
	};

	// 获取指定类型下第一个分类作为默认分类
	Model.prototype.getDefaultClass = function(type) {
		var classData = this.comp("classData");
		var rows = classData.find([ "fType" ], [ type ]);
		return rows.length > 0 ? rows[0].val("fClass") : "";
	};

	Model.prototype.accountDataValueChanged = function(event) {
		// 当类型改变时，分类也要同时改变
		if (event.col == "fType") {
			event.row.val("fClass", this.getDefaultClass(event.value));
		}
	};

	Model.prototype.okBtnClick = function(event) {
		// 确定后返回当前行，用于windowDialog的mapping映射
		var accountData = this.comp("accountData");
		this.owner.send(accountData.getCurrentRow());
	};

	Model.prototype.onClassChanged = function(event) {
		this.comp("classData").clear();
		this.comp("classData").loadData(event.classData, true, null, null, true);
	};
	
	Model.prototype.modelLoad = function(event) {
		// 通过Shell的消息总线，挂接分类改变的消息，接收到后加载改变后的分类数据
		justep.Shell.on("onClassChanged", this.onClassChanged, this);
	};

	Model.prototype.modelUnLoad = function(event){
		justep.Shell.off("onClassChanged", this.onClassChanged);
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

	return Model;
});