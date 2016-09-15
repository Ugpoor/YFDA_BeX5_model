define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();
		var shellImpl = new ShellImpl(this,{
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				},
				"moreApp" :{
					url : require.toUrl('./moreApp.w')
				},
				"wallPaper" : {
					url : require.toUrl('./wallPaper.w')
				},
				"specialTopic" : {
					url : require.toUrl('./specialTopic.w')
				},
				"photo" : {
					url : require.toUrl('./photo.w')
				},
				"bigPicture" : {
					url : require.toUrl('./bigPicture.w')
				},
			}
		})
	};

	
	Model.prototype.modelLoad = function(event) {
		justep.Shell.showPage("main");
	};
	return Model;
});