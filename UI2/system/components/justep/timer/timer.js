/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");

	var url = require.normalizeName("./timer");
	var ComponentConfig = require("./timer.config");

	var Timer = justep.ViewComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
			this.enabled = true;
			this.times = -1;
			this._pause = false;
			this.interval = 1000;
			this._timerHandle = null;
		},
		dispose : function() {
			this.stop();
			this.callParent();
		},
		buildTemplate : function(cfg) {
			if(!cfg || !cfg.model || !(cfg.model instanceof justep.ModelBase)){
	    		var msg = new justep.Message(justep.Message.JUSTEP231117);//创建Timer组件必须给出有效的model参数
	    		throw justep.Error.create(msg);
			} 
			this.set(cfg);
			cfg.parentNode = cfg.model.getRootNode();
			return $('<span ' + (cfg.xid?'xid="'+cfg.xid+'"':'') + ' component="' + url + '" style="display:none;"/>');
		},
		init : function(value, bindingContext, allBindings){
			this.callParent(value, bindingContext, allBindings);
			this.$domNode.hide();
			this._inited = true;
			if(this.enabled) this.start();
		},
		stop: function(){
			this._pause = false;
			this.enabled = false;
			if(this._timerHandle){
				clearInterval(this._timerHandle);
				this._timerHandle = null;
			}
		},
		start: function(){
			if(!this._timerHandle){
				var runTimes = 0;
				var self = this;
				this._timerHandle = setInterval(function(){
					if(self._pause) return;
					runTimes++;
					self.fireEvent('onTimer',{source:self, times:runTimes});
					if(self.times>0 && runTimes>=self.times) self.stop();
				},this.interval);
			}
			this._pause = false;
			this.enabled = true;
		},
		pause: function(){
			this._pause = true;
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "enabled":
				if(this._inited)
					value?this.start():this.stop();
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		}
	});

	justep.Component.register(url, Timer);
	return Timer;
});