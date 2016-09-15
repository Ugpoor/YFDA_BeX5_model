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
				"course":{
					url : this.transUrl("./child/course.w")
				},
				"forum":{
					url : this.transUrl("./child/forum.w")
				},
				"about":{
					url : this.transUrl("./child/about.w")
				},
				"login":{
					url : this.transUrl("./login/login.w")
				},
				"reg":{
					url : this.transUrl("./login/reg.w")
				},
				"search":{
					url : this.transUrl("./page/search.w")
				},
				"submit":{
					url : this.transUrl("./child/submit.w")
				},
				"tcourse":{
					url : this.transUrl("./child/tcourse.w")
				},
				"teachers":{
					url : this.transUrl("./child/teachers.w")
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