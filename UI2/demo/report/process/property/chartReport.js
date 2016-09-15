define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require('css!../css/tableLayoutFix').load();
	
	var Model = function(){
		this.callParent();
	};

	return Model;
});