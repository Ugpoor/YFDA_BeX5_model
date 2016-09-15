define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.isVisibleChange = function(event){
		this.comp("data").setValue("isVisible", event.checked);
	};

	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var type_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var titleName = data.getValue("titleName", row);
			var titlefontName = data.getValue("titlefontName", row);
			var titlefontStyle = data.getValue("titlefontStyle", row);
			var titlefontSize = data.getValue("titlefontSize", row);
			var margin = data.getValue("margin", row);
			var upperMargin = data.getValue("upperMargin", row);
			var lowerMargin = data.getValue("lowerMargin", row);
			var labelWidth = data.getValue("labelWidth", row);
			var tickfontName = data.getValue("tickfontName", row);
			var tickfontStyle = data.getValue("tickfontStyle", row);
			var tickfontSize = data.getValue("tickfontSize", row);
			var labelAngle = data.getValue("labelAngle", row);
			var itemfontName = data.getValue("itemfontName", row);
			var itemfontType = data.getValue("itemfontType", row);
			var itemfontSize = data.getValue("itemfontSize", row);
			var itemMargin = data.getValue("itemMargin", row);
			var itemMaxWid = data.getValue("itemMaxWid", row);
			var itemOutLine = data.getValue("itemOutLine", row);
			var itemNumFm = data.getValue("itemNumFm", row);
			var isVisible = data.getValue("isVisible", row);
			var isshowType = data.getValue("isshowType", row);
			var num_start = data.getValue("num_start", row);
			var num_end = data.getValue("num_end", row);
			var num_step = data.getValue("num_step", row);
			var num_auto = data.getValue("num_auto", row);
			var showCfg;
			if(self.flag){
				showCfg = "show";
			}
			type_data.push({
				"titleName" : titleName,
				"titlefontName" : titlefontName,
				"titlefontStyle" : titlefontStyle,
				"titlefontSize" : titlefontSize,
				"margin" : margin,
				"upperMargin" : upperMargin,
				"lowerMargin" : lowerMargin,
				"labelWidth" : labelWidth,
				"tickfontName" : tickfontName,
				"tickfontStyle" : tickfontStyle,
				"tickfontSize" : tickfontSize,
				"labelAngle" : labelAngle,
				"itemfontName" : itemfontName,
				"itemfontType" : itemfontType,
				"itemfontSize" : itemfontSize,
				"itemMargin" : itemMargin,
				"itemMaxWid" : itemMaxWid,
				"itemOutLine" : itemOutLine,
				"itemNumFm" : itemNumFm,
				"isVisible" : isVisible,
				"showCfg" : showCfg,
				"isshowType" : isshowType,
				"num_start" : num_start,
				"num_end" : num_end,
				"num_step" : num_step,
				"num_auto" : num_auto,
			});
		});
		return type_data;
	}

	Model.prototype.dataValueChanged = function(event){
		this.flag = true;
	};

	Model.prototype.isshowTypeChange = function(event){
		this.comp("data").setValue("isshowType",event.checked);
	};

	Model.prototype.checkbox2Change = function(event){
		this.comp("data").setValue("num_auto", event.checked);
	};

	return Model;
});