define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.tabItem2Select = function(event) {
		this.setChartStatus("area_h");
	};

	Model.prototype.setChartStatus = function(chartId) {
		var comp = this.comp(chartId);
		if (!comp.loaded) {
			setTimeout(function() {
				comp.refresh();
			}, 300);
			comp.loaded = true;
		}
	}

	return Model;
});
