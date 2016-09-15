/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require){
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	return {
		GROUP_ROOT_ID: "_group_",
		GROUP_ORGKIND: "group",
		GROUP_QUERY_ACTION: "queryOrgCommonGroupAction",

		loadGroupRoot: function(columns, filter, context) {
			var translateParam = new biz.Request.TranslateParam();
			translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_TREE;
			translateParam.rowOption.sequence = columns;
			translateParam.setTreeOption('tree-parent-relation', "sParent");
			
			var params = new biz.Request.ActionParam();
			params.setString("filter", filter);
			params.setInteger("offset", 0);
			params.setInteger("limit", -1);
			var r = biz.Request.sendBizRequest({
				context: context,
				contentType: "json",
				dataType: "json",
				directExecute: true,
				action: this.GROUP_QUERY_ACTION, 
				parameters: params,
				translateParam: translateParam
			});
			return biz.Request.getData(r);
		},

		isGroupOrgID: function(id) {
			
			return id && (id.indexOf("/" + this.GROUP_ROOT_ID + "/") == 0);
		},

		getOrgIDOfGroupOrgID: function(id) {
			if (this.isGroupOrgID(id)) {
				return id.substring(id.lastIndexOf("/") + 1, id.length);
			}
			return id;
		},

		getGroupIDOfGroupOrgID: function(id) {
			if (this.isGroupOrgID(id)) {
				var groupID = id.substring(("/" + this.GROUP_ROOT_ID + "/").length, id.length);
				groupID = groupID.substring(0, groupID.indexOf("/"));
				return groupID;
			}
			return null;
		}
	};
});