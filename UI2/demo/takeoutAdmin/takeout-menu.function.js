define(function(require) {
	require("w!$UI/demo/takeoutAdmin/cuisineManage.w");
	require("w!$UI/demo/takeoutAdmin/orderManage.w");
	require("w!$UI/demo/takeoutAdmin/userManage.w");
	require("w!$UI/demo/takeoutAdmin/statictis.w");

	
	return {
		"$children" : [{		
			"$name" : "item",
			"$text" : "",
			"display" : "solid",
			"label" : "菜品管理",
			"url" : "$UI/demo/takeoutAdmin/cuisineManage.w"
		},{
			"$name" : "item",
			"$text" : "",
			"display" : "solid",
			"label" : "订单管理",
			"url" : "$UI/demo/takeoutAdmin/orderManage.w"
		}, {
			"$name" : "item",
			"$text" : "",
			"display" : "solid",
			"label" : "会员管理",
			"url" : "$UI/demo/takeoutAdmin/userManage.w"
		}, {
			"$name" : "item",
			"$text" : "",
			"label" : "统计分析",
			"url" : "$UI/demo/takeoutAdmin/statistics.w"
		} ],
		"$name" : "root",
		"$text" : ""
	};
});