define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
    var TextOut = {
      
		formatText : function(text) {
			return text.toString().replace(/</g, "&lt;");
		},
		clear : function(container) {
			$(container).empty();
		},
		setText : function(container, text) {
		    debugger;
			$(container).html("<pre>" + this.formatText(text) + "</pre>");
		},
		appendText : function(container, text) {
			$(container).append("<pre>" + this.formatText(text) + "</pre>");
		}
	};
	
	Model.prototype.li9Click = function(event){
		if (!this.comp("dWhere").loaded) {
			this.comp("dWhere").refreshData();
			divWhereCode = this.getElementByXid("divWhereCode");
			divWhereCode.innerText = "this.dWhereProductsAfterRefresh = " + this.dWhereProductsAfterRefresh.toString()
			                        +  "this.btnWhereQueryClick = " + this.btnWhereQueryClick.toString();
	    
			TextOut.setText("divWhereCode", "this.dWhereProductsAfterRefresh = " + this.dWhereProductsAfterRefresh.toString());
			TextOut.appendText("divWhereCode", "this.btnWhereQueryClick = " + this.btnWhereQueryClick.toString());
		}
	};


	Model.prototype.li5Click = function(event){
	    debugger;
		if (!this.comp("dOrders").loaded) {
			this.comp("dOrders").refreshData();
	        var divQueryDEMO_OrdersAction = this.getElementByXid("divQueryDEMO_OrdersAction");
			divQueryDEMO_OrdersAction.innerText =
			"select \n" + 
			"	DEMO_Orders.*, \n" +
			"	DEMO_Customers.fCompanyName as fCompanyName,DEMO_Customers.fContactName as fContactName,DEMO_Customers.fPhone as fPhone, \n" +
			"	( \n" +
			"		SELECT  (SUM( DEMO_OrderDetails.fUnitPrice * DEMO_OrderDetails.fQuantity )) AS sumMoney \n" + 
			"		FROM DEMO_OrderDetails DEMO_OrderDetails   \n" +
			"		WHERE DEMO_OrderDetails.fOrderID = DEMO_Orders \n" +
			"	) as fTotalMoney, \n" +
			"	( \n" +
			"		CASE \n" + 
			"			WHEN DEMO_Orders.fStatus = 'checking' THEN '审批中' \n" +
			"			WHEN DEMO_Orders.fStatus = 'checked' THEN '已审批' \n" +
			"			WHEN DEMO_Orders.fStatus = 'shipped' THEN '已发货' \n" +
			"		END \n" +
			"	) as fStatusName, \n" +
			"	'' as fChineseTotalMoney, '' as fChineseFreght \n" + 
			"from DEMO_Orders DEMO_Orders \n" +  
			"	optional  join DEMO_Customers DEMO_Customers on DEMO_Orders.fCustomerID = DEMO_Customers ";
			
			var divQueryDEMO_OrderDetailsAction = this.getElementByXid("divQueryDEMO_OrderDetailsAction");
			divQueryDEMO_OrderDetailsAction.innerText = 	
			"select DEMO_OrderDetails.*, \n" +
			"	( DEMO_OrderDetails.fUnitPrice * DEMO_OrderDetails.fQuantity ) as fMoney, \n" +
			"	DEMO_Products.fProductName as fProductName,DEMO_Products.fQuantityPerUnit as fQuantityPerUnit \n" +
			"from DEMO_OrderDetails DEMO_OrderDetails \n" + 
			"	optional  join DEMO_Products DEMO_Products on DEMO_OrderDetails.fProductID = DEMO_Products ";
		}
	};

	Model.prototype.dWhereProductsAfterRefresh = function(event){
	/*	event.source.insert("_all_", 0, {
		"fProductName": "全部"
	});*/
	};

	Model.prototype.btnWhereQueryClick = function(event){
		// 查找订单
		var data = this.comp("dWhere");
		var productID = this.comp("dTemp").getValue("productID");
	
		if (!productID || productID == "_all_") {
		// 清空过滤条件，显示全部订单
			data.setFilter("productFilter", "");
		} else {
		// 用子查询过滤包含选中产品的订单
			data.setFilter("productFilter", "DEMO_Orders IN (SELECT od.fOrderID FROM DEMO_OrderDetails od WHERE od.fProductID = '" + productID + "') ");
		}
		data.refreshData();
	};

	Model.prototype.li12Click = function(event){
		if (!this.comp("dDistinctFalse").loaded) {
		this.comp("dDistinctFalse").refreshData();
		this.comp("dDistinctTrue").refreshData();
		var divQueryDistinctShipCityAction = this.getElementByXid("divQueryDistinctShipCityAction");
		divQueryDistinctShipCityAction.innerText = 		
			"select distinct DEMO_Orders.fShipCity as fShipCity \n" +
			"from DEMO_Orders DEMO_Orders";
	}
	};

	Model.prototype.li16Click = function(event){
		if (!this.comp("dOrders_Source").loaded) {
		this.comp("dOrders_Source").refreshData();
		this.comp("dOrders_Dest").newData();
		var divCopyOrderDetail = this.getElementByXid("divCopyOrderDetail");
		divCopyOrderDetail.innerText= "this.btnCopyOrderDetailClick = " + this.btnCopyOrderDetailClick.toString();
	}
	};

	Model.prototype.li20Click = function(event){
		if (!this.comp("dOrders_Save").loaded) {
		this.comp("dOrders_Save").refreshData();
	}
	};

	Model.prototype.btnCopyOrderDetailClick = function(event){
		var rows = [];

		var source = this.comp("dDetails_Source");
		var dest = this.comp("dDetails_Dest");
	
	// 遍历左边的订单明细
	/*cartData.each(function(options) {
			var row = options.row;
			content = content + row.val("fName") + "(" + row.val("fCount") + ") ";
		});*/
		source.each(function(options) {
			var sourcerow = options.row;
			var sourceID = sourcerow.val("DEMO_OrderDetails");
			var productID = sourcerow.val("fProductID");
		// 用find方法判断产品是否已存在于右边的订单明细中
			if (dest.find(["fProductID"], [productID]).length == 0) {
			// 构造新增数据结构
				var row = {
						"fProductID": productID,
						"fUnitPrice": sourcerow.val("fUnitPrice"),
						"fQuantity": 1, // 复制后数量为1
						"fDiscount": sourcerow.val("fDiscount"),
						"fMoney": sourcerow.val("fUnitPrice"),
						"fProductName": sourcerow.val("fProductName"),
						"fQuantityPerUnit": sourcerow.val("fQuantityPerUnit")
				};
				rows.push(row);
			}
		})
		
		
		if (rows.length > 0) {
		// 调用右边bizData的newData方法，批量新增订单明细数据
			dest.newData({
				"index": dest.getCount(), // 指定新增数据的位置在末尾
				"defaultValues": rows // newData方法会将这个json数组转换成Table参数格式，在调用createAction时传给table参数
			});
		}
	};

	return Model;
});