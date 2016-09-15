define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.modelParamsReceive = function(event){		
		/*
		 * 1、接收坐标参数
		 * 2、打开地图
		 */
		if(this.params && this.params.positioning!=undefined){
			var positioning = this.params.positioning;			
			
			var url =  require.toUrl("./map.html");
			var coords = positioning.split('|');
			var latitude = coords[0];
			var longitude = coords[1];
			url = url +"?latitude=" + latitude  + "&longitude=" + longitude;			
		    $(this.getElementByXid('mapContent')).html('<iframe src="'+url+'" width="100%" height="100%" style="border:0;"></iframe>');
		}		
	};

	return Model;
});
