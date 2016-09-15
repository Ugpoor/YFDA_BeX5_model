define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	require("$UI/demo/account/appVersionChecker");
	
	var Model = function() {
		this.callParent();

		this.shellImpl = new ShellImpl(this, {
			contentsXid : "pages",
			wingXid : "wing",
			pageMappings : {
				"list" : {
					url : "$UI/demo/account/list.w"
				},
				"detail" : {
					url : "$UI/demo/account/detail.w"
				},
				"classSetting" : {
					url : "$UI/demo/account/classSetting.w"
				}
			}
		});
	};

	Model.prototype.modelLoad = function(event) {
		this.shellImpl.showPage("list");
	};

	Model.prototype.classSettingBtnClick = function(event) {
		this.shellImpl.showPage("classSetting");
	};

	return Model;
});