define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.button1Click = function(event){
		var node = document.getElementById("a");
		alert(node.textContent);
	};

	Model.prototype.button2Click = function(event){
		var id = this.getIDByXID("b");
		var node = document.getElementById(id);
		alert(node.textContent);
	};

	return Model;
});