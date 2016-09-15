define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function() {
		this.callParent();
	};

	// 显示详细数据
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_CustomerVisit = '" + event.data + "'");
		detailData.refreshData();
	};

	return Model;
});

