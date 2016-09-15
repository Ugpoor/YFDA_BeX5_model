define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		
		this.comp('orderData').loadData([ event.data ]);
		this.comp('orderData').first();
	};

	Model.prototype.cancelClick = function(event){
		this.comp('windowReceiver').windowCancel();
	};

	Model.prototype.okbtnClick = function(event){
		this.comp('windowReceiver').windowCancel();

	};

	return Model;
});