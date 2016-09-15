define(function(require) {
	require("css!$UI/system/components/justep/common/demo/prettify").load();
	require("$UI/system/components/justep/common/demo/prettify");
	var justep = require("$UI/system/lib/justep");
	var utils = {
		self : null,
		showCode : function(ob, xid) {
			if (typeof ob === "string") {
				xid = ob;
			} else {
				this.self = ob;
			}
			var self = this.self;
			var pre = this.getString(self[xid]);
			if ($(self.getElementByXid(xid)).length == 1) {
				$(self.getElementByXid(xid)).html("<pre class='prettyprint linenums ' style='background:white;font-weight:bold'>" + pre + "</pre>");
			} else {
				justep.Util.hint("xid有误: " + xid);
			}
			return this;
		},
		getString : function(fun) {
			var funAsString = fun ? fun.toString() : "undefine";
			var test1 = funAsString.substring(funAsString.indexOf('{') + 1, funAsString.lastIndexOf('}'));
			return test1.replace(/	/g, "  ");
		},
		prettyPrint : function() {
			prettyPrint.call(this);
		}
	};
	return utils;
});