define(function(require) {
	require("$UI/system/resources/system.res");
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require('css!./plugin/submenu/css/bootstrap-submenu').load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");

	var $ = require("jquery");

	var Submenu = require("./plugin/submenu/js/bootstrap-submenu");
	var Button = require('$UI/system/components/justep/button/button');

	var funcFlag = '_func_', menuFlag = '_menu_';
	//用于缓存的jquery对象
	var $contentPages,$funcHead;

	var Model = function() {
		this.callParent();

		this.on('onInit', function(event) {
			event.config.isDebugMode = true;//开发模式
			event.config.needLogin = false;
			event.config.main.url = '$UI/portal/sample-pc/main/main.w';
		});

		this.on('onShowPage', function(event) {
			this.showTab(event.pageID, event.title, event.isMainPage);
		});

		this.on('onClosePage', function(event) {
			this.closeTab(event.pageID);
		});

		this.on('onLoadFunctionTree', function(event) {
			//登录成功后显示功能区
			$('.x-portal-root').removeClass('hide').show();
		
			var model = this;
			// 接管创建功能树
			$.each(event.funcs, function(i, v) {
				model.doCreateMenu(v, i);
			});
			// 默认点击第一个菜单
			$('.x-portal-first-meun > .x-first-meun-item:first').click();
		});

		this.on('onClearFunctionTree', function(event) {
			// 接管清理功能树
			this.clearMenu();
		});

		//加载代理
		this.on('onLoadAgent', this.doLoadAgent);

		getFuncTabs().on('click', '.close.x-portal-close', function(event) {
			var $target = $(event.currentTarget).closest("li");
			this.closePage($target.attr('pid'));
			return false;
		}.bind(this)).on('click', 'li', function(event) {
			var $target = $(event.currentTarget);
			this.showPage($target.attr('pid'));
		}.bind(this));
		
		//绑定关闭全部功能btn
		$contentPages = $('.x-portal-content-pages');//进行缓存，便于后期使用，提高效率
		$funcHead = $('.x-portal-func-head'),self = this;
		var $closeAllBtn = $funcHead.children('.x-portal-closeall-btn').on('click',function(){
			self.closeAllPage();
		});
		$funcHead.on('mouseenter',function(event){
			$closeAllBtn.show();
		}).on('mouseleave ', function(event){
			$closeAllBtn.hide();
		});
		
		//二级菜单左右移动btn
		var $sm = getSecondMeun();
		$sm.on('mouseover', function(event){
			var navW = $sm.children('.x-portal-second-meun-nav:visible').width();
			var smW = $sm.innerWidth();
			if(smW<navW)
				$sm.children('.x-portal-second-meun-btn-right,.x-portal-second-meun-btn-left').show();
		}).on('mouseout', function(event){
			$sm.children('.x-portal-second-meun-btn-right,.x-portal-second-meun-btn-left').hide();
		}).on('mouseup touchend', function(event){
			secondMeunStop();
		});
		
		$sm.children('.x-portal-second-meun-btn-right').on('mousedown touchstart', function(){
			secondMeunStart(-1);
		});
		
		$sm.children('.x-portal-second-meun-btn-left').on('mousedown touchstart', function(){
			secondMeunStart(1);
		});

		$(window).on('resize',function(){
			calcSecondMenuNavWidth($sm.children('.x-portal-second-meun-nav:visible'));
			var $nav = $sm.children('.x-portal-second-meun-nav:visible'), navW = $nav.width();
			var smW = $sm.innerWidth();
			if(smW>=navW) $nav.css('left',0);
			calcContentPagesHeight();
		});
	};

	Model.prototype.getMenu = function(){
		//可以重新实现菜单
		return this.callParent();
	};
	
	var secondMeunStart = function(offset){
		getSecondMeun().prop('_scroll_type_',offset);
		secondMeunRun();
	};
	
	var secondMeunStop = function(){
		getSecondMeun().prop('_scroll_type_',0);
	};
	
	var secondMeunRun = function(){
		var $sm = getSecondMeun(), scrollOffset = $sm.prop('_scroll_type_');
		if(scrollOffset){
			scrollOffset = scrollOffset * 50;
			var $nav = $sm.children('.x-portal-second-meun-nav:visible');
			var p = $nav.position();
			p.left = p.left + scrollOffset;
			if(p.left>0) p.left = 0; 
			$nav.css(p);
			var navW = $nav.width();
			var smW = $sm.innerWidth();
			if(p.left<0 && smW<(navW+p.left))
				setTimeout(secondMeunRun, 50);
		}
	};

	var getFuncTabs = function() {
		return $('ul.x-portal-func-tabs');
	};

	var getSecondMeun = function() {
		return $('.x-portal-second-meun');
	};

	var calcSecondMenuNavWidth = function($secondMenu){
		//计算宽度
		var w = 0;
		$secondMenu.children("li").each(function(){
			var $li = $(this);
			var liw = $li.outerWidth(true);
			var x = $li.offset().left + liw;
			w += liw;
			if(x>w) w = x;
		});
		$secondMenu.width(w);
	};

	var calcContentPagesHeight = function(){
		var h = $funcHead.height();
		$contentPages.css('top',h+4);
	};
	
	Model.prototype.doLoadAgent = function(event){
		//初始化代理
		var agents = event.agents;
		var html = [];
		for(var i=0; i<agents.length; i++){
			var agent = agents[i];
			var s = justep.String.format('<li><a data-executor="{0}">{1}</a></li>', agent.id, agent.name);
			html.push(s);
		}
		var me = this;
		$('.x-portal-agent .dropdown-menu').append(html.join('')).children('li').click(function(e){
			var executor = $(e.target).data("executor");
			executor && me.openAgent(executor);
		});
	};
	
	Model.prototype.clearMenu = function() {
		this.clearFirstMeun();
		this.clearSecondMeun();
	};

	Model.prototype.clearFirstMeun = function() {
		var model = this;
		$('.x-portal-first-meun').children().each(function() {
			model.removeElement(this);
		});
	};

	Model.prototype.clearSecondMeun = function() {
		var model = this;
		getSecondMeun().children('ul.x-portal-second-meun-nav').each(function() {
			model.removeElement(this);
		});
	};

	Model.prototype.doCreateMenu = function(func, index) {// 增加索引增加菜单延迟创建缓存机制
		if (func) {
			this.createFirstMenuItem(func, index);
		}
	};

	var hasChildren = function(func) {
		return func && $.isArray(func.$children) && func.$children.length > 0;
	};

	var getIcon = function(func) {
		//没有时给出默认图标
		return func.iconClass || 'icon-ios7-briefcase-outline';
	};

	Model.prototype.createFirstMenuItem = function(func, index) {
		var $firstMeun = $('.x-portal-first-meun');
		var btn = new Button({
			parentNode : $firstMeun[0],
			label : func.label,
			'class' : 'btn btn-link btn-icon-top x-first-meun-item ',
			icon : getIcon(func)
		});
		btn.on('onClick', this.doClickFirstMenuItem, this);
		func[menuFlag] = justep.String.format('_FirstMenu_{0}_', index);
		btn[funcFlag] = func;
	};

	Model.prototype.doClickFirstMenuItem = function(event) {
		$('.x-portal-first-meun').children('.x-first-meun-item').removeClass('active');
		event.source.addClass('active');
		var func = event.source[funcFlag];
		this.loadSecondMenu(func);
		this.runFunc(func);
	};

	Model.prototype.runFunc = function(func){
		if(this.isFunc(func))
			this.showPage(func.pageKey);
	};
	
	Model.prototype.loadSecondMenu = function(func) {
		var $secondMenubar = getSecondMeun(), menuID = func[menuFlag];
		$secondMenubar.children('ul.x-portal-second-meun-nav').hide();
		var $secondMenu = $secondMenubar.children("." + menuID);
		if ($secondMenu.size() <= 0) {
			var secondMenu = document.createElement('ul');
			$secondMenu = $(secondMenu).addClass('nav nav-pills x-portal-second-meun-nav').addClass(menuID);
			var model = this;
			$.each(func.$children, function(i, v) {
				model.createSecondMenuItem(v, menuID, i, $secondMenu);
			});
			// 通过平台api加入进行bind
			this.addNode($secondMenubar[0], secondMenu);
			calcSecondMenuNavWidth($secondMenu);
			// 绑定点击事件
			$secondMenu.on('click', 'a.x-second-meun-item,a.x-submeun-item', function(event) {
				model.doClickSecondMenuItem(event);
			}).on('click', 'a.x-second-meun-item>.psm,a.x-submeun-item>.psm', function(event){
				var p = $(this).parent(),func=p.prop(funcFlag);
				if(func && func.pageKey){
					model.selectExecutorShowPage(func.pageKey);
				}
				return false;
			});
		}
		$secondMenu.show();
	};

	Model.prototype.createSecondMenuItem = function(func, parentID, index, $parentNode) {
		func[menuFlag] = justep.String.format('_{0}_SecondMenu_{1}_', parentID, index);
		var $item = createSubMenuItem(func);
		var $a = $item.removeClass('dropdown-submenu').children('a.x-submeun-item').addClass('x-second-meun-item');
		if(hasChildren(func)) $a.attr({"data-toggle":"dropdown"}).dropdown().append('<span class="caret"></span>');
		$parentNode.append($item);
	};

	var createSubMenuItem = function(func) {
		var $menuItem = $('<li/>'), $menuItemA = $('<a/>').addClass('x-submeun-item').attr('title',func.label).prop(funcFlag, func).html(func.label);
		if(func.psmCount > 1) $menuItemA.append('<span class="psm icon-person-stalker"></span>');
		$menuItem.append($menuItemA);
		var $subMenu = createSubMenu(func);
		if ($subMenu) {
			$menuItem.append($subMenu).addClass('dropdown-submenu');
			Submenu($subMenu);
		}
		return $menuItem;
	};

	var createSubMenu = function(func) {
		if (hasChildren(func)) {
			var funcs = func.$children;
			var $subMenu = $('<ul class="dropdown-menu"/>');
			for (var i = 0; i < funcs.length; i++) {
				$subMenu.append(createSubMenuItem(funcs[i]));
			}
			return $subMenu;
		}
	};

	Model.prototype.doClickSecondMenuItem = function(event) {
		var $item = $(event.currentTarget);
		var func = $item.prop(funcFlag);
		this.runFunc(func);
	};

	Model.prototype.closeAllTab = function() {
		getFuncTabs().empty();
	};

	Model.prototype.closeTab = function(pageID) {
		var $tabs = getFuncTabs(), $tab = $tabs.children('li[pid="' + pageID + '"]');
		/*
		if($tab.hasClass('active'))
			if ($tab.prev().addClass('active').size() <= 0)
				$tab.next().addClass('active');
		*/
		$tab.remove();
		calcContentPagesHeight();
	};

	Model.prototype.showTab = function(pageID, title, isMainPage) {
		var $tabs = getFuncTabs(), $tab = $tabs.children('li[pid="' + pageID + '"]');
		if ($tab.size() <= 0) {
			var colse = isMainPage ? '' : ('<span class="close x-portal-close">×</span>');
			$tabs.append(justep.String.format('<li class="active" pid="{0}"><a class="x-portal-title-a" href="#"><span>{1}</span>{2}</a></li>', pageID, title, colse));
			$tab = $tabs.children('li[pid="' + pageID + '"]');
			//重新计算功能区域大小
			calcContentPagesHeight();
		}
		$tabs.children('li').removeClass('active');
		$tab.addClass('active');
	};

	return Model;
});