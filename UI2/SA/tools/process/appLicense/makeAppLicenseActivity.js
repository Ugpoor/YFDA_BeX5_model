define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");
	var MD5 = require("$UI/system/lib/base/md5");
	var Uploader = require('$UI/system/components/justep/uploader/uploader');

	var Model = function() {
		this.callParent();
		this.canCreate = justep.Bind.observable(true);
		this.clickTime = justep.Bind.observable(0);
	};

	Model.prototype.btnOKClick = function(event) {
		var now = (new Date()).getTime();
		if (!this.canCreate.peek() && (now - this.clickTime.peek()) < 5000)
			throw new Error('请稍后再生成应用License');// 间隔五秒

		if (this.check()) {
			this.makeLicense();
		}
	};

	Model.prototype.check = function() {
		if ('' == this.comp('cert').val())
			throw new Error('请选择开发商数字证书文件');
		if ('' == this.comp('certPassword').val())
			throw new Error('请输入开发商数字证书密码');
		if ('' == this.comp('developer').val())
			throw new Error('请输入开发商登陆reg.justep.com账号');
		if ('' == this.comp('developerPassword').val())
			throw new Error('请输入开发商登陆reg.justep.com密码');
		if ('' == this.comp('acode').val())
			throw new Error('请输入申请者的授权码');
		if ('' == this.comp('useDays').val())
			throw new Error('请输入授权使用天数');
		if ('' == this.comp('userCount').val())
			throw new Error('请输入授权使用用户数');
		if ('' == this.comp('app').val())
			throw new Error('请输入授权的应用');
		if (!IsNum(this.comp('useDays').val()))
			throw new Error('请输入有效的授权使用天数');
		if (!IsNum(this.comp('userCount').val()))
			throw new Error('请输入有效的授权使用用户数');
		return true;
	};

	var md5Obj = new MD5();
	var getMd5 = function(str) {
		if (str)
			return md5Obj.hex_md5(str);
		else
			return '';
	};

	var IsNum = function(s) {
		s = s.trim();
		if (s != null) {
			var r, re;
			re = /\d*/i; // \d表示数字,*表示匹配多个数字
			r = s.match(re);
			return (r == s) ? true : false;
		}
		return false;
	};

	Model.prototype._createUploader = function(domNode) {
		this.uploader = new Uploader(domNode, {
			actionUrl : require.toUrl('$UI/SA/tools/process/appLicense/makeApplicense.j'),
			autoUpload : false,
			requestHeader : {
				Accept : 'application/json'
			},
			name : 'cert'
		});
		this.uploader.on('onStart', this._doUploadReady, this);
		this.uploader.on('onSuccess', this._doUploadOK, this);
		this.uploader.on('onFileSelected', this._doFileSelected, this);
	};

	Model.prototype._doFileSelected = function(event){
		this.comp('cert').val(event.file.name);
	};
	
	Model.prototype._doUploadReady = function(evt) {
		var now = (new Date()).getTime();
		this.canCreate.set(false);
		this.clickTime.set(now);
		var param = {
			certPassword : this.comp('certPassword').val(),
			developerPassword : getMd5(this.comp('developerPassword').val()),
			developer : this.comp('developer').val(),
			acode : this.comp('acode').val(),
			useDays: this.comp('useDays').val(),
			userCount: this.comp('userCount').val(),
			app: this.comp('app').val(),
			info: this.comp('info').val()
		};
		this.uploader.addData(param);
	};

	Model.prototype.makeLicense = function() {
		this.uploader.submit();	
	};

	Model.prototype._doUploadError = function(event){
		this.canCreate.set(true);
		this.comp('cert').val('');
		justep.Util.hint("生成应用License失败，请求服务端出错",{
			type : 'danger'
		});
	};
	
	Model.prototype._doUploadOK = function(event) {
		this.canCreate.set(true);
		this.comp('cert').val('');
		var doc = event.response;
		if (doc) {
			var data = XML.eval(doc, "/root/data/*", "single");
			var flag = biz.Request.getFlag(doc);
		}
		if (flag) {
			var isok = 'false' != flag;
			
			if (isok && data) {
				this.comp("appLicense").val(biz.Request.transform(data));
				justep.Util.hint('应用License生成完成');
			} else {
				var msg = "生成应用License失败！";
				
				var code = biz.Request.getCode(doc);
				if (code == biz.Request.SESSION_TIMEOUT) {
					msg += "输入的开发商登陆reg.justep.com账号和密码不正确";
				} else
					msg += biz.Request.getMessage(doc);
				justep.Util.hint(msg, {
					type : 'danger'
				});
			}
		}
	};

	Model.prototype.modelLoad = function(event){
		if (!this.uploader)
			this._createUploader(this.getElementByXid("openBtn"));
	};

	return Model;
});