define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!com.verso.cordova.clipboard");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.copyClick = function(event) {
		var text = this.comp("data").val("text");
		if (!text) {
			justep.Util.hint("请在复制文本框中输入内容，用于复制");
			return ;
		}
		cordova.plugins.clipboard.copy(text,function(evt){
			justep.Util.hint("复制成功！");
		});
	};

	Model.prototype.pasteClick = function(event) {
		var self = this;
		cordova.plugins.clipboard.paste(function(text) {
			self.comp("data").setValue("copyText", text);
			justep.Util.hint("粘贴成功！");
		});
	};

	return Model;
});