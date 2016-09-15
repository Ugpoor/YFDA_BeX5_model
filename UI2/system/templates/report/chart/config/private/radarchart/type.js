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
	
	Model.prototype.finish = function(wizard){
		var data = this.comp("data");
		var self = this;
		var type_data = [];
		data.each(function(param) {
			var row = param.row;
			var ticks_count = data.getValue("ticks_count",row);
			var gap = data.getValue("gap",row);
			var fontName = data.getValue("fontName",row);
			var fontStyle = data.getValue("fontStyle",row);
			var fontSize = data.getValue("fontSize",row);
			var showType;
			if (self.flag) {
				showType = "show";
			}
			type_data.push({
				"ticks_count" : ticks_count,
				"gap" : gap,
				"fontName" : fontName,
				"fontStyle" : fontStyle,
				"fontSize" : fontSize,
				"showType" : showType
			});
		});
		return type_data;
	}

	return Model;
});