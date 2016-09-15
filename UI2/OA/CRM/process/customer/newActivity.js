define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();

	var Model = function() {
		this.callParent();
	};

	//新增客户、编辑客户时显示客户信息
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp("customerData");
		detailData.clear();
		this.comp("statusData").setValue( "status", event.data.type);
		
		if (event.data.type == "edit") {
			detailData.setFilter("filter1", "OA_Customer = '" + event.data.customerID + "'");
			detailData.refreshData();
			this.comp("titleBar").setTitle("编辑客户");
		}else {
			detailData.newData();
			this.comp("titleBar").setTitle("新建客户");
		}
	};

	//返回客户列表
	Model.prototype.backBtnClick = function(event) {
		this.comp("closeMsgDlg").show();
	};

	// 不保存
	Model.prototype.closeMsgDlgClose = function(event){
		if (event.button == 'yes') {
			this.comp('windowReceiver').windowCancel();
		}
	};

	//保存客户，并返回客户列表
	Model.prototype.saveBtnClick = function(event) {
		var socialData1 = this.comp("relativeOrg1").getSocialDataComponent();
		var socialData2 = this.comp("relativeOrg2").getSocialDataComponent();
		if (socialData1.isChanged() || socialData2.isChanged()) {
			this.comp('customerData').setValue('fLastModifyTime', justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
		}

		this.comp("customerData").saveData();
		this.comp('windowReceiver').windowEnsure(this.comp('customerData').getCurrentRow());
	};

	
	//显示省
	Model.prototype.selectProvinceClick = function(event) {
		this.comp("contents").to("province");
		this.comp("provinceData").refreshData();
	};

	//选择省、显示市
	Model.prototype.listProvinceClick = function(event){
		var customerData = this.comp("customerData");
		var provinceData = this.comp("provinceData");
		
		customerData.setValue("fCity","");
		customerData.setValue("fCityID", "");
		customerData.setValue("fZone", "");
		customerData.setValue("fZoneID", "");
		customerData.setValue("fProvince", provinceData.getValue("fName"));
		customerData.setValue("fProvinceID", provinceData.getValue("DEMO_Province"));
		
		var cityData = this.comp("cityData");
		cityData.setFilter("filter2", "DEMO_City.fProvinceID ='" + provinceData.getValue("DEMO_Province") + "'");
		cityData.refreshData();

		this.comp("contents").to("city");
	};

	//选择市、显示区
	Model.prototype.listCityClick = function(event){
		var customerData = this.comp("customerData");
		var cityData = this.comp("cityData");
		
		customerData.setValue("fZone", "");
		customerData.setValue("fZoneID", "");
		customerData.setValue("fCity", cityData.getValue("fName"));
		customerData.setValue("fCityID", cityData.getValue("DEMO_City"));
		
		var zoneData = this.comp("zoneData");
		zoneData.setFilter("filter3", "DEMO_Zone.fCityID ='" + this.comp("customerData").getValue("fCityID") + "'");
		zoneData.refreshData();
		
		this.comp("contents").to("zone");
	};

	//选择区
	Model.prototype.listZoneClick = function(event){
		var customerData = this.comp("customerData");
		var zoneData = this.comp("zoneData");
		customerData.setValue("fZone", zoneData.getValue("fName"));
		customerData.setValue("fZoneID", zoneData.getValue("DEMO_Zone"));
		
		this.comp("contents").to("mainField");
	};

	//返回客户信息页
	Model.prototype.backMain = function(event){
		this.comp("contents").to("mainField");
	};
	
	//删除客户
	Model.prototype.divDelClick = function(event){
		this.comp("customerData").deleteData();
		this.comp("customerData").saveData();
		this.comp('windowReceiver').windowEnsure();
	};

	//点新增，切换到选择添加字段页
	Model.prototype.divAddMoreClick = function(event){
		this.comp("contents").to("checkField");
		this.comp("customerData").getValue("fPhone");
	};
  
	//点自定义字段，切换到新增字段页
	Model.prototype.divAddFieldClick = function(event){
		this.comp("contents").to("moreField");
		this.comp("moreFieldData").newData();
	};
  
	//返回客户信息页
	Model.prototype.checkBackBtnClick = function(event) {
		this.comp("contents").to("mainField");
	};

	//保存新增字段
	Model.prototype.moreSaveBtnClick = function(event) {
		var data = this.comp("custMoreData");
		var newdata = this.comp("moreFieldData");
		data.newData({index : 0});
		data.setValue("OA_CustomrMore", newdata.getValue("OA_CustomrMore"));
		data.setValue("fCustomerID", this.comp("customerData").getValue("OA_Customer"));
		data.setValue("fFieldName", newdata.getValue("fFieldName"));
		data.setValue("fFieldValue", newdata.getValue("fFieldValue"));
		
		this.comp("contents").to("checkField");
	};
	//返回选择添加字段页
	Model.prototype.moreBaceBtnClick = function(event) {
		this.comp("contents").to("checkField");
	};

	return Model;
});