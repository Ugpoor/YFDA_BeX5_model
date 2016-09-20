define(function(require) {
	var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.chartBtnClick = function(event) {
		this.showChart();
	};

	Model.prototype.chart2BtnClick = function(event) {
		this.chartBtnClick();
	};

	Model.prototype.showChart = function() {
		var process = this.comp("process");
		process.showChart("/YFDA1/YFDA_lawEnforce/process/generalAudit/generalAuditProcess", this.comp("mainData").getCurrentRowID(), null);
	};

	Model.prototype.listTablesRowDblClick = function(event) {
		var tabs = this.comp("tabs");
		if (this.comp("mainData").getCurrentRow()) {
			tabs.setActiveTab("detailLi");
		}
	};

//?? 需要写入代码跳转到审核页面，并且载入当前申请ID
	Model.prototype.buttonClick = function(event){
		justep.xbl('windowDialog3').open();
	};

	Model.prototype.h = function(event){

	};

	return Model;
});