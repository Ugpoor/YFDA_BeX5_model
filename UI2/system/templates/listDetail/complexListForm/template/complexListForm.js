define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};
	
	Model.prototype.returnMainView = function(event){
		this.comp("contents").to("mainView");
	};

	Model.prototype.deleteBtn = function(event){
		this.comp(this.comp("list").get("data")).deleteData(event.bindingContext.$object);
	};

	Model.prototype.showDetailView = function(event){
		this.comp("contents").to("detailView");
	};

	return Model;
});
