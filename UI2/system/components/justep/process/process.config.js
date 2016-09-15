/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
/**
 *  properties type: string, number, boolean, array, object
 *  binds: key是DOM上的属性名称, value是收集到component中的名称
 */
define(function(require) {
	return {
		properties : {
			data : "string",
			autoClose : "boolean",
			autoStart : "boolean",
			autoFilter : "boolean",
			autoSave : "boolean",
			dialog: "string",
			dialogWidth: "string",
			dialogHeight: "string",
		},
		events : [ "onBeforeStart", "onAfterStart", "onStartCommit", "onStartError", "onBeforeAdvance", "onAfterAdvance", "onAdvanceCommit", "onAdvanceError", "onBeforeAdvanceQuery",
				"onAfterAdvanceQuery", "onAdvanceQueryError", "onBeforeOpenDialog", "onBeforeBack", "onAfterBack", "onBackCommit", "onBackError", "onBeforeBackQuery", "onAfterBackQuery",
				"onBackQueryError", "onBeforeAbort", "onAfterAbort", "onAbortCommit", "onAbortError", "onBeforeAbortQuery", "onAfterAbortQuery", "onAbortQueryError", "onBeforeSuspend",
				"onAfterSuspend", "onSuspendCommit", "onSuspendError", "onBeforeSuspendQuery", "onAfterSuspendQuery", "onSuspendQueryError", "onBeforeTransfer", "onAfterTransfer", "onTransferCommit",
				"onTransferError", "onBeforeTransferQuery", "onAfterTransferQuery", "onTransferQueryError", "onBeforeStartCustomizedQuery", "onAfterStartCustomizedQuery",
				"onStartCustomizedQueryError", "onBeforeSpecial", "onAfterSpecial", "onSpecialCommit", "onSpecialError", "onBeforeSpecialQuery", "onAfterSpecialQuery", "onSpecialQueryError", 
				"onCloseDialog"],
		binds : {}
	};
});
