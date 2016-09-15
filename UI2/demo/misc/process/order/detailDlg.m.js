define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.kind = 'new';
	};

	Model.prototype.windowReceiverReceive = function(event){
		var row = event.data;
		var data = this.comp('detailData');
		data.clear();
		if(!row){
			this.kind = 'new';
			data.add({fUnitprice:0.0,fQuantity:0,fDisCount:1.0});
		}else{
			this.kind = 'edit';
			data.add({fProductCode:row.val('fProductCode'),fProductName:row.val('fProductName'),fUnitprice:row.val('fUnitprice'),fQuantity:row.val('fQuantity'),fDisCount:row.val('fDisCount')});
		}
	};

	Model.prototype.OkBtnClick = function(event){
		this.comp('windowReceiver').windowEnsure({kind:this.kind,row:this.comp('detailData').getCurrentRow()});
	};

	return Model;
});