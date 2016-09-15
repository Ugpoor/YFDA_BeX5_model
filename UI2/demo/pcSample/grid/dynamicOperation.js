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

	// 获得当前行的值
	Model.prototype.currentRowClick = function(event) {
		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length != 1) {
			justep.Util.hint("请先选中一行数据");
			return;
		}
		var row = this.comp('employeeData').getRowByID(arr[0]);
		justep.Util.hint("姓名:" + row.val("name") + "---" + "性别：" + row.val("sex") + "---" + "部门：" + row.val("dept") + "---" + "学历：" + row.val("enducation"));

	};

	// 获得第一行的值
	Model.prototype.firstRowClick = function(event) {
		var row = this.comp('employeeGrid').getData().getFirstRow();
		justep.Util.hint("姓名:" + row.val("name") + "---" + "性别：" + row.val("sex") + "---" + "部门：" + row.val("dept") + "---" + "学历：" + row.val("enducation"));

	};
	// 获得id为“员工3” 的行的值’
	Model.prototype.idRowClick = function(event) {
		var row = this.comp('employeeData').getRowByID("2");
		justep.Util.hint("姓名:" + row.val("name") + "---" + "性别：" + row.val("sex") + "---" + "部门：" + row.val("dept") + "---" + "学历：" + row.val("enducation"));

	};
	
	// 删除选中行
	Model.prototype.deleteClick = function(event) {

		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length == 0) {
			justep.Util.hint("请先选中至少一行数据");
			return;
		}
		for (var i = 0; i < arr.length; i++) {
			this.comp('employeeGrid').deleteRow(arr[i]);
		}
	};

	// 插入首行
	Model.prototype.insertFirstRowClick = function(event) {
		this.comp('employeeData').newData({
			index : 0,
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"name" : "新员工",
				"sex" : "女",
				"dept" : "新部门",
				"enducation" : "无学历"

			} ]
		})
		this.comp('employeeGrid').refresh();
	};

	// 追加尾行
	Model.prototype.addLastRowClick = function(event) {
		this.comp('employeeData').newData({
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"name" : "新员工",
				"sex" : "女",
				"dept" : "新部门",
				"enducation" : "无学历"

			} ]
		})
		this.comp('employeeGrid').refresh();
	};

	// 选中行前插入行
	Model.prototype.beforeRowClick = function(event) {
		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length != 1) {
			justep.Util.hint("请先选中一行数据");
			return;
		}
		var index = this.comp('employeeData').getRowByID(arr[0]).index();
		this.comp('employeeData').newData({
			index : index,
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"name" : "新员工",
				"sex" : "女",
				"dept" : "新部门",
				"enducation" : "无学历"

			} ]
		})
		this.comp('employeeGrid').refresh();
	};

	// 选中行后追加行
	Model.prototype.afterRowClick = function(event) {
		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length != 1) {
			justep.Util.hint("请先选中一行数据");
			return;
		}
		var index = this.comp('employeeData').getRowByID(arr[0]).index();
		this.comp('employeeData').newData({
			index : index + 1,
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"name" : "新员工",
				"sex" : "女",
				"dept" : "新部门",
				"enducation" : "无学历"

			} ]
		})
		this.comp('employeeGrid').refresh();
	};

	// 上移行
	Model.prototype.moveUpClick = function(event) {
		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length != 1) {
			justep.Util.hint("请先选中一行数据");
			return;
		}

		var row = this.comp('employeeData').getRowByID(arr[0]);
		var index = row.index();
		this.comp('employeeData').deleteData(row);
		this.comp('employeeData').newData({
			index : index - 1,
			defaultValues : [ {
				"id" : row.val("id"),
				"name" : row.val("name"),
				"sex" : row.val("sex"),
				"dept" : row.val("dept"),
				"enducation" : row.val("enducation")

			} ]
		})
		this.comp('employeeGrid').refresh();
		this.comp('employeeGrid').setRowChecked(row.val("id"), true);

	};

	// 下移行
	Model.prototype.moveDownClick = function(event) {
		var arr = this.comp('employeeGrid').getCheckeds();
		if (arr.length != 1) {
			justep.Util.hint("请先选中一行数据");
			return;
		}

		var row = this.comp('employeeData').getRowByID(arr[0]);
		var index = row.index();
		this.comp('employeeData').deleteData(row);
		this.comp('employeeData').newData({
			index : index + 1,
			defaultValues : [ {
				"id" : row.val("id"),
				"name" : row.val("name"),
				"sex" : row.val("sex"),
				"dept" : row.val("dept"),
				"enducation" : row.val("enducation")

			} ]
		})
		this.comp('employeeGrid').refresh();
		this.comp('employeeGrid').setRowChecked(row.val("id"), true);

	};
	// js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/dynamicOperation.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/dynamicOperation.w&xid=employeeGrid"
		},true);
	};

	return Model;
});