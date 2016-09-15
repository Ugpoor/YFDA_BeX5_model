define(function(require){
	require("css!$UI/portal/mobile/css/icon").load();
	require("$UI/system/lib/cordova/cordova");
	require('$UI/system/lib/jquery/transition');

	var MD5 = require('$UI/system/lib/base/md5'),
		$= require('jquery'),
		justep = require('$UI/system/lib/justep'),
		biz = require('$UI/system/lib/biz'),
		md5 = new MD5(),
		loginAction = "$UI/portal/base/login/login.j";
		
	var LangParamName = 'language';	
	
	var Model = function(){
		this.callParent();
    };
	
	Model.prototype.modelLoad = function(event){
		var me = this,
			remember = this.comp('remember'),
			name = this.comp('name'),
			password = this.comp('password'),
			lang = this.comp('lang'),
			langs = this.comp('langs'),
			autoLogin = this.comp('autoLogin');
			
		//如果只有一种语言那么隐藏语言选项
		if(langs.getCount() > 1){
			$(".lang-switch").show();
			var search = window.location.search;
			if(search){
				search = search.substring(1);
				search = search.split("&");
				for(var i=0; i<search.length; i++){
					if(search[i].indexOf(LangParamName + "=") == 0){
						var value = search[i].split("=")[1];
						lang.val(value);
						break;
					}
				}
			}
		}	

		if(this.store('rememberme') == 'remember'){
			remember.val(true);
			name.val(this.store("username"));
			password.val(this.store("password"));
			autoLogin.val(this.store("autoLogin"));
		}
		
		$('body').on('keyup',function(){
			if(event.keyCode==13){
				me.login();
				return false;
			}
		});
		
        var urlParams = new justep.URL(window.location.href).params || {};//$.parseUrlQuery(window.location.href);
		var manualLogin = urlParams.manualLogin === 'true' || urlParams.manualLogin === true;
		
		if(!manualLogin && autoLogin.val()){
			this.login();
		}
	};
	
	Model.prototype.login = function(){
		var remember = this.comp('remember'),
			name = this.comp('name'),
			password = this.comp('password'),
			autoLogin = this.comp('autoLogin');
	
        var urlParams = new justep.URL(window.location.href).params || {};//$.parseUrlQuery(window.location.href);
        delete urlParams.manualLogin; 
        urlParams.username = name.val();
        urlParams.password = password.val();
        if (urlParams.password !== this.store("password")){//说明非是明文
			urlParams.password = md5.hex_md5_salt(urlParams.password);
        }
        urlParams.loginDate = justep.Date.toString(new Date(), 'yyyy-MM-dd');
        
        var result = this.doLogin(urlParams);
        
        if(result.flag === true){
        
			var auto = autoLogin.val();
			if(remember.val()){
				this.store('rememberme',"remember");
				this.store('username',urlParams.username);
				this.store('password',urlParams.password);
				this.store('autoLogin', auto);
            }
			//对话框返回数据
			this.comp("receiver").windowEnsure(result.data);
			
            return false;
        }else{
            alert(result.message);
        }
	};
	
	Model.prototype.doLogin = function(params){
		params['url'] = require.toUrl(loginAction);
        var result = biz.Request.login(params);
       if(result.status === 0){
         	return {flag: false, message: "网络有问题, 请与管理员联系!"};
       }else{
          	return JSON.parse(result.responseText);
       }	
    };	
	
	Model.prototype.rememberChange = function(event){
		var checked = event.source.val();
        if(!checked){
            this.store("rememberme", false);
            this.store("username", '');
            this.store("password", '');
        }
        return false;
	};
	
	Model.prototype.loginClick = function(event){
		this.login();
		return false;
	};
	
	Model.prototype.store = function(name, value){
		if(value !== undefined){
			localStorage.setItem(name, value);		
		}else{
			value = localStorage.getItem(name);
			if(value === 'true') value = true;
			if(value === 'false') value = false;
			if(value === 'null') value = null;
			return value;
		}
	};
	Model.prototype.autoLoginChange = function(event){
		var checked = event.source.val();
		if(checked){
			this.comp('remember').val(true);
		}
        return false;
	};
	Model.prototype.langChange = function(event){
		var lang = event.value;
		if(!lang) return;
		var search = window.location.search;
		if(search){
			search = search.substring(1);
			search = search.split('&');
			var newSearch = [];
			for(var i=0; i<search.length; i++){
				if(search[i].indexOf(LangParamName + "=") != 0)
					newSearch.push(search[i]);
			}
			newSearch.push(LangParamName + "=" + lang);
			search = "?" + newSearch.join("&"); 
		}else
			search = "?" + LangParamName + "=" + lang;
		window.location.href = window.location.origin + window.location.pathname + search + window.location.hash; 
	};
	Model.prototype.showLangBtnClick = function(event){
		$("[xid='showLangBtn']").hide();
		$("[xid='hideLangBtn']").show();
		$(".login-lang").show();
	};
	Model.prototype.hideLangBtnClick = function(event){
		$("[xid='showLangBtn']").show();
		$("[xid='hideLangBtn']").hide();
		$(".login-lang").hide();
	};
	return Model;
});
