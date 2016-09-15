define(function(require){
	require("$UI/system/resources/system.res");
	var $ = require("jquery"),
		FastClick = require("$UI/system/components/justep/lib/fastclick"),
		justep = require("$UI/system/lib/justep"),
		CommonUtils = require("$UI/system/components/justep/common/utils"),
		biz = require("$UI/system/lib/biz");
		require("$UI/system/components/justep/loadingBar/loadingBar");

	require("$UI/system/lib/cordova/cordova");
	require("$UI/system/lib/jquery/transition");
	require("w!$UI/portal/mobile/left/left.w");
	require("w!$UI/portal/mobile/login/login.w");
	require("w!$UI/portal/mobile/main/main.w");
	
	window.__justep.directConnectBiz = true;
	window.isPortalWindow = true;
	
	var Model = function(){
		this.callParent();
		//修改主页，初始化门户
		this.on('onInit', function(event) {
			event.config.main.url = '$UI/portal/mobile/main/main.w';
			event.config.changePassword.url = '$UI/portal/mobile/changePassword/changePassword.w';
			event.config.loginURL = '$UI/portal/mobile/login/login.w';
			event.config.leftURL = '$UI/portal/mobile/left/left.w?$functionTree=true';
			
			this.initPortal();
		});
		
		//登录前清理相关
		this.on('onBeforeLogin', this.doBeforeLogin);
		//登录成功后加载展现
		this.on('onLogin', this.doAfterLogin);
		//onload事件
		this.on('onLoad', this.doLoad);
	};
	
	Model.prototype = {
		getBSessionID: function(){
			return this.getContext().getBSessionID();
		},
		getLanguage: function(){
			return this.getContext().getLanguage();
		},
		getSkin: function(){
			return this.getContext().getSkin();
		},
		toggleMenu: function(){
			this.comp('portal').toggleLeft();
		},
		setSkin: function(value){
			var cur = this.getContext().getSkin();
			if(cur != value){
				this.myStore('skin', value);
				this.reload({$skin: value});
			}
		},
		setLang: function(value){
			var cur = this.getContext().getLang();
			if(cur != value){
				this.myStore('lang', value);
				this.reload({lang: value});
			}
		},
		setDebug: function(value){
			this.myStore('debug', value);
			if(value)
				$("#debugBar").show();
			else
				$("#debugBar").hide();
		},
		store: function(name, value){
			if(value !== undefined){
				localStorage.setItem(name, value);		
			}else{
				value = localStorage.getItem(name);
				if(value === 'true') value = true;
				if(value === 'false') value = false;
				return value;
			}
		},
		myStore: function(name, value){
			name = this.getContext().getCurrentPersonID() + '.' + name;
			return this.store(name, value);
		}
	};
	
	Model.prototype.createShellImpl = function(){
		var me = this, shellImpl = this.callParent();
		var _old_showPage = shellImpl.showPage;
		shellImpl.showPage = function(){
			//显示工作区
			me.comp('portal').show('content');
			return _old_showPage.apply(shellImpl,arguments)
		}
		return shellImpl;
	};
	
	Model.prototype.initPortal = function(){
		var self = this;
		var pages = this.getPages();
		var exitdDtd = CommonUtils.attachDoubleClickExitApp(function(){
			if(!self.logined || pages.getActiveIndex() == 0){
				return true;
			}
			return false;
		});
		exitdDtd.done(function(){
			self._doLogout();
		});
	};
	
	Model.prototype.doBeforeLogin = function(){
		var pages = this.getPages();
		if(pages){
			pages.removeAll();
		};
		this.comp('portal').show('content');
		this.comp('portal').removeLeftContent();
	};
		
	Model.prototype.doLoad = function(){
		FastClick.attach(document.body);
			
		var me = this,
			ignoreConfirm = this.getContext().getRequestParameter("ignoreConfirm");
		
		
		/*加上是为了解决浏览器刷新提醒的问题, 但是在app中会导致返回按钮退出提醒
		 *onbeforeunload能力比较有限, 后边解决单页模式就可以解决这个问题
		*/
		if(!justep.Browser.isX5App && (ignoreConfirm != "true")){
			window.onbeforeunload = function(){
				if(me.logined && !me.isReloadMode)
					return "您确定要退出吗？";
			};
		}
	};
		
	Model.prototype.doAfterLogin = function(event){
		var portal = this.comp('portal'),
			context = this.getContext();			
		
		//加载左边栏
		portal.loadLeftContent(require.toUrl(this._cfg.leftURL));
		var self = this;
		portal.leftCompose.on('onLoad',function(){
			//for debug
			if(self.myStore('debug'))
				$('#debugBar').show();
			else	
				$('#debugBar').hide();
		});
		//hcr 添加通知相关
		biz.Push.init(context, context.getCurrentPersonID());
	};

	Model.prototype.toggleLeftClick = function(event){
		this.comp('portal').toggleLeft();
	};

	Model.prototype.prevClick = function(event){
		this.getPages().prev();
	};

	Model.prototype.nextClick = function(event){
		this.getPages().next();
	};

	Model.prototype.clearClick = function(event){
		this.closeAllPage();
	};

	Model.prototype.refreshClick = function(event){
		this.reload();
		window.location.reload();
	};
	Model.prototype.logout = function(config) {
		//hcr 添加通知相关
		biz.Push.disConnect();
		this.callParent(config);
	};
	
	return Model;
});