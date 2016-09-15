define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		
	};
	
	
	
	Model.prototype.button1Click = function(event){
		var data = this.comp('input1').val();
		this.comp("windowReceiver1").windowEnsure(data);
	};
	Model.prototype.button2Click = function(event){
		this.comp("windowReceiver1").windowCancel();
	};
	return Model;
});