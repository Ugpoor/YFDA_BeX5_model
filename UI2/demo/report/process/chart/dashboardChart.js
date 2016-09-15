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
			}, 300);
			comp.loaded = true;
		}
	}

	Model.prototype.tabItem2Click = function(event){
		this.setChartStatus("chart_dialmeter");
	};

	Model.prototype.tabItem5Click = function(event){
		this.setChartStatus("dial_meter");
	};

	Model.prototype.tabItem6Click = function(event){
		this.setChartStatus("chart_thermometermeter");
	};

	Model.prototype.tabItem7Click = function(event){
		this.setChartStatus("chart_multidial");
	};

	return Model;
});
