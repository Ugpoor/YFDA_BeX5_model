define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	//加载左表数据
	Model.prototype.leftDataCustomRefresh = function(event) {
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
	//加载右表数据
	Model.prototype.rightDataCustomRefresh = function(event) {
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
	//渲染单元格
	Model.prototype.leftGridCellRender = function(event) {
		if (event.colVal == null) {
			event.html = "<a component='$model/UI2/system/components/justep/button/button' class='btn btn-link btn-only-icon' label='button' xid='button4' icon='icon-arrow-right-a'><i class='icon-arrow-right-a'/></a>"
		}
	};

	//渲染单元格
	Model.prototype.rightGridCellRender = function(event) {
		if (event.colVal == null) {
			event.html = "<a component='$model/UI2/system/components/justep/button/button' class='btn btn-link btn-only-icon' label='button' xid='button4' icon='icon-arrow-left-a'><i class='icon-arrow-left-a'/></a>"
		}
	};
	//点击左表箭头
	Model.prototype.leftGridRowClick = function(event) {
		if ($(event.domEvent.target).hasClass("icon-arrow-right-a")) {
			var row = this.comp('leftEmployee').getRowByID(event.rowID);
			this.comp('leftEmployee').deleteData(row);
			this.comp('rightEmployee').newData({
				defaultValues : [ {
					"name" : row.val("name"),
					"sex" : row.val("sex"),
					"dept" : row.val("dept"),
					"enducation" : row.val("enducation")

				} ]
			})
			this.comp('rightGrid').refresh();

		}

	};
	//点击右表箭头
	Model.prototype.rightGridRowClick = function(event) {
		if ($(event.domEvent.target).hasClass("icon-arrow-left-a")) {
			var row = this.comp('rightEmployee').getRowByID(event.rowID);
			this.comp('rightEmployee').deleteData(row);
			this.comp('leftEmployee').newData({
				defaultValues : [ {
					"name" : row.val("name"),
					"sex" : row.val("sex"),
					"dept" : row.val("dept"),
					"enducation" : row.val("enducation")

				} ]
			})
			this.comp('leftGrid').refresh();

		}

	};

	Model.prototype.sourceClick = function(event) {
		this.comp('popMenu').show();
	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/doubleSelectionTransverse.js"
		},true);
	};
	//左表源码
	Model.prototype.leftSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/doubleSelectionTransverse.w&xid=leftGrid"
		},true);
	};
	//右表源码
	Model.prototype.rightSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/doubleSelectionTransverse.w&xid=rightGrid"
		},true);
	};

	return Model;
});