/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
		this.relations = [];
		this.options = {};
	};

	Model.prototype.okBtnClick = function(){
		var receiver = this.comp("windowReceive");
		var flowToData = this.comp("flowToData");
		var data = {};
		data.options = this.options;
		for (var i=0; i<this.relations.length; i++){
			data[this.relations[i]] = flowToData.getValue(this.relations[i]); 
		}
		receiver.windowEnsure(data);
	};
	
	Model.prototype.cancelBtnClick = function(){
		var receiver = this.comp("windowReceive");
		receiver.windowCancel();
	};
	
	Model.prototype.windowReceiveReceive = function(event){
		this.relations = [];
		for (var name in event.data){
			if (event.data.hasOwnProperty(name)){
				if (name == 'options'){
					this.options = event.data.options;
					action = event.data.options.action;
				}else{
					this.relations.push(name);
				}
			}
		}
		var data = {rows: [event.data || {}]};
		var flowToData = this.comp("flowToData");
		flowToData.loadData(data);
		flowToData.first();
		flowToData.setValue("action", this.options.action);
	};
	
	return Model;
});
