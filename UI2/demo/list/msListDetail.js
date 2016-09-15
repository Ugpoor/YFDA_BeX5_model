define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.addProductBtnClick = function(event){
		var orderID = this.comp("orderData").getCurrentRowID();
		var options = {action: "new", orderID: orderID};
		this.comp("productDialog").open({data: options});
	};

	Model.prototype.editProductBtnClick = function(event){
		var mainData = this.comp("orderDetailData");
		var row = {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}};
		$.each(mainData.defCols, function(col){
			row[col] = mainData.val(col);
		});
		var options = {action: "edit", row: row};
		this.comp("productDialog").open({data: options});
	};
	
	Model.prototype.hasOrderDetail = function(){
		return this.comp("orderDetailData").getCount() > 0;
	};

	Model.prototype.productDialogReceive = function(event){
		var mainData = this.comp("orderDetailData");
		if (event.data.action === "new"){
			var id = event.data.row[mainData.idColumn];
			this.comp("orderDetailData").loadData({rows: [event.data.row]}, true);
			mainData.to(id);
		}else{
			$.each(mainData.defCols, function(col){
				mainData.setValue(col, event.data.row[col]);
			});
		};
	};
	
	Model.prototype.orderDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	return Model;
});