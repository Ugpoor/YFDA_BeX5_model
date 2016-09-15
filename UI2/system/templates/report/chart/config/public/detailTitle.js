define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.flag = false;
	};

	Model.prototype.modelLoad = function(event) {
		this.comp("chartTitle").val("Justep图表");
	};

	Model.prototype.finish = function(wizard) {
		var title_data = [];
		var data = this.comp("data");
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var isshow = data.getValue("isshow", row);
			var chartTitle = data.getValue("chartTitle", row);
			var chartPosition = data.getValue("chartPosition", row);
			var vertical = data.getValue("vertical", row);
			var horizontal = data.getValue("horizontal", row);
			var fontType = data.getValue("fontType", row);
			var fontStyle = data.getValue("fontStyle", row);
			var fontSize = data.getValue("fontSize", row);
			var showTitle;
			if (self.flag) {
				showTitle = "show";
			}
			title_data.push({
				"isshow" : isshow,
				"chartTitle" : chartTitle,
				"chartPosition" : chartPosition,
				"vertical" : vertical,
				"horizontal" : horizontal,
				"fontType" : fontType,
				"fontStyle" : fontStyle,
				"fontSize" : fontSize,
				"showTitle" : showTitle
			});
		})
		return title_data;
	}

	Model.prototype.checkbox1Change = function(event) {
		this.comp("data").setValue("isshow", event.checked);
		if (event.checked) {
			$(".istrue").show();
		} else {
			$(".istrue").hide();
		}
		this.flag = event.checked;
	};

	return Model;
});