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

	// <column label="indicator_radius" name="indicator_radius" type="String"/>
	// <column label="indicator_angle" name="indicator_angle" type="String"/>
	// <column label="indicator_outlinecolor" name="indicator_outlinecolor"
	// type="String"/>
	// <column label="indicator_fontName" name="indicator_fontName"
	// type="String"/>
	// <column label="indicator_fontStyle" name="indicator_fontStyle"
	// type="String"/>
	// <column label="indicator_fontSize" name="indicator_fontSize"
	// type="String"/>
	// <column label="dial_annotation" name="dial_annotation" type="String"/>
	// <column label="annotation_fontName" name="annotation_fontName"
	// type="String"/>
	// <column label="annotation_fontStyle" name="annotation_fontStyle"
	// type="String"/>
	// <column label="annotation_fontSize" name="annotation_fontSize"
	// type="String"/>
	// <column label="annotation_radius" name="annotation_radius"
	// type="String"/>
	// <column label="annotation_angle" name="annotation_angle" type="String"/>
	// <column label="rangle_innerradius" name="rangle_innerradius"
	// type="String"/>
	// <column label="rangle_outerradius" name="rangle_outerradius"
	// type="String"/>
	// <column label="dial_viewx" name="dial_viewx" type="String"/>
	// <column label="dial_viewy" name="dial_viewy" type="String"/>
	// <column label="dial_viewwidth" name="dial_viewwidth" type="String"/>
	// <column label="dial_viewheight" name="dial_viewheight" type="String"/>

	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var type_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var indicator_radius = data.getValue("indicator_radius", row);
			var indicator_angle = data.getValue("indicator_angle", row);
			var indicator_outlinecolor = data.getValue("indicator_outlinecolor", row);
			var indicator_fontName = data.getValue("indicator_fontName", row);
			var indicator_fontStyle = data.getValue("indicator_fontStyle", row);
			var indicator_fontSize = data.getValue("indicator_fontSize", row);
			var dial_annotation = data.getValue("dial_annotation", row);
			var annotation_fontName = data.getValue("annotation_fontName", row);
			var annotation_fontStyle = data.getValue("annotation_fontStyle", row);
			var annotation_fontSize = data.getValue("annotation_fontSize", row);
			var annotation_radius = data.getValue("annotation_radius", row);
			var annotation_angle = data.getValue("annotation_angle", row);
			var rangle_innerradius = data.getValue("rangle_innerradius", row);
			var rangle_outerradius = data.getValue("rangle_outerradius", row);
			var dial_viewx = data.getValue("dial_viewx", row);
			var dial_viewy = data.getValue("dial_viewy", row);
			var dial_viewwidth = data.getValue("dial_viewwidth", row);
			var dial_viewheight = data.getValue("dial_viewheight", row);
			var showType;
			if (self.flag) {
				showType = "show";
			}
			type_data.push({
				"indicator_radius" : indicator_radius,
				"indicator_angle" : indicator_angle,
				"indicator_outlinecolor" : indicator_outlinecolor,
				"indicator_fontName" : indicator_fontName,
				"indicator_fontStyle" : indicator_fontStyle,
				"indicator_fontSize" : indicator_fontSize,
				"dial_annotation" : dial_annotation,
				"annotation_fontName" : annotation_fontName,
				"annotation_fontStyle" : annotation_fontStyle,
				"annotation_fontSize" : annotation_fontSize,
				"annotation_radius" : annotation_radius,
				"annotation_angle" : annotation_angle,
				"rangle_innerradius" : rangle_innerradius,
				"rangle_outerradius" : rangle_outerradius,
				"dial_viewx" : dial_viewx,
				"dial_viewy" : dial_viewy,
				"dial_viewwidth" : dial_viewwidth,
				"dial_viewheight" : dial_viewheight,
				"showType" : showType
			});
		});
		return type_data;
	}

	return Model;
});