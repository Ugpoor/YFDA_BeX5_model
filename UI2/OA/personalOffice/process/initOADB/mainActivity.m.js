define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.initBtnClick = function(event) {
		this.comp("typeData").setValue('visible','show');
		var backdrop = $('<div class="x-wing-backdrop"></div>').appendTo('.initPage');
		setTimeout(function(){backdrop.show()},1);
		
		var me = this;
		setTimeout(function(){
			biz.Request.sendBizRequest({
				"context" : me.getContext(),
				"action" : "initOADBAction",
				"async": true,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						me.comp("messageDialog").show();
					}
					me.comp("typeData").setValue('visible','');
					setTimeout(function(){backdrop.fadeOut()},1);
				}
			});
		},100);
	};

	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	return Model;
});