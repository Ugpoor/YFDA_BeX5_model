define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	//返回上一页
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
	
	Model.prototype.windowReceiverReceive = function(event) {
		/*var mainData = this.comp("data");
		mainData.clear();
		var url = require.toUrl("./professionNewsData.json");
		$.getJSON(url, function(data) {
			mainData.newData({
				defaultValues : data[event.data]
			})
		});*/
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

	return Model;
});
