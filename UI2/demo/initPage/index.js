define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var baas = justep.Baas;

	require("$UI/system/lib/cordova/cordova");
	require("css!$UI/demo/native/common/pub").load();
	require("cordova!phonegap-plugin-barcodescanner");

	var Model = function() {
		this.callParent();
		this.STORE_ID = "com.justep.demo.advice.barcodedata";
	};

	Model.prototype.modelLoad = function(event) {
		var me = this;
		//获取输入的值
		var v = localStorage.name;
		//获取扫描的值
		var val = localStorage.val;
		//获取选择的值
		var area = localStorage.area;
		
		if(v){
			this.comp("nameInput").val(v);
			this.comp("maincontents").to("tocontent");
			this.getElementByXid("iframe1").src = v;
		}
		
		if(val){
			this.comp("scanInput").val(val);
			this.comp("maincontents").to("tocontent");
			this.getElementByXid("iframe1").src = val;
		}
		
		if(area){
			this.comp("maincontents").to("tocontent");
			this.getElementByXid("iframe1").src = area;
		}
		
		
		document.addEventListener("deviceready", onDeviceReady, false);
		// 加载完成 
		function onDeviceReady() {
			me.comp("scanBtn").set({
				disabled : false
			});

			if (localStorage.getItem(me.STORE_ID) != "")
				me.comp("fileData").loadData(JSON.parse(localStorage.getItem(me.STORE_ID)));
		}
	};

	// 关闭功能
	Model.prototype.backBtnClick = function(event) {
		localStorage.setItem(this.STORE_ID, JSON.stringify(this.comp("fileData").toJson(false)));
		justep.Portal.closeWindow();
	};

	// 扫描二维码
	Model.prototype.scanBtnClick = function(event) {
		var data = this.comp("fileData");
		function onSuccess(result) {
			data.newData({
				index : 0
			});
			data.setValue("filePath", result.text);
		}
		cordova.plugins.barcodeScanner.scan(onSuccess);
	};
	// 清空历史记录
	Model.prototype.deleteBtnClick = function(event) {
		this.comp("fileData").clear();
		localStorage.setItem(this.STORE_ID, "");
		var butt = $(this.comp("scanBut").domNode);
		butt.css("display", "none");
	};

	//向扫描的域名发送请求；
	Model.prototype.subBtnClick = function(event) {
		//获取 扫描二维码确认后显示后显示的按钮
		var butt = $(this.comp("scanBut").domNode);
		//获取  输入域名确认显示后显示的按钮
		var inputBtn = $(this.comp("inputBtn").domNode);
		
		var scanInput = this.comp("scanInput").val();
		var me = this;
		baas.sendRequest({
			"url" : "/justep/InitPage",
			"action" : "getCode",
			"params" : {
				param : scanInput
			},
			"success" : function(data) {
				var num = data.statusCode;
				if (num != 404 && num != 500) {
					butt.css("display", "block");
					localStorage.val = scanInput;
					localStorage.removeItem("value");
					me.comp("nameInput").val("");
					inputBtn.css("display", "none");
					localStorage.removeItem("area");
				} else {
					justep.Util.hint("域名不正确");   
				}
			},
			"error" : function() {
				justep.Util.hint("域名不正确");
			}
		});

	};

	//向输入的域名发送请求
	Model.prototype.submitBtnClick = function(event) {
		var nameInput = this.comp("nameInput").val();
		//获取 扫描二维码确认后显示后显示的按钮
		var butt = $(this.comp("scanBut").domNode);
		
		var inputBtn = $(this.comp("inputBtn").domNode);
		var me = this;
		baas.sendRequest({
			"url" : "/justep/InitPage",
			"action" : "getCode",
			"params" : {
				param : nameInput
			},
			"success" : function(data) {
				var num = data.statusCode;
				if (num != 404 && num != 500) {
					inputBtn.css("display", "block");
					localStorage.name = nameInput;
					localStorage.removeItem("val");
					me.comp("scanInput").val("");
					localStorage.removeItem("area");
				} else {
					justep.Util.hint("域名不正确");
				}
			},
			"error" : function() {
				justep.Util.hint("域名不正确");
			}
		});

	};
	
	//清空输入的域名 
	Model.prototype.delBtnClick = function(event) {
		this.comp("nameInput").val("");
		var inputBtn = $(this.comp("inputBtn").domNode);
		inputBtn.css("display", "none");
		localStorage.clear();
	};
	
	//contrilGroup 的显示和隐藏
	Model.prototype.showTitle = function(event){
		var num = event.target.parentElement.getAttribute("num");
		var numarr = [1,2,3];
		for(var i in numarr){
			if(numarr[i] != num){
			this.comp("controlGroup" + numarr[i]).collapse()
			} 
		} 
	};  

	//向内置初始页发送请求
	Model.prototype.scanButton = function(event){
		var demo = event.source.$domNode.attr("url");
		var pageBut = $(this.comp("pageBut").domNode);
		baas.sendRequest({
			"url" : "/justep/InitPage",
			"action" : "getCode",
			"params" : {
				param : demo
			}, 
			"success" : function(data) {
				var num = data.statusCode;  
				if (num != 404 && num != 500) {
					pageBut.css("display", "block");
					localStorage.area = demo;
					localStorage.removeItem("val");
					localStorage.removeItem("value");
				} else {
					pageBut.css("display", "none");
					justep.Util.hint("域名不正确");
				}
			},
			"error" : function() {
				justep.Util.hint("域名不正确");
				pageBut.css("display", "none");
			}
		});
	};
	
	

	return Model;
});