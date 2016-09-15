define(function(require){
	var $ = require("jquery");
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	
	Model.prototype.windowReceiveReceive = function(event){
		var processChart = this.comp("processChart");
		var data = event.data || {};
		processChart.showTrack();
		if (data.task){
			processChart.loadByTask(data.task, data.refresh || false);	
		}else{
			processChart.loadByData(data.process, data.data, data.refresh || false);
		}
	};

	Model.prototype.modelLoad = function(event){
		//this.comp("processChart").load();
	};
	
	Model.prototype.trackItemClick = function(event){
		//debugger;
	};
	
	Model.prototype.pertItemClick = function(event){
		//debugger;
	};
	
	Model.prototype.show = function(){
		this.comp("processChart").updateTrackHelpStatus();
	};
	return Model;
});