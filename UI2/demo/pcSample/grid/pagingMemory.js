define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.orderDataCustomRefresh = function(event) {
		var data = event.source;
		justep.Baas.sendRequest({
			"url" : "/justep/demo", // servlet请求地址
			"action" : "queryOrder", // action
			"params" : { // action对应的参数
				"limit" : event.limit, // 分页信息 - 行数
				"offset" : event.offset
			// 分页信息 - 行偏移
			},
			"success" : function(resultData) { // 请求成功后的回调方法
				var append = event.options && event.options.append; // 通过event.options.append判断数据是否增量加载
				data.loadData(resultData, append); // 加载返回数据到data
			}
		});
	};

	Model.prototype.obtainClick = function(event) {
		var fContent = [];
		this.comp('memory').each(function(param) {
			fContent.push(param.row.val("fContent"));
		})
		justep.Util.hint("选中项：" + fContent.toString());
	};

	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/pagingMemory.js"
		},true);
	};

	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/pagingMemory.w&xid=pagingGrid"
		},true);
	};

	Model.prototype.pagingGridRowChecked = function(event) {
		this.comp('memory').deleteAllData();
		var arr = this.comp('pagingGrid').getCheckeds();
		for (var i = 0; i < arr.length; i++) {
			var row = this.comp('orderData').getRowByID(arr[i]);
			this.comp('memory').newData({
				defaultValues : [ {
					"fID" : row.val("fID"),
					"fContent" : row.val("fContent"),
					"fUserName" : row.val("fUserName"),
					"fAddress" : row.val("fAddress")
				} ]
			})
		}
	};

	return Model;
});