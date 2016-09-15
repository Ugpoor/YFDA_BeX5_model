define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");
	var MD5 = require("$UI/system/lib/base/md5");

	var Model = function() {
		this.callParent();
		this.canCreate = justep.Bind.observable(true);
		this.clickTime = justep.Bind.observable(0);
	};

	Model.prototype.btnOKClick = function(event) {
		var now = (new Date()).getTime();
		if (!this.canCreate.peek() && (now - this.clickTime.peek()) < 5000)
			throw new Error('请稍后再创建开发商数字证书');// 间隔五秒

		if (this.check()) {
			this.canCreate.set(false);
			this.clickTime.set(now);
			this.download();
		}
	};

	Model.prototype.check = function() {
		if ('' == this.comp('developer').val())
			throw new Error('请输入开发商登陆reg.justep.com账号');
		if ('' == this.comp('developerPassword').val())
			throw new Error('请输入开发商登陆reg.justep.com密码');
		if ('' == this.comp('certPassword1').val())
			throw new Error('请输入开发商数字证书密码');
		if ('' == this.comp('certPassword2').val())
			throw new Error('请输入开发商数字证书确认密码');
		if (this.comp('certPassword1').val() != this.comp('certPassword2').val())
			throw new Error('开发商数字证书密码输入不一致');
		return true;
	};

	var md5Obj = new MD5();
	var getMd5 = function(str){
		if(str)	return md5Obj.hex_md5(str);
		else return '';
	};
	 
	Model.prototype.download = function() {
		var $root = $(this.getRootNode());
		var _url = require.toUrl('$UI/SA/tools/process/appLicense/cerateCert.j');
		var url = new justep.URL(_url);
		url.setParam({
			certPassword:this.comp('certPassword1').val(),
			developerPassword:getMd5(this.comp('developerPassword').val()),
			developer:this.comp('developer').val()
		});
		var downLoadFrame = $root.children('.downloadFrame');
		if (downLoadFrame.length === 0) {
			var self = this;
			downLoadFrame = $('<iframe class="downloadFrame"></iframe>').css('display', 'none').appendTo($root);
			downLoadFrame.on('load', function() {
				self.checkResult(this);
				self.canCreate.set(true);
			});
		}
		downLoadFrame.attr('src', url.toString());
	};

	Model.prototype.checkResult = function(iframe) {
		var msg = "生成数字证书失败！";
		if (iframe && iframe.contentWindow && iframe.contentWindow.document) {// 特殊支持i9
			var doc = (!justep.Browser.IE || justep.Browser.IE9) ? iframe.contentWindow.document : iframe.contentWindow.document.XMLDocument;
			if (doc) {
				var data = XML.eval(doc, "/root/data", "single");
				var flag = biz.Request.getFlag(doc);
				var code = biz.Request.getCode(doc);
			}
			if (code == biz.Request.SESSION_TIMEOUT) {
				msg += "输入的开发商登陆reg.justep.com账号和密码不正确";
			} else if (data && flag) {
				var isok = 'false' != flag;
				if (!isok) {
					msg += biz.Request.getMessage(doc);
				}
			}
			justep.Util.hint(msg, {
				type : 'danger'
			});
		}
	};

	return Model;
});