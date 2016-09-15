define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.isVisible = util.flag;
		this.callParent();
	};
	
	Model.prototype.informationDataCustomRefresh = function(event){
		var informationData = event.source;
		$.ajax({
			type: "GET",
			url: require.toUrl('./json/information.json'),
			dataType: 'json',
			async: false,
			cache: false,
			success: function(data){
				informationData.loadData(data);
			},
			error: function(){
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	//js代码
	Model.prototype.jsClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/homepage_Information_tab1.js"
		},true);
	};
	//个人信息源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupOne"
		},true);
	};
	//信息接收源码
	Model.prototype.sourceBtnTwoClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupTwo"
		},true);
	};
	//工作日志源码
	Model.prototype.sourceBtnThreeClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupThree"
		},true);
	};
	//通知公告源码
	Model.prototype.sourceBtnFour = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupFour"
		},true);
	};
	//标准规范源码
	Model.prototype.sourceBtnFive = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupFive"
		},true);
	};
	//内部审核源码
	Model.prototype.sourcrBtnSixe = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab1.w&xid=controlGroupSixe"
		},true);
	};
	return Model;
});