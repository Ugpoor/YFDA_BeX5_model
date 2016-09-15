define(function(require){
	var shell = require('$UI/system/lib/portal/shell');
	var portal = require('$UI/system/lib/portal/portal');
	var $ = require("jquery");
	
	var processOption = function(option) {
		var ret = {};
		$.each(option, function(k, v) {
			if ('label' === k)
				ret.title = v;
			else if(!$.isFunction(v)) 
				ret[k] = v;
		});

		return ret;
	};
	
	portal.openWindow = function(url, options){
		if($.isPlainObject(url)){
			options = url;
		}
		options = options || {}; 
		if('string'===typeof(url)) options.url = url;
		//兼容UI下的功能
		if(options.url && options.url.indexOf('/')===0)
			options.url = '$model' + options.url;
		return shell.showPage(processOption(options));
	};

	portal.hasWindow = function(id){
		var openedPages = this.shellImpl.getOpenedPages();
		if ($.isArray(openedPages))
			for (var i = openedPages.length - 1; i >= 0; i--) {
				if(openedPages[i]!=id) return true;
			}
		return false;
	};

	portal.gotoWindow = function(id){
		return shell.showPage({xid:id});
	};
});


