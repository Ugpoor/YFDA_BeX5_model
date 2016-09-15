define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function() {
		this.callParent();
		this.latitude;
		this.longitude;
	};

	//新增，如果不能获取经纬度，则不能新增
	Model.prototype.windowReceiverReceive = function(event) {
		this.latitude = event.data.latitude;
		this.longitude = event.data.longitude;

		this.comp("visitData").clear();
		this.comp("visitData").newData();
		this.comp("visitData").setValue("fLatitude",this.latitude);
		this.comp("visitData").setValue("flongitude",this.longitude);
	};
	
	//选择客户
	Model.prototype.checkCustomerClick = function(event) {
		this.comp("selectCustomerDialog").open({data:{
			latitude: this.latitude,
			longitude: this.longitude
		}});
	};
	
	//选择客户后
	Model.prototype.selectCustomerDialogReceive = function(event){
		var data = this.comp("visitData");
		data.setValue("fCustomer", event.data.val("fName"));
		data.setValue("fCustomerID", event.data.val("OA_Customer"));
	};
	
	//返回列表
	Model.prototype.backBtnClick = function(event) {
		this.comp("closeMsgDlg").show();
	};

	// 不保存
	Model.prototype.closeMsgDlgClose = function(event){
		if (event.button == 'yes') {
			this.comp('windowReceiver').windowCancel();
		}
	};

	//保存
	Model.prototype.saveBtnClick = function(event) {
		this.comp("visitData").saveData();
		this.comp('windowReceiver').windowEnsure(this.comp("visitData").getCurrentRow());
	};

	return Model;
});