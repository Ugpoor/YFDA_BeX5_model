define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = true;
	};

	Model.prototype.tick_cisibleChange = function(event){
		this.comp("data").setValue("tick_cisible", event.checked);
		this.flag = event.checked;
	};
	/*
		   <column label="tick_cisible" name="tick_cisible" type="String"/>  
      <column label="tick_color" name="tick_color" type="String"/>  
      <column label="ticklabel_color" name="ticklabel_color" type="String"/>  
      <column label="tick_size" name="tick_size" type="String"/>  
      <column label="tick_fontName" name="tick_fontName" type="String"/>  
      <column label="tick_fontStyle" name="tick_fontStyle" type="String"/>  
      <column label="tick_fontSize" name="tick_fontSize" type="String"/>  
      <column label="needle_color" name="needle_color" type="String"/>  
      <column label="value_color" name="value_color" type="String"/>  
      <column label="units" name="units" type="String"/>  
      <column label="value_fontName" name="value_fontName" type="String"/>  
      <column label="value_fontStyle" name="value_fontStyle" type="String"/>  
      <column label="value_fontSize" name="value_fontSize" type="String"/>  
      <column label="dial_background" name="dial_background" type="String"/>  
      <column label="dial_outline" name="dial_outline" type="String"/>  
      <column label="meter_angle" name="meter_angle" type="String"/> 
*/
	Model.prototype.finish = function(wizard){
		var data = this.comp("data");
		var type_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var tick_cisible = data.getValue("tick_cisible", row);
			var tick_color = data.getValue("tick_color", row);
			var ticklabel_color = data.getValue("ticklabel_color", row);
			var tick_size = data.getValue("tick_size", row);
			var tick_fontName = data.getValue("tick_fontName", row);
			var tick_fontStyle = data.getValue("tick_fontStyle", row);
			var tick_fontSize = data.getValue("tick_fontSize", row);
			var needle_color = data.getValue("needle_color", row);
			var value_color = data.getValue("value_color", row);
			var units = data.getValue("units", row);
			var value_fontName = data.getValue("value_fontName", row);
			var value_fontStyle = data.getValue("value_fontStyle", row);
			var value_fontSize = data.getValue("value_fontSize", row);
			var dial_background = data.getValue("dial_background", row);
			var dial_outline = data.getValue("dial_outline", row);
			var meter_angle = data.getValue("meter_angle", row);
			var showType;
			if (self.flag) {
				showType = "show";
			}
			type_data.push({
			"tick_cisible" : tick_cisible,
			"tick_color" : tick_color,
			"ticklabel_color" : ticklabel_color,
			"tick_size" : tick_size,
			"tick_fontName" : tick_fontName,
			"tick_fontStyle" : tick_fontStyle,
			"tick_fontSize" : tick_fontSize,
			"needle_color" : needle_color,
			"value_color" : value_color,
			"units" : units,
			"value_fontName" : value_fontName,
			"value_fontStyle" : value_fontStyle,
			"value_fontSize" : value_fontSize,
			"dial_background" : dial_background,
			"dial_outline" : dial_outline,
			"meter_angle" : meter_angle,
			"showType" : showType,
			});
		});
		return type_data;
	}

	
	return Model;
});