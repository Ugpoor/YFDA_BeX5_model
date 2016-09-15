define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	
	var Model = function() {
		this.callParent();
	};
	Model.prototype.closeWin = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.menuClick = function(event) {
		this.comp("popMenu").show();
	};

	Model.prototype.addDetailClick = function(event) {
		this.comp("addDetailDlg").open();
		/*
		var data = this.comp('detailData');
		data.newData({
			defaultValues : [ {
				fUnitprice : 0.0,
				fQuantity : 0,
				fDisCount : 1.0,
				fFactAmt : 0
			} ]
		});
		*/
	};
	Model.prototype.addDetailDlgReceive = function(event) {
		var row = event.data.row;
		var kind = event.data.kind;
		var data = this.comp('detailData');
		if ('new' === kind)
			data.newData({
				defaultValues : [ {
					fProductCode : row.val('fProductCode'),
					fProductName : row.val('fProductName'),
					fUnitprice : row.val('fUnitprice'),
					fQuantity : row.val('fQuantity'),
					fDisCount : row.val('fDisCount')
				} ]
			});
		else {
			data.setValue('fProductCode', row.val('fProductCode'));
			data.setValue('fProductName', row.val('fProductName'));
			data.setValue('fUnitprice', row.val('fUnitprice'));
			data.setValue('fQuantity', row.val('fQuantity'));
			data.setValue('fDisCount', row.val('fDisCount'));
		}
	};
	Model.prototype.deleteClick = function(event) {
		this.comp('detailData').deleteData(event.bindingContext.$object,{async:true});
	};

	return Model;
});
