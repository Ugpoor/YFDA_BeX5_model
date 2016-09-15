define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	
	
	Model.prototype.modelActive = function(event){
		this.showMessage("触发onActive事件");
	};
	
	Model.prototype.modelInactive = function(event){
		this.showMessage("触发onInactive事件");
	};

	
	
	Model.prototype.modelModelConstruct = function(event){
		this.showMessage("触发onModelConstruct事件");
	};

	Model.prototype.modelModelConstructDone = function(event){
		this.showMessage("触发onModelConstructDone事件");
	};

	Model.prototype.modelLoad = function(event){
		this.showMessage("触发onLoad事件");
	};

	
	
	Model.prototype.modelParamsReceive = function(event){
		this.showMessage("触发onParamsReceive事件");
	};

	
	
	Model.prototype.modelUnLoad = function(event){
		this.showMessage("触发onunload事件");
	};
	
	Model.prototype.showMessage = function(title){
		console.log(title);
		var containerId = this.getIDByXID("container");
		$("#" + containerId).append("<p>" + title + "<p/>");
	};

	
	
	return Model;
});