define(function(require){		
	var Observable = require("$UI/system/lib/base/observable");
	var Object = require("$UI/system/lib/base/object");
	var $ = require("jquery");
	var Browser = require("$UI/system/lib/base/browser");
	require("$UI/system/lib/cordova/cordova");
	
	var Notification = Object.extend({
		mixins : Observable,
		constructor : function() {
			this.callParent();
			this.$logNode = $("<div></div>").css({position:"fixed",bottom:'50px',right:"10px",'z-index':'999999',width:'50%','word-break':'break-all'}).appendTo('body');
		},
		log : function(msg,type,time,options){
			var msgEle = $(msg);
			type = type || "message";
			var logEle = $("<div></div>").addClass("alert alert-"+type).append(msgEle).appendTo(this.$logNode);
			if(options){
				var clickCallback = options.click;
			}
			var _time = time || 2000;
			
			var hideSelf = function(){
				logEle.hide('slow',function(){
					logEle.remove();
				});
			};
			
			setTimeout(function(){
				hideSelf();
			},_time);
			
			logEle.on('click',function(){
				hideSelf();
				clickCallback && clickCallback();
			});
			return msgEle;
		}
	});
	return new Notification();
});