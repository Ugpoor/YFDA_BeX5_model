define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();		
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main":{
					url : require.toUrl('./main.w')
				},
				"list":{
					url : require.toUrl('./list.w')
				},
				"class":{
					url : require.toUrl('./class.w')
				},
				"detail":{
					url : require.toUrl('./detail.w')
				},
				"search":{
					url : require.toUrl('./search.w')
				},
				"cart":{
					url : require.toUrl('./cart.w')
				},
				"order":{
					url : require.toUrl('./order.w')
				},
				"success":{
					url : require.toUrl('./success.w')
				}
			}
		});
		
	};

	return Model;
});