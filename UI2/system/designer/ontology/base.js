var msgCount = 0;
var footer = document.getElementById("footer");
var msgPanel
function print(msg) {
	msgCount++;
	if (!footer) {
		footer = document.getElementById("footer");
		footer.innerHTML = "<textarea id=\"msgEditor\" wrap=\"off\" style=\"width:100%;height:200px\" name=\"textarea1\"> </textarea>";
		msgPanel = document.getElementById("msgEditor");
	}
	msgPanel.value += msg + "\n";
	msgPanel.doScroll("scrollbarPageDown");

}
//字符串函数扩展.
String.prototype.endWith = function(str) {
	if (str == null || str == "" || this.length == 0
			|| str.length > this.length)
		return false;
	if (this.substring(this.length - str.length) == str)
		return true;
	else
		return false;
	return true;
}
String.prototype.trim = function() {       
    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");      
}   
String.prototype.startWith = function(str) {
	if (str == null || str == "" || this.length == 0
			|| str.length > this.length)
		return false;
	if (this.substr(0, str.length) == str)
		return true;
	else
		return false;
	return true;
}

String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
}  

String.prototype.contains = function(substr,isIgnoreCase)
 {
	if (isIgnoreCase) {
		//this = this.toLowerCase();
		substr = substr.toLowerCase();
	}
	var startChar = substr.substring(0, 1);
	var strLen = substr.length;
	for (var j = 0,l=this.length - strLen + 1; j < l; j++) {
		if (this.charAt(j) == startChar)// 如果匹配起始字符,开始查找
		{
			if (this.substring(j, j + strLen) == substr)// 如果从j开始的字符与str匹配，那ok
			{
				return true;
			}
		}
	}
	return false;
}


justep = {};
justep.data = {};
justep.util = {};
justep.coms = {};

justep.apply = function(o, c, defaults) {
	if (defaults) {
		// no "this" reference for friendly out of scope calls
		justep.apply(o, defaults);
	}
	if (o && c && typeof c == 'object') {
		for (var p in c) {
			o[p] = c[p];
		}
	}
	return o;
};

justep.apply(justep, {
	count:0,
	extend : function() {

		var io = function(o) {
			for (var m in o) {
				this[m] = o[m];
			}
		};
		var oc = Object.prototype.constructor;

		return function(sb, sp, overrides) {
			if (typeof sp == 'object') {
				overrides = sp;
				sp = sb;
				sb = overrides.constructor != oc
						? overrides.constructor
						: function() {
							sp.apply(this, arguments);
						};
			}
			var F = function() {
			}, sbp, spp = sp.prototype;
			F.prototype = spp;
			sbp = sb.prototype = new F();
			sbp.constructor = sb;
			sb.superclass = spp;
			if (spp.constructor == oc) {
				spp.constructor = sp;
			}
			sb.override = function(o) {
				justep.override(sb, o);
			};
			sbp.override = io;
			justep.override(sb, overrides);
			return sb;
		};
	}(),

	override : function(origclass, overrides) {
		if (overrides) {
			var p = origclass.prototype;
			for (var method in overrides) {
				p[method] = overrides[method];
			}
		}
	},
	isEmpty : function(v, allowBlank) {
		return v === null || v === undefined
				|| (!allowBlank ? v === '' : false);
	},

	value : function(v, defaultValue, allowBlank) {
		return justep.isEmpty(v, allowBlank) ? defaultValue : v;
	},
	isEmpty:function(v,allowBlank){
		return v===null||v===undefined||(!allowBlank?v==="":false)
	},
	isArray : function(v) {
		return v && typeof v.pop == 'function';
	},
	getCom : function(id) {
		return justep.coms[id];
	},
	genaGUID:function(){
		return "id_"+(new Date()).getTime()+""+(this.count++);
	}
});

var Browser = {
	MO : (typeof(document.implementation) != "undefined"
			&& typeof(document.implementation.createDocument) != "undefined" && typeof(HTMLDocument) != "undefined"),
	IE : window.ActiveXObject ? true : false,
	FF : (navigator.userAgent.toLowerCase().indexOf("firefox") > -1),
	OP : (navigator.userAgent.toLowerCase().indexOf("opera") > -1),
	Event : function(e) {
		if (this.IE)
			return window.event;
		else if (this.FF)
			return e;
	}
}

var EventUtil = new Object;

EventUtil.addListener = function(oTarget, sEventType, handler,owner) {
	var eventHandler = handler;
	if (owner) {
		// 在这里重新定义一个处理函数
		eventHandler = function(e) {
			handler.call(owner, e);
		}
	}
	// firefox情况下
	if (oTarget.addEventListener) {
		oTarget.addEventListener(sEventType, eventHandler, false);
	}
	// IE下
	else if (oTarget.attachEvent) {
		oTarget.attachEvent("on" + sEventType, eventHandler);
	} else {
		oTarget["on" + sEventType] = eventHandler;
	}
};
EventUtil.on = EventUtil.addListener;

EventUtil.removeListener = function (oTarget, sEventType, fnHandler) {
     if (oTarget.removeEventListener) {
         oTarget.removeEventListener(sEventType, fnHandler, false);
     } else if (oTarget.detachEvent) {
         oTarget.detachEvent("on" + sEventType, fnHandler);
     } else {
         oTarget["on" + sEventType] = null;
     }
};

EventUtil.formatEvent = function(oEvent) {
	// isIE和isWin引用到一个js文件，判断浏览器和操作系统类型
	if (Browser.IE) {
		oEvent.charCode = (oEvent.type == "keypress") ? oEvent.keyCode : 0;
		// IE只支持冒泡，不支持捕获
		oEvent.eventPhase = 2;
		oEvent.isChar = (oEvent.charCode > 0);
		oEvent.pageX = oEvent.clientX + document.body.scrollLeft;
		oEvent.pageY = oEvent.clientY + document.body.scrollTop;
		// 阻止事件的默认行为
		oEvent.preventDefault = function() {
			this.returnValue = false;
		};

		// 将toElement,fromElement转化为标准的relatedTarget
		if (oEvent.type == "mouseout") {
			oEvent.relatedTarget = oEvent.toElement;
		} else if (oEvent.type == "mouseover") {
			oEvent.relatedTarget = oEvent.fromElement;
		}
		// 取消冒泡
		oEvent.stopPropagation = function() {
			this.cancelBubble = true;
		};

		oEvent.target = oEvent.srcElement;
		// 添加事件发生时间属性，IE没有
		oEvent.time = (new Date).getTime();
	}
	return oEvent;
};

EventUtil.getEvent = function() {
	return window.event;
	if (window.event) {
		// 格式化IE的事件
		return this.formatEvent(window.event);
	} else {
		return EventUtil.getEvent.caller.arguments[0];
	}
};


justep.util.Observable = function(){
 
    if(this.listeners){
        this.on(this.listeners);
        delete this.listeners;
    }
};
justep.util.Observable.prototype = {
 
    fireEvent : function(){
        if(this.eventsSuspended !== true){
            var ce = this.events[arguments[0].toLowerCase()];
            if(typeof ce == "object"){
                return ce.fire.apply(ce, Array.prototype.slice.call(arguments, 1));
            }
        }
        return true;
    },

    // private
    filterOptRe : /^(?:scope|delay|buffer|single)$/,

    addListener : function(eventName, fn, scope, o){
        if(typeof eventName == "object"){
            o = eventName;
            for(var e in o){
                if(this.filterOptRe.test(e)){
                    continue;
                }
                if(typeof o[e] == "function"){
                    // shared options
                    this.addListener(e, o[e], o.scope,  o);
                }else{
                    // individual options
                    this.addListener(e, o[e].fn, o[e].scope, o[e]);
                }
            }
            return;
        }
        o = (!o || typeof o == "boolean") ? {} : o;
        eventName = eventName.toLowerCase();
        var ce = this.events[eventName] || true;
        if(typeof ce == "boolean"){
            ce = new justep.util.Event(this, eventName);
            this.events[eventName] = ce;
        }
        ce.addListener(fn, scope, o);
    },
 
    removeListener : function(eventName, fn, scope){
        var ce = this.events[eventName.toLowerCase()];
        if(typeof ce == "object"){
            ce.removeListener(fn, scope);
        }
    },
 
    purgeListeners : function(){
        for(var evt in this.events){
            if(typeof this.events[evt] == "object"){
                 this.events[evt].clearListeners();
            }
        }
    },
 
    relayEvents : function(o, events){},
 
    addEvents : function(o){
        if(!this.events){
            this.events = {};
        }
        if(typeof o == 'string'){
            for(var i = 0, a = arguments, v; v = a[i]; i++){
                if(!this.events[a[i]]){
                    this.events[a[i]] = true;
                }
            }
        }else{
           // Ext.applyIf(this.events, o);
        }
    },
 
    hasListener : function(eventName){
        var e = this.events[eventName];
        return typeof e == "object" && e.listeners.length > 0;
    },
 
    suspendEvents : function(){
        this.eventsSuspended = true;
    },
 
    resumeEvents : function(){
        this.eventsSuspended = false;
    },

    // these are considered experimental
    // allows for easier interceptor and sequences, including cancelling and overwriting the return value of the call
    // private
    getMethodEvent : function(method){ },

    // adds an "interceptor" called before the original method
    beforeMethod : function(method, fn, scope){ },

    // adds a "sequence" called after the original method
    afterMethod : function(method, fn, scope){ },

    removeMethodListener : function(method, fn, scope){ }
};
justep.util.Observable.prototype.on = justep.util.Observable.prototype.addListener;
justep.util.Observable.prototype.un = justep.util.Observable.prototype.removeListener;
 
justep.util.Observable.capture = function(o, fn, scope){
    o.fireEvent = o.fireEvent.createInterceptor(fn, scope);
};
 
justep.util.Observable.releaseCapture = function(o){
    o.fireEvent = justep.util.Observable.prototype.fireEvent;
};

(function(){

    var createBuffered = function(h, o, scope){ };

    var createSingle = function(h, e, fn, scope){ };

    var createDelayed = function(h, o, scope){ };

    justep.util.Event = function(obj, name){
        this.name = name;
        this.obj = obj;
        this.listeners = [];
    };

    justep.util.Event.prototype = {
        addListener : function(fn, scope, options){
            scope = scope || this.obj;
            if(!this.isListening(fn, scope)){
                var l = this.createListener(fn, scope, options);
                if(!this.firing){
                    this.listeners.push(l);
                }else{ // if we are currently firing this event, don't disturb the listener loop
                    this.listeners = this.listeners.slice(0);
                    this.listeners.push(l);
                }
            }
        },

        createListener : function(fn, scope, o){
            o = o || {};
            scope = scope || this.obj;
            var l = {fn: fn, scope: scope, options: o};
            var h = fn;
            l.fireFn = h;
            return l;
        },

        findListener : function(fn, scope){
            scope = scope || this.obj;
            var ls = this.listeners;
            for(var i = 0, len = ls.length; i < len; i++){
                var l = ls[i];
                if(l.fn == fn && l.scope == scope){
                    return i;
                }
            }
            return -1;
        },

        isListening : function(fn, scope){
            return this.findListener(fn, scope) != -1;
        },

        removeListener : function(fn, scope){
            var index;
            if((index = this.findListener(fn, scope)) != -1){
                if(!this.firing){
                    this.listeners.splice(index, 1);
                }else{
                    this.listeners = this.listeners.slice(0);
                    this.listeners.splice(index, 1);
                }
                return true;
            }
            return false;
        },

        clearListeners : function(){
            this.listeners = [];
        },

        fire : function(){
            var ls = this.listeners, scope, len = ls.length;
            if(len > 0){
                this.firing = true;
                var args = Array.prototype.slice.call(arguments, 0);
                for(var i = 0; i < len; i++){
                    var l = ls[i];
                    if(l.fireFn.apply(l.scope||this.obj||window, arguments) === false){
                        this.firing = false;
                        return false;
                    }
                }
                this.firing = false;
            }
            return true;
        }
    };
})();