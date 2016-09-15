define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.okBtnClick = function(event) {
		this.comp("windowReceiver").windowEnsure(this.comp("treeData").getCurrentRow());
	};
	return Model;
});