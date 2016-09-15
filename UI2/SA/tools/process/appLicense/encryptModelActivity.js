define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");
	var Uploader = require('$UI/system/components/justep/uploader/uploader');

	var Model = function() {
		this.callParent();
		this.canCreate = justep.Bind.observable(true);
	};

	Model.prototype.btnOKClick = function(event) {
		if (!this.canCreate.peek())
			throw new Error('请稍后再加密应用');// 间隔五秒

		if (this.check()) {
			this.encryptModel();
		}
	};

	Model.prototype.check = function() {
		if ('' == this.comp('cert').val())
			throw new Error('请选择开发商数字证书文件');
		if ('' == this.comp('password').val())
			throw new Error('请输入开发商数字证书密码');
		if ('' == this.comp('sourceModelPath').val())
			throw new Error('请输入原模型路径');
		if ('' == this.comp('targetModelPath').val())
			throw new Error('请输入加密后模型存放路径');
		if ('' == this.comp('app').val())
			throw new Error('请输入需要加密的应用');
		return true;
	};

	Model.prototype._createUploader = function(domNode) {
		this.uploader = new Uploader(domNode, {
			actionUrl : require.toUrl('$UI/system/service/common/bizAction.j'),
			autoUpload : false,
			requestHeader : {
				Accept : 'application/json'
			},
			name : 'cert'
		});
		this.uploader.on('onStart', this._doUploadReady, this);
		this.uploader.on('onSuccess', this._doUploadOK, this);
		this.uploader.on('onFileSelected', this._doFileSelected, this);
		this.uploader.on('onError', this._doUploadError, this);
	};

	Model.prototype._doFileSelected = function(event) {
		this.comp('cert').val(event.file.name);
	};

	Model.prototype._doUploadReady = function(evt) {
		this.canCreate.set(false);
		this.comp('popOver').show();

		var param = {
			password : this.comp('password').val(),
			sourceModelPath : this.comp('sourceModelPath').val(),
			targetModelPath : this.comp('targetModelPath').val(),
			app : this.comp('app').val(),
			isCompile : !!this.comp('isCompile').val(),
			process : '/SA/tools/process/appLicense/appLicenseProcess',
			activity : 'encryptModelActivity',
			action : 'encryptAppAction'
		};
		this.uploader.addData(param);
	};

	Model.prototype.encryptModel = function() {
		this.uploader.submit();
	};

	Model.prototype._doUploadError = function(event){
		this.canCreate.set(true);
		this.comp('popOver').hide();
		this.comp('cert').val('');
		justep.Util.hint("应用加密失败，请求服务端出错",{
			type : 'danger'
		});
	};
	
	Model.prototype._doUploadOK = function(event) {
		this.canCreate.set(true);
		this.comp('popOver').hide();
		this.comp('cert').val('');
		var result = event.response;
		if (result && result.flag) {
			var isok = 'false' != result.flag;

			if (isok) {
				justep.Util.hint('应用加密完成');
			} else {
				var msg = biz.Request.getMessage(result);
				justep.Util.hint("应用加密失败，" + msg,{
					type : 'danger'
				});
			}
		}
	};

	Model.prototype.modelLoad = function(event) {
		if (!this.uploader)
			this._createUploader(this.getElementByXid("openBtn"));
	};

	return Model;
});