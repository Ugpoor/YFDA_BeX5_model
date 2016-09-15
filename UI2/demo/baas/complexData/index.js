define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.userDataBeforeRefresh = function(event){
		var searchVal = this.getElementByXid("searchInput").value;
		var data = event.source;
		data.filters.setVar("search",'%'+searchVal+'%');
		data.filters.setVar("useSearch",searchVal?1:0);
	};

	return Model;
});