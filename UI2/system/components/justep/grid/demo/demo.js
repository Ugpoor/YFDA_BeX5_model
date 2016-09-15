/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	/*
	var $ = require("jquery");
	 */
	var justep = require('$UI/system/lib/justep');

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.mainDataBeforeNew = function(event){
		//grid组件要求新增数据必须有主键
		event.option.defaultValues = [{fID:justep.UUID.createUUID()}];
	};
	
	return Model;
});
