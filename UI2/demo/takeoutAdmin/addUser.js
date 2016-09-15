define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var userData = this.comp("userData");
		userData.clear();
		this.operator = event.data.operator;
		if (this.operator == "new") {
			userData.newData({
				"defaultValues" : [ {
					"fID" : justep.UUID.createUUID()
					
				} ]
			});
		} else if (this.operator == "edit") {
			userData.loadData([ event.data.rowData ]);
			userData.first();
		}
	};

	Model.prototype.okbtnClick = function(event){
		var userData = this.comp("userData");
		var receiver = this.comp("windowReceiver");
		receiver.windowEnsure(userData.getCurrentRow());
	};

	Model.prototype.cancelClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};

	return Model;
});