define(function(require) {
	var $ = require("jquery");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		var url = require.toUrl(event.params.url);

		$('[xid=image1]').attr("src", url);
	};

	return Model;
});