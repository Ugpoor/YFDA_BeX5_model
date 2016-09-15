define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.isVisible = util.flag;
		this.callParent();
	};
	Model.prototype.selectOneClick = function(event){
		this.comp("statusData").setValue("edit", 1);
	};
	Model.prototype.selectTwoClick = function(event){
		this.comp("statusData").setValue("edit", 2);
	};
	Model.prototype.selectThreeClick = function(event){
		this.comp("statusData").setValue("edit", 3);
	};
	Model.prototype.selectFourClick = function(event){
		this.comp("statusData").setValue("edit", 4);
	};
	Model.prototype.selectFiveClick = function(event){
		this.comp("statusData").setValue("edit", 5);
	};
	Model.prototype.textDataCustomRefresh = function(event){
		var textData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/cross_text.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	textData.loadData(data);
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	//js代码
	Model.prototype.jsBtnClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/cross_vertical.js"
		}, true);
	};
	//打开popmenu
	Model.prototype.sourceClick = function(event) {
		this.comp('popMenu').show();
	};

	//选项1源码
	Model.prototype.leftSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_vertical.w&xid=tabContentOne"
		},true);
	};
	//右表源码
	Model.prototype.rightSourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_vertical.w&xid=tabContentTwo"
		},true);
	};

	return Model;
});