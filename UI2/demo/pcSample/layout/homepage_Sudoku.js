define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.isVisible = util.flag;
		this.callParent();
	};
	
	Model.prototype.getUrl = function(imgUrl){
		return require.toUrl("./img/"+imgUrl);
	};
	
	Model.prototype.gridClick = function(event){
		var row = event.bindingContext.$object;
		this.comp("messageDialog").show({title:row.val("fTitle")});
	};
	//js代码
	Model.prototype.showjsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/homepage_Sudoku.js"
		},true);
	};
	//源码
	Model.prototype.showPageSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Sudoku.w&xid=window"
		},true);
	};
	
	return Model;
});