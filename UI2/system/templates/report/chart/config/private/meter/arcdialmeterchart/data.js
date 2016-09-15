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
	
//	<column label="scale_visible" name="scale_visible" type="String"/>  
//      <column label="lower_bound" name="lower_bound" type="String"/>  
//      <column label="upper_bound" name="upper_bound" type="String"/>  
//      <column label="major_tickincrement" name="major_tickincrement" type="String"/>  
//      <column label="minor_tickcount" name="minor_tickcount" type="String"/>  
//      <column label="start_angle" name="start_angle" type="String"/>  
//      <column label="extent" name="extent" type="String"/>  
//      <column label="major_tickcolor" name="major_tickcolor" type="String"/>  
//      <column label="minor_tickcolor" name="minor_tickcolor" type="String"/>  
//      <column label="tick_fontName" name="tick_fontName" type="String"/>  
//      <column label="tick_fontStyle" name="tick_fontStyle" type="String"/>  
//      <column label="tick_fontSize" name="tick_fontSize" type="String"/>  
//      <column label="tick_radius" name="tick_radius" type="String"/>  
//      <column label="label_offset" name="label_offset" type="String"/>  
//      <column label="pointer_radius" name="pointer_radius" type="String"/>  
//      <column label="width_radius" name="width_radius" type="String"/>  
//      <column label="cap_radius" name="cap_radius" type="String"/>  
//      <column label="dial_viewx" name="dial_viewx" type="String"/> 
//      <column label="dial_viewy" name="dial_viewy" type="String"/> 
//      <column label="dial_viewwidth" name="dial_viewwidth" type="String"/> 
//      <column label="dial_viewheight" name="dial_viewheight" type="String"/> 
	
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
			var dial_viewx = data.getValue("dial_viewx", row);
			var dial_viewy = data.getValue("dial_viewy", row);
			var dial_viewwidth = data.getValue("dial_viewwidth", row);
			var dial_viewheight = data.getValue("dial_viewheight", row);
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
				"showData" : showData,
				"dial_viewx" : dial_viewx,
				"dial_viewy" : dial_viewy,
				"dial_viewwidth" : dial_viewwidth,
				"dial_viewheight" : dial_viewheight,
			});
		});
		return data_data;
	};
	
	return Model;
});