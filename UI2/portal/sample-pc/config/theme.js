define(function(require){

	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	var justep = require("$UI/system/lib/justep");

	var defaultTheme = "blue2";
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.modelLoad = function(event){
		Demo.init();
	};
	
	Model.prototype.closeBtnClick = function(event){
		this.comp("receiver").windowCancel();
	};
	
	/**
	Demo script to handle the theme demo
	**/
	var Demo = function() {

        var panel = $('.theme-panel');

        var setLayout = function() {

            var layoutOption = $('.layout-option', panel).val();
            var sidebarOption = $('.sidebar-option', panel).val();
            var headerOption = $('.page-header-option', panel).val();
            var footerOption = $('.page-footer-option', panel).val();
            var sidebarPosOption = $('.sidebar-pos-option', panel).val();
            var sidebarStyleOption = $('.sidebar-style-option', panel).val();
            var sidebarMenuOption = $('.sidebar-menu-option', panel).val();
            var headerTopDropdownStyle = $('.page-header-top-dropdown-style-option', panel).val();

            if (sidebarMenuOption === 'hover' && sidebarOption === 'fixed') {
            	sidebarMenuOption = "accordion";
                alert("当侧边栏处于固定模式,菜单不能设置为侧出式.");
                $('.sidebar-menu-option', panel).val("accordion");
            }
            
            if (sidebarOption == "fixed" && headerOption == "default") {
            	headerOption = 'fixed';
                alert('在头部不固定的情况下侧边拦固定是不支持的. 可以设置固定头, 固定侧边拦.');
                $('.page-header-option', panel).val("fixed");
            }

            justep.Shell.fireEvent('onCallPortal',{fn:'setThemeOptions', param:{
            	layout: layoutOption,
	            sidebar: sidebarOption,
	            header: headerOption,
	            footer: footerOption,
	            sidebarPos: sidebarPosOption,
	            sidebarStyle: sidebarStyleOption,
	            sidebarMenu: sidebarMenuOption
	        }});
        };

        // handle theme colors
        var setColor = function(color) {
            var color_ = (Metronic.isRTL() ? color + '-rtl' : color);
            justep.Shell.fireEvent('onCallPortal',{fn:'setColor', param:{color: color_}});
        };

	    // Handle Theme Settings
	    var handleTheme = function() {

	        if ($('.body').hasClass('page-boxed') === false) {
	            $('.layout-option', panel).val("fluid");
	        }

	        //$('.sidebar-option', panel).val("default");
	        $('.page-header-option', panel).val("fixed");
	        //$('.page-footer-option', panel).val("default");
	        if ($('.sidebar-pos-option').attr("disabled") === false) {
	            $('.sidebar-pos-option', panel).val(Metronic.isRTL() ? 'right' : 'left');
	        }

	        var lastSelectedLayout = '';

	        $('.toggler', panel).click(function() {
	            $('.toggler').hide();
	            $('.toggler-close').show();
	            $('.theme-panel > .theme-options').show();
	        });

	        /*
	        $('.toggler-close', panel).click(function() {
	        	//mad 隐藏打开按钮
	            //$('.toggler').show();
	            $('.toggler-close').hide();
	            $('.theme-panel > .theme-options').hide();
	        });
	        */

	        $('.theme-colors > ul > li', panel).click(function() {
	            var color = $(this).attr("data-style");
	            setColor(color);
	            $('ul > li', panel).removeClass("current");
	            $(this).addClass("current");
	        });

	        // set default theme options:

	        if ($(".body").hasClass("page-boxed")) {
	            $('.layout-option', panel).val("boxed");
	        }

	        if ($(".body").hasClass("page-sidebar-fixed")) {
	            $('.sidebar-option', panel).val("fixed");
	        }

	        if ($(".body").hasClass("page-header-fixed")) {
	            $('.page-header-option', panel).val("fixed");
	        }

	        if ($(".body").hasClass("page-footer-fixed")) {
	            $('.page-footer-option', panel).val("fixed");
	        }

	        if ($(".body").hasClass("page-sidebar-reversed")) {
	            $('.sidebar-pos-option', panel).val("right");
	        }

	        if ($(".page-sidebar-menu").hasClass("page-sidebar-menu-light")) {
	            $('.sidebar-style-option', panel).val("light");
	        }

	        if ($(".page-sidebar-menu").hasClass("page-sidebar-menu-hover-submenu")) {
	            $('.sidebar-menu-option', panel).val("hover");
	        }
	        
	        var themeUrl = $("#style_color").attr("href");
	        if(themeUrl){
	        	var s = themeUrl.split('/');
	        	var name = s[s.length-1].split('.')[0];
		        $('.theme-panel ul > li').removeClass("current");
		        $('.theme-panel ul > li[data-style="' + name + '"]').addClass("current");
	        }

	        var sidebarOption = $('.sidebar-option', panel).val();
	        var headerOption = $('.page-header-option', panel).val();
	        var footerOption = $('.page-footer-option', panel).val();
	        var sidebarPosOption = $('.sidebar-pos-option', panel).val();
	        var sidebarStyleOption = $('.sidebar-style-option', panel).val();
	        var sidebarMenuOption = $('.sidebar-menu-option', panel).val();

	        $('.layout-option, .page-header-option, .page-header-top-dropdown-style-option, .sidebar-option, .page-footer-option, .sidebar-pos-option, .sidebar-style-option, .sidebar-menu-option', panel).change(setLayout);
	    };

	    // handle theme style
	    var setThemeStyle = function(style) {
	        var file = (style === 'rounded' ? 'components-rounded' : 'components');
	        file = (Metronic.isRTL() ? file + '-rtl' : file);

	        $('#style_components').attr("href", Metronic.getGlobalCssPath() + file + ".css");

	        if ($.cookie) {
	            $.cookie('layout-style-option', style);
	        }
	    };

	    return {

	        //main function to initiate the theme
	        init: function() {
	            // handles style customer tool
	            handleTheme(); 

	            // handle layout style change
	            $('.theme-panel .layout-style-option').change(function() {
	                 setThemeStyle($(this).val());
	            });

	            // set layout style from cookie
	            if ($.cookie && $.cookie('layout-style-option') === 'rounded') {
	                setThemeStyle($.cookie('layout-style-option'));
	                $('.theme-panel .layout-style-option').val($.cookie('layout-style-option'));
	            }            
	        },
	        setLayout: function(){
	        	setLayout();
	        },
	        setColor: function(value){
	        	setColor(value);
	        }
	    };

	}();
	
	Model.prototype.resetBtnClick = function(event){
        $('.theme-panel .layout-option').val("fluid");
        $('.theme-panel .sidebar-option').val("fixed");
        $('.theme-panel .page-header-option').val("fixed");
        $('.theme-panel .page-footer-option').val("fixed");
        $('.theme-panel .sidebar-pos-option').val("left");
        $('.theme-panel .sidebar-style-option').val("default");
        $('.theme-panel .sidebar-menu-option').val("accordion");
        
        $('.theme-panel ul > li').removeClass("current");
        $('.theme-panel ul > li[data-style="' + defaultTheme + '"]').addClass("current");
        
        Demo.setLayout();
        Demo.setColor(defaultTheme);
	};
	
	return Model;

});