define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
	};
	//加载数据
	Model.prototype.bigDataCustomRefresh = function(event) {
		var bigData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/bigData.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				bigData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});

	};
	//点击加载按钮
	Model.prototype.loadClick = function(event) {
		this.comp('bigData').refreshData();
	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/bigData.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/bigData.w&xid=bigDataGrid"
		},true);
	};

	return Model;
});