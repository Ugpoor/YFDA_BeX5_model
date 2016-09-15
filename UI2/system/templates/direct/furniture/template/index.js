define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();
		
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				},
				"productRecomment" : {
					url : require.toUrl('./productRecomment.w')
				},
				"introduce" : {
					url : require.toUrl('./introduce.w')
				},
				"contactUS" : {
					url : require.toUrl('./contactUS.w')
				}
			}
		})
	};
	
	Model.prototype.modelLoad = function(event) {
		justep.Shell.showPage("main");
	};
	
	Model.prototype.openDemo = function(event) {
		var demo = event.source.$domNode.attr("urlMapping");
		justep.Shell.showPage(demo);
	};
	Model.prototype.menuClick = function(event) {
		this.comp('popMenu').show();
	};

	return Model;
});