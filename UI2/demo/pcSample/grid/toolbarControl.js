define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.employeeDataCustomRefresh = function(event) {
		var employee = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/employee.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				employee.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};

	// 动态禁用按钮
	Model.prototype.dynamicForbiddenClick = function(event) {
		$(this.comp('exportAll').$domNode).attr("disabled", true);
	};

	// 动态启用按钮
	Model.prototype.dynamicEnableClick = function(event) {
		$(this.comp('exportAll').$domNode).attr("disabled", false);
	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/toolbarControl.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		this.comp('popMenu').show();
	};
	//源码
	Model.prototype.firstSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/toolbarControl.w&xid=firstToolBar"
		},true);
	};
	//源码
	Model.prototype.secondSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/toolbarControl.w&xid=secondToolBar"
		},true);
	};
	//源码
	Model.prototype.thirdSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/toolbarControl.w&xid=thirdToolBar"
		},true);
	};

	return Model;
});