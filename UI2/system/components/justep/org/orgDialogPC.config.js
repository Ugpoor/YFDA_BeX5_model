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
			title : "string",
			showTitle: "boolean",
			manageCodes: "string",
			limit: "integer",
			includeDisabled: "boolean",
			showCommonGroup: "boolean",
			cascade: "boolean",
			useVirtualRoot: "boolean",
			virtualRootLabel: "string",
			rootFilter: "string",
			filter: "string",
			selectFilter: "string",
			multiSelection: "boolean",
			includeOrgKind: "string",
			process: "string",
			activity: "string",
			status: "string",
			width: "string",
			height: "string",
			top: "string",
			left: "string",
			cacheKind: "string"
		},
		events:["onLoad", "onOpen", "onClose", "onReceive"],
		binds:{}
	};
});