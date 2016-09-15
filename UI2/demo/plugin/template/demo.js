define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var browser = require("$UI/system/lib/base/browser");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.modelModelConstruct = function(event){
		if(browser.isX5App){
		}else{
			justep.Util.hint("此demo只在应用内正常运行");
		}
	};
	

	return Model;
});