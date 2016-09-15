define(function(require) {
	require('./mockPortalApi');

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var biz = require('$UI/system/lib/biz');
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");

	var selectors = {
		pages : '.x-portal-pages',
		username : '.x-portal-username',
		agent : '.x-portal-agent',
		reload : '.x-portal-reload',
		waitTask : '.x-portal-task-wait',
		logout : '.x-portal-logout',
		setPassWord : '.x-portal-setPassWord',
		showMainPage: '.x-portal-showMain',
		datetime: '.x-portal-datetime'
	};
	var loginAction = '$UI/portal/base/login/login.j';
	var logoutAction = '$UI/portal/base/logout/logout.j';
	var mainPageKey = 'main';
	var changePasswordPageKey = 'changePassword';

	window.isPortalWindow = true;
	var Model = function() {
		this.callParent();
		
		this.waitTaskCount = justep.Bind.observable(0);

		this._cfg = {
			main : {
				show : true,
				xid : 'main',
				url : "$UI/portal/base/main/main.w",
				process : "/portal/process/message/messageProcess",
				activity : "mainActivity",
				title : "首页"
			},
			changePassword : {
				xid : "changePassword",
				url : '$UI/portal/base/changePassword/changePassword.w',
				process : "/portal/process/message/messageProcess",
				activity : "mainActivity",
				title : '修改密码'
			},
			agent : {
				process : "/SA/OPM/system/systemProcess",
				activity : "mainActivity"
			},
			waitTask : {
				count : {
					process : "/portal/process/message/messageProcess",
					activity : "mainActivity",
					action : "queryWaitMessageAction"
				},
				//默认指向任务中心
				url : "$UI/SA/task/taskCenter/mainActivity.a?parameter=waiting",
				process : "/SA/task/taskCenter/taskCenterProcess",
				activity : "mainActivity",
				xid : "waitTask",
				title : '待办任务',
				enabled : false
			},
			loginURL : '$UI/portal/base/login/login.w',
			selectExecutorURL : '$UI/portal/base/dialog/selectExecutor.w',
			iframeFuncURL : '$UI/portal/base/plugin/iframeFunc.w',
			dateTimeFormat:'yyyy-MM-dd hh:mm:ss'
		};
		this._cfg.binds = [ {
			selector : selectors.setPassWord,
			event : 'click',
			func : this.changePassword.bind(this)
		}, {
			selector : selectors.logout,
			event : 'click',
			func : this.logout.bind(this)
		}, {
			selector : selectors.reload,
			event : 'click',
			func : this.reload.bind(this)
		}, {
			selector : selectors.showMainPage,
			event : 'click',
			func : this.showMainPage.bind(this)
		} ];
		this._pages = null;
		this.current = null;
		this._loginDlg = null;
		this._selectExecutorDlg = null;
		this.openedPage = {};

		this.openers = [];
		if (location.hash !== "" && location.hash !== "#!login") {
			this.loginDtd = this.getLoadedDeferred();
		}
	};

	Model.prototype.bindUpdateDateTime = function(){
		var $root = $(this.getRootNode());
		var $dateTime = $root.find(selectors.datetime);
		if($dateTime.size()>0){
			var model = this; 
			var fn = function(){
				var now = new Date();
				$dateTime.text(justep.Date.toString(now, model._cfg.dateTimeFormat||justep.Date.DEFAULT_FORMAT));
			};
			this._updateDateTimeHandle = window.setInterval(justep.Util.bindModelFn(this, fn, this), 1000);
		}
	};
	
	Model.prototype.showMainPage = function(){
		this.showPage(mainPageKey);
	};
	
	Model.prototype.getPageId = function() {
		return this.current;
	};

	Model.prototype.reload = function() {
		this.isReloadMode = true;
		this.setBsessionid(this.bsessionid);
		window.location.reload();
	};

	Model.prototype.refreshWaitTaskCount = function() {
		if(this._cfg.waitTask && this._cfg.waitTask.enabled && this.__logined){
			var cfg = this._cfg.waitTask.count, me = this;
			if(this._refreshWaitTaskCountHandle) window.clearTimeout(this._refreshWaitTaskCountHandle);
			this._refreshWaitTaskCountHandle = window.setTimeout(function(){
				this._refreshWaitTaskCountHandle = null;
				var params = new biz.Request.ActionParam();
				var response = biz.Request.sendAsyncBizRequest({
					contentType : "application/json",
					dataType : "application/json",
					process : cfg.process,
					activity : cfg.activity,
					action : cfg.action,
					directExecute : true,
					parameters : params,
					context : me.getContext(),
					callback : function(resultData) {
						if (resultData && resultData.state && resultData.response && resultData.response.rows) {
							if(resultData.response.rows.length>0)
								me.waitTaskCount.set(resultData.response.rows[0].fCount.value);
						}
					}
				});
			}, 500);
		}
	};

	Model.prototype.changePassword = function() {
		return this.showPage(changePasswordPageKey);
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
		var container = event.container, options = event.data.params, pageID = event.data.xid;
		var title = this._getTitle(options, container);
		this.current = pageID;
		if (container) {
			// 增加相关的class
			container.$domNode.addClass('x-portal-page-container').parent(".x-contents-content").addClass('x-portal-page-content');
		}
		var isMainPage = (options ? this.isMainPage(options.xid) : false);
		if (this.hasListener('onShowPage')) {
			var eData = {
				source : this,
				isMainPage : isMainPage,
				title : title,
				pageID : pageID,
				first : !this.openedPage[pageID],
				options : options
			};
			this.fireEvent('onShowPage', eData);
		}
		this.openedPage[pageID] = true;
		//关闭时刷新待办任务数
		if(isMainPage) this.refreshWaitTaskCount();
	};

	Model.prototype.selectExecutorDialogReceive = function(event){
		this.showPageByExecutor(this._executor_pageKey_,event.data);
	};
	
	Model.prototype.showPageByExecutor = function(pageKey,executor) {
		var pageParam = this.shellImpl.pageMappings[pageKey];
		var title = this._getTitle(pageParam);
		var cfg = {title:title,process:pageParam.process,activity:pageParam.activity,url:pageParam.url};
		if(executor) cfg.executor = executor;
		return this.showPage(cfg);
	};
	
	Model.prototype.selectExecutorShowPage = function(pageKey) {
		this._executor_pageKey_ = pageKey;
		var pageParam = this.shellImpl.pageMappings[pageKey];
		var title = this._getTitle(pageParam);
		var me = this;
		var params = new biz.Request.ActionParam();
		params.setString('process', pageParam.process);
		params.setString('activity', pageParam.activity);
		params.setString('type', "json");
		var response = biz.Request.sendBizRequest({
			contentType : "application/json",
			dataType : "application/json",
			process : "/SA/OPM/system/systemProcess",
			activity : "mainActivity",
			action : 'getPersonMembersAction',
			directExecute : true,
			parameters : params,
			context : this.getContext(),
			callback : function(resultData) {
				if (resultData && resultData.state) {
					var psm = [];
					var dlg = me.getSelectExecutorDialog();
					$.each(resultData.response,function(n,v){
						psm.push({fID:n,fName:v});
					});
					dlg.open({data:psm});
				}
			}
		});
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

	Model.prototype.sessionTimeout = function() {
		if (!this.logined) {
			this.logout({
				ignoreConfirm : true
			});
		}else if(this.__logined && !this.__sessionTimeoutConfirm){//没有登录和已经弹出询问框都不再重复询问
			this.__sessionTimeoutConfirm = true;
			var self = this, OKfunc = function(){
				self.logout({
					ignoreConfirm : true
				});
				self.__sessionTimeoutConfirm = false;
			};
			justep.Util.confirm("服务器连接超时, 是否关闭页面!", OKfunc, function(){
				self.__sessionTimeoutConfirm = false;
			});
		}
	};

	Model.prototype.logout = function(config) {
		config = config || {};
		var self = this;
		if (config.ignoreConfirm || confirm("请您注意，是否打开的功能都保存了，关闭系统将导致没有保存的数据丢失！\r\r您确定要退出吗？")) {
			if(!this.isAgent){
				this.__logined = false;
				this.closeAllAgent();//关闭所有代理
				this.closeAllPage();
				this.closeMainPage();
				this._doLogout();
				this.showLoginDialog();
			}else window.close();//代理时关闭功能
		} else {
			if ((typeof event !== "undefined") && event.type == "hashchange") {
				history.forward();
			}
		}
	};

	Model.prototype._doLogout = function() {
		var url = require.toUrl(logoutAction);
		try {
			$.ajax({
				type : "POST",
				processData : false,
				url : url,
				cache : false,
				async : false
			});
		} catch (err) {
		}
	};

	Model.prototype._doBind = function() {
		var $root = $(this.getRootNode());
		var binds = this._cfg.binds;
		if ($.isArray(binds)) {
			for (var i = 0; i < binds.length; i++) {
				$root.find(binds[i].selector).on(binds[i].event, binds[i].func);
			}
		}
		this.bindUpdateDateTime();
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

	var isJ = function isJ(url){
		var i = url.indexOf('?');
		if(i != -1)
			url = url.substring(0, i);
		return /\.j$/.test(url.toLowerCase());
	};
	
	var isIframeFunc = function(func){
		var isUI2 = true;
		try{
			isUI2 = justep.URL.isUI2(func.url);
		}catch(err){
		}
		return !isUI2 || func.type == "iframe" || isJ(func.url);
	};

	var isIframeUrl = function(url){
		var isUI2 = true;
		try{
			isUI2 = justep.URL.isUI2(url);
		}catch(err){
		}
		return !isUI2 || isJ(url);
	};

	var getIframeFuncUrl = function(url, iframeFuncURL){
		return iframeFuncURL + ((iframeFuncURL.indexOf("?") > 0) ? "&" : "?") + "iframeFunc=" + encodeURIComponent(url);
	};
	
	var createPageKey = function(func,iframeFuncURL) {
		var key = func.url;
		if(isIframeFunc(func)){
			func.url = getIframeFuncUrl(func.url, iframeFuncURL);
			func.type = "iframe";
		}
		func['pageKey'] = key;
		return key;
	};

	var func2pageMapping = function(func,iframeFuncURL) {
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

	Model.prototype.createAgent = function(){
		var agentList = this.getContext().data.agentList;
		if(agentList && agentList.value && agentList.value.length > 0){
			$(selectors.agent).show();
			if (this.hasListener('onLoadAgent')) {
				var eData = {
					source : this,
					agents : agentList.value
				};
				this.fireEvent('onLoadAgent', eData);
			}
		}else $(selectors.agent).hide();		
	};
	
	Model.prototype.createFunctionTree = function() {
		var funcsData = this.getContext().data.functionTree.menu;

		// 功能增加到maaping
		var pageMappings = {};
		pageMappings[mainPageKey] = param2pageMapping(this._cfg.main);
		pageMappings[changePasswordPageKey] = param2pageMapping(this._cfg.changePassword);
		if(this._cfg.waitTask && this._cfg.waitTask.enabled) pageMappings[this._cfg.waitTask.xid] = param2pageMapping(this._cfg.waitTask);
		// 遍历功能树生成mapping
		var model = this;
		this.eachFuncs(funcsData.$children, function(params) {
			if (model.isFunc(params.func)) {
				var func = params.func;
				var key = createPageKey(func,model._cfg.iframeFuncURL);
				pageMappings[key] = func2pageMapping(func,model._cfg.iframeFuncURL);
			}
		});
		this.shellImpl.addPageMappings(pageMappings);
		// 清理功能树
		this.clearFunctionTree();

		if (this.hasListener('onLoadFunctionTree')) {
			var eData = {
				source : this,
				funcs : funcsData.$children
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

	Model.prototype.setBsessionid = function(value) {
		this.bsessionid = value;
		// set cookie bsessionid
		if (value === null)
			justep.Util.deleteCookie("bsessionid", '/');
		else
			justep.Util.addCookie("bsessionid", value, '/', null, true);
		this.logined = !!this.bsessionid;

		if (justep.Browser.IE9) {
			if (this.logined) {
				window.onbeforeunload = function() {
					return "退出会导致未保存的数据丢失?";
				};
			} else {
				// 确保登陆也不会提示
				window.onbeforeunload = undefined;
			}
		}
		window.__justep._directConnectBiz = window.__justep._directConnectBiz || window.__justep.directConnectBiz;
		if (window.__justep._directConnectBiz) {
			var bizFrame = $('#bSessionIDFrame');
			var bSessionidUrl = biz.Request.businessServer + '/default.html#' + this.bsessionid;
			$('#bSessionIDFrame').remove();
			window.__justep.directConnectBiz = false;
			bizFrame = $(
					'<div style="width:0;height:0;font-size:0;overflow:hidden;"><iframe src='
							+ bSessionidUrl + ' onload="(function(){window.__justep.directConnectBiz = true;})();"></iframe></div>').attr({
				id : 'bSessionIDFrame'
			});
			$('body').append(bizFrame);
		}
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
	
	Model.prototype.getSelectExecutorDialog = function() {
		if (!this._selectExecutorDlg) {
			this._selectExecutorDlg = new WindowDialog({
				src : this._cfg.selectExecutorURL,
				status: "normal",
				title: "请选择岗位",
				width: "360px",
				height: "auto",
				showTitle: true,
				parentNode : this.getRootNode()
			});
			this._selectExecutorDlg.on('onReceive', this.selectExecutorDialogReceive, this);
		}
		return this._selectExecutorDlg;
	};

	Model.prototype.showLoginDialog = function() {
		this.beforeLogin();
		this.getLoginDialog().open();
	};

	Model.prototype.loginDialogReceive = function(event) {
		this.beforeLogin();
		this.setPortalContext(event.data);
		this.afterLogin();
	};

	Model.prototype.setPortalContext = function(data) {
		var context = this.getContext();
		// todo 合并executor, executeContext, 代码不好, 指定了具体的参数
		var executor = null;
		var executeContext = null;
		if (context.data.params) {
			executor = context.data.params.executor;
			executeContext = context.data.params.executeContext;
		}
		context.data = data;
		context.data.params = context.data.params || {};
		context.data.params.executor = executor;
		context.data.params.executeContext = executeContext;

		window.__justep.__portalContext = context;
		this.setBsessionid(context.data.bsessionid);
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

	Model.prototype.openAgent = function(executor) {
		var config = justep.Util.clone(this._cfg.agent);
		config.executor = executor;
		config.agent = 'true';
		this.bsessionid && (config.bsessionid=this.bsessionid);
		var context = this.getContext();
		var skin = context.getSkin();
		skin && (config.$skin=skin);
		if($.isFunction(context.getLanguage)){
			var lang = context.getLanguage();
			lang && (config.language=lang);
		} 
		var url = new justep.URL(window.location.protocol + '//' + window.location.host + window.location.pathname);
		url.setParam(config);

		var opener = window.open(url.toString(), executor);
		this.openers.push(opener);
		return opener;
	};

	Model.prototype.closeAllAgent = function() {
		for (var i = 0; i < this.openers.length; i++) {
			this.openers[i].close();
		}
		this.openers = [];
	};

	Model.prototype.beforeLogin = function() {
		this.clearFunctionTree();
		this.closeAllPage();

		this.setBsessionid(null);

		// 登录前
		if (this.hasListener('onBeforeLogin')) {
			this.fireEvent('onBeforeLogin', {
				source : this
			});
		}
	};

	Model.prototype.afterLogin = function() {
		this.__logined = true;
		var context = this.getContext();
		this.isDebugMode = context.isDebug();
		var me = this;

		//控制开发模式刷新
		$(selectors.reload)[this.isDebugMode?'show':'hide']();
		//显示登陆者名称
		var userName = context.getCurrentPersonName();
		$(selectors.username).html(userName);
		//获取代办任务数
		var waitTaskCfg = this._cfg.waitTask;
		if(!waitTaskCfg.disabled){
			$(selectors.waitTask).on('click', function(){
				me.showPage(waitTaskCfg.xid);
			});
			this.refreshWaitTaskCount();
		}
		
		// 登录后完成
		if (this.hasListener('onLogin')) {
			var eData = {
				source : this,
				context : context
			};
			this.fireEvent('onLogin', eData);
		}
		// 初始化代理
		this.createAgent();
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
		//兼容UI功能
		justep.Portal.isPortal2 = true;
		this.setBsessionid(justep.Util.getCookie("bsessionid"));
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
		//接管处理UI的url
		this.shellImpl.on('onBeforePageLoad', function(event){
			if(event.data && event.data.url && isIframeUrl(event.data.url)){
				event.data.url = getIframeFuncUrl(event.data.url, this._cfg.iframeFuncURL);
			}
		},this);
		//打开功能通知后台
		this.shellImpl.on('onAfterPageLoad', function(evt){
			if(!this.__sessionTimeoutConfirm){
				if(evt.container && $.isFunction(evt.container.getInnerModel)){
					var model = evt.container.getInnerModel();
					if(model){
						var params = new biz.Request.ActionParam();
						var response = biz.Request.sendBizRequest({
							contentType : "application/json",
							dataType : "application/json",
							action : 'openActivityAction',
							directExecute : true,
							parameters : params,
							context : model.getContext(),
							callback : function(){}//沉默后端异常
						});
					}
				}			
			}
		}, this);
		//关闭功能通知后台
		this.shellImpl.on('onBeforePageClose', function(evt){
			if(!this.__sessionTimeoutConfirm){
				if(evt.container && $.isFunction(evt.container.getInnerModel)){
					var model = evt.container.getInnerModel();
					if(model){
						var params = new biz.Request.ActionParam();
						var response = biz.Request.sendBizRequest({
							contentType : "application/json",
							dataType : "application/json",
							action : 'closeActivityAction',
							directExecute : true,
							parameters : params,
							context : model.getContext(),
							callback : function(){}//沉默后端异常
						});
					}
				}			
			}
		}, this);
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
			if (me.logined && !me.isReloadMode && !me.executor) {
				me._doLogout();
				me.setBsessionid(null);
			}
		};

		// 如果不是IE9 , 可以设置onbeforeunload
		if (!justep.Browser.IE9) {
			window.onbeforeunload = function() {
				if (me.logined && !me.isReloadMode && !me.isDebugMode)
					return "退出会导致未保存的数据丢失?";
			};
		}

		this.isAgent = 'true'===getParameter("agent");
		this.executor = getParameter("executor");
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
		} else {
			this.showLoginDialog();
		}
	};

	Model.prototype.getFuncIframe = function(tabId){
		var pages = this.getPages();
		if (pages == null) {
			return null;
		}
		var content = pages.getContent(tabId);
		var $iframe = content && content.$domNode.find('iframe.portal-frame');
		if($iframe && $iframe.size()>0) return $iframe.get(0);
	};
	
	Model.prototype.loadPortalContext = function(name, password) {
		var url = new justep.URL(require.toUrl(loginAction));
		this.bsessionid && url.setParam({
			bsessionid : this.bsessionid
		});
		this.executor && url.setParam({
			executor : this.executor
		});
		name && password && url.setParam({
			username : name,
			password : password,
			loginDate : justep.Date.toString(new Date(), 'yyyy-MM-dd')
		});
		
        var result = biz.Request.login({url:url.toString()});
        if(result.status === 0 || result.status === 500){
        	return false;
        }else{
    		var data = JSON.parse(result.responseText);
    		if (data.flag)
    			this.setPortalContext(data.data);
    		return data.flag;
        }	
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

	Model.prototype.modelUnLoad = function(event){
		if(this._updateDateTimeHandle) window.clearInterval(this._updateDateTimeHandle);
	};

	return Model;
});
