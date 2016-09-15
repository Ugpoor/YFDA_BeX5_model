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
		this.setChartStatus("v_line_3D");
	};

	Model.prototype.tabItem3Click = function(event){
		this.setChartStatus("h_line");
	};

	Model.prototype.tabItem4Click = function(event){
		this.setChartStatus("h_line_3d");
	};

	Model.prototype.tabItem5Click = function(event){
		this.setChartStatus("vxy_line");
	};

	Model.prototype.tabItem6Click = function(event){
		this.setChartStatus("hxy_line");
	};

	return Model;
});
