define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function() {
		this.callParent();
		this.latitude;
		this.longitude;
	};

	//获得经纬度
	Model.prototype.windowReceiverReceive = function(event){
		this.latitude = event.data.latitude;
		this.longitude = event.data.longitude;
	};

	//显示全部客户
	Model.prototype.allCusBtnClick = function(event) {
		this.comp("customerData").filters.clear();
		this.comp("customerData").refreshData();
	};

	//没有选择返回
	Model.prototype.backBtnClick = function(event) {
		this.comp('windowReceiver').windowCancel();
	};

	//点击后返回
	Model.prototype.customerListClick = function(event) {
		var row = this.comp("customerData").getCurrentRow();
		if(row.val('fName') != null )
			this.comp("windowReceiver").windowEnsure(row);
	};

	Model.prototype.buttonGroupSelect = function(event){
		//显示附近客户
		if(event.item.label=="附近"){
			if(this.longitude == undefined){
				alert('无法获取地理位置信息。不能显示附近客户');
				event.cancel = true;
			}else{
				var minLongitude = this.longitude - 0.02;
				var maxLongitude = this.longitude + 0.02;
				var minLatitude = this.latitude - 0.02;
				var maxLatitude = this.latitude + 0.02;

				var filter = "flongitude >= " + minLongitude + " and flongitude <= " + maxLongitude 
			      + " and fLatitude >= " + minLatitude + " and fLatitude <= " + maxLatitude;

				this.comp("customerData").setFilter("filter1",filter);
				this.comp("customerData").refreshData();
			}
		}
	};

	//新增客户
	Model.prototype.addBtnClick = function(event){
		this.comp('newDialog').open({data : {customerID : "",type:"new"}});
	};

	//新增客户后，刷新客户列表
	Model.prototype.newDialogReceive = function(event){
		this.comp("customerData").refreshData();
	};

	return Model;
});