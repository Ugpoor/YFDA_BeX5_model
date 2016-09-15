define(function(require) {
	var $ = require("jquery");
	require("./jquery.iframe");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function() {
		this.iframePromise = null;
		this.iframe = null;
		this.callParent();
	};
	
	Model.prototype.modelLoad = function(event){
		//创建iframe打开UI的功能
		var self = this;
		var context = this.getContext();
		var url = context.getRequestParameter("iframeFunc");
		if(url){
			url = decodeURIComponent(url);
			var dtd = $.Deferred();
			this.iframePromise = dtd.promise();
			var urlObj = new justep.URL(url);
			if(!urlObj.getParam('language')) urlObj.setParam('language',context.getLanguage());  
			if(!urlObj.getParam('bsessionid')) urlObj.setParam('bsessionid',context.getBSessionID());  
			if(!urlObj.getParam('process')) urlObj.setParam('process',context.getProcess());  
			if(!urlObj.getParam('activity')) urlObj.setParam('activity',context.getActivity());  
			if(!urlObj.getParam('executor')) urlObj.setParam('executor',context.getExecutor());  
			if(!urlObj.getParam('executeContext')) urlObj.setParam('executeContext',context.getExecuteContext());  
			url = urlObj.toString();		
			var frame = $('<iframe frameBorder=0 class="portal-frame"></iframe>');
			this.iframe = frame[0];
			$(this.getRootNode()).append(frame);
			frame.src(require.toUrl(url), function(iframe, duration){
				dtd.resolve({
					iframe:this
				});				
				//增加5.2.7门户接口
				try{
					this.contentWindow.WindowProxy = {
							close: function(){
								justep.Shell.closePage();
							},
							addSubPage: function(){},
							removeSubPage: function(){}
					};
				}catch(err){/*跨域屏蔽错误*/};
			});
		}
	};
	
	return Model;
});