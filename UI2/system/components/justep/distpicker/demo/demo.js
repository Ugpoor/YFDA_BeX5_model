define(function(require) {
	//var $ = require("jquery");
	// var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.doOK = function(event) {
		var comp = event.source;
		var value = comp.getValue();
		this.comp('input1').val(value.province + ' ' + value.city + ' ' + value.district);
	};

	Model.prototype.input1Click = function(event) {
		var ditpicker2 = this.comp('distPicker2');
		ditpicker2.show();
	};

	return Model;
});