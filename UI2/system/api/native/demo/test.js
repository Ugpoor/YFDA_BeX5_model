define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var base = require('$UI/system/api/native/base');
	var scan = require('$UI/system/api/native/scan');
	var network = require('$UI/system/api/native/network');
	var geo = require('$UI/system/api/native/geo');
	var voice = require('$UI/system/api/native/voice');
	var translate = require('$UI/system/api/native/translate');
	var image = require('$UI/system/api/native/image');
	var wxPay = require('$UI/system/api/native/wxPay');
	var shop = require('$UI/system/api/native/wxShop');
	var menu = require('$UI/system/api/native/wxMenu');
	var share = require('$UI/system/api/native/share');

	var Model = function() {
		this.callParent();
		this.ready = justep.Bind.observable(false);
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		base.ready(function() {
			self.ready.set(true);
			share.onMenuShareTimeline({
				title : '互联网之子',
				link : 'http://movie.douban.com/subject/25785114/',
				imgUrl : 'http://demo.open.weixin.qq.com/jssdk/images/p2166127561.jpg',
				trigger : function(res) {
					// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
					alert('用户点击分享到朋友圈');
				},
				success : function(res) {
					alert('已分享');
				},
				cancel : function(res) {
					alert('已取消');
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});

			share.onMenuShareAppMessage({
				title : '互联网之子',
				desc : '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
				link : 'http://movie.douban.com/subject/25785114/',
				imgUrl : 'http://demo.open.weixin.qq.com/jssdk/images/p2166127561.jpg',
				trigger : function(res) {
					// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
					alert('用户点击发送给朋友');
				},
				success : function(res) {
					alert('已分享');
				},
				cancel : function(res) {
					alert('已取消');
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});

			share.onMenuShareQQ({
				title : '互联网之子',
				desc : '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
				link : 'http://movie.douban.com/subject/25785114/',
				imgUrl : 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
				trigger : function(res) {
					alert('用户点击分享到QQ');
				},
				complete : function(res) {
					alert(JSON.stringify(res));
				},
				success : function(res) {
					alert('已分享');
				},
				cancel : function(res) {
					alert('已取消');
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});

			share.onMenuShareWeibo({
				title : '互联网之子',
				desc : '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
				link : 'http://movie.douban.com/subject/25785114/',
				imgUrl : 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
				trigger : function(res) {
					alert('用户点击分享到微博');
				},
				complete : function(res) {
					alert(JSON.stringify(res));
				},
				success : function(res) {
					alert('已分享');
				},
				cancel : function(res) {
					alert('已取消');
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});
			share.onMenuShareQZone({
				title : '互联网之子',
				desc : '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
				link : 'http://movie.douban.com/subject/25785114/',
				imgUrl : 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
				trigger : function(res) {
					alert('用户点击分享到QZone');
				},
				complete : function(res) {
					alert(JSON.stringify(res));
				},
				success : function(res) {
					alert('已分享');
				},
				cancel : function(res) {
					alert('已取消');
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});
		});
	};

	Model.prototype.checkJsApiClick = function(event) {
		base.checkJsApi({
			jsApiList : [ 'checkJsApi', 'previewImage' ],
			success : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	Model.prototype.scanQRCode0Click = function(event) {
		scan.scanQRCode();
	};
	Model.prototype.scanQRCode1Click = function(event) {
		scan.scanQRCode({
			needResult : 1,
			desc : 'scanQRCode desc',
			success : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	Model.prototype.shareToTimeline = function(event) {
		share.shareTo({
			scene : "timeline"
		});
	};

	Model.prototype.shareToAppmessage = function(event) {
		share.shareTo({
			scene : "appessage"
		});
	};

	Model.prototype.shareToQQ = function(event) {
		share.shareTo({
			scene : "qq"
		});
	};

	Model.prototype.shareToWeibo = function(event) {
		share.shareTo({
			scene : "weibo"
		});
	};
	Model.prototype.shareToQzone = function(event) {
		share.shareTo({
			scene : "qzone"
		});
	};

	// 查看地理位置
	Model.prototype.openLocationClick = function(event) {
		geo.openLocation({
			latitude : 23.099994,
			longitude : 113.324520,
			name : 'TIT 创意园',
			address : '广州市海珠区新港中路 397 号',
			scale : 14,
			infoUrl : 'http://weixin.qq.com',
			success : function(res) {
				alert("" + JSON.stringify(res));
			}
		});
	};

	Model.prototype.hideOptionMenuClick = function(event) {
		menu.hideOptionMenu();
	};

	// 8.2 显示右上角菜单
	Model.prototype.showOptionMenuClick = function(event) {
		menu.showOptionMenu();
	};

	// 8.3 批量隐藏菜单项
	Model.prototype.hideMenuItemsClick = function(event) {
		menu.hideMenuItems({
			menuList : [ 'menuItem:readMode', // 阅读模式
			'menuItem:share:timeline', // 分享到朋友圈
			'menuItem:copyUrl' // 复制链接
			],
			success : function(res) {
				alert('已隐藏“阅读模式”，“分享到朋友圈”，“复制链接”等按钮');
			},
			fail : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	// 8.4 批量显示菜单项
	Model.prototype.showMenuItemsClick = function(event) {
		menu.showMenuItems({
			menuList : [ 'menuItem:readMode', // 阅读模式
			'menuItem:share:timeline', // 分享到朋友圈
			'menuItem:copyUrl' // 复制链接
			],
			success : function(res) {
				alert('已显示“阅读模式”，“分享到朋友圈”，“复制链接”等按钮');
			},
			fail : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	// 8.5 隐藏所有非基本菜单项
	Model.prototype.hideAllNonBaseMenuItemClick = function(event) {
		menu.hideAllNonBaseMenuItem({
			success : function() {
				alert('已隐藏所有非基本菜单项');
			}
		});
	};

	// 8.6 显示所有被隐藏的非基本菜单项
	Model.prototype.showAllNonBaseMenuItemClick = function(event) {
		menu.showAllNonBaseMenuItem({
			success : function() {
				alert('已显示所有非基本菜单项');
			}
		});
	};

	// 8.7 关闭当前窗口
	Model.prototype.closeWindowClick = function(event) {
		menu.closeWindow();
	};

	Model.prototype.getLocationClick = function(event) {
		geo.getLocation({
			success : function(res) {
				alert(JSON.stringify(res));
			},
			cancel : function(res) {
				alert('用户拒绝授权获取地理位置');
			}
		});
	};
	var images = window.images = {
		localId : [],
		serverId : []
	};
	Model.prototype.chooseImageClick = function(event) {
		image.chooseImage({
			success : function(res) {
				images.localId = res.localIds;
				alert('已选择 ' + res.localIds.length + ' 张图片');
			}
		});
	};

	// 5.2 图片预览
	Model.prototype.previewImageClick = function(event) {
		image.previewImage({
			current : "http://192.168.1.93:8080/x5/UI2/system/service/doc/common/simpleFileStore.j?realFileName=modified.jpg&storeFileName=modified.jpg&ownerID=5da957edf147329a&operateType=preview",
			urls : [ 'http://img3.douban.com/view/photo/photo/public/p2152117150.jpg', 'http://img5.douban.com/view/photo/photo/public/p1353993776.jpg',
					'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg' ]
		});
	};

	Model.prototype.uploadImageClick = function(event) {
		if (images.localId.length == 0) {
			alert('请先使用 chooseImage 接口选择图片');
			return;
		}
		var i = 0, length = images.localId.length;
		images.serverId = [];
		function upload() {
			image.uploadImage({
				localId : images.localId[i],
				success : function(res) {
					i++;
					alert('已上传：' + i + '/' + length);
					images.serverId.push(res.serverId);
					if (i < length) {
						upload();
					}
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});
		}
		upload();
	};

	Model.prototype.downloadImageClick = function(event) {
		if (images.serverId.length === 0) {
			alert('请先使用 uploadImage 上传图片');
			return;
		}
		var i = 0, length = images.serverId.length;
		images.localId = [];
		function download() {
			image.downloadImage({
				serverId : images.serverId[i],
				success : function(res) {
					i++;
					alert('已下载：' + i + '/' + length + " 本地文件： " + res.localId);
					images.localId.push(res.localId);
					if (i < length) {
						download();
					}
				}
			}

			);
		}
		download();
	};

	Model.prototype.getNetworkTypeClick = function(event) {
		network.getNetworkType({
			success : function(res) {
				alert(res.networkType);
			},
			fail : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	Model.prototype.chooseWXPayClick = function(event) {

		var tradeNo = justep.UUID.createUUID();
		var notifyUrl = location.origin + "/baas/weixin/weixin/notify";
		wxPay.pay({
			body : "x5外卖",
			mchId : "1305137601",
			notifyUrl : notifyUrl,
			outTradeNo : tradeNo,
			totalFee : "1",
			success : function(e) {
				alert(JSON.stringify(e))
			},
			cancel : function(e) {
				alert(JSON.stringify(e))
			},
			fail : function(e) {
				alert(JSON.stringify(e))
			}
		});
	};

	Model.prototype.openProductSpecificViewClick = function(event) {
		shop.openProductSpecificView({
			productId : 'pDF3iY_m2M7EQ5EKKKWd95kAxfNw',
			extInfo : '123'
		});
	};

	Model.prototype.addCardClick = function(event) {
		shop.addCard({
			cardList : [ {
				cardId : 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
				cardExt : '{"code": "", "openid": "", "timestamp": "1418301401","signature":"f54dae85e7807cc9525ccc127b4796e021f05b33"}'
			}, {
				cardId : 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
				cardExt : '{"code": "", "openid": "", "timestamp": "1418301401","signature":"f54dae85e7807cc9525ccc127b4796e021f05b33"}'
			} ],
			success : function(res) {
				alert('已添加卡券：' + JSON.stringify(res.cardList));
			}
		});
	};

	var codes = [];
	Model.prototype.chooseCardClick = function(event) {
		shop.chooseCard({
			cardSign : '8ef8aa071f1d2186cb1355ec132fed04ebba1c3f',
			timestamp : 1437997723,
			nonceStr : 'k0hGdSXKZEj3Min5',
			success : function(res) {
				res.cardList = JSON.parse(res.cardList);
				encrypt_code = res.cardList[0]['encrypt_code'];
				alert('已选择卡券：' + JSON.stringify(res.cardList));
				decryptCode(encrypt_code, function(code) {
					codes.push(code);
				});
			}
		});
	};

	// 12.3 查看卡券
	Model.prototype.openCardClick = function(event) {
		if (codes.length < 1) {
			alert('请先使用 chooseCard 接口选择卡券。');
			return false;
		}
		var cardList = [];
		for (var i = 0; i < codes.length; i++) {
			cardList.push({
				cardId : 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
				code : codes[i]
			});
		}
		shop.openCard({
			cardList : cardList
		});
	};

	var voices = window.voices = {
		localId : '',
		serverId : ''
	};
	Model.prototype.translateVoiceClick = function(event) {
		if (voices.localId == '') {
			alert('请先使用 startRecord 接口录制一段声音');
			return;
		}
		translate.translateVoice({
			localId : voices.localId,
			complete : function(res) {
				if (res.hasOwnProperty('translateResult')) {
					alert('识别结果：' + res.translateResult);
				} else {
					alert('无法识别');
				}
			}
		});
	};

	Model.prototype.startRecordClick = function(event) {
		voice.startRecord({
			cancel : function() {
				alert('用户拒绝授权录音');
			},
		});
	};

	// 4.3 停止录音
	Model.prototype.stopRecordClick = function(event) {
		voice.stopRecord({
			success : function(res) {
				alert("OK:" + JSON.stringify(res));
				voices.localId = res.localId;
			},
			fail : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};
	// 4.4 监听录音自动停止
	voice.onVoiceRecordEnd({
		complete : function(res) {
			voices.localId = res.localId;
			alert('录音时间已超过一分钟');
		}
	});

	// 4.5 播放音频
	Model.prototype.playVoiceClick = function(event) {
		if (voices.localId == '') {
			alert('请先使用 startRecord 接口录制一段声音');
			return;
		}
		voice.playVoice({
			localId : voices.localId
		});
	};

	// 4.6 暂停播放音频
	Model.prototype.pauseVoiceClick = function(event) {
		voice.pauseVoice({
			localId : voices.localId,
			success : function(res) {
				alert(JSON.stringify(res));
			}
		});
	};

	// 4.7 停止播放音频
	Model.prototype.stopVoiceClick = function(event) {
		voice.stopVoice({
			localId : voices.localId
		});
	};

	// 4.8 上传语音
	Model.prototype.uploadVoiceClick = function(event) {
		// if (voice.localId == '') {
		// alert('请先使用 startRecord 接口录制一段声音');
		// return;
		// }
		voice.uploadVoice({
			localId : voices.localId,
			success : function(res) {
				alert('上传语音成功，serverId 为' + res.serverId);
				voices.serverId = res.serverId;
			}
		});
	};

	Model.prototype.downloadVoiceClick = function(event) {
		if (voices.serverId == '') {
			alert('请先使用 uploadVoice 上传声音');
			return;
		}
		voice.downloadVoice({
			serverId : voices.serverId,
			success : function(res) {
				alert('下载语音成功，localId 为' + res.localId);
				voices.localId = res.localId;
			}
		});
	};

	return Model;
});
