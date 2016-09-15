define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.setChartStatus = function(chartId) {
		var comp = this.comp(chartId);
		if (!comp.loaded) {
			setTimeout(function() {
				comp.refresh();
			}, 100);
			comp.loaded = true;
		}
	}

	Model.prototype.tabItem2Click = function(event){
		this.setChartStatus("chart_gantt_h");
	};

	return Model;
});
