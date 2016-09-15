define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.okbtnClick = function(event){
		var arr = this.comp('dataTables').getCheckeds();
		this.comp('windowReceiver').windowEnsure(arr);
	};

	Model.prototype.cancelClick = function(event){
		
		
		this.comp('windowReceiver').windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event){
		
		
		var inputData = event.data;
		var arr = [];
		inputData.each(function(option){
			arr.push({
				link:option.row.val("value"),
				linkName:option.row.val("oValue")
			});
		
		})
		
		this.comp('optionalInputData').loadData({
			"@type" : "table",
			"rows" : arr
		})
		this.comp('dataTables').reload();
	};

	return Model;
});