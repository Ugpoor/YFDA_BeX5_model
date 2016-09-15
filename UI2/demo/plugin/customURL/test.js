define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};
	//点击进入原生应用内部
	Model.prototype.button1Click = function(event){
		window.location.href = "wex5app://";
	};

	return Model;
});