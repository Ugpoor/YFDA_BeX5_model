define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.data1CustomRefresh = function(event) {
		var data = this.comp('statisticsOrderData');
		var startDate = this.getElementByXid('startDate').value;
		var endDate = this.getElementByXid('endDate').value;
		var params = {};
		if (startDate && endDate) {
			params = {
				startDate : startDate,
				endDate : endDate
			};
		}
		justep.Baas.sendRequest({
			"url" : "/takeoutAdmin/order",
			"action" : "getCuisineStatistics",
			"async" : false,
			"params" : params,
			"success" : function(ret) {

				data.loadData(ret);

			}
		});
	};
	// 查看折线图
	Model.prototype.showPictureClick = function(event) {
		var statisticsOrderData = this.comp('statisticsOrderData');
		this.comp('echartWindowDialog').open({
			data : statisticsOrderData
		});
	};

	// 搜索
	Model.prototype.selectClick = function(event) {

		var data = this.comp('statisticsOrderData');
		data.refreshData()

	};

	return Model;
});