define(function(require){
	var $ = require("jquery");
	(function(){
		if(window.__justep && window.__justep.isDebug && location.href.indexOf('livereload=false')==-1 && location.href.indexOf('/system/designer')==-1 && (window.WebSocket || window.MozWebSocket)){
			setTimeout(function(){
				$.getScript("http://"+location.hostname+":35729/livereload.js");
			},2000);
		}
	})();
	return {};
});