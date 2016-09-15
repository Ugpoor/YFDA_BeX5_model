define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = true;
	};

	Model.prototype.scale_visibleChange = function(event){
		this.comp("data").setValue("scale_visible",event.checked);
		this.flag = event.checked;
	};
	
	Model.prototype.finish = function(wizard){
		var data = this.comp("data");
		var data_data = [];
		var self = this;
		data.each(function(param){
			var row = param.row;
			var scale_visible= data.getValue("scale_visible", row);
			var lower_bound = data.getValue("lower_bound", row);
			var upper_bound = data.getValue("upper_bound", row);
			var major_tickincrement = data.getValue("major_tickincrement", row);
			var start_angle = data.getValue("start_angle", row);
			var extent = data.getValue("extent", row);
			var major_tickcolor = data.getValue("major_tickcolor", row);
			var minor_tickcolor = data.getValue("minor_tickcolor", row);
			var tick_fontName = data.getValue("tick_fontName", row);
			var tick_fontStyle = data.getValue("tick_fontStyle", row);
			var tick_fontSize = data.getValue("tick_fontSize", row);
			var tick_radius = data.getValue("tick_radius", row);
			var label_offset = data.getValue("label_offset", row);
			var pointer_radius = data.getValue("pointer_radius", row);
			var width_radius = data.getValue("width_radius", row);
			var cap_radius = data.getValue("cap_radius", row);
			var pointer_outlinecolor = data.getValue("pointer_outlinecolor", row);
			var pointer_fillcolor = data.getValue("pointer_fillcolor", row);
			var showData;
			if (self.flag) {
				showData = "show";
			}
			data_data.push({
				"scale_visible" : scale_visible,
				"lower_bound" : lower_bound,
				"upper_bound" : upper_bound,
				"major_tickincrement" : major_tickincrement,
				"start_angle" : start_angle,
				"extent" : extent,
				"major_tickcolor" : major_tickcolor,
				"minor_tickcolor" : minor_tickcolor,
				"tick_fontName" : tick_fontName,
				"tick_fontStyle" : tick_fontStyle,
				"tick_fontSize" : tick_fontSize,
				"tick_radius" : tick_radius,
				"label_offset" : label_offset,
				"pointer_radius" : pointer_radius,
				"width_radius" : width_radius,
				"cap_radius" : cap_radius,
				"pointer_outlinecolor" : pointer_outlinecolor,
				"pointer_fillcolor" : pointer_fillcolor,
				"showData" : showData
			});
		});
		return data_data;
	};
	
	return Model;
});