define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();
		
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main":{
					url : require.toUrl("./index_main.w")
				},
				"fileSystem":{
					url : require.toUrl("./fileSystem.w")
				},
			}
		});
	};

	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};
	
	return Model;
});