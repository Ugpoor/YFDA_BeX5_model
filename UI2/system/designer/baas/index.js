define(function(require) {
    var WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var $ = require("jquery");

	var Model = function() {
		this.callParent();
	};
 
	Model.prototype.refreshBtnClick = function(event) {
		window.location.reload();
	};

	Model.prototype.modelLoad = function(event) {
		var parentNode = $(this.getElementByXid("composeParent"));
		var targetUrl = this.getContext().getRequestParameter("targetUrl");
		if(targetUrl){
			this.currentCompose = this.createCompose(targetUrl);		
		}
	};

	Model.prototype.createCompose = function(src) {
		var src = require.toUrl(src);
		var compose = new WindowContainer({
			parentNode : this.getElementByXid("composeParent"),
			src : src
		});
		$(compose.domNode).addClass('compose');
		return compose;
	};
 
	return Model;
});
