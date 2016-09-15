define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	

	var Model = function() {
		this.callParent();
	};

	Model.prototype.employeeCustomRefresh = function(event) {
		var employee = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/pagingData.json'),
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
	// 移动到下侧
	Model.prototype.bottomClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollTop = a[0].scrollHeight;
	};
	// 移动到上侧
	Model.prototype.topClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollTop = 0;
	};
	// 缓慢移动到下侧
	Model.prototype.slowBottomClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollTop : a[0].scrollHeight
		}, 1200);
	};
	// 缓慢移动到上侧
	Model.prototype.slowTopClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollTop : 0
		}, 1200)
	};
	// 移动到右侧
	Model.prototype.rightClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollLeft = a[0].scrollWidth;
	};
	// 移动到左侧
	Model.prototype.leftClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollLeft = 0;
	};
	// 缓慢移动到右侧
	Model.prototype.slowRightClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollLeft : a[0].scrollWidth
		}, 1200);
	};
	// 缓慢移动到左侧
	Model.prototype.slowLeftClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollLeft : 0
		}, 1200);
	};
	// 移动到右下侧
	Model.prototype.rightBottomClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollTop = a[0].scrollHeight;
		a[0].scrollLeft = a[0].scrollWidth;
	};
	// 移动到左上侧
	Model.prototype.leftTopClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a[0].scrollTop = 0;
		a[0].scrollLeft = 0;
	};
	// 缓慢移动到右下侧
	Model.prototype.slowRightBottomClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollTop : a[0].scrollHeight,
			scrollLeft : a[0].scrollWidth
		}, 1200);
	};
	// 缓慢移动到左上侧
	Model.prototype.slowLeftTopClick = function(event) {
		var a = $(document.getElementsByName("aa"));
		a.animate({
			scrollTop : 0,
			scrollLeft : 0
		}, 1200);

	};

	Model.prototype.jsClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/controlScrollbar.js"
		},true);
	};

	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/controlScrollbar.w&xid=panel1"
		},true);
	};

	return Model;
});