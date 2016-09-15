define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		var mainData = this.comp("data");
		mainData.clear();
		var url = require.toUrl("./professionNewsData.json");
		$.getJSON(url, function(data) {
			mainData.newData({
				defaultValues : data[event.data]
			})
		});
	};

	Model.prototype.modelParamsReceive = function(event) {
		var rowid = this.params.rowid;
		if (!rowid)
			rowid = "1";
		var mainData = this.comp("data");
		mainData.clear();
		var url = require.toUrl("./professionNewsData.json");
		$.getJSON(url, function(data) {
			mainData.newData({
				defaultValues : data[rowid]
			})
		});
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	return Model;
});
