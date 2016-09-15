define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.flag = false;
	};

	Model.prototype.isCirChange = function(event){
		this.comp("data").setValue("isCir",event.checked);
	};
	
	Model.prototype.finish = function(wizard) {
		var data = this.comp("data");
		var pri_data = [];
		var self = this;
		data.each(function(param) {
			var row = param.row;
			var isCir = data.getValue("isCir", row);
			var bgAlpha = data.getValue("bgAlpha", row);
			var fgAlpha = data.getValue("fgAlpha", row);
			var ndm = data.getValue("ndm", row);
			var laGap = data.getValue("laGap", row);
			var lafontName = data.getValue("lafontName", row);
			var lafontStyle = data.getValue("lafontStyle", row);
			var lafontSize = data.getValue("lafontSize", row);
			var pls = data.getValue("pls", row);
			var plnf = data.getValue("plnf", row);
			var plpf = data.getValue("plpf", row);
			var mttls = data.getValue("mttls", row);
			var mttnf = data.getValue("mttnf", row);
			var mttpf = data.getValue("mttpf", row);
			var showCfg;
			if (self.flag) {
				showCfg = "show";
			}
			pri_data.push({
				"isCir" : isCir,
				"bgAlpha" : bgAlpha,
				"fgAlpha" : fgAlpha,
				"ndm" : ndm,
				"laGap" : laGap,
				"lafontName" : lafontName,
				"lafontStyle" : lafontStyle,
				"lafontSize" : lafontSize,
				"pls" : pls,
				"plnf" : plnf,
				"plpf" : plpf,
				"mttls" : mttls,
				"mttnf" : mttnf,
				"mttpf" : mttpf,
				"showCfg" : showCfg
			});
		});
		return pri_data;
	}
	
	Model.prototype.dataValueChanged = function(event){
		this.flag = true;
	};
	
	return Model;
});