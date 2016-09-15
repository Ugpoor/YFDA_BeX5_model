define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
		
		this.updateTime = justep.Bind.observable("");
		this.regCode = justep.Bind.observable("");
		this.sysCode = justep.Bind.observable("");
	};

	Model.prototype.showActivationTime = function(){
		var params = new biz.Request.ActionParam(),
		me = this;
		biz.Request.sendBizRequest({
			context: this.getContext(),
			action: "getActivationTimeAction",
			parameters: params,
			dataType: 'json',
			callback: function(data){
				if(data.state){
				  var date = data.response;
				  if(date) me.updateTime.set("您的系统上次密钥更新时间："+date);
				  else me.updateTime.set("您的系统版本不需要密钥更新！");
				}
				data.ignoreError=false;
			}
		});
	};

	Model.prototype.modelLoad = function(event){
		this.showActivationTime();
	};

	Model.prototype.btnGetSysCodeClick = function(event){
		var params = new biz.Request.ActionParam(),
		me = this;
		biz.Request.sendBizRequest({
				context: this.getContext(),
				action: "getActivationPackageAction",
				parameters: params,
				dataType: 'json',
				callback: function(data){
					if(data.state){
					  var code = data.response;
					  if(code) me.sysCode.set(code);
					}
					data.ignoreError=false;
				}
		});
	};

	Model.prototype.btnUpdateClick = function(event){
		var code = justep.String.trim(this.regCode.get()),
		me = this;
		if(!code) throw justep.Error.create("请填入License密钥更新码！");
		var params = new biz.Request.ActionParam();
		params.setString("pkg", code);
		biz.Request.sendBizRequest2({
				context: this.getContext(),
				action: "regActivationPackageAction",
				parameters: params,
				dataType: 'json',
				callback: function(data){
					if(data.state){
						me.showActivationTime();
						if(data.response) justep.Util.hint('系统密钥更新成功！');
						else justep.Util.hint('系统密钥更新失败！');
					}
					data.ignoreError=false;
				}
		});
	};

	return Model;
});