define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.dataValueChanged = function(event){
		this.flag = true;
	};
	
	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var other_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var bgColor = data.getValue("bgColor", row);
			var bgAlpha = data.getValue("bgAlpha", row);
			var pgAlpha = data.getValue("pgAlpha", row);
			var showCfg;
			if (self.flag) {
				showCfg = "show";
			}
			other_data.push({
				"bgColor" : bgColor,
				"bgAlpha" : bgAlpha,
				"pgAlpha" : pgAlpha,
				"showCfg" : showCfg
			});
		});
		return other_data;
	}

	return Model;
});