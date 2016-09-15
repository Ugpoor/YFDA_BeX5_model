define(function(require){
	require("$UI/system/resources/system.res");	
	var defaultTheme = "blue2";

	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("css!./assets/admin/layout/css/layout").load();
	require("css!./assets/admin/layout/css/themes/blue2").load({id: "style_color"});
	
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	require("./plugins.min");	
	require("./metronic.min");
	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
		
		//修改主页，初始化门户
		this.on('onInit', function(event) {
			event.config.isDebugMode = false;//开发模式
			event.config.needLogin = false;
			event.config.main.url = '$UI/portal/sample-pc/main/main.w';
			this.initPortal();
		});
		
		//登录前清理相关
		this.on('onBeforeLogin', this.doBeforeLogin);
		//登录成功后加载展现
		this.on('onLogin', this.doAfterLogin);

		//功能激活，设置title和菜单
		this.on('onShowPage', this.doActivePage);
		//功能关闭，清理菜单
		this.on('onClosePage', this.doClosePage);

		//加载功能树
		this.on('onLoadFunctionTree', this.doCreateFunctionTree);
		//清理功能树
		this.on('onClearFunctionTree', this.clearFuncTree);
	};
	
	Model.prototype.getMenu = function(){
		//可以重新实现菜单
		return this.callParent();
	};
	
	Model.prototype.initTheme = function(){
		this.initThemed = false;
		var options = {
			color: this.customizer.get("metronic/color"),
			layout: this.customizer.get("metronic/layout") || "fluid",
		    sidebar: this.customizer.get("metronic/sidebar") || "fixed",
		    header: this.customizer.get("metronic/header") || "fixed",
		    footer: this.customizer.get("metronic/footer") || "fixed",
		    sidebarPos: this.customizer.get("metronic/sidebarPos") || "left",
		    sidebarStyle: this.customizer.get("metronic/sidebarStyle") || "default",
		    sidebarMenu: this.customizer.get("metronic/sidebarMenu") || "accordion"
		}
		this.setTheme(options);
		this.initThemed = true;
	};
	
	Model.prototype.setTheme = function(options){
		this.setColor(options);
		delete options.color;
		this.setThemeOptions(options);
	};
	
	Model.prototype.setColor = function(options){
		var color = options.color || defaultTheme;
		//为了保证在调试刷新下表现正确, 有时候id style_color还没有设置到link上
		setTimeout(function(){
			$('#style_color').attr("href", Layout.getLayoutCssPath() + 'themes/' + color + ".css");
		}, 0);
        if (color == 'light2') {
            $('.page-logo img').attr('src', Layout.getLayoutImgPath() + 'logo-invert.png');
        } else {
            $('.page-logo img').attr('src', Layout.getLayoutImgPath() + 'logo.png');
        }
        if(this.initThemed)
        	this.customizer.save("metronic/color", options.color);
        
        this.currentThemeCache = this.currentThemeCache || {};
        this.currentThemeCache["metronic/color"] = options.color;
	};
	
	Model.prototype.setThemeOptions = function(options){
        var layoutOption = options.layout;
        var sidebarOption = options.sidebar;
        var headerOption = options.header;
        var footerOption = options.footer;
        var sidebarPosOption = options.sidebarPos;
        var sidebarStyleOption = options.sidebarStyle;
        var sidebarMenuOption = options.sidebarMenu;
        var headerTopDropdownStyle = options.headerTopDropdown;

        var resetLayout = function() {
            $(".body").
            removeClass("page-boxed").
            removeClass("page-footer-fixed").
            removeClass("page-sidebar-fixed").
            removeClass("page-header-fixed").
            removeClass("page-sidebar-reversed");

            $('.page-header > .page-header-inner').removeClass("container");

            if ($('.page-container').parent(".container").size() === 1) {
                $('.page-container').insertAfter('.body > .page-root > .clearfix');
            }

            if ($('.page-footer > .container').size() === 1) {
                $('.page-footer').html($('.page-footer > .container').html());
            } else if ($('.page-footer').parent(".container").size() === 1) {
                $('.page-footer').insertAfter('.page-container');
                $('.scroll-to-top').insertAfter('.page-footer');
            }

             $(".top-menu > .navbar-nav > li.dropdown").removeClass("dropdown-dark");

            $('.body > .page-root > .container').remove();
        };
        
        resetLayout(); // reset layout to default state

        if (layoutOption === "boxed") {
            $(".body").addClass("page-boxed");

            // set header
            $('.page-header > .page-header-inner').addClass("container");
            var cont = $('.body > .page-root > .clearfix').after('<div class="container"></div>');

            // set content
            $('.page-container').appendTo('.body > .page-root > .container');

            // set footer
            if (footerOption === 'fixed') {
                $('.page-footer').html('<div class="container">' + $('.page-footer').html() + '</div>');
            } else {
                $('.page-footer').appendTo('.body > .page-root > .container');
            }
        }

        if (this.lastSelectedLayout != layoutOption) {
            //layout changed, run responsive handler: 
            Metronic.runResizeHandlers();
        }
        this.lastSelectedLayout = layoutOption;

        //header
        if (headerOption === 'fixed') {
            $(".body").addClass("page-header-fixed");
            $(".page-root>.page-header").removeClass("navbar-static-top").addClass("navbar-fixed-top");
        } else {
            $(".body").removeClass("page-header-fixed");
            $(".page-root>.page-header").removeClass("navbar-fixed-top").addClass("navbar-static-top");
        }

        //sidebar
        if ($('.body').hasClass('page-full-width') === false) {
            if (sidebarOption === 'fixed') {
                $(".body").addClass("page-sidebar-fixed");
                $("page-sidebar-menu").addClass("page-sidebar-menu-fixed");
                $("page-sidebar-menu").removeClass("page-sidebar-menu-default");
                Layout.initFixedSidebarHoverEffect();
            } else {
                $(".body").removeClass("page-sidebar-fixed");
                $("page-sidebar-menu").addClass("page-sidebar-menu-default");
                $("page-sidebar-menu").removeClass("page-sidebar-menu-fixed");
                $('.page-sidebar-menu').unbind('mouseenter').unbind('mouseleave');
            }
        }

        // top dropdown style
        if (headerTopDropdownStyle === 'dark') {
            $(".top-menu > .navbar-nav > li.dropdown").addClass("dropdown-dark");
        } else {
            $(".top-menu > .navbar-nav > li.dropdown").removeClass("dropdown-dark");
        }

        //footer 
        if (footerOption === 'fixed') {
            $(".body").addClass("page-footer-fixed");
        } else {
            $(".body").removeClass("page-footer-fixed");
        }

        //sidebar style
        if (sidebarStyleOption === 'light') {
            $(".page-sidebar-menu").addClass("page-sidebar-menu-light");
        } else {
            $(".page-sidebar-menu").removeClass("page-sidebar-menu-light");
        }

        //sidebar menu 
        if (sidebarMenuOption === 'hover') {
            $(".page-sidebar-menu").addClass("page-sidebar-menu-hover-submenu");
        } else {
            $(".page-sidebar-menu").removeClass("page-sidebar-menu-hover-submenu");
        }

        //sidebar position
        if (Metronic.isRTL()) {
            if (sidebarPosOption === 'left') {
                $(".body").addClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'right'
                });
            } else {
                $(".body").removeClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'left'
                });
            }
        } else {
            if (sidebarPosOption === 'right') {
                $(".body").addClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'left'
                });
            } else {
                $(".body").removeClass("page-sidebar-reversed");
                $('#frontend-link').tooltip('destroy').tooltip({
                    placement: 'right'
                });
            }
        }

        Layout.fixContentHeight(); // fix content height            
        Layout.initFixedSidebar(); // reinitialize fixed sidebar

        if(this.initThemed)
			for(var prop in options){
				if(options.hasOwnProperty(prop))
					this.customizer.save("metronic/" + prop, options[prop]);;
			}
        
        this.currentThemeCache = this.currentThemeCache || {};
		for(var prop in options){
			if(options.hasOwnProperty(prop))
				this.currentThemeCache["metronic/" + prop] = options[prop];
		}
	};
	
	Model.prototype._getCurrentLayout = function(){
		var result = {};
		result.other = this.currentThemeCache;

		//从main页面获取门户配置
		var dom = $(".portal-main").get(0);
		if(dom){
			var config = justep.Bind.contextFor(dom).$model._getLayoutConfig();
			result.portal = config; 
		}else{
			justep.Util.hint("首页异常!确认门户首页正常打开了吗?");
		}
			
		return result;
	};
	
	Model.prototype.doActivePage = function(event){
		//event.pageID, event.title, event.isMainPage
		this.setTitle(event.title);
		
		//设置x-full-screen
		var value = $(".page-content>.x-contents").css("min-height");
		if(/px$/.test(value)){
			$(".window.x-full-screen").height(value);
		}
		
		if(!event.isMainPage){
			$('#portal-opened').show();
			$(this.comp("closeFuncBtn").domNode).show();
			if(event.first){
				var html = justep.String.format('<li><a data-pid="{0}" onmouseover="$(this).addClass(\'on\');" onmouseout="$(this).removeClass(\'on\');"><i class="opened-close pull-right icon-close-round"></i>{1}</a></li>', event.pageID, event.title);
				this.addNode($('#portal-opened .dropdown-menu .dropdown-menu-content')[0], $(html)[0]);
				var size = $('#portal-opened .dropdown-menu .dropdown-menu-content li').length;
				$('#portal-opened .dropdown-menu .external h3 span').html(size);
			}
		}else $(this.comp("closeFuncBtn").domNode).hide();	
	};
	
	Model.prototype.doClosePage = function(event){
		$('#portal-opened .dropdown-menu li a').each(function(){
			if($(this).data('pid') == event.pageID) $(this).parent().remove();
		});
		var size = $('#portal-opened .dropdown-menu .dropdown-menu-content li').length;
		$('#portal-opened .dropdown-menu .external h3 span').html(size);
		if(size == 0)
			$('#portal-opened').hide();
	};
		
	Model.prototype.setTitle = function(value){
		value = value || "";
		$('.page-title').html(value);
	};	
	
	Model.prototype.doCreateFunctionTree = function(event){
		var funcs = event.funcs,
			$content = $(".page-sidebar-menu"),
			html = [],
			me = this;
	
		//html.push('<li><a href="#" isMain="true"><i class="fa fa-th-large" /><span class="nav-label">首页</span></a></li>');
		function printTree(children, isFirst){
			if(!children || !children.length) return;
			for(var i=0; i<children.length; i++){
				var child = children[i];
				html.push('<li class="');
				if(child.psmCount > 1)
					html.push('psm');
				html.push('">');
				html.push('<a class="ajaxify"');
				if(child.url){
					html.push('title="', child.label, '" ');
					html.push('pageKey="', child.pageKey, '" ');
				}
				html.push('>');
				if(child.iconClass)
					html.push('<i class="' + child.iconClass + '"/>');
				if(isFirst){
					html.push('<span class="title">');
				}
				html.push(child.label);
				if(isFirst){
					html.push('</span>');
					html.push('<span class="selected"></span>');
				}
				if(child.$children && child.$children.length > 0){
					html.push('<span class="arrow"></span>');
				}
				if(child.psmCount > 1){
					html.push('<span class="psm icon-person-stalker"></span>');
				}
				html.push('</a>');
				if(child.$children && child.$children.length > 0){
					html.push('<ul class="sub-menu">');
					printTree(child.$children);
					html.push('</ul>');
				}
				html.push('</li>');
			}
		}
		
		printTree(funcs, true);
		
		html = html.join('');
		
		$content.append(html);
		
		var me = this;
	    $('li>a', $content).click(function(){
	    	var el = $(this),pageKey=el.attr('pageKey');
	    	if(pageKey){
	    		$(".func-open", $content).removeClass("func-open");
	    		el.parent().addClass("func-open");
	    		me.showPage(pageKey);
	    	}
	    });
	};

	Model.prototype.clearFuncTree = function(){
		$(".page-sidebar-menu>li").each(function(index, item){
			if(index>1) $(item).remove();
		});
	};

	Model.prototype.doBeforeLogin = function(){
		$(".page-header-inner .page-logo .menu-toggler").hide();
		$(".page-header-inner .top-menu").hide();

		$('#portal-opened').hide();
		$('#portal-opened .dropdown-menu .dropdown-menu-content').html('');
		
		$("#portal-agent").hide();
		$('#portal-agent .dropdown-menu').html('');
	};
	
	Model.prototype.doAfterLogin = function(event){
		var context = event.context;
		this.customizer = new Customizer(context.data.layout, context);
		this.initTheme();

		$(".page-root").show();
		
		$(".page-header-inner .page-logo .menu-toggler").show();
		$(".page-header-inner .top-menu").show();
	};
	
	Model.prototype.initPortal = function(event){
		//初始化Metronic
		Metronic.init(); // init metronic core componets
		Layout.init(); // init layout
		QuickSidebar.init(); // init quick sidebar
		Index.init();
		Index.initDashboardDaterange();
		Index.initJQVMAP(); // init index page's custom scripts
		Index.initCalendar(); // init index page's custom scripts
		Index.initCharts(); // init index page's custom scripts
		Index.initChat();
		Index.initMiniCharts();
		Metronic.addResizeHandler(function(){
			var value = $(".page-content>.x-contents").css("min-height");
			if(/px$/.test(value)){
				$(".portal-frame").height(value);
				$(".window.x-full-screen").height(value);
			}
		});
		
		var me = this;		
		$('#portal-opened').hide();
		$("#portal-opened .dropdown-menu").click(function(event){
			if($(event.target).hasClass('opened-close')){
				me.closePage($(event.target).parent().data('pid'));
			}else if($(event.target).hasClass('closeAll')){
				me.closeAllPage();
			}else{
				var pid = $(event.target).data('pid');
				if(pid) me.showPage(pid);
			}
		});
		
		//兼容平板设备
		$(".dropdown-toggle[data-hover=dropdown]").click(function(){
			$(this).parent().addClass("open");
		})
		
		if(!justep.Browser.hasTouch){
	        $('[data-x5-hover="dropdown"]').not('.hover-initialized').each(function() {
	            $(this).dropdownHover();
	            $(this).addClass('hover-initialized');
	        });
		}
		this.initExecutor();
	};
	
	Model.prototype.initExecutor = function(){
		if(this.executor){
			this.comp("configBtn").$domNode.hide();
			this.comp("changPasswordBtn").$domNode.hide();
			this.comp("logoutBtn").$domNode.hide();
			this.comp("closeBtn").$domNode.show();
		}
	};
	
	Model.prototype.closeFuncBtnClick = function(event){
		if(this.current) this.closePage(this.current);
	};

	Model.prototype.configBtnClick = function(event){
		this.comp("configDialog").open();
	};
	
	var Customizer = function(config, context){
		$.extend(this, config);
		this.other = this.other || {};
		this.context = context;
	};
	
	Customizer.prototype = {
		get: function(key){
			return this.other[key];
		},
		save: function(key, data){
			//开发者实现保存逻辑
		}		
	};
	
	//解决IE9+, 下href="javascript:..."引起onbeforeunload执行的问题
	$(document).click(function(event){
		if(event.target && event.target.tagName.toLowerCase() == 'a'){
			var href = $(event.target).attr("href");
			if(href && href.indexOf("javascript:") == 0)
				return false;
		}
	});

	return Model;
});