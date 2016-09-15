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
		this.setChartStatus("horizontal_3d_chart_bar");
	};

	Model.prototype.tabItem3Click = function(event){
		this.setChartStatus("stackedh_chart_bar");
	};

	Model.prototype.tabItem4Click = function(event){
		this.setChartStatus("stackedh_3d_chart");
	};

	Model.prototype.tabItem5Click = function(event){
		this.setChartStatus("cylinder_horizontal_bar_chart");
	};

	return Model;
});
