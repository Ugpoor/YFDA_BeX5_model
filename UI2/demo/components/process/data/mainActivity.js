define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		var data = this.comp("dReference_Orders");
		
	};

	Model.prototype.li4Click = function(event){
	    this.comp("dReference_Orders").loadData();
		
	};

	Model.prototype.li5Click = function(event){
		this.comp("dCalculate_OrderDetails").loadData();
		
	};

	Model.prototype.li6Click = function(event){
		this.comp("dOrderBy_Orders").loadData();
	};

	Model.prototype.li7Click = function(event){
		this.comp("dOrderBy_Orders").loadData();
	};

	Model.prototype.li8Click = function(event){
		this.comp("dFilter_Orders").loadData();
	};

	Model.prototype.li9Click = function(event){
		this.comp("dMasterDetail_Orders").loadData();
	};

	Model.prototype.button5Click = function(event){
	    debugger;
		var data = this.comp("dOrderBy_Orders");
		var temp = this.comp("dTemp");
		var field = temp.val("field");
		var type = temp.val("type");
		
		if (field != "" && type != "") {
			data.clearOrderBy();
			data.setOrderBy(field, type);
			data.refreshData();
		} 
	};

	Model.prototype.btnFindClick = function(event){
	    debugger;
	    var ipt = this.getElementByXid("inputFind");
		var txt = $.trim(ipt.value);
		if (txt == "") {
		    justep.Util.hint("请输入收货人姓名（支持模糊查找）", {
				"type" : "danger"
			});
			
		} else {
			var data = this.comp("dFilter_Orders");
			var ids = data.find(["fShipName"], [txt], false, false, true);
			if (ids.length == 0) {
			    justep.Util.hint("没有查到相关的订单", {
				"type" : "danger"
			    });
				
			} else {
				var orderNumbers = [];
				for (var i = 0; i < ids.length; i++) {
					orderNumbers.push(data.getValue("fOrderNumber", ids[i]) + "(" + data.getValue("fShipName", ids[i]) + ")");
				}	
				justep.Util.hint("查到收货人相关的订单有：" + orderNumbers.join(","));
			
			}
		}
	};


	Model.prototype.btnFilterClick = function(event){
		 var ipt = this.getElementByXid("inputFilter");
		var txt = $.trim(ipt.value);
		
		var data = this.comp("dFilter_Orders");
		data.setFilter("shipNameFilter", "fShipName like '%" + txt + "%'");
		data.refreshData();
	};


	Model.prototype.li12Click = function(event){
		this.comp("dTreeGrid_Org").loadData();
		this.comp("dTree_Org").loadData();
	};


	return Model;
});