define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	require('./mockPortalApi');
	require(['./appVersionChecker']);

	var Model = function() {
		this.callParent();
		this.shellImpl = new ShellImpl(this, {
			contentsXid : 'pages',
			pageMappings:{
				"main":{
					url : require.toUrl('./main/main.w')
				},
				"left":{
					url : require.toUrl('./menu/left2.w')
				},
				"sampleData":{
					url : require.toUrl("$model/UI2/demo/baas/simpleData/index.w")
				},
				"takeout":{
					url : require.toUrl("$model/UI2/takeout/index.w")
				},
				"list":{
					url : require.toUrl("$model/UI2/system/components/justep/list/demo/news.w")
				},
				"geolocation":{
					url : require.toUrl("$model/UI2/demo/device/geolocation/mainActivity.w")
				},
				"tuniu":{
					url : require.toUrl('$UI/demo/tuniu/index_main.w')
				},
				"searchList":{
					url : require.toUrl('$UI/demo/tuniu/searchList.w')
				},
				"detail":{
					url : require.toUrl('$UI/demo/tuniu/detail.w')
				}
			}
		});
	};
	
	Model.prototype.modelLoad = function(event) {
		this.shellImpl.showPage("main");
		this.shellImpl.loadPage("left");
	};
	return Model;
});