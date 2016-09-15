define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");

	var Model = function() {
		this.callParent();
	};
	
	//显示客户详细信息
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp("customerData");
		detailData.setFilter("filter1", "OA_Customer = '"+event.data.customerID+"'");
		detailData.refreshData();
	};

	//返回客户列表
	Model.prototype.backBtnClick = function(event){
		this.comp('windowReceiver').windowEnsure();
	};

	//编辑客户信息
	Model.prototype.editBtnClick = function(event){
		this.comp('editDialog').open({data : {customerID : this.comp('customerData').getValue('OA_Customer'),type:"edit"}});
	};

	//从编辑客户信息返回，刷新当前客户数据
	Model.prototype.editDialogReceive = function(event){
		this.comp('customerData').refreshData();
	};

	//显示客户地图信息
	Model.prototype.mapBtnClick = function(event){
		var data = this.comp("customerData");
		if(data.val('flongitude') == null){
			alert("该客户没有地理位置信息");
			return;
		}
		var vData = this.comp('lastVisitData');
		vData.setFilter("filter1", "OA_CustomerVisit.fCustomerID = '" + data.getValue("OA_Customer") + "' and OA_CustomerVisit.flongitude is not null");
		vData.refreshData();

		var arrMapInfo = new Array();

		if(vData.getCount() > 0){
			arrMapInfo.push(OA.getMapInfo(vData.getCurrentRow(), this.getContext()));
		}else{
			arrMapInfo.push(OA.getMapInfoFromCustomer(data.getCurrentRow(), this.getContext()));
		}
		this.comp('mapDialog').open({
			data : arrMapInfo
		});		

	};
	
	return Model;
});
