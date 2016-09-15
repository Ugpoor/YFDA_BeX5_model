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
	var GridSelect = require('$UI/system/components/justep/gridSelect/gridSelect');

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.mainDataBeforeNew = function(event){
		//grid组件要求新增数据必须有主键
		event.option.defaultValues = [{fID:justep.UUID.createUUID()}];
	};
	
	var dGridSelect;
	Model.prototype.button1Click = function(event){
		var option = {
			xid:'dGridSelect',
			optionCfg:{
				data:'classData',
				value:'fClass',
				columns:[{
					name:'fClass'
				},{
					name:'fType',
					align:'right'
				}]
			},
			'bind-label':"mainData.ref('fString')",
			'bind-ref':"mainData.ref('fClass')",
			multiselect:false,
			onShowOption: function(evt){
				justep.Util.hint('---ShowOption---');
			},
			parentNode: this.comp('controlGroup2').domNode
			};
		if(!dGridSelect){
			dGridSelect = new GridSelect(option);
			//如果没有指定parentNode参数需要调用this.addComponent把组件加入界面
			//this.addComponent(this.comp('controlGroup2').domNode,dGridSelect);
		} 
	};
	
	Model.prototype.button2Click = function(event){
		if(dGridSelect){
		  dGridSelect.free();
		  dGridSelect = null;
		}
	};
	
	return Model;
});
