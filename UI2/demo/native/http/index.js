define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!cordova-plugin-http");

	var Model = function(){
		this.callParent();
	};
	//按钮点击事件发送post请求
	Model.prototype.postClick = function(event){
		var url = "http://webim.demo.rong.io/email_login_token";
		var params = {
				"email" : "3363329249@qq.com",
				"password" : "123456"
		};
		var headers = {
		}; 
		cordovaHTTP.post(url,params,headers,function(info){
			alert(JSON.stringify(info.data));
		},function(info){
			alert(JSON.stringify(info.data));
		});

	};

	Model.prototype.getClick = function(event){
		var url = "http://webim.demo.rong.io/email_login_token";
		var params = {
				"email" : "3363329249@qq.com",
				"password" : "123456"
		};
		var headers = {
		}; 
		cordovaHTTP.get(url,params,headers,function(info){
			alert(JSON.stringify(info.data));
		},function(info){
			alert(JSON.stringify(info.data));
		});
	};


	return Model;
});