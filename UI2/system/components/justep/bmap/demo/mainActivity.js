define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var bmap = require('$UI/system/components/justep/bmap/bmap');

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(){
		justep.Portal.closeWindow();
	};

	Model.prototype.button1Click = function(event){
		bmap.marker({
			location:"40.047669,116.313082",
			title:"百度大厦",
			content:"百度奎科大厦",
			src:"bmapDemoApp"
		});
	};
	
	Model.prototype.button3Click = function(event){
		bmap.geocoder({
			address:"高和蓝峰大厦",
			src:"bmapDemoApp"
		});
	};
	
	Model.prototype.button4Click = function(event){
		bmap.geocoder({
			location:"39.990912172420714,116.32715863448607",
			coord_type:"gcj02",
			src:"bmapDemoApp"
		});
	};
	
	
	Model.prototype.button5Click = function(event){
		bmap.placeSearch({
			query:"海底捞",
			location:"31.204055632862,121.41117785465",
			radius:"1000",
			region:"上海",
			src:"bmapDemoApp"
		});
	};
	
	Model.prototype.button6Click = function(event){
		bmap.placeDetail({
			uid:"d3099bdd81c525dbd1f49ee6",
			src:"bmapDemoApp"
		});
		
	};
	
	Model.prototype.button7Click = function(event){
		bmap.line({
			region:"北京",
			name:"7",
			src:"bmapDemoApp"
		});
	};
	
	Model.prototype.button8Click = function(event){
		bmap.direction({
			origin:"latlng:34.264642646862,108.95108518068|name:我家",
			destination:"大雁塔",
			mode:"driving",
			region:"西安",
			src:"bmapDemoApp"
		});
	};
	
	return Model;
});