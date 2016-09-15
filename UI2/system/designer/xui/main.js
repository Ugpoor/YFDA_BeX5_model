function getRequestParameter(paramName) {
	var url = decodeURI(window.location.href);
	var idx = url.indexOf("?");
	var params = url.substring(idx + 1);
	if (params) {
		params = params.split("&");
		for ( var i = 0; i < params.length; i += 1) {
			var param = params[i].split("=");
			if (param[0] == paramName) {
				var targetValue = param[1];
				var idx2 = targetValue.indexOf("#");
				if (idx2 != -1) {
					targetValue = targetValue.substring(0, idx2);
				}
				return decodeURIComponent(targetValue);;
			}
		}
	}
}

var __DEBUG = false;   
window.__justep = {};
var href = window.location.href;
//var __version = "$abc" ;
//var idx1 = href.indexOf("/$v");
//if(idx1>0){
//	var idx2 = href.indexOf("/",idx1+2);
//	__version = href.substring(idx1+1,idx2);
//}

var uiPath = getRequestParameter("uiPath");
var device = getRequestParameter("device");
if(!device || device == 'pc'){
	device = "v_l_s_desktopd_pc";
}else{
	device = "v_l_s_d_m";
}
var contextPathName = getRequestParameter("contextPathName");
var hasMin = getRequestParameter("hasMin");
 
var _$UI = uiPath.substring(uiPath.lastIndexOf("/") + 1);
var _$model = uiPath.substring(0, uiPath.lastIndexOf("/"));
var _systemPath = '/' + contextPathName +'/' + _$UI + '/system';
var paths = { 
		'$model' : "/" + contextPathName ,// _$model,
		'bind' : '../../lib/bind/bind',
		'modernizr': '../../lib/base/modernizr-2.8.3.min',
		'xuiService' : '../../components/designerCommon/js/xuiService',
		'jquery' : '../../lib/jquery/jquery-1.11.1',
		'jqueryEx' : './jqueryEx',
		'designer' : hasMin=="true"?'./designer.min':'designer'
	};
paths["$model/"+_$UI] = "/" + contextPathName+ '/'+_$UI+'/'+device;

requirejs.config({
	baseUrl : '/' + contextPathName +'/' + _$UI + '/system/designer/xui',
	paths : paths,
	shim : {
        'modernizr': {
            exports: 'Modernizr'
           }
	},
	map : {
		  '*' : {
		   cordova : _systemPath + '/lib/require/cordova.js',
		   res : _systemPath + '/lib/require/res.js',
		   w : _systemPath + '/lib/require/w.js',
		   css : _systemPath + '/lib/require/css.js'
		  }
	},
	deps: ['modernizr'],
	waitSeconds : 30
});

var initData;
function executeMethod(params) {
	if (params) {
		var oParams = typeof params == 'string' ? eval("(" + params + ")") : params;
		var methodName = oParams.methodName;
		if (methodName == 'initData') {
			initData = oParams;
		}
		if (window.designer) {
			initData = null;
			return window.designer.executeMethod(methodName, oParams);
		}
	}
}

function executeCompMethod(params) {
	var oParams = typeof params == 'string' ? eval("(" + params + ")") : params;
	var dId = params["d_id"];
	var target = $("*[d_id='" + dId + "']:first")[0];
	if (!target) {
		return;
	}
 
	var com = window.designer.getComponent(target);
	if (!com) {
		com = window.designer.getOwnerComponent(target);
	}
	params.target = target;
	var methodName = oParams.methodName;
	if (window.designer[methodName]) {
		window.designer[methodName](params);
	}

	if (com && com[methodName]) {
		com[methodName](params);
	}

	delete params.target;
	var str = JSON.stringify(params);
	return str;
}

function regComponents(componentMap) {
	for ( var p in componentMap) {
		var cfg = window.componentConfig[p];
		if (cfg) {
			cfg["js-class"] = componentMap[p];
		}
	}
}
var __requireHistoryList = [];//已经加载的组件列表

/**获取依赖*/
function __getDepends(_compList){ 
	var depends = {jsDependList:[],cssDependList:[]};
	if(__DEBUG){
		return depends;
	}
	for(var i = 0;i<_compList.length;i+=1){
		for(var p in _dependMap){
			var compList = _dependMap[p].compList;
			if($.inArray(_compList[i],compList) !=-1){
				//先从间接依赖的合并文件找
				var allDepends = _dependMap[p].depends;
				for(var j = 0;j<allDepends.length;j+=1){
					var item = allDepends[j];
					if(item.indexOf("css!") == -1){//js依赖
						if($.inArray(item,depends.jsDependList) ==-1){
							depends.jsDependList.push(item);
						}
					}else{//css依赖
						if($.inArray(item,depends.cssDependList) ==-1){
							depends.cssDependList.push(item);
						}
					}
				}
				
				if(p.indexOf("css!") == -1){//js依赖
					if($.inArray(p,depends.jsDependList) ==-1){
						depends.jsDependList.push(p);
					}
				}else{//css依赖
					if($.inArray(p,depends.cssDependList) ==-1){
						depends.cssDependList.push(p);
					}
				}
			}
		}
	}
	return depends;
}

/**
 * 加载依赖的css文件
 * @param cssDependList
 */
function __loadDependCss(cssDependList){
	require(cssDependList,function(){
		for(var i = 0;i<arguments.length;i+=1){
			arguments[i].load();
		}
		//设置包含的css文件
		var $links = $("html>head>link");
		var idx = cssDependList.length-1;
		for(var i = $links.length-1;i>=0 && idx>=0;i-=1){
			var cssList = _dependMap[cssDependList[idx]].cssList;
			$links.eq(i).attr("include",cssList.join(","));
			idx-=1;
		}
	});
}


function __loadDepends(compList,callback){
	var newCompList = [];
	if(__requireHistoryList.length>0){
		//判断组件是否已经加载，已经加载过的不再加载
		for(var i = 0;i<compList.length;i+=1){
			if($.inArray(compList[i],__requireHistoryList) ==-1){
				newCompList.push(compList[i]);
			}else{
				__requireHistoryList.push(compList[i]);
			}
		}
		if(newCompList.length == 0){
			callback();
			return;
		}
	}else{
		//第一次加载
		__requireHistoryList = compList;
		newCompList = compList;
	}
	var depends = __getDepends(newCompList); 
	__loadDependCss(depends.cssDependList);
	
	//加载css
	require(depends.cssDependList,function(){
		for(var i = 0;i<arguments.length;i+=1){
			arguments[i].load();
		}
	});
	
	//加载依赖的min文件
	require(depends.jsDependList,callback);
}

/**
 * 初始化.
 * @param initData
 */
function __init(initData) {
 
	window.componentConfig = initData.componentConfig;
	window._compToMinJsFileMap = initData.compToMinJsFileMap;
	window._compToMinCssFileMap = initData.compToMinCssFileMap;
	window._dependMap = initData.dependMap;//组件到min文件 依赖关系
 
	initData = typeof initData == 'string' ? eval("(" + initData + ")") : initData;
 
	var requireList = __requireHistoryList = initData.requireList;
	var depends = initData.depends;
	
	var jsDependList = !__DEBUG?depends.jsDependList:[];
	var cssDependList = !__DEBUG?depends.cssDependList:[];
	__loadDependCss(cssDependList);
//	if(depends.jsDependList.length>0){
		//加载依赖的js文件
		require(jsDependList,function(){
			requireList.push("designer");
			require(requireList, function() {
				for ( var i = 0; i < arguments.length - 1; i += 1) {
					regComponents(arguments[i]);
				}
				window.designer = arguments[arguments.length - 1];
				if (initData) {
					window.designer.initData(initData);
				}
				document.onkeydown = function() {
					if (event.keyCode == 116) {
						event.keyCode = 0;
						event.cancelBubble = true;
						return false;
					}
				};
				document.oncontextmenu = function() {
					return false;
				};
			});
		
		});
//	}
}
 
if(!__DEBUG){
	require(["$model/"+_$UI+"/system/core.min"], function() {
		require(["$model/"+_$UI+"/system/common.min"], function() {
			require(["$model/"+_$UI+"/system/components/designerCommon/js/webSocketMng"],function(websocket){
				websocket.callJava({
					filePath : websocket.getRequestParameter("filePath"),
					methodName : 'getInitData',
					callback : "__init"
				});
				var timer1 = setInterval(function() {// 第一次打开studio时websocket初始化不成功时会重新初始化
					if (!websocket.isOpened()) {
						websocket.clean();
						websocket.callJava({
							filePath : websocket.getRequestParameter("filePath"),
							methodName : 'getInitData',
							callback : "__init"
						});
					} else {
						clearInterval(timer1);
					}
				}, 3000);
			});
		});
	});
}else{
	require(["$model/"+_$UI+"/system/components/designerCommon/js/webSocketMng"],function(websocket){
		websocket.callJava({
			filePath : websocket.getRequestParameter("filePath"),
			methodName : 'getInitData',
			callback : "__init"
		});
		var timer1 = setInterval(function() {// 第一次打开studio时websocket初始化不成功时会重新初始化
			if (!websocket.isOpened()) {
				websocket.clean();
				websocket.callJava({
					filePath : websocket.getRequestParameter("filePath"),
					methodName : 'getInitData',
					callback : "__init"
				});
			} else {
				clearInterval(timer1);
			}
		}, 3000);
	});
}