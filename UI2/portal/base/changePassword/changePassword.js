define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MD5 = require('$UI/system/lib/base/md5');
	
	var changePasswordAction = '$UI/portal/base/changePassword/ChangePassword.j',
		md5 = new MD5(true);
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveBtnClick = function(event){
		var oldValue = this.comp('oldPWInput').val(),
			newValue = this.comp('newPWInput').val(),
			confirmValue = this.comp('confirmPWInput').val();
		
		if(!oldValue || !newValue){
			justep.Util.hint("密码不能为空！", {type: 'danger', parent: this.getRootNode()});
			return;
		}
		if(oldValue === newValue){
			justep.Util.hint("新旧密码不能一样！", {type: 'danger', parent: this.getRootNode()});
			return;
		}
		if(newValue !== confirmValue){
			justep.Util.hint("新密码输入不一致！", {type: 'danger', parent: this.getRootNode()});
			return;
		}
		
		var result = this.changePassword(newValue, oldValue);
		if(result.flag === false)
			justep.Util.hint(result.message, {type: 'danger', parent: this.getRootNode()});
		else
			justep.Util.hint("密码修改成功！", {type: 'success', parent: this.getRootNode()});
			
	};
	
	Model.prototype.changePassword = function(newPwd, oldPwd){
		var url = new justep.URL(require.toUrl(changePasswordAction)),
			userName = this.getContext().getCurrentPersonCode();
		url.setParam({
			username: userName,
			password: md5.hex_md5_salt(oldPwd),
			new_password: md5.hex_md5_salt(newPwd)
		});
        var result = $.ajax({
            type: "GET",
            url: url.toString(),
            async: false,
            cache:false
        });
        return JSON.parse(result.responseText);
	};

	return Model;
});