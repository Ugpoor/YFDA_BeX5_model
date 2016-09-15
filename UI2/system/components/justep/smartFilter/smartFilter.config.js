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
			filterData: "string",
			filterCols: "string",
			caseSensitive: "boolean",
			autoRefresh: "boolean",
			autoRefreshMode: "string"
		},
		events: ["onFilter"],
		binds: {}
	};
});