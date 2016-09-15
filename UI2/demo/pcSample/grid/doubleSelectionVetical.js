define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	//加载上表数据
	Model.prototype.aboveDataCustomRefresh = function(event) {
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
	//加载下表数据
	Model.prototype.bottomDataCustomRefresh = function(event) {
		var employee = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/employeeReserve.json'),
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
	//点击上表箭头
	Model.prototype.aboveGridRowClick = function(event) {
		if ($(event.domEvent.target).hasClass("icon-arrow-down-a")) {
			var row = this.comp('aboveData').getRowByID(event.rowID);
			this.comp('aboveData').deleteData(row);
			this.comp('bottomData').newData({
				defaultValues : [ {
					"name" : row.val("name"),
					"sex" : row.val("sex"),
					"dept" : row.val("dept"),
					"enducation" : row.val("enducation")

				} ]
			})
			this.comp('bottomGrid').refresh();

		}
	};
	//点击下表箭头
	Model.prototype.bottomGridRowClick = function(event) {
		if ($(event.domEvent.target).hasClass("icon-arrow-up-a")) {
			var row = this.comp('bottomData').getRowByID(event.rowID);
			this.comp('bottomData').deleteData(row);
			this.comp('aboveData').newData({
				defaultValues : [ {
					"name" : row.val("name"),
					"sex" : row.val("sex"),
					"dept" : row.val("dept"),
					"enducation" : row.val("enducation")

				} ]
			})
			this.comp('aboveGrid').refresh();

		}
	};
	//渲染单元格
	Model.prototype.aboveGridCellRender = function(event) {
		if (event.colVal == null) {
			event.html = "<a component='$model/UI2/system/components/justep/button/button' class='btn btn-link btn-only-icon' label='button' xid='button4' icon='icon-arrow-down-a'><i class='icon-arrow-down-a'/></a>"
		}
	};
	//渲染单元格
	Model.prototype.bottomGridCellRender = function(event) {
		if (event.colVal == null) {
			event.html = "<a component='$model/UI2/system/components/justep/button/button' class='btn btn-link btn-only-icon' label='button' xid='button4' icon='icon-arrow-up-a'><i class='icon-arrow-up-a'/></a>"
		}

	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/doubleSelectionVetical.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		this.comp('popMenu').show();
	};
	//上表源码
	Model.prototype.topSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/doubleSelectionVetical.w&xid=aboveGrid"
		},true);
	};
	//下表源码
	Model.prototype.bottomSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/doubleSelectionVetical.w&xid=bottomGrid"
		},true);
	};

	return Model;
});