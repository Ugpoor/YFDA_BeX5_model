define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.chartBtnClick = function(event){
		this.showChart();
	};

	Model.prototype.chart2BtnClick = function(event){
		this.showChart();
	};
	
	Model.prototype.showChart = function(){
		var process = this.comp("process");
		process.showChart(this.getContext().getProcess(), this.comp("orderData").getCurrentRowID(), null);
	};

	return Model;
});