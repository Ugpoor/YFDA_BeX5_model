define(function(require){
	var $ = require("jquery");
	require("cordova!cordova-plugin-http");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	//成功回调，data.status为请求返回的状态值，data.data为返回的数据
	function success(data){
		alert("状态值:"+data.status+"\n 返回数据:"+data.data);
	}
	//失败回调，data.status为请求返回的状态值，data.data为返回的数据
	function failure(data){
		alert("错误返回状态值："+data.status+"\n 返回数据:"+data);
	}
	//下载文件成功返回
	function fileSuccess(data){
		alert("标题:"+data.headers+"\n 状态值:"+data.status+"\n 返回数据:"+data.file);
	}
	//上传下载文件失败返回
	function fileFailure(data){
		alert("\n 状态值:"+data.status+"\n 返回数据:"+data.error);
	}
	//get请求
	Model.prototype.getClick = function(event){
		cordovaHTTP.get("http://www.baidu.com", {}, {}, success,failure);
	};
	//head请求
	Model.prototype.headClick = function(event){
		cordovaHTTP.head("http://www.baidu.com", {}, {}, success,failure);
	};
	//post请求
	Model.prototype.postClick = function(event){
		cordovaHTTP.post("http://www.baidu.com", {}, {}, success,failure);
	};
	//SSLPinning协议开关
	Model.prototype.enableSSLPinningClick = function(event){
		cordovaHTTP.enableSSLPinning("true",function success (){alert("允许SSL pinning")},function fail(){alert("禁止SSL pinning")});
	};
	//证书开关
	Model.prototype.acceptAllCertsClick = function(event){
		cordovaHTTP.enableSSLPinning("true",function success (){alert("允许证书")},function fail(){alert("禁止证书")});
	};
	//域名开关
	Model.prototype.validateDomainNameClick = function(event){
		cordovaHTTP.acceptAllCerts("true",function success (){alert("允许域名")},function fail(){alert("禁止域名")});
	};
	//文件下载
	// 路径"cordova.file.dataDirectory"的含义参考cordova-plugin-file插件的介绍：http://docs.wex5.com/cordova-plugin-file/
	Model.prototype.downloadFileClick = function(event){
	    cordovaHTTP.downloadFile("http://192.168.1.104:8080/1.jpg", {}, {},cordova.file.dataDirectory+"/1.jpg",fileSuccess,fileFailure);
	};
	//上传文件
	Model.prototype.uploadFileClick = function(event){
		cordovaHTTP.uploadFile("http://192.168.1.104:8080/", {}, {},cordova.file.dataDirectory+"/1.jpg","picture",success,fileFailure);
	};
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"getClick").showCode("headClick").showCode("postClick").showCode("enableSSLPinningClick").showCode("acceptAllCertsClick").showCode("validateDomainNameClick").showCode("downloadFileClick").showCode("uploadFileClick").prettyPrint();
	};

	return Model;
});