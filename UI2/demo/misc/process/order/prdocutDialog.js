define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	/**
		输入参数
		1. 新建时
			{action: 'new', orderID: 'xx'}
		2. 编辑时
			{action: 'edit', row: {}}
	*/
	Model.prototype.windowReceiverReceive = function(event){
		this.action = event.data.action;
		var data = this.comp("orderDetailData");
		if (event.data.action === "new"){
			data.clear();
			var options = {defaultValues: [{"fOrderID": event.data.orderID}]};
			data.newData(options);
		}else{
			data.loadData({rows: [event.data.row]}, false);
			data.first();
		}
	};

	Model.prototype.cancelBtnClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.okBtnClick = function(event){
		var mainData = this.comp("orderDetailData");
		var options = {row: {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}}, action: this.action};
		$.each(mainData.defCols, function(col){
			options.row[col] = mainData.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	return Model;
});