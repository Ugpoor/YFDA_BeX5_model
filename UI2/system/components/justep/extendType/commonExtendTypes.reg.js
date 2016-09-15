/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
/**
 *  注册扩展类型
 *  name 扩展类型名称
 *  dataType 扩展类型支持的数据类型,默认全部类型
 *  editor 扩展类型编辑器组件的url
 *  class 扩展类型类
 */
define(function(require){
	//注册数组格式请保持，组件的java会进行分析
	var ret = [
	        {
	        	"name" : "sys.boolean",
	        	"dataType" : "",
	        	"editor" : "$UI/system/components/justep/button/checkbox"
	        },
	        {
	        	"name" : "sys.email",
	        	"dataType" : "String,Text",
	        	"editor" : ""
	        },
	        {
	        	"name" : "sys.datetime",
	        	"dataType" : "Date,Time,DateTime",
	        	"editor" : "$UI/system/components/justep/input/input"
	        }
	];
	
	var classes = {
			"sys.boolean": require("./js/extendTypeBoolean"),
			"sys.email": require("./js/extendTypeEmail"),
			"sys.datetime": require("./js/extendTypeDateTime")
	};
	
	for(var i=0,len=ret.length; i<len; i++){
		ret[i]["class"] = classes[ret[i].name];
	}
	return ret;
});