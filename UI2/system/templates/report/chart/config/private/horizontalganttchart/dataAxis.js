define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.serie_visibleChange = function(event){
		this.comp("data").setValue("serie_vis", event.checked);
	};

	Model.prototype.serie_No_autoChange = function(event){
		this.comp("data").setValue("serie_No_auto",event.checked);
	};

	Model.prototype.serie_double_axisChange = function(event){
		this.comp("data").setValue("serie_double_axis",event.checked);
	};

	Model.prototype.dataValueChanged = function(event){
		this.flag = true;
	};
	
	Model.prototype.finish = function(wizard){
		var data = this.comp("data");
		var axis_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var serie_vis = data.getValue("serie_vis", row);
			var serie_title = data.getValue("serie_title", row);
			var serie_title_fontName= data.getValue("serie_title_fontName", row);
			var serie_title_fontStyle = data.getValue("serie_title_fontStyle", row);
			var serie_title_fontSize = data.getValue("serie_title_fontSize", row);
			var serie_No_auto = data.getValue("serie_No_auto", row);
			var serie_No_start = data.getValue("serie_No_start", row);
			var serie_No_end = data.getValue("serie_No_end", row);
			var serie_No_step = data.getValue("serie_No_step", row);
			var serie_tick_fontName = data.getValue("serie_tick_fontName", row);
			var serie_tick_fontStyle = data.getValue("serie_tick_fontStyle", row);
			var serie_tick_fontSize = data.getValue("serie_tick_fontSize", row);
			var serie_No_fm = data.getValue("serie_No_fm", row);
			var serie_upper_margin = data.getValue("serie_upper_margin", row);
			var serie_double_axis = data.getValue("serie_double_axis", row);
			var serie_one_axis = data.getValue("serie_one_axis", row);
			var serie_two_axis = data.getValue("serie_two_axis", row);
			var showAxis;
			if (self.flag) {
				showAxis = "show";
			}
			axis_data.push({
				"serie_vis" : serie_vis,
				"serie_title" : serie_title,
				"serie_title_fontName" : serie_title_fontName,
				"serie_title_fontStyle" : serie_title_fontStyle,
				"serie_title_fontSize" : serie_title_fontSize,
				"serie_No_auto" : serie_No_auto,
				"serie_No_start" : serie_No_start,
				"serie_No_end" : serie_No_end,
				"serie_No_step" : serie_No_step,
				"serie_tick_fontName" : serie_tick_fontName,
				"serie_tick_fontStyle" : serie_tick_fontStyle,
				"serie_tick_fontSize" : serie_tick_fontSize,
				"serie_No_fm" : serie_No_fm,
				"serie_upper_margin" : serie_upper_margin,
				"serie_double_axis" : serie_double_axis,
				"serie_one_axis" : serie_one_axis,
				"serie_two_axis" : serie_two_axis,
				"showAxis" : showAxis
			});
		});
		
		return axis_data;
	};

	return Model;
});