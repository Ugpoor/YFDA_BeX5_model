define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};

	Model.prototype.wReceiverReceive = function(event){
		this.comp('data').loadData(event.data);
	};

	Model.prototype.runClick = function(event){
		var fID = event.bindingContext.$object.val('fID');
		this.comp('wReceiver').windowEnsure(fID);
	};

	return Model;
});