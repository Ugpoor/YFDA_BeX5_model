define(function(require) {
	var $ = require("jquery");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		var rowid=this.params.rowid;
		if(rowid==undefined){
			rowid="1";
		}
		var mainData = this.comp("data");
		mainData.clear();		
		var url = require.toUrl("./data.json");
		$.getJSON(url, function(data) {
			mainData.newData({
				defaultValues : data[rowid]
			})
		});
	};

	return Model;
});
