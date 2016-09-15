define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.dictionaryDataCustomRefresh = function(event){
		var data = [{fID : "1",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"}, 
		            {fID : "2",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "3",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "4",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "5",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "6",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "7",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"},
		            {fID : "8",fValue : "guest",fName : "新增",fRemark : "新增",fOrder : "0"}];
		for ( var i in data) {
			this.comp("dictionaryData").newData({
				defaultValues:[{
					fID : data[i].fID,
					fValue : data[i].fValue,
					fName : data[i].fName,
					fRemark : data[i].fRemark,
					fOrder : data[i].fOrder
				}]
			});
		}
	};

	// js代码
	Model.prototype.jsBtnClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/dic_maintenance.js"
		}, true);
	};

	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/dic_maintenance.w&xid=controlGroup"
		}, true);
	};


	return Model;
});