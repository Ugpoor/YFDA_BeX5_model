define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.returnClick = function(event) {
		this.close();
	};

	Model.prototype.toURL = function(imgUrl) {
		return imgUrl ? require.toUrl(imgUrl) : "";

	};
	Model.prototype.girlDataCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/girlData.json");
		allData.loadDataFromFile(url, event.source, true);
	};
	
	//打开查看大图页
	Model.prototype.openPage = function() {
		justep.Shell.showPage("bigPicture");
	}

	Model.prototype.image2Click = function(event) {
		this.openPage();

	};
	Model.prototype.image5Click = function(event){
		this.openPage();
	};
	
	Model.prototype.image4Click = function(event){
		this.openPage();
	};
	
	return Model;
});