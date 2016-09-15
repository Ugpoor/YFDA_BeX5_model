define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	//加载数据
	Model.prototype.formattingDataCustomRefresh = function(event) {
		var formatting = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/formattingData.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				formatting.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});

	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/contentFormatting.w&xid=formattingGrid"
		},true);

	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/contentFormatting.js"
		},true);
	};

	return Model;
});