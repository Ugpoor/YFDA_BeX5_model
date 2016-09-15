define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.callParent();
		this.arr = ["introduce","onsale","newArrival","customService"];
		
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				},
				"onsale" : {
					url : require.toUrl('./onsale.w')
				},
				"newArrival" : {
					url : require.toUrl('./newArrival.w')
				},
				"introduce" : {
					url : require.toUrl('./introduce.w')
				},
				"detail" : {
					url : require.toUrl('./detail.w')
				}
			}
		})
	};

	Model.prototype.modelLoad = function(event) {
		justep.Shell.showPage("main");
	};

	//打开页面
	Model.prototype.openDemo = function(event) {
		var demo = event.source.$domNode.attr("urlMapping");
		justep.Shell.showPage(demo);
	};
	//更改按钮背景并打开页面
	Model.prototype.openPage = function(event){
		var xid = event.source.getXid();
		var self = this;

		for(var i = 0; i< this.arr.length; i++){
			if(self.arr[i] == xid){
				var btn = $(self.getElementByXid(xid));
				btn.css("background-color","#FF34B3");
				btn.css("color","#FFFFFF");
			}else{
				var btn = $(self.getElementByXid(self.arr[i]));
				btn.css("background-color","transparent");
				btn.css("color","#000000");
			}
		}
		var demo = event.source.$domNode.attr("urlMapping");
		justep.Shell.showPage(demo);
	};
	//展开下拉按钮
	Model.prototype.menuClick = function(event) {
		this.comp('popMenu1').show();
	};

	return Model;
});