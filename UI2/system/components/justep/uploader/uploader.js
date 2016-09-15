/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define([(function(){
	//TODO 增加本地能力
	if(navigator.userAgent.indexOf('JustepApp') != -1 && false){
		return "./uploader-ios";
	}else if(typeof FormData === "function" || typeof FormData === "object"){
		return "./uploader-html5";
	}else{
		return "./uploader-html4";
	}
})(), "require", "res!./uploader-ios.js", "res!./uploader-html5.js","res!./uploader-html4.js"],function(Uploader, require){
	require("res!./uploader-ios.js");
	require("res!./uploader-html5.js");
	require("res!./uploader-html4.js");
	return Uploader;
});