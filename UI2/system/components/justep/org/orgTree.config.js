/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
/**
 *  properties type: string, number, boolean, array, object
 *  binds: key是DOM上的属性名称, value是收集到component中的名称
 */
define(function(require){
	return {
		properties: {
			title: "string",
			src: "string",
			process: "string",
			activity: "string",
			limit : "number",
			filter : "string",
			rootLabel : "string",
			data : "string",
			labelColumn : "string",
			multiSelection: "boolean",
			includeDisableOrg: "boolean",
			autoLoad : "boolean"
		},
		events:[],
		binds:{}
	};
});