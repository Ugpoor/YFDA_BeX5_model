define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.mainBeforeRefresh = function(event){

	};

	Model.prototype.addBtnClick = function(event){
		//从门户获取门户配置
		var dom = $(".page-root").get(0);
		if(dom){
			var config = justep.Bind.contextFor(dom).$model._getCurrentLayout();
			var mainData = this.comp("main");
			mainData.newData({
				"defaultValues" : [{
					sPersonID: this.getContext().getCurrentPersonID(),
					sThemeActivity: "activity",
					sPortal: JSON.stringify(config.portal),
					sOther: JSON.stringify(config.other),
					sPublishType: "system4portal3",
					sThemeName: ""
				}]
			});
		}else{
			justep.Util.hint("首页异常!确认门户首页正常打开了吗?");
		}
	};

	Model.prototype.gridCellRender = function(event){
		if(event.colName == "sThemeActivity"){
			var value = event.colVal;
			if(value != "disable")
				event.html = "可用";
			else	 
				event.html = "不可用";
		}
	};

	Model.prototype.stopBtnClick = function(event){
		var mainData = this.comp("main");
		mainData.setValue("sThemeActivity", "disable");
	};

	Model.prototype.playBtnClick = function(event){
		var mainData = this.comp("main");
		mainData.setValue("sThemeActivity", "activity");
	};

	return Model;
});