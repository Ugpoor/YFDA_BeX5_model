/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var RTGrid = require("../grid");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	var XML = require("$UI/system/lib/base/xml");
	
	var COMP_EDITOR_FLAG = 'comp_';
	var COMP_EDITOR = 'component';
	var EDITOR_INPUT = {type:'input',name:'input'};
	var EDITOR_CHECKBOX = {type:'checkbox',name:'checkbox'};
	var EDITOR_TEXTAREA = {type:'textarea',name:'textarea'};
	var EDITOR_INPUT_COMP = {type:COMP_EDITOR_FLAG+'input',name:'Input(组件模式)'};
	var EDITOR_CHECKBOX_COMP = {type:COMP_EDITOR_FLAG+'checkbox',name:'Checkbox(组件模式)'};
	var EDITOR_DIRECT_CHECKBOX_COMP = {type:COMP_EDITOR_FLAG+'direct_checkbox',name:'直接显示Checkbox(组件模式)'};
	var EDITOR_TEXTAREA_COMP = {type:COMP_EDITOR_FLAG+'textarea',name:'Textarea(组件模式)'};
	var EDITOR_SELECT_COMP = {type:COMP_EDITOR_FLAG+'select',name:'Select(组件模式)'};
	var EDITOR_INPUT_BTN_COMP = {type:COMP_EDITOR_FLAG+'inputbtn',name:'InputButton(组件模式)'};
	var EDITOR_GRIDSELECT_COMP = {type:COMP_EDITOR_FLAG+'selectgrid',name:'SelectGrid(组件模式)'};
	var ALL_EDITORS = [   EDITOR_INPUT,
				          EDITOR_CHECKBOX,
				          EDITOR_TEXTAREA,
				          EDITOR_INPUT_COMP,
				          EDITOR_CHECKBOX_COMP,							
				          EDITOR_DIRECT_CHECKBOX_COMP,							
				          EDITOR_TEXTAREA_COMP,							
				          EDITOR_SELECT_COMP,							
				          EDITOR_INPUT_BTN_COMP,							
				          EDITOR_GRIDSELECT_COMP];
	var COMP_EDITORS = [  EDITOR_INPUT_COMP,
				          EDITOR_CHECKBOX_COMP,							
				          EDITOR_DIRECT_CHECKBOX_COMP,							
				          EDITOR_TEXTAREA_COMP,							
				          EDITOR_SELECT_COMP,							
				          EDITOR_INPUT_BTN_COMP,							
				          EDITOR_GRIDSELECT_COMP];
	
	//为了设计时提前引入css
	require("../js/grid.css");
	require("css!./css/grid").load();
	
	var _getEditorTemplate = function(name,type){
		var ret;
		if(type===EDITOR_INPUT_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:false},xml:'<input component="$UI/system/components/justep/input/input" {0} class="form-control x-edit-focusin"/>'};
		}else if(type===EDITOR_CHECKBOX_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:true},xml:'<span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" {0}></span>'};
		}else if(type===EDITOR_DIRECT_CHECKBOX_COMP.type){
			ret = {attr:{multiRowEditor:true,disableEditorDisplay:false},xml:'<span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" {0}></span>'};
		}else if(type===EDITOR_SELECT_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:false},xml:'<select component="$UI/system/components/justep/select/select" {0} bind-optionsCaption="请选择" class="form-control x-edit-focusin"/>'};
		}else if(type===EDITOR_TEXTAREA_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:false},xml:'<textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit-focusin" {0}/>'};
		}else if(type===EDITOR_INPUT_BTN_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:false},xml:'<div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"><input type="text" class="form-control x-edit-focusin" component="$UI/system/components/justep/input/input" {0}/><div class="input-group-btn"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="..."><i></i><span></span></a></div></div>'};
		}else if(type===EDITOR_GRIDSELECT_COMP.type){
			ret = {attr:{multiRowEditor:false,disableEditorDisplay:false},xml:'<div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" {0}><option></option></div>'};
		}
		if(ret && ret.xml){
			ret.xml = justep.String.format(ret.xml,_getEditorBindRef(name));
		}
		return ret;
	};

	var _getEditorType = function($col){
		var multiRowEditor = ('true'==$col.attr('multiRowEditor')); 
		var $editor = $col.children('editor').children(':first');
		var comp = $editor.attr('component');
		if(comp==='$UI/system/components/justep/input/input') return EDITOR_INPUT_COMP.type;
		else if(comp==='$UI/system/components/justep/button/checkbox' && multiRowEditor) return EDITOR_DIRECT_CHECKBOX_COMP.type;
		else if(comp==='$UI/system/components/justep/button/checkbox' && !multiRowEditor) return EDITOR_CHECKBOX_COMP.type;
		else if(comp==='$UI/system/components/justep/select/select') return EDITOR_SELECT_COMP.type;
		else if(comp==='$UI/system/components/justep/textarea/textarea') return EDITOR_TEXTAREA_COMP.type;
		else if(comp==='$UI/system/components/justep/gridSelect/gridSelect') return EDITOR_GRIDSELECT_COMP.type;
		else if(comp==='$UI/system/components/bootstrap/inputGroup/inputGroup') return EDITOR_INPUT_BTN_COMP.type;
	};
	
	var _RTGrid = RTGrid.extend({
		_processFooter:function(){
			//设计时不处理
		},
		getDataByExpr:function(data){
			return this.getModel().comp(data);
		}
	});
	
	var Grid = RTGrid.extend({
		constructor : function(config) {
			this.callParent(config);
		},
		init : function(value, bindingContext) {
			var $domNode = $(this.domNode);
			this.data = $domNode.attr('data');
			$domNode.html('请设置Grid的data属性然后增加Grid列').attr('d_resizable',false);
			var self = this;
			if('100%'==$domNode.attr('height'))
					$domNode.height('100%');	
			window.setTimeout(function(){
				self.repaintGrid();
			},100);
			$domNode.on("childUndoRedo",function(){//撤销重做时重画
				if(self.repaintTimer){
					clearTimeout(self.repaintTimer);
				}
				self.repaintTimer = setTimeout(function(){
					self.repaintTimer = null;
					self.repaintGrid();
				},150);
			}).on('childChanged','th',function(event){
				self.repaintGrid();
			});
	 
		},
		set: function(value){
			this.callParent(value);
			if ('height' in value) {
				this.$domNode.height(value['height']);
			}
			this.repaintGrid();
		},
		editGroup: function(config){
			var self = this;
			//打开编辑器
			xuiService.openPage("$UI/system/components/justep/grid/designer/editGroup.w", {
				title : "分组设置",
				height: 680,
				xml : config.nodeXml
			}, function(result) {
				var propOK = $.Deferred(),viewOK = $.Deferred(),OK = [];
				//设置分组相关属性
				xuiDoc.set(self,{useGroupbar:result.useGroupbar,grouping:result.grouping},function(){
					propOK.resolve();
				});
				//替换分组设置
				var groupFields = result.groupFields;
				var groupFieldXML = "", groupOrderXML = "", groupTextXML = "", groupSummaryXML = "", groupColumnShowXML = "";
				for(var i=0;i<groupFields.length;i++){
					groupFieldXML += ("<item>"+groupFields[i].field+"</item>");
					groupOrderXML += ("<item>"+groupFields[i].order+"</item>");
					groupTextXML += ("<item>"+groupFields[i].text+"</item>");
					groupSummaryXML += ("<item>"+groupFields[i].summary+"</item>");
					groupColumnShowXML += ("<item>"+groupFields[i].groupColumnShow+"</item>");
				}
				var groupingViewXML = "<groupingView "+(result.nullText?("nullText='"+result.nullText+"'"):"")+" groupCollapse='"+result.groupCollapse+"'>"
					+(groupFieldXML?('<groupField>'+groupFieldXML+'</groupField>'):'')
					//+(groupOrderXML?('<groupOrder>'+groupOrderXML+'</groupOrder>'):'')
					//+(groupTextXML?('<groupText>'+groupTextXML+'</groupText>'):'')
					//+(groupSummaryXML?('<groupSummary>'+groupSummaryXML+'</groupSummary>'):'')
					//+(groupColumnShowXML?('<groupColumnShow>'+groupColumnShowXML+'</groupColumnShow>'):'')
					+"</groupingView>";
				xuiDoc.replaceChild(self, groupingViewXML, {
					xpathCondition : "*[local-name()='groupingView']",
					paintComponent : false
				},function(){
					viewOK.resolve();
				});
				//设置列定义
				var headers = self.__grid.domNode.grid.headers;
				$.each(groupFields,function(i,item){
					var idx = self.getColIndex(item.field);
					if(idx>-1){
						var colComp = self.getModel().comp(headers[idx].el);
						var colOK = $.Deferred();
						OK.push(colOK);
						xuiDoc.set(colComp,{summaryType:item.summaryType,summaryTpl:item.summaryTpl},function(){
							colOK.resolve();
						});
					}
				});
				OK.push(propOK);
				OK.push(viewOK);
				$.when.apply($,OK).done(function(){
					self.repaintGrid();
				});
			});
		},
		editGroupHeaders: function(config){
			var self = this;
			//打开编辑器
			xuiService.openPage("$UI/system/components/justep/grid/designer/editGroupHeaders.w", {
				title : "多列头设置",
				height: 680,
				xml : config.nodeXml
			}, function(result) {
				var viewOK = $.Deferred();
				//替换分组设置
				var groupHeadersXML = result.groupHeaders;
				xuiDoc.replaceChild(self, groupHeadersXML, {
					xpathCondition : "*[local-name()='groupHeaders']",
					paintComponent : false
				},function(){
					viewOK.resolve();
				});
				$.when(viewOK).done(function(){
					self.repaintGrid();
				});
			});
		},
		//列移动；
		moveColumn:function(config){
			var self = this;
			xuiService.openPage("$UI/system/components/justep/grid/designer/moveColumn.w", {
				title : "调整列顺序",  
				height: 680,
				xml : config.nodeXml
			}, function(result) {
				xuiDoc.replaceChild(self, result.def.join(""), {
					paintComponent : false
				},function(){
					//刷新grid；
					self.repaintGrid();
				});
			});
		},
		getDataCols: function(){
			
		},
		appendColumn: function(config) {
			var self = this;
			//获取data的did
			var dataID = this.get('data');
			var data = this.getModel().comp(dataID);
			if(!data){
				alert('请先设置Grid的data属性');
				return;
			}
			var data_did = data.$domNode.attr('d_id');
			// 获取data列信息
			var cols = xuiDoc.getEditorDataSource("RuleRelationDatasource.getDatasource",null,data_did);
			//打开编辑器
			xuiService.openPage("$UI/system/components/justep/grid/designer/appendColumn.w", {
				xml : config.nodeXml,
				cols : cols,
				editors: ALL_EDITORS
			}, function(result) {
				var cols = result.cols;
				if($.isArray(cols)){
					var configs = [];
					for(var i=0;i<cols.length;i++){
						var colName = cols[i].name;
						var editorType = cols[i].editor;
						var editor = _getEditorTemplate(colName, editorType);
						var editorXML = '',attrXML = '';
						
						if(editor){
							if(editor.attr){
								for(var n in  editor.attr){
									var v = editor.attr[n];
									attrXML += (' '+n+'="'+v+'"'); 
								}
							}
							editorXML = '<editor>'+editor.xml+'</editor>';
						}
						if(editorType){
							//有编辑器打开editable
							if(0===editorType.indexOf(COMP_EDITOR_FLAG)) editorType=COMP_EDITOR;
							attrXML += (' editable="true"'); 
							attrXML += (' editor="'+editorType+'"'); 
						}

						configs.push({
							componentName : "$UI/system/components/justep/grid/grid#column",
							parentElementId : self.columns_dId,
							templateContent : '<column width="100" name="'+colName+'" '+attrXML+' >'+editorXML+'</column>'
						});
					}
					//批量创建列
					xuiDoc.batchCreateComponent(configs, function() {
						self.repaintGrid();
					});
				}
				
			});
		},
		repaintGrid : function(){
			if(this.isRepainting){
				return;
			}
			var dataID = this.get('data');
			var data = this.getModel().comp(dataID);
			if(!data){
				this.$domNode.html('请设置Grid的data属性然后增加Grid列');
				return;
			}
			this.isRepainting = true;
			var xuiNode = xuiDoc.getNodeByDId(this.$domNode.attr('d_id'));
			var self = this;
			//var url = "http://127.0.0.1:8080/x5/UI2/system/components/justep/grid/server/transCfg.j";
			var url = require.toUrl("$UI/system/components/justep/grid/server/transCfg.j");
			
			$.ajax({
			    async : false,
			    dataType:'json',
			    data: {"grid": xuiNode},
			    type : 'POST',
			    url : url, 
			    success : function(cfg) { 
			    	self.createGrid(cfg,xuiNode); 
			    	self.isRepainting = false;
			    	self.ownerDesigner.setSelection(self.$domNode[0]);
			    },
			    error : function(xhr,status,err) {
			       alert("转换Grid的定义失败："+[status,xhr.readyState,err]);
			       self.isRepainting = false;
			    }
			});			
		},
		getColIndex: function(name){
			var ret = -1;
			if(this.__grid){
				var gcols = this.__grid.getGridParam('colModel');
				for(var i=0; i<gcols.length; i++){
					if(name==gcols[i].name) return i;
				}
			}
			return ret;
		},
		createEditors: function(){ 
			var $row=this.__grid.$domNode.find('tr.jqgfirstrow');
			var $tds = $row.children('td');
			var tdCount = $tds.size();
			var trHtml = "<tr class='x-grid-widget-content jqgrow x-row-ltr x-grid-designer-editors'>";
			for(var i=0; i<tdCount; i++){
				trHtml += "<td d_canAddChild='true' class='x-grid-editing'/>";
			}
			trHtml += "</tr>";
			$row.after(trHtml);
		},
		createGrid: function(cfg,xuiNode){
			this.cfg = cfg;
			if(!this.cfg.colModel||this.cfg.colModel.length<1) this.cfg.colModel = [{
				"label": '请添加列',
				"name" : 'temp'
			}];
			//记录原选中组件did
			var dIds = this.ownerDesigner.getSelectionIds();
			
			if(this.__grid) this.__grid.dispose();
			this.$domNode.empty();
			cfg.parentNode = this.domNode;
			//创建展现的grid
			this.__grid = new _RTGrid(cfg);
			//创建列编辑器容器
			this.createEditors();
			//分许定义的结构绑定did
			var cols = cfg.colModel;
			var headers = this.__grid.domNode.grid.headers;
			var $editorTR = this.__grid.$domNode.find('tr.x-grid-designer-editors');
			var $editorTDs = $editorTR.children('td');
			for(var i=0; i<cols.length; i++){
				var idx = this.getColIndex(cols[i].name);
				if(idx>-1){
					$($editorTDs[idx]).attr('col',cols[i].name)[cols[i].hidden?'hide':'show']();
					//设置设计时的相关属性
					$(headers[idx].el).attr({"d_id":cols[i]["d_id"],"d_selectable":cols[i]["d_selectable"],"componentName":cols[i]["componentName"]})
									.prop("colDef",cols[i]);
				}
			}
			//去除列头绑定事件
			$.each(headers,function(i){
				$(headers[i].el).off("click").off("mousedown");
			});
			//设置grid外层宽度
			//this.$domNode.width(this.__grid.getGridParam('width'));
			//bing列头的did
			var $tr = $(xuiNode).find('columns');
			this.columns_dId = $tr.attr("d_id");
			this.$domNode.find('tr.x-grid-labels').attr({"d_id":$tr.attr("d_id"),"d_selectable":false,"componentName":$tr.attr("componentName")});
			//bind列编辑器
			$tr.find('column').each(function(){
				var $col = $(this);
				var $colEditor = $col.children('editor');
				if($colEditor.size()>0){
					$editorTR.children('td[col='+$col.attr('name')+']')
						.attr({"d_id":$colEditor.attr("d_id"),"d_selectable":$colEditor.attr("d_selectable"),"componentName":$colEditor.attr("componentName")})
						.append($colEditor.children().addClass('customelement editable'));
				}
			});
			var self = this;
			//挂接创建编辑器
			this.__grid.$domNode.on("beforeAddChild","tr.x-grid-designer-editors td",function(event){
				var $td = $(this);
				var $colDef = $tr.find('column[name='+$td.attr('col')+']');
			    var templateText = xuiDoc.getTemplate(event.componentName);
			    var pId = $td.attr("d_id");
			    var paintComponent = true;
			    if(!$td.attr("componentname")){
			    	pId = $colDef.attr('d_id');
			    	paintComponent = false;
			    	event.componentName = "editor";
			    	templateText  = "<editor>"+templateText +"</editor>";			    	
			    }
			    xuiDoc.createComponent(event.componentName,pId,{paintComponent:paintComponent,templateContent:templateText},function(node){
			    	if(paintComponent){
			    		$("*[d_id='"+$(node).attr("d_id")+"']").addClass("customelement editable");
			    		return;
			    	}
			    	var $colEditor = $(node);
			    	$td.attr({"d_id":$colEditor.attr("d_id"),"d_selectable":$colEditor.attr("d_selectable"),"componentName":$colEditor.attr("componentName")})
					.append($colEditor.children().addClass('customelement editable'));
			    	self.ownerDesigner.endCreateComponent();  
			    	self.ownerDesigner.setSelection($td.firstChild()[0]);
			    });
			    event.preventDefault();
			});
			//去除相关事件
			this.__grid.$domNode.off('click');
			//去除分组按钮操作绑定
			$(this.__grid.domNode.grid.gDiv).find('.x-grid-grp-item-del').on("click",function(){return false;});
			//绑定列组件
			this.ownerDesigner.paintChildComponent(this.domNode);
			
			//选中原选中组件
			dIds = eval(dIds);
			if(dIds && dIds.length>0)
				this.ownerDesigner.setSelectionByIds({ids:dIds});
		}
	});
	
	var _getEditorBindRef = function(name){
		return name?'bind-ref="ref(\''+name+'\')"':'';
	};

	var Column = justep.ViewComponent.extend({
		constructor : function(config) {
			this.callParent(config);
		},
		init : function(value, bindingContext) {

		},
		getGrid: function(){
			var gel = this.$domNode.closest("div[componentName='$UI/system/components/justep/grid/grid']")[0];
			return this.getModel().comp(gel);
		},
		setEditor: function(){
			var self = this;
			var xuiNodeStr = xuiDoc.getNodeByDId(this.$domNode.attr('d_id'));
			var $col = $(XML.fromString(xuiNodeStr).documentElement);
			var edittype = _getEditorType($col);
			var col = $col.attr('name');
			
			//打开编辑器
			xuiService.openPage("$UI/system/components/justep/grid/designer/editorSelector.w", {
				title : "设置列编辑器",
				height: 580,
				width: 500,
				data : {
					editors: COMP_EDITORS,
					editType: edittype
				}
			}, function(result) {
				self.updateEditor(col, result.type);
			});
		},
		updateEditor: function(name, type){
			if(!type) return;
			var param = _getEditorTemplate(name, type);
			
			var self = this;
			//设置列属性
			var attrOK = $.Deferred();
			if(param.attr)
				xuiDoc.set(self,param.attr,function(){
					attrOK.resolve();
				});
			else attrOK.resolve();
			//设置列编辑器
			var viewOK = $.Deferred();
			xuiDoc.replaceChild(self, '<editor>'+param.xml+'</editor>', {
				xpathCondition : "*[local-name()='editor']",
				paintComponent : false
			},function(){
				viewOK.resolve();
			});
			$.when(viewOK,attrOK).done(function(){
				self.repaintGrid();
			});
		},
		onRemove : function(event){ 
			//删除列的同时把对应的编辑器也删除
			var grid = this.getGrid();
			var targetIdx = this.$domNode.index();
			var $editorTR = grid.$domNode.find('tr.x-grid-designer-editors');
			
			$("tr",$editorTR.parent()).each(function(){
				$("td:last",this).hide();
				$("td:eq("+targetIdx+")",this).remove();
			});
		},
		
		repaintGrid: function(){
			var grid = this.getGrid();
			xuiService.getXuiDoc().repaintComponent(grid);
		},
		
		eEditor : function(){
			var xuiNodeStr = xuiDoc.getNodeByDId(this.$domNode.attr('d_id'));
			var $col = $(XML.fromString(xuiNodeStr).documentElement);
			var did = $col.children('editor').attr('d_id');
			if(did){
				xuiDoc.deleteComponent([did]);
				this.repaintGrid();
			}
		},
		
		set: function(value){
			var grid = this.getGrid();
			if(grid){
				if(value && value.hasOwnProperty("width")){
					var w = value['width'];
					var colDef = this.$domNode.prop("colDef");
					grid.__grid.setColWidth(colDef['name'],w);
				}else if(value && value.hasOwnProperty("editor")){
					var v = value.editor;
					//设置编辑器后自动打开editable
					xuiDoc.set(this,{editable:!!v});
					if('component'===v){
						this.setEditor();
					}else{
						//删除editor
						this.removeEditor();
					}
				}else if(value && !value.hasOwnProperty("multiRowEditor") && !value.hasOwnProperty("editable")) this.repaintGrid();
			}
		}
	});
	
	return {
		'$UI/system/components/justep/grid/grid' : Grid,
		'$UI/system/components/justep/grid/grid#column' : Column
	};

});