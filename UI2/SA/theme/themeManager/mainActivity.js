define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.createBtnClick = function(event){
		var mainData = this.comp("main");
		mainData.newData({
			"defaultValues" : [{
				sPublishType: "portal3"
			}]
		});
	};

	return Model;
});