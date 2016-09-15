define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");
	
	var Model = function(){
		this.callParent();
		this.pk;
	};

	Model.prototype.windowReceiverReceive = function(event){
		
		var result = BAASModel.getFileds(event.data.db,event.data.table);
		var data = this.comp('formData');
		var values = [];
		for ( var i = 0; i < result.length; i++) {
			values[i] = {};
			values[i].index = i;
			values[i].name = result[i].name;
			values[i].dataType = result[i].dataType;
			values[i].labelName = result[i].remarks;
			values[i].colEditor = 'input';
			values[i].check = true;
			if(result[i].pk){
				this.pk = result[i].name;
			}
		}
		data.clear();
		if(values.length>0){
			data.newData({
				defaultValues : values
			});
		}
	};

	Model.prototype.okBtnClick = function(event){
		
		var pk = this.pk;
		var rows = [];
		this.comp('formData').each(function(param){
    	if(param.row.val('check')){
    			rows.push(param.row);
    		}
		});
		
		this.comp('windowReceiver').windowEnsure({
			rows:rows,
			pk:pk
		});
	};



	Model.prototype.allCheckClick = function(event){
		this.comp('formData').each(function(param){
			if(!param.row.val('check')){
    			param.row.val('check',true);
    		}
		});
	};


	Model.prototype.allNotCheckClick = function(event){
		this.comp('formData').each(function(param){
			if(param.row.val('check')){
    			param.row.val('check',false);
    		}
		});
	};


	return Model;
});