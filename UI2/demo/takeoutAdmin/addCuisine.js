define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.okbtnClick = function(event){
		var row = this.comp('cuisineDetailData').getCurrentRow();
		this.comp('windowReceiver').windowEnsure(row);
	};

	Model.prototype.windowReceiverReceive = function(event){
		this.comp('cuisineDetailData').clear();
		if(event.data == null){
			this.comp('cuisineDetailData').newData({
				defaultValues :[{
					fID : justep.UUID.createUUID()
					
				}]
			})
		}else{
			this.comp('cuisineDetailData').loadData([ event.data ]);
			this.comp('cuisineDetailData').first();
		}
	
	};

	Model.prototype.cancelClick = function(event){
		this.comp('windowReceiver').windowCancel();
		
	};

	return Model;
});