define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.justep.cordova.plugin.scanCard");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
		this.callBack();
	};
	var UUID;
	var UUIDs=[""];
	
	//回调方法
	Model.prototype.callBack = function(){
		this.success = function (result) {
			alert(JSON.stringify(result));
		};
		this.error = function (result) {
			alert(JSON.stringify(result));
		};
	};
	//申请授权
	Model.prototype.aouthClick = function(event){
		navigator.scanCard.auth("12345",this.success,this.error);
	};
	//检查是否授权
	Model.prototype.checkClick = function(event){
		navigator.scanCard.checkAuth(this.success,this.error);
	};
	//清除授权信息
	Model.prototype.clearClick = function(event){
		navigator.scanCard.clearAuthentication(this.success,this.error);
	};
	//拍照并上传
	Model.prototype.takePictureClick = function(event){
		navigator.scanCard.takePicture(function(result){
			UUID = result.UUID;
			alert(UUID);
		}, error);
	};
	//重新上传照片
	Model.prototype.uploadClick = function(event){
		navigator.scanCard.uploadPicture(UUID,function(){
			alert("上传成功");
		}, function(){
			alert("上传失败");
		});
	};
	//根据UUID获取数据
	Model.prototype.getByUUIDClick = function(event){
		UUIDs[0] = UUID;
		navigator.scanCard.getCardByUuid(UUIDs,this.success,this.error);
	};
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "callBack");
		utils.showCode(this, "aouthClick");
		utils.showCode(this, "checkClick");
		utils.showCode(this, "clearClick");
		utils.showCode(this, "takePictureClick");
		utils.showCode(this, "uploadClick");
		utils.showCode(this, "getByUUIDClick");
		utils.prettyPrint();
	};
	return Model;
});