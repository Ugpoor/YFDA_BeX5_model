define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/lib/base/util");
	
	require("$UI/system/lib/cordova/cordova");
	require("cordova!cordova-plugin-geolocation");
	require("cordova!com.justep.cordova.plugin.baidulocation");
	
	var Model = function(){
		this.callParent();
	};
	
	//只能上传图片
	Model.prototype.modelLoad = function(event){
		/*
		 * 控制文件上传类型
		 * 文件上传提示
		 */		
		var uploader = this.comp("attachmentSimple").uploader;
		uploader.on('onFileSelected',function(event){
		    if(event.file.type=="" || event.file.type.indexOf("image/")==0){
		    	util.hint("图片正在上传...",
					{
						"position": "middle"
					}
				);
		    } else {
		    	util.hint("只能上传图片！",
					{
						"type":"warning",
						"position": "middle"
					}
				);
				event.cancel = true;
		    }		   
		});		
		
	};
	
	//地图
	Model.prototype.mapBtnClick = function(event){
		/*
		 * 打开地图页，并传入坐标
		 */
		var gpsDtd = this.getLocation();
		gpsDtd.done(function(position) {
			var positioning=position.latitude+"|"+position.longitude;
			justep.Shell.showPage("map", {
				positioning : positioning
			});
		});
	};
	//定位
	Model.prototype.getLocation = function() {
		/*
		 * 获取当前定位，获取地理位置失败，暂时采用默认地址
		 */
		var gpsDtd = $.Deferred();
		if (this.wxApi) {
			this.wxApi.exec().done(function(wx) {
				wx.getLocation({
					type : "gcj02",
					success : function(data) {
						gpsDtd.resolve({
							coorType : data.coorType,
							address : data.address,
							longitude : data.longitude,
							latitude : data.latitude
						});
					},
					cancel : function(res) {
						gpsDtd.resolve({
							longitude : 116.45764191999997,
							latitude : 39.8622934399999
						});
					}
				});
			}).fail(function() {
				gpsDtd.resolve({
					longitude : 116.45764191999997,
					latitude : 39.8622934399999
				});
			});
		} else if (navigator.geolocation) {
			var success = function(data) {
				// data.longtitude 经度
				// data.latitude 纬度
				// data.address 文字描述的地址信息
				// data.hasRadius 是否有定位精度半径
				// data.radius 定位精度半径
				// data.type 定位方式
				// data.coorType
				gpsDtd.resolve({
					coorType : data.coorType,
					address : data.address,
					longitude : data.coords.longitude,
					latitude : data.coords.latitude
				});
			};

			var fail = function(e) {
				justep.Util.hint("获取地理位置失败，暂时采用默认地址");
				gpsDtd.resolve({
					longitude : 116.45764191999997,
					latitude : 39.8622934399999
				});
			};
			/**
			 *  如果在室内 enableHighAccuracy: true 反而误差更大
			 *  如果在室外 enableHighAccuracy: true 相对准确
			 */
			navigator.geolocation.getCurrentPosition(success, fail);
			/*var gpsWatchID = navigator.geolocation.watchPosition(success, fail,{
			timeout: 30*1000,
			maximumAge: 30000,
			enableHighAccuracy: true});*/
		} else {
			justep.Util.hint("获取地理位置失败，暂时采用默认地址");
			gpsDtd.resolve({
				longitude : 116.45764191999997,
				latitude : 39.8622934399999
			});
		}
		return gpsDtd.promise();
	};
		
	//上传
	Model.prototype.dataValueChanged = function(event){		
		/*
		 * 1、获取上传图片，组合预览地址
		 * 2、生成上传图片的fID
		 * 3、将上传图片信息保存到paiData
		 */
		var data = this.comp('data');
		var paiData = this.comp('paiData');		
		
		var row=data.getCurrentRow();
		
		var jsonList = eval("(" + row.val('fileName') + ")");
		jsonList[0].ownerID = row.getID();
		var ownerID = row.getID();
		 
		var realFileName = jsonList[0]["realFileName"];
		var storeFileName = jsonList[0]["storeFileName"];
		var operateType = "preview";//预览
		var previewUrl=this.comp("attachmentSimple").getFileUrl(realFileName,storeFileName,ownerID,operateType);
		
		var fid=1;
		if(paiData.getCount()>0){
			paiData.last();
			fid=paiData.getValue("fID")+1;
		}
		var gpsDtd = this.getLocation();
		gpsDtd.done(function(position) {
			var positioning=position.latitude+"|"+position.longitude;
			var options = {
				defaultValues : [ {
					fID : fid,//id
					fFileName : realFileName,//图片名
					fPreviewPath : previewUrl,//预览地址
					fDownloadPath : JSON.stringify(jsonList),//下载时需要的json串
					fCreateTime : justep.Date.toString(new Date(),'yyyy-MM-dd hh:mm:ss'),//上传时间
					fDescription : "",//描述
					fAddress : position.address,//上传时地址
					fPositioning : positioning  //上传时坐标
				} ]
			};			
			paiData.newData(options);
			paiData.saveData();
			
		});
		data.refreshData();
		paiData.refreshData();
	};
	
	//图片详细
	Model.prototype.imageClick = function(event){
		/*
		 *进入详细页
		 */
		var paiData = this.comp('paiData');
		justep.Shell.showPage("detail", {
			fid : paiData.getValue("fID")
		});
	};
	//刷新paiData数据
	Model.prototype.modelActive = function(event){
		this.comp('paiData').refreshData();
	};
			
	return Model;
});