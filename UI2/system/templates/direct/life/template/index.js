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
					url : this.transUrl("./main/index_main.w")
				},
				"login":{
					url : this.transUrl("./login/login.w")
				},
				"reg":{
					url : this.transUrl("./login/reg.w")
				},
				"business":{
					url : this.transUrl("./child/business.w")
				},
				"connection":{
					url : this.transUrl("./child/connection.w")
				},
				"information":{
					url : this.transUrl("./child/information.w")
				},
				"phone":{
					url : this.transUrl("./child/phone.w")
				},
				"parent":{
					url : this.transUrl("./parent/parent.w")
				},
				
			}
		});
	};

	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};
	
	Model.prototype.transUrl = function(url){
		return require.toUrl(url)
	};

	return Model;
});