define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.marker_visibleChange = function(event){
		this.comp("data").setValue("marker_visible",event.checked);
		this.flag = event.checked;
	};

	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var cordon_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var marker_visible = data.getValue("marker_visible", row);
			var marker_label = data.getValue("marker_label", row);
			var marker_value = data.getValue("marker_value", row);
			var marker_fontName = data.getValue("marker_fontName", row);
			var marker_fontStyle = data.getValue("marker_fontStyle", row);
			var marker_fontSize = data.getValue("marker_fontSize", row);
			var showCordon;
			if (self.flag) {
				showCordon = "show";
			}
			cordon_data.push({
				"marker_visible" : marker_visible,
				"marker_label" : marker_label,
				"marker_value" : marker_value,
				"marker_fontName" : marker_fontName,
				"marker_fontStyle" : marker_fontStyle,
				"marker_fontSize" : marker_fontSize,
				"showCordon" : showCordon
			});
		});
		return cordon_data;
	}
	
	return Model;
});