define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");
	
	var Model = function(){
		this.callParent();
		this.pk;
		this.checkedValue;
		this.checkedType;
	};

	Model.prototype.windowReceiverReceive = function(event){
		this.checkedType = event.data.type;
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
		var checkedType = this.checkedType;
		var checkedValue = this.checkedValue;
		if(!checkedValue){
			alert('您还没有选择字段');
			return;
		}
		this.comp('windowReceiver').windowEnsure({
			type:checkedType,
			columnName:checkedValue
		});
	};


	Model.prototype.formDataValueChanged = function(event){
		if ("check" == event.col && true === event.value)
			this.checkedValue = event.row.val("name");
	};


	Model.prototype.radioChange = function(event){		  
		if(event.source.value){
			this.checkedValue = event.bindingContext.$object.val('name');
		}
	};




	return Model;
});