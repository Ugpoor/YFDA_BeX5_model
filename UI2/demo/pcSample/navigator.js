define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.gridDataCustomRefresh = function(event){
		var gridData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/grid.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				gridData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	
	Model.prototype.formsDataCustomRefresh = function(event){
		var formsData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/forms.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				formsData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	
	Model.prototype.formsDataCustomRefresh = function(event){
		var textData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/text.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				textData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	
	Model.prototype.tableDataCustomRefresh = function(event){
		var tableData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/table.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				tableData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};

	Model.prototype.formElementDataCustomRefresh = function(event){
		var formElementData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/form-element.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				formElementData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};

	Model.prototype.navigatorDataCustomRefresh = function(event){
		var navigatorData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/navigator.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				navigatorData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	
	
	Model.prototype.openPageClick = function(event){
		var src = event.bindingContext.$rawData.val('src');
		window.open(require.toUrl(src));
	};

	
	

	Model.prototype.layoutDataCustomRefresh = function(event){
		var layoutData = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/layout.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				layoutData.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};

	
	

	return Model;
});