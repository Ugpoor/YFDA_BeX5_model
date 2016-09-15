define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var menu = require("$UI/demo/config/demo-pc.function");

	var selectors = {
			pages : '.x-portal-pages',
			username : '.x-portal-username',
			reload : '.x-portal-reload',
			logout : '.x-portal-logout'
		};
		var mainPageKey = 'main';

		var Model = function(){
			this.callParent();
			
			this._cfg = {
					isDebugMode: true,
					needLogin: false,
					main : {
						show : true,
						xid : mainPageKey,
						url : "$UI/portal/sample-pc/main/main.w",
						title : "首页"
					},
					loginURL : '$UI/portal/sample-pc/login/login.w'
				};
			this._cfg.binds = [ {
					selector : selectors.logout,
					event : 'click',
					func : this.logout.bind(this)
				}, {
					selector : selectors.reload,
					event : 'click',
					func : this.reload.bind(this)
				} ];
			this._pages = null;
			this.userName = "demo";
			this.current = null;
			this._loginDlg = null;
			this.openedPage = {};

			this.openers = [];
			if (location.hash !== "" && location.hash !== "#!login") {
				this.loginDtd = this.getLoadedDeferred();
			}
		};

		Model.prototype.reload = function() {
			this.isReloadMode = true;
			window.location.reload();
		};
		
		Model.prototype._getTitle = function(options, container) {
			var title = (options && (options.title || (options.extra && options.extra.title))) || '';
			if (container && container.getInnerModel()) {
				var evtData = {
					type : 'getTitle',
					title : title
				};
				container.getInnerModel().postMessage(evtData);
				title = evtData.title;
			}
			return title;
		};

		Model.prototype._doShowPage = function(event) {
			var container = event.data.container, options = event.data.params, pageID = event.data.xid;
			var title = this._getTitle(options, container);
			this.current = pageID;
			if (container) {
				// 增加相关的class
				container.$domNode.addClass('x-portal-page-container').parent(".x-contents-content").addClass('x-portal-page-content');
			}
			if (this.hasListener('onShowPage')) {
				var eData = {
					source : this,
					isMainPage : (options ? this.isMainPage(options.xid) : false),
					title : title,
					pageID : pageID,
					first : !this.openedPage[pageID],
					options : options
				};
				this.fireEvent('onShowPage', eData);
			}
			this.openedPage[pageID] = true;
		};
		
		Model.prototype.showPage = function(options) {
			return this.shellImpl.showPage(options);
		};

		Model.prototype._doClosePage = function(event) {
			var id = event.data.closePageXid;
			if(this.current === id) this.current = null;
			delete this.openedPage[id];
			if (this.hasListener('onClosePage')) {
				var eData = {
					source : this,
					pageID : id
				};
				this.fireEvent('onClosePage', eData);
			}
		};
		
		Model.prototype.closePage = function(pageID) {
			return this.shellImpl.closePage(pageID, true);
		};

		Model.prototype.logout = function(config) {
			config = config || {};
			var self = this;
			if (config.ignoreConfirm || confirm("请您注意，是否打开的功能都保存了，关闭系统将导致没有保存的数据丢失！\r\r您确定要退出吗？")) {
				this.closeAllPage();
				this.closeMainPage();
				this._doLogout();
				this.showLoginDialog();
			} else {
				if ((typeof event !== "undefined") && event.type == "hashchange") {
					history.forward();
				}
			}
		};

		Model.prototype._doLogout = function() {
			//开发者实现
		};

		Model.prototype._doBind = function() {
			var $root = $(this.getRootNode());
			var binds = this._cfg.binds;
			if ($.isArray(binds)) {
				for (var i = 0; i < binds.length; i++) {
					$root.find(binds[i].selector).on(binds[i].event, binds[i].func);
				}
			}
		};

		Model.prototype.clearFunctionTree = function() {
			if (this.hasListener('onClearFunctionTree')) {
				var eData = {
					source : this
				};
				this.fireEvent('onClearFunctionTree', eData);
			}
		};

		Model.prototype.getFunctions = function() {
			return this.getContext().data.functionTree.menu;
		};

		var param2pageMapping = function(param) {
			var ret = $.extend({}, param);
			if (param.title) {
				delete ret.title;
				ret.extra = {};
				ret.extra.title = param.title;
			}
			return ret;
		};

		var createPageKey = function(func) {
			var key = func.url;
			func['pageKey'] = key;
			return key;
		};

		var func2pageMapping = function(func) {
			var ret = {
				extra : {}
			};
			$.each(func, function(k, v) {
				if ($.inArray(k, [ 'activity', 'process', 'url' ]) > -1)
					ret[k] = v;
				else if ('label' === k)
					ret.extra.title = v;
				else if ('$children' != k)
					ret.extra[k] = v;
			});

			return ret;
		};

		Model.prototype.getMenu = function(){
			return menu;
		};
		
		Model.prototype.createFunctionTree = function() {
			var menu = this.getMenu();
			// 功能增加到maaping
			var pageMappings = {};
			pageMappings[mainPageKey] = param2pageMapping(this._cfg.main);
			// 遍历功能树生成mapping
			var model = this;
			this.eachFuncs(menu.$children, function(params) {
				if (model.isFunc(params.func)) {
					var func = params.func;
					var key = createPageKey(func);
					pageMappings[key] = func2pageMapping(func);
				}
			});
			this.shellImpl.addPageMappings(pageMappings);
			// 清理功能树
			this.clearFunctionTree();

			if (this.hasListener('onLoadFunctionTree')) {
				var eData = {
					source : this,
					funcs : menu.$children
				};
				this.fireEvent('onLoadFunctionTree', eData);
			}
		};

		Model.prototype.eachFuncs = function(funcs, fn, layer, parent) {
			var iLayer = layer || 0;
			if (!$.isArray(funcs) || !$.isFunction(fn))
				return;
			for (var i = 0; i < funcs.length; i++) {
				var func = funcs[i];
				fn({
					layer : iLayer,
					parent : parent,
					func : funcs[i],
					index : i
				});
				this.eachFuncs(func.$children, fn, (iLayer + 1), func);
			}
		};

		Model.prototype.isMainPage = function(pid) {
			return pid === this._cfg.main.xid;
		};
		
		Model.prototype.getLoginDialog = function() {
			if (!this._loginDlg) {
				this._loginDlg = new WindowDialog({
					src : this._cfg.loginURL,
					parentNode : this.getRootNode()
				});
				this._loginDlg.on('onReceive', this.loginDialogReceive, this);
			}
			return this._loginDlg;
		};
		
		Model.prototype.showLoginDialog = function() {
			this.beforeLogin();
			if(this._cfg.needLogin)
				this.getLoginDialog().open();
			else this.afterLogin();
		};

		Model.prototype.loginDialogReceive = function(event) {
			this.userName = event.data.username;
			this.beforeLogin();
			this.afterLogin();
		};

		Model.prototype.closeMainPage = function() {
			if (this.shellImpl) {
				this.closePage(mainPageKey);
				this.shellImpl.removeMainPage();
			}
		};

		Model.prototype.closeAllPage = function() {
			if (this.shellImpl) {
				this.shellImpl.closeAllOpendedPages();
			}
		};

		Model.prototype.beforeLogin = function() {
			this.clearFunctionTree();
			this.closeAllPage();

			// 登录前
			if (this.hasListener('onBeforeLogin')) {
				this.fireEvent('onBeforeLogin', {
					source : this
				});
			}
		};

		Model.prototype.afterLogin = function() {
			var context = this.getContext();
			this.isDebugMode = this._cfg.isDebugMode;
			var me = this;

			//控制开发模式刷新
			$(selectors.reload)[this.isDebugMode?'show':'hide']();
			//显示登陆者名称
			$(selectors.username).html(this.userName);
			
			// 登录后完成
			if (this.hasListener('onLogin')) {
				var eData = {
					source : this,
					context : context
				};
				this.fireEvent('onLogin', eData);
			}
			// 初始化功能树
			this.createFunctionTree();

			// 加载主页面
			var loginDtdResolve = function() {
				if (me.loginDtd)
					me.loginDtd.resolve();
			};
			if (this._cfg.main.show)
				this.showPage(mainPageKey).done(loginDtdResolve);
			else
				loginDtdResolve();
		};

		Model.prototype.isFunc = function(func) {
			return !!func.url;
		};

		Model.prototype.getPages = function() {
			if (!this._pages) {
				var node = this.getPagesNode();
				if (node)
					this._pages = this.comp(node);
			}
			return this._pages;
		};

		Model.prototype.getPagesNode = function() {
			var $root = $(this.getRootNode());
			var $pages = $root.find(selectors.pages);
			if ($pages.size() > 0) {
				return $pages[0];
			}
		};

		Model.prototype._doInit = function() {
			if (this.hasListener('onInit')) {
				var eData = {
					source : this,
					config : this._cfg
				};
				this.fireEvent('onInit', eData);
			}
			
			this.shellImpl = this.createShellImpl();
			this.shellImpl.on('onCallPortal', this._doCallPortal, this);
			this.shellImpl.on('onPageActive', this._doShowPage, this);
			this.shellImpl.on('onAfterPageClose', this._doClosePage, this);
		};

		Model.prototype._doCallPortal = function(event){
			var fn = event.fn, param = event.param;
			if($.isFunction(this[fn])){
				event.result = this[fn].call(this, param);
			}
		};
		
		Model.prototype.createShellImpl = function(){
			return new ShellImpl(this, {
				contentsXid : this.getPagesNode()
			});
		};
		
		Model.prototype.modelLoad = function(event) {
			var me = this;
			window.onunload = function() {
				if (me.logined && !me.isReloadMode) {
					me._doLogout();
				}
			};

			// 如果不是IE9 , 可以设置onbeforeunload
			if (!justep.Browser.IE9) {
				window.onbeforeunload = function() {
					if (me.logined && !me.isReloadMode && !me.isDebugMode)
						return "退出会导致未保存的数据丢失?";
				};
			}

			var name = getParameter("username");
			var password = getParameter("password");
			if (password)
				password = password.toUpperCase();// 大写MD5
			var isDirectLogin = name && password;
			if (this.logined || isDirectLogin) {
				if (this.loadPortalContext(name, password)) {
					// 隐藏密码和用户名
					var newUrl = (location.origin ? location.origin : (location.protocol + "//" + location.host)) + window.location.pathname;
					var search = window.location.search || "";
					if (search) {
						var a = [];
						search = search.substring(1);
						search = search.split("&");
						for (var i = 0; i < search.length; i++) {
							var s = search[i];
							if (s.toLowerCase().indexOf("password=") == -1 && s.toLowerCase().indexOf("username=") == -1) {
								a.push(s);
							}
						}
						search = "";
						if (a.length > 0)
							search = "?" + a.join("&");
					}
					newUrl += search;
					newUrl += window.location.hash;
					window.history.replaceState(null, null, newUrl);

					this.afterLogin();
				} else
					this.showLoginDialog();
			} else{
				this.showLoginDialog();
			}
		};
		
		Model.prototype.loadPortalContext = function(name, password) {
			this.userName = name;
			return true;
		};
		
		function getParameter(name) {
			var search = window.location.search;
			var params = {};
			search = search ? search : "";

			if (search.charAt(0) == "?") {
				search = search.substring(1);
			}
			search = decodeURIComponent(search);
			var items = search.split("&");
			for (var i = 0; i < items.length; i++) {
				var item = items[i];
				var index = item.indexOf("=");
				if (item && (index != -1)) {
					var key = item.substring(0, index), value = decodeURIComponent(item.substring(index + 1));
					if (key.indexOf('.') == '-1')
						params[key] = value;
					else {
						key = key.split('.');
						var obj = params[key[0]] = params[key[0]] || {};
						for (var j = 1; j < key.length - 1; j++) {
							obj = obj[key[j]] = obj[key[j]] || {};
						}
						obj[key.pop()] = value;
					}
				}
			}
			return params[name];
		}

		Model.prototype.modelModelConstruct = function(event) {
			this._doInit();
			this._doBind();
		};
		
		return Model;
	});
