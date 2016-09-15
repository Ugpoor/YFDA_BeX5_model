define(function(require) {
	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.doOK = function(event) {
		var comp = event.source;
		var value = comp.getValue();
		if(value instanceof Date){
			var type = this.comp('mainData').val('type');
			if(type=='datetime') value= justep.Date.toString(value, "yyyy年MM月dd日hh时mm分ss秒");
			else if(type=='date') value= justep.Date.toString(value, "yyyy年MM月dd日");
			else if(type=='time') value= justep.Date.toString(value, "hh时mm分ss秒"); 
		}else value = "";
		this.comp('output').set('value',value);
	};

	Model.prototype.datePickerClick = function(event){
		var comp = this.comp('datePicker');
		comp.set('type',this.comp('mainData').val('type'));
		comp.show();
		comp.setValue(new Date());
	};

	return Model;
});