define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.tabs1Select = function(event){
		alert("选择的tab xid : " +event.tab.attr("xid"));
	};

	return Model;
});