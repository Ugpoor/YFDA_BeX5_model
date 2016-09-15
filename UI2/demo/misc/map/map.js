define(function(require) {
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.loadBaiduMap();
		this.loadGaodeMap();
	};

	Model.prototype.loadBaiduMap = function() {
		var id = this.getIDByXID("baiduMap");
		window._baiduInit = function() {
			var map = new BMap.Map(id);
			map.centerAndZoom(new BMap.Point(116.397428, 39.90923), 12);
			map.addControl(new BMap.MapTypeControl());
			map.setCurrentCity("北京");
			map.enableScrollWheelZoom(true);
		};
		require([ 'http://api.map.baidu.com/api?v=1.4&ak=您的密钥&callback=_baiduInit' ], function() {
			if (window.BMap && window.BMap.Map) {
				window._baiduInit();
			}
		});
	};

	Model.prototype.loadGaodeMap = function() {
		var id = this.getIDByXID("gaodeMap");
		window._gaodeInit = function() {
			var map = new AMap.Map(id, {
				resizeEnable : true,
				rotateEnable : true,
				dragEnable : true,
				zoomEnable : true,
				zooms : [ 3, 18 ],
				view : new AMap.View2D({
					center : new AMap.LngLat(116.397428, 39.90923),
					zoom : 12
				})
			});
		};		
		require([ 'http://webapi.amap.com/maps?v=1.3&key=yourkey&callback=_gaodeInit' ], function() {
			if (window.AMap && window.AMap.Map) {
				window._gaodeInit();
			}
		});
	};
	return Model;
});