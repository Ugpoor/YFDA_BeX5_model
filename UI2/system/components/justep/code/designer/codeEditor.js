define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();

	var Model = function() {
		this.callParent();
		this.code = justep.Bind.observable("abc");
	};

	Model.prototype.modelLoad = function(event) {
		var initData = xuiService.getPageParams();// 获取传入的参数
		var $root = $(this.getRootNode());
		this.comp('textarea').$domNode.css({
			height : $root.innerHeight()
		});
		var code = xuiDoc.getJSMethodContent({
			name : initData.name
		});
		var content = code.content||"";
		if(content[0]==='{' && content[content.length-1]==='}') content = content.substring(1, content.length-1);
		this.code.set(content);
	};

	Model.prototype.getReturnValue = function() {
		return {
			code : "{"+this.code.get()+"}"
		};
	};
	
	return Model;
});