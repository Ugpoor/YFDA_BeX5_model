define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MD5 = require('$UI/system/lib/base/md5');
	
	var changePasswordAction = '$UI/portal/base/changePassword/ChangePassword.j';
	var md5 = new MD5(true);
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveBtnClick = function(event){
		var oldValue = this.comp('oldPWInput').val(),
			newValue = this.comp('newPWInput').val(),
			confirmValue = this.comp('confirmPWInput').val();
		
		if(!oldValue || !newValue){
			this.comp('alert').show({
				type: 'OK',
				message: '密码不能为空'
			});
			return;
		}
		if(oldValue === newValue){
			this.comp('alert').show({
				type: 'OK',
				message: '新旧密码一样'
			});
			return;
		}
		if(newValue !== confirmValue){
			this.comp('alert').show({
				type: 'OK',
				message: '新密码输入不一致'
			});
			return;
		}
		
		var result = this.changePassword(newValue, oldValue);
		if(result.flag === false)
			this.comp('alert').show({
				type: 'OK',
				message: result.message
			});
		else
			this.comp('alert').show({
				type: 'OK',
				message: '密码修改成功'
			});
			
	};
	
	Model.prototype.changePassword = function(newPwd, oldPwd){
		var url = new justep.URL(require.toUrl(changePasswordAction)),
			userName = this.getContext().getCurrentPersonName();
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