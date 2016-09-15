define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 订单详情
	Model.prototype.showOrderDetail = function(row) {
		this.comp('orderWindowDialog').open({
			data : row.toJson()
		});
	}

	// 点击查看订单详情按钮
	Model.prototype.showOrderDetailClick = function(event) {
		var row = this.comp('cuisineOrderData').getCurrentRow();
		this.showOrderDetail(row);
	};

	// 双击订单列表显示订单详情
	Model.prototype.orderListDblclick = function(event) {
		var row = this.comp('cuisineOrderData').getCurrentRow();
		this.showOrderDetail(row);
	};

	// 点击保存修改
	Model.prototype.saveClick = function(event) {
		this.comp('cuisineOrderData').saveData();
	};

	// 点击展开或隐藏过滤
	Model.prototype.spreadClick = function(event) {
		var filterDetail = $(this.getElementByXid('filterDetail'));
		if (filterDetail.is(':hidden') == false) {
			filterDetail.hide();
			var filter = this.comp('spread');
			filter.set({
				label : "展开过滤",
				icon : "icon-android-add"
			});
		} else {
			filterDetail.show();
			var filter = this.comp('spread');
			filter.set({
				label : "隐藏过滤",
				icon : "icon-android-remove"
			});
		}
	};

	// 默认隐藏过滤内容
	Model.prototype.modelLoad = function(event) {
		$(this.getElementByXid('filterDetail')).hide();
	};

	// 订单列表过滤
	Model.prototype.filterBtnClick = function(event) {
		var startDate = this.getElementByXid('startDate').value;
		var endDate = this.getElementByXid('endDate').value;
		var userName = this.getElementByXid('userName').value;
		var dispatchingState = this.getElementByXid('dispatchingState').value;

		var data = this.comp('cuisineOrderData');

		if (startDate != "" && endDate != "") {
			data.setFilter("filter1", "takeout_order.fCreateTime between :startDate and :endDate");
			data.filters.setVar("startDate", startDate);
			data.filters.setVar("endDate", endDate);

		}
		if (userName != null && userName != "") {
			data.setFilter("filter2", "takeout_order.fUserName like '%" + userName + "%'");

		}
		if (dispatchingState != null && dispatchingState != "") {
			data.setFilter("filter3", "takeout_order.fDispatchingState = :dispatchingState");
			data.filters.setVar("dispatchingState", dispatchingState);
		}

		this.comp('cuisineOrderData').refreshData();
	};

	// 清空过滤条件
	Model.prototype.emptyClick = function(event) {
		this.getElementByXid('startDate').value = "";
		this.getElementByXid('endDate').value = "";
		this.getElementByXid('userName').value = "";
		this.getElementByXid('dispatchingState').value = "";

		this.comp('cuisineOrderData').filters.clear();
		this.comp('cuisineOrderData').refreshData();
	};

	return Model;
});