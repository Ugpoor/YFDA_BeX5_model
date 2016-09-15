define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var process = event.data[0];
		var labelData = event.data[1];
		var arr = [];
		
		labelData.each(function(option){
			arr.push({
				disposePage:"'"+process + option.row.val("value")+".a'",
				name:option.row.val("oValue")
			});
		
		})
		
		this.comp('pageData').loadData({
			"@type" : "table",
			"rows" : arr
		})
		this.comp('dataTables1').reload();
		
	};

	Model.prototype.cancelClick = function(event){
		this.comp('windowReceiver').windowCancel();
		
	};

	Model.prototype.okbtnClick = function(event){
		var row = this.comp('pageData').getCurrentRow();
		var disposePage = row.val("disposePage");
		
		this.comp('windowReceiver').windowEnsure(disposePage);
		
		
	};

	return Model;
});