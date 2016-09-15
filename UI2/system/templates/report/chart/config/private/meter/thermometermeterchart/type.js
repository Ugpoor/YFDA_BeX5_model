define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.flag = false;
	};

	Model.prototype.dataValueChanged = function(event) {
		this.flag = true;
	};

	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var type_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var lower = data.getValue("lower", row);
			var upper = data.getValue("upper", row);
			var units = data.getValue("units", row);
			var showType;
			if (self.flag) {
				showType = "show";
			}
			type_data.push({
				"lower" : lower,
				"upper" : upper,
				"units" : units,
				"showType" : showType
			});
		});
		return type_data;
	}

	return Model;
});