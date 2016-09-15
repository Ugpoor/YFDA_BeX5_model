
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/components/justep/common/demo/prettify");
	require("$UI/system/components/justep/common/demo/jquery.zclip.min");
	var Model = function() {
		this.callParent();
		this.flag = justep.Browser.isPC;
	};
	Model.prototype.windowReceiver1Receive = function(event) {
		this.copyCode()
		var htmlArea = $.ajax({
			url : require.toUrl(event.data),
			async : false,
			dataType : 'text'
		});
		if (event.data.indexOf("/baas/justep/getContent/getWindowContent") < 0) {
			$(this.getElementByXid("showCode")).html("<pre class='prettyprint linenums ' style='background:white;font-weight:bold'>" + htmlArea.responseText + "</pre>");
			prettyPrint();
			return true;
		}
		var result = htmlArea.responseText;
		$(this.getElementByXid("showCode")).html("<pre class='prettyprint linenums' style='background:white;font-weight:bold'><xmp>" + JSON.parse(result).result + "</xmp></pre>");
		prettyPrint();
	};

	Model.prototype.closePage = function(event) {
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.copyBtnClick = function(event) {
		this.copyCode()
	};

	 Model.prototype.copyCode = function() {
		var self = this;
		var path = require.toUrl("./ZeroClipboard.swf");
		$("#" + this.getIDByXID("copyBtn")).zclip({
			path : path,
			copy : function() {
				return $(self.getElementByXid("showCode")).text();
			},
			afterCopy : function() {
				$("#msg").show("normal", function() {
					setTimeout(function() {
						$("#msg").fadeOut();
					}, 2000);
				})
			}
		});
	};

	return Model;
});