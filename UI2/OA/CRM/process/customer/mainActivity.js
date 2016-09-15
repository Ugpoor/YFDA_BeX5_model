define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
		
	var Model = function(){
		this.callParent();
	};

	//关闭功能
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	//新增客户
	Model.prototype.addBtnClick = function(event){
		this.comp('newDialog').open({data : {customerID : "",type:"new"}});

	};

	//新增客户返回后刷新客户列表
	Model.prototype.newDialogReceive = function(event){
		this.comp('customerData').refreshData();
	};

	//查看客户详细信息
	Model.prototype.customerListClick = function(event){
		if(this.comp('customerData').getValue("fName")!=null)
			this.comp('detailDialog').open({data : {customerID : this.comp('customerData').getValue("OA_Customer")}});
	};
	
	//查看客户详细信息后刷新客户列表
	Model.prototype.detailDialogReceive = function(event){
		this.comp('customerData').refreshData();
	};
	
	return Model;
});