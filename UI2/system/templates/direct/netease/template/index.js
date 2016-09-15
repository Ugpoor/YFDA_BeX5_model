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
					url : require.toUrl('./index_main.w')
				},
				"list":{
					url : require.toUrl('./list.w')
				},
				"detail":{
					url : require.toUrl('./detail.w')
				},
				"post":{
					url : require.toUrl('./post.w')
				},
				"login":{
					url : require.toUrl('./login.w')
				},
				"registered":{
					url : require.toUrl('./registered.w')
				},
				"important":{
					url : require.toUrl('./important.w')
				}				
			}
		});
	};

	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};

	return Model;
});