define(function(require){
	var $ = require("jquery");
	require("cordova!cordova-plugin-appavailability");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	function success(name) {
		return function(){
			alert("本机已安装:"+name);
		}
	};
	function fail(name) {
		return function(){
			alert("本机未安装:"+name);
		}
	};
	Model.prototype.QQClick = function(event){
		var name = "QQ";
		appAvailability.check({
          	ios:"mqq://",
          	android:"com.tencent.mobileqq"
          },
          success(name),
          fail(name));
              
	};
	Model.prototype.weixinClick = function(event){
		var name = "微信";
		appAvailability.check({
          	ios:"weixin://",
          	android:"com.tencent.mm"
          },
          success(name),
          fail(name));
	};
	Model.prototype.sinaweiboClick = function(event){
		var name = "新浪微博";
		appAvailability.check({
          	ios:"sinaweibo://",
          	android:"com.sina.weibo"
          },
          success(name),
          fail(name));
	};	
	Model.prototype.baidumapClick = function(event){
		var name = "百度地图";
		appAvailability.check({
          	ios:"baidumap://",
          	android:"com.baidu.BaiduMap"
          },
          success(name),
          fail(name));
	};	

	Model.prototype.youkuClick = function(event){
		var name = "优酷";
		appAvailability.check({
          	ios:"youku://",
          	android:"com.youku.phone"
          },
          success(name),
          fail(name));
	};	
	Model.prototype.AlipayClick = function(event){
		var name = "支付宝";
		appAvailability.check({
          	ios:"alipay://",
          	android:"com.eg.android.AlipayGphone"
          },
          success(name),
          fail(name));
	};
	Model.prototype.taobaoClick = function(event){
		var name = "淘宝";
		appAvailability.check({
          	ios:"taobao://",
          	android:"com.taobao.taobao"
          },
          success(name),
          fail(name));
	};	
	Model.prototype.zhihuClick = function(event){
		var name = "知乎";
		appAvailability.check({
          	ios:"zhihu://",
          	android:"com.zhihu.android"
          },
          success(name),
          fail(name));
	};
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"QQClick").prettyPrint();
	};
	return Model;
});