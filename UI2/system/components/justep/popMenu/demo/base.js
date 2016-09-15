/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var Button = require("$UI/system/components/justep/button/button");
	
	var Model = function(){
		this.callParent();
	};
	
	var count = 1;
	
	Model.prototype.button1Click = function(event){
		this.comp("popMenu1").show();
	};

	Model.prototype.button2Click = function(event){
		alert('ok');
	};

	Model.prototype.button6Click = function(event){
		var menu = this.comp("menu1");
		menu.addItem({
			label : "Item" + count++
		});
	};

	Model.prototype.button7Click = function(event){
		var menu = this.comp("menu1");
		menu.addDivider();
	};

	return Model;
});
