define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require('$UI/system/lib/jquery/transition');
	var DocUtils = require('$UI/system/components/justep/docCommon/docUtil');
	
	var isLeft = true;
	var currentLocation;
	var watchLocationID;
	var paiData;
	var Model = function(){
		this.callParent();
		this.on('onload',function(){
			paiData = this.comp('paiData');
			/*if(paiData.getCount() == 0){
				var row = paiData.newData({});
				paiData.setValue('fScode','随手拍');
				paiData.setValue('fSName',"");
				paiData.setValue('fCode',"");
				paiData.saveData();
			}*/
			// Success callback
		    var success = function(p){
		        var latitude = p.coords.latitude;
				var longitude = p.coords.longitude;
				currentLocation = latitude + '|' +longitude;
		    };
		    watchLocationID = navigator.geolocation.watchPosition(success, null, {enableHighAccuracy: true});
		});
	};
	
	Model.prototype.backBtn1Click = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.mapBtnClick = function(event){
		this.comp('baiduMapDialog').open({data:currentLocation});
	};
	
	Model.prototype.getSrc = function($object){
		var codeValue = $object.row.fCode.value.get();
		if(codeValue){
			var img = DocUtils.InnerUtils.getdocServerAction({
				docPath:"/defaultDocNameSpace",
				urlPattern:"/repository/file/download/" + codeValue + "/last/content",
				context:this.getContext()
			});
			return img;
		}
		return "http://www.justep.com/file/upload/201407/09/11-27-37-58-1.jpg";
	};
	
	Model.prototype.getPosition = function($object){
		return "x-content-on-left";
	};
	
	Model.prototype.isOnLeft = function($object){
		return isLeft;
	};
	
	Model.prototype.isOnCenter = function($object){
		var isCenter = false;
		if(this.comp('paiData').getCurrentRow()){
			isCenter = this.comp('paiData').getCurrentRow().row == $object.row;
			if(isCenter){
				isLeft = false;
			}
		}
		return isCenter;
		
	};
	
	Model.prototype.isOnRight = function($object){
		if(!isLeft && this.comp('paiData').getCurrentRow()){
			isCenter = this.comp('paiData').getCurrentRow().row == $object.row;
			if(isCenter){
				return false;
			}
			return true;
		}
		return false;
	};
	
	Model.prototype.cameraBtnClick = function(event){
		var self = this;
		if(navigator.camera){
			navigator.camera.getPicture(captureSuccess, captureFail, { quality: 50});
			function captureSuccess(path) {
				var success = function(r) {
					var file = $(r.response).find("file");
					var fileId = $(file).attr("file-name");
					var row = paiData.newData({});
					paiData.setValue('fScode','随手拍');
					paiData.setValue('fSName',currentLocation);
					paiData.setValue('fCode',fileId);
					paiData.saveData();
				};
				var fail = function(error) {
				    alert("upload An error has occurred: Code = " + error.code);
				};
				var options = new FileUploadOptions();
				var fileName= path.substr(path.lastIndexOf('/')+1);
				options.fileName = fileName;
				var ft = new FileTransfer();
				ft.upload(path, encodeURI(self.getUploadUrl()), success, fail, options);
			};
			function captureFail(){
				alert('fail');
			};
		}else{
			var msg = $('<div class="alert alert-danger" style="z-index:999;text-align:center;font-size:16px;-webkit-transition:all 0.4s;-webkit-transform:translate3d(0,-100%,0);font-weight:bold;position:absolute;top:0;left:0;width:100%;" role="alert">本demo在手机app中运行效果最佳</div>').appendTo('body');
			setTimeout(function(){
				msg.transform('translate3d(0,0,0)');
			},1);
			setTimeout(function(){
				msg.transform('translate3d(0,-100%,0)').transitionEnd(function(){
					msg.remove();
				});
			},2000);
		}
	};
	
	Model.prototype.getUploadUrl = function(){
		var docUrl = DocUtils.InnerUtils.getdocServerAction({
			docPath:"/defaultDocNameSpace",
			urlPattern:"/repository/file/cache/upload",
			context:this.getContext(),
			useCookie:false
		});
		if (docUrl.indexOf("uploadDoc.j") != -1&& docUrl.indexOf("#") == -1) {
				docUrl = window.location.protocol + "//"
						+ window.location.host + docUrl;
		}
		return docUrl;
	};
	
	Model.prototype.contents1ActiveChange = function(event){
		console.log('change');
	};
	
	Model.prototype.modelModelConstruct = function(event){
		var paiData = this.comp('paiData');
		if(paiData && paiData.getCount() == 0){
			var row = paiData.newData({});
			paiData.setValue('fScode','随手拍');
			paiData.setValue('fSName',"");
			paiData.setValue('fCode',"");
		}
	};
	
	return Model;
});