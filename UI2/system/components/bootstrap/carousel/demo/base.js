define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button2Click = function(event){
		this.comp("carousel1").add('<img src="./images/p1.jpg" class="image-wall"/>');
	};

	return Model;
});