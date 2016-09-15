define(function(require) {
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	var base = require('./base');
	var Utils = require("./utils");
	var Object = require('$UI/system/lib/base/object');
	var WeixinPay = Object.extend({
		constructor : function() {
			base.init([ 'chooseWXPay' ]);
		},
		pay : function(param) {
			var wx = base.getWx();
			var self = this;
			if (wx) {
				var paySuccess = param.success;
				var payCancel = param.cancel;
				var payFail = param.fail;

				delete param.success;
				delete param.cancel;
				delete param.fail;

				base.getUserInfo().done(function(userInfo) {
					param.action = "chooseWXPay";
					var chooseWXPayDtd = $.Deferred();
					$.ajax({
						method : "POST",
						url : base.config.weixinJSApiUrl,
						cache : false,
						data : param
					}).done(function(wxJsPayReq) {// todo
						wxJsPayReq = JSON.parse(wxJsPayReq);
						chooseWXPayDtd.resolve(wxJsPayReq);
					}).fail(function(res) {
						param.fail = payFail;
						Utils.errorCallback(this, param, {
							'errMsg' : 'pay : fail',
							'resultStr' : JSON.stringify(res)
						});
					});

					chooseWXPayDtd.promise().done(function(wxJsPayReq) {
						param.success = paySuccess;
						param.fail = payFail;
						param.cancel = payCancel;
						var payparam = {
							timestamp : wxJsPayReq.timeStamp,
							nonceStr : wxJsPayReq.nonceStr,
							package : wxJsPayReq['package'],
							signType : 'MD5', // 注意：新版支付接口使用 MD5 加密
							paySign : wxJsPayReq.paySign,

							success : function(res) {
								Utils.successCallback(self, param, {
									'errMsg' : 'chooseWXPay:ok'
								});
							},
							fail : function(res) {
								Utils.errorCallback(self, param, {
									errMsg : 'chooseWXPay:fail',
									'resultStr' : JSON.stringify(res)
								});

							},
							cancel : function(res) {
								Utils.cancelCallback(self, param, {
									errMsg : 'chooseWXPay:cancel',
									'resultStr' : JSON.stringify(res)
								});
							},
						};
						wx.chooseWXPay.call(this, payparam);
					});
				}).fail(function(err) {
					Utils.errorCallback(self, param, {
						errMsg : 'getUserInfo:fail',
						'resultStr' : JSON.stringify(err)
					});
				});

			} else {
				var traceId = justep.UUID.createUUID();
				var body = param && param.body;
				var feeType = param && param.feeType || "1";
				var notifyUrl = param && param.notifyUrl;
				var totalFee = param && param.totalFee;
				var tradeNo = param && param.outTradeNo;
				var success = param && param.success;
				var fail = param && param.fail;
				var cancel = param && param.cancel;

				var successCallback = function(message) {
					success && success(0);
					Utils.logCallback(" chooseWXPay() ", true)(JSON.stringify(message));
				};
				var failCallback = function(message) {
					Utils.errorCallback(self, param, {
						errMsg : 'fail',
						'resultStr' : JSON.stringify(message)
					});
				};
				var cancelCallback = function(message) {
					Utils.cancelCallback(self, param, {
						errMsg : 'fail',
						'resultStr' : JSON.stringify(message)
					});
					Utils.logCallback(" chooseWXPay() ", false)('cancel by user');
				};
				var weixin = navigator.weixin;
				weixin.generatePrepayId({
					"body" : body,
					"feeType" : feeType,
					"notifyUrl" : notifyUrl,
					"totalFee" : totalFee,
					"traceId" : traceId,
					"tradeNo" : tradeNo
				}, function(prepayId) {
					weixin.sendPayReq(prepayId, function(message) {
						successCallback(message);
					}, function(message) {
						cancelCallback(message);
					});
				}, function(message) {
					failCallback(message);
				});
			}
			;
			;
		}
	});
	return new WeixinPay();
});
