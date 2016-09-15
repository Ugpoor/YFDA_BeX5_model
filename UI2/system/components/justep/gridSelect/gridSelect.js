/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	require("css!./css/gridSelect").load();

	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Data = require("$UI/system/components/justep/data/data");
	var Grid = require("$UI/system/components/justep/grid/grid");

	var url = require.normalizeName("./gridSelect");
	var ComponentConfig = require("./gridSelect.config");

	var GridSelect = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.grid = null;
			this.value = null;
			this.label = null;
			this.ext = null;
			this.optionCfg = null;
			this.optionHeight = 300;
			this.autoOptionWidth = false;
			this.inputChangeable = false;
			this.inputFilterable = false;
			this.clearButton = false;
			this.defaultLabel = null;
			this.selectFilter = null;
			this.valueSeparator = ",";
			this.labelSeparator = ",";
			this.extSeparator = ",";
			this.multiselect = false;
			this._showed = false;
			this._handle = {};
			this.callParent(options);
		},
		dispose : function() {
			if(this._filterByInputHandle) clearTimeout(this._filterByInputHandle);
			//搬回来
			if(this._optionNode)this.domNode.appendChild(this._optionNode);
			this._disposeGrid();
			this._bindEvent(false);
			this.callParent();
		},
		_disposeGrid : function() {
			if (this.grid) {
				this._bindGridEvent();
				justep.Component.removeComponent(this.grid);
				this.grid = null;
			}
		},
		getOverlay: function(){
			var $rootNode = $(this.getModel().getRootNode());
			var $overlay = $rootNode.children('div.x-gridSelect-overlay');
			if($overlay.length<=0){
				$rootNode.append('<div class="x-gridSelect-overlay"></div>');
				$overlay = $rootNode.children('div.x-gridSelect-overlay');
			}
			return $overlay;
		},
		getOptionNode: function(){
			return this._optionNode;
		},
		_createGrid : function() {
			if (this.optionCfg) {
				this._oldOPW = this.$domNode.innerWidth()-2;
				var defaultCfg = {
					//下拉目前不支持智能加载渲染，计算高度有问题
					scroll : false,
					rowNum : -1,
					height : this.optionHeight,
					width : this.autoOptionWidth?'auto':(this._oldOPW),
					useFilterBar : false,
					grouping : false,
					useGroupbar : false,
					multiselect : false,
					hiddenPager : true,
					hiddenCaptionbar : true
				};
				var self = this;
				this._optionNode = this.$domNode.children('.x-gridSelect-option')[0];
				//搬到.w的根上,lzg特殊实现显示问题，释放时再搬回来
				this.getModel().getRootNode().appendChild(this._optionNode);
				this.optionCfg.parentNode = this._optionNode;
				this.optionCfg.multiselect = this.multiselect;
				this.optionCfg.onTreeIconRender = function(event){
					if(self.hasListener('onTreeIconRender')){
						event.source = self;
						self.fireEvent('onTreeIconRender',event);
					}
				};
				this.optionCfg.onFilter = function(event){
					if(self.inputFilterable){
						var filterByInput = function(row,col,inputVal){
							if(col&&row&&inputVal){
								var val = row.val(col) || '';
								return (val+'').toLowerCase().indexOf(inputVal.toLowerCase())>=0;
							}
						};
						var datas = event.datas;
						var inputFilterValue = self._inputFilterValue;
						event.inputFilterValue = inputFilterValue;
						if(inputFilterValue && $.isArray(datas) && datas.length>0){
							var valueCol = self.optionCfg.value;
							var labelCol = self.optionCfg.label;
							var extCol = self.optionCfg.ext;
							for(var i=datas.length-1; i>=0; i--){
								var row = datas[i];
								var ok = filterByInput(row,valueCol,inputFilterValue)||filterByInput(row,labelCol,inputFilterValue)||filterByInput(row,extCol,inputFilterValue);
								if(!ok) datas.splice(i,1);
							}
							self._inputFilterValue = null;
						}
						if(self.hasListener('onOptionFilter')){
							event.source = self;
							self.fireEvent('onOptionFilter',event);
						}
					}
				};
				this.optionCfg.onCollapseRow = 
					this.optionCfg.onExpandRow = 
						this.optionCfg.onReload = function(event){
					self._reSetHeight();
				};
				
				if(this.selectFilter){
					this.optionCfg.onRowCheck = function(event){
						event.cancel = !self._doCanSelect(event.row);
					};
					if(!this.multiselect){
						this.optionCfg.onBeforeRowSelect = this.optionCfg.onRowCheck;
						delete this.optionCfg.onRowCheck;
					}
					this.optionCfg.rowAttr = '('+this.selectFilter+')?{}:{class:"x-disabled-select"}';
				}

				this.grid = new Grid($.extend(defaultCfg,this.optionCfg));
				// 绑定grid相关事件
				this._bindGridEvent();
			}
		},
		_bindGridEvent : function(on) {
			if (this.grid) {
				var fn = 'off';
				if (on !== false) {
					this._handle['grid-keydown'] = this._doGridKeyDown.bind(this);
					this._handle['grid-click'] = this._doGridClick.bind(this);
					fn = 'on';
				}
				this.grid.$domNode[fn]('keydown', this._handle['grid-keydown']);
				$(this.getOptionNode())[fn]('click', this._handle['grid-click']);
				$(this.getOptionNode())[fn]('click', '.x-disabled-select', function(event){event.stopPropagation();});
			}
		},
		buildTemplate : function(config) {
			this._cfg = config || {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'x-gridSelect';
			var tpl = '<input class="form-control x-gridSelect-input" '+(this.isDisabled()?'disabled="disabled"':'')+'/>';
			tpl += '<i class="x-gridSelect-clear icon-close-circled '+(this.clearButton?'':'hide')+'"/>';
			return "<div class='"
				+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
				+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url
				+ "'" + " >"
				+ tpl
				+ "<div class='x-gridSelect-option'/></div>";
		},
		showOption : function() {
			if(!this.isDisabled())
				this._showOption(true);
		},
		hideOption : function() {
			if(this.multiselect && this._showed)this._updateRefValue();
			this._showOption(false);
		},
		_doCanSelect: function(row){
			var ret = true;
			if(this.selectFilter){
				if(!this._selectFilterExpr) this._selectFilterExpr = new justep.Express(this.selectFilter);
				var ctx = justep.Bind.contextFor(this.domNode);
				ctx.$row = row;
				ret = justep.Express.eval(this._selectFilterExpr, ctx.$row, ctx);
				delete ctx.$row;
			}
			return ret;
		},
		_reSetHeight: function(){
			if(this.grid){
				this.grid.setHeight(this.optionHeight);
				var $option = $(this.getOptionNode());
				var h = $option.height(), w = $option.width();
				var gw = this.grid.$domNode.outerWidth(true);
				var gh = this.grid.$domNode.outerHeight(true)+this.grid.getHeaderHeight()+2;
				if(gw>w) gh += 18;
				if(h>gh){
					this.grid.setHeight(gh);
				}
			}
		},
		_setOptionPosition: function(){
			var $root = $(this.getModel().getRootNode());
			var wOffset = $root.offset();
			var pOffset = this.$domNode.offset();
			pOffset.top -= wOffset.top; 
			pOffset.left -= wOffset.left; 
			var $option = $(this.getOptionNode()),optionH = $option.height();
			var h = this.$domNode.outerHeight();
			var top = h;
			if((pOffset.top+h+optionH)>$(document).height()){
				top = -optionH;
			}
			pOffset.top += top;
			if(pOffset.top<0) pOffset.top = 0;
			$option.css(pOffset);
		},
		_showOption : function(b) {
			if (this._showed == b)
				return;
			this._showed = !!b;
			
			var overlay = this.getOverlay();
			overlay[b ? 'show' : 'hide']();
			overlay[b ? 'on' : 'off']('click', this._handle['body-click']);
			if (b) {
				if('false'!=this.optionCfg.autoLoad){
					var data = this._getOptionData();
					if(data)data.open();
				}
				if (!this.grid)
					this._createGrid();
				else if(!this.autoOptionWidth){
					var opw = this.$domNode.innerWidth()-2;
					if(opw!=this._oldOPW){
						this._oldOPW = opw;
						this.grid.setWidth(opw);
					}
				}
			}
			$(this.getOptionNode())[b ? 'show' : 'hide']();
			if (b) {
				this._updateSelected();
				this._reSetHeight();
				this._setOptionPosition();
				if(this.hasListener('onShowOption')){
					this.fireEvent('onShowOption',{source:this});
					//计算两遍，因为有变态的写法，在onShowOption中使用alert
					this._updateSelected();
					this._reSetHeight();
					this._setOptionPosition();
				}				
			}else{
				//重新渲染显示
				if(this.inputFilterable){
					this.render();
					this.grid.refresh();
				}
				this._getInput().focus();
				if(this.hasListener('onHideOption')){
					this.fireEvent('onHideOption',{source:this});
				}				
			}
		},
		_updateSelected : function() {
			//先去除选中
			var i;
			if (this.multiselect) {
				var checkIDs = this.grid.getCheckeds();
				if($.isArray(checkIDs)){
					for(i=0;i<checkIDs.length;i++)
						this.grid.setRowChecked(checkIDs[i],false);
				}
			}
			// 选中行
			if (null !== this.value && undefined !== this.value) {
				var row = null, rowid = null, data = this._getOptionData();
				if (!this.multiselect) {
					row = this._getOptionRow(this.value);
					if (row)
						rowid = data.getRowID(row);
					this.grid.setSelection(rowid);
				} else {
					var values = ('' + this.value).split(this.valueSeparator);
					for (i = 0; i < values.length; i++) {
						row = this._getOptionRow(values[i]);
						if (row){
							rowid = data.getRowID(row);
							this.grid.setRowChecked(rowid,true);
						}
					}
				}
			}
		},
		// 初始化
		doInit : function(value, bindingContext) {
			if(this.$domNode.children('input.x-gridSelect-input').size()<=0){
				var tpl = '<input class="form-control x-gridSelect-input" '+(this.isDisabled()?'disabled="disabled"':'')+'/>';
				tpl += '<i class="x-gridSelect-clear icon-close-circled '+(this.clearButton?'':'hide')+'"/>';
				this.$domNode.prepend(tpl);
			}
			this.$domNode.children('input.x-gridSelect-input').attr('readonly', !this.inputChangeable&&!this.inputFilterable);
			this._bindEvent();
		},
		_getClearButton: function(){
			return this.$domNode.children('i.x-gridSelect-clear');
		},
		_bindEvent : function(on) {
			var fn = 'off';
			if (on !== false) {
				this._handle['input-keydown'] = this._doInputKeyDown.bind(this);
				this._handle['click'] = this._doClick.bind(this);
				this._handle['clear-click'] = this._doClearClick.bind(this);
				this._handle['body-click'] = this.hideOption.bind(this);
				fn = 'on';
			}
			var data = this._getOptionData();
			if (data)
				data[fn](Data.EVENT_REFRESHDATA_AFTER, this.render, this);
			this.$domNode[fn]('keydown', '.x-gridSelect-input', this._handle['input-keydown']);
			this.$domNode[fn]('click', '.x-gridSelect-input', this._handle['click']);
			this.$domNode[fn]('click', '.x-gridSelect-clear', this._handle['clear-click']);
			this.getOverlay()[fn]('click', this._handle['body-click']);
			//$('body')[fn]('click', this._handle['body-click']);
		},
		_doClearClick : function(){
			if(!this.isDisabled()){
				if (this.optionCfg.ext) {
					this._val2ref(this.extRef, null);
				}
				if (this.optionCfg.label) {
					this.label = null;
					this._val2ref(this.labelRef, null);
				}
				if (this.optionCfg.value) {
					this._val2ref(this.ref, null);
				}
			}
		},
		_doClick : function(evt) {
			this.$domNode.parent().click();//让父组件触发click事件
			this._getInput().focus();
			this._showed ? this.hideOption() : this.showOption();
			evt.stopPropagation();
		},
		_doInputKeyDown : function(evt) {
			switch (evt.keyCode) {
			case 37:
			case 38:	
			case 39: break;//左右上
			case 40:// down
				this.showOption();
				if (this.grid){
					this.grid.$domNode.focus();
				}
				break;
			case 27:// esc
				this._showOption(false);
				break;
			case 13:// 回车
				this._updateRefValueByInput();
				break;
			default:
				//输入过滤处理
				if(this.inputFilterable){
					this._filterByInput();
				}
			}
		},
		_filterByInput: function(){
			var self = this;
			if(this._filterByInputHandle) clearTimeout(this._filterByInputHandle);
			this._filterByInputHandle = setTimeout(function(){
				self._filterByInputHandle = null;
				self._inputFilterValue = self._getInput().val();
				if(self._showed) self.grid.refresh();
				else self.showOption();
			}, 500);
		},
		_getInput: function(){
			return this.$domNode.children("input.x-gridSelect-input");
		},
		_updateRefValueByInput : function(){
			if(this.inputChangeable){
				var value = this._getInput().val(),label=value,ext=value;
				var data = this._getOptionData();
				var row = data.find([this.optionCfg.value],[value],true,false,false,true);
				if(row && row.length>0){
					if (this.optionCfg.label) label = row[0].val(this.optionCfg.label);
					if (this.optionCfg.ext) ext = row[0].val(this.optionCfg.ext);
				}
				this._updateRefValue(value,label,ext);
			}
		},
		_updateRefValue : function(value,label,ext) {
			var data = this._getOptionData();
			if (this.optionCfg && data && this.grid) {
				if(arguments.length === 0){
					value = null;
					label = null;
					ext = null;
					if (!this.multiselect) {
						if(!this._doCanSelect(data.getCurrentRow(true))) return;
						value = data.val(this.optionCfg.value);
						label = data.val(this.optionCfg.label);
						ext = data.val(this.optionCfg.ext);
					} else {
						var rowids = this.grid.getCheckeds();
						for ( var i = 0; i < rowids.length; i++) {
							var r = data.getRowByID(rowids[i]);
							if (r) {
								value = (null !== value ? (value + this.valueSeparator) : '') + r.val(this.optionCfg.value);
								label = (null !== label ? (label + this.labelSeparator) : '') + r.val(this.optionCfg.label);
								ext = (null !== ext ? (ext + this.extSeparator) : '') + r.val(this.optionCfg.ext);
							}
						}
					}
				}
				if (this.optionCfg.value) {
					this._val2ref(this.ref, value);
				}
				if (this.optionCfg.label) {
					this._val2ref(this.labelRef, label);
				}
				if (this.optionCfg.ext) {
					this._val2ref(this.extRef, ext);
				}
				if(this.hasListener('onUpdateValue')){
					this.fireEvent('onUpdateValue',{source:this});
				}				
			}
		},
		_selected : function() {
			this.hideOption();
			this._updateRefValue();
		},
		_doGridClick : function(evt) {
			if (!this.multiselect)
				this._selected();
			evt.stopPropagation();
		},
		_doGridKeyDown : function(evt) {
			switch (event.keyCode) {
				case 13:// 回车
					if (!this.multiselect)
						this._selected();
					break;
				case 27: this._showOption(false);	
			}
		},
		doUpdate : function(value, bindingContext, allBindings) {
			var v = {};
			this.labelRef = value && !(value.labelRef instanceof justep.BindComponent.NullValue) ? value.labelRef : null;
			this.extRef = value && !(value.extRef instanceof justep.BindComponent.NullValue) ? value.extRef : null;
			this.ref = value && !(value.ref instanceof justep.BindComponent.NullValue) ? value.ref : null;
			if (this.labelRef)
				v['label'] = this.labelRef.get();
			if (this.extRef)
				v['ext'] = this.extRef.get();
			if (this.ref)
				v['value'] = this.ref.get();
			this.set(v);
			if(this._showed)this._updateSelected();
			this.callParent(value, bindingContext, allBindings);
		},
		disabledRender: function(){
			if(this.$domNode)this.$domNode.attr('disabled', this.isDisabled()).children("input.x-gridSelect-input").attr('disabled', this.isDisabled());
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "value":
				if (oldVal != value) {
					this.needRender = this._inited;
				}
				break;
			case "label":
				if (oldVal != value) {
					this.needRender = this._inited;
				}
				break;
			case "optionCfg":
				break;
			case "clearButton":
				if(this._inited && oldVal != value) this._getClearButton()[value?'removeClass':'addClass']('hide');
				break;
			case "defaultLabel":
				if (oldVal != value) {
					this._defaultLabelExpr = null;
				}
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		},
		_getOptionData : function() {
			if (this.optionCfg)
				return this.getModel().comp(this.optionCfg.data);
		},
		_getOptionRow : function(v) {
			if (this.optionCfg && this.optionCfg.value) {
				var data = this._getOptionData();
				if (data && data.isLoaded()) {
					// 根据value查找label
					var rows = data.find([ this.optionCfg.value ], [ v ], true);
					if (rows.length > 0)
						return rows[0];
				}
			}
		},
		_getDefaultLabel : function(){
			if(this.defaultLabel && 'string'===typeof(this.defaultLabel)){
				if(!this._defaultLabelExpr) this._defaultLabelExpr = new justep.Express(this.defaultLabel);
				var ctx = justep.Bind.contextFor(this.domNode);
				return justep.Express.eval(this._defaultLabelExpr, ctx.$object, ctx);
			}
		},
		_getDisplayValue : function() {
			if (!this.labelRef && this.optionCfg && this.optionCfg.label && this.optionCfg.value) {
				var row = this._getOptionRow(this.value);
				if (row)
					this.label = row.val(this.optionCfg.label);
			}
			return this.label || this.value || this._getDefaultLabel() || '';
		},
		render : function() {
			this._getInput().val(this._getDisplayValue());
			this.callParent();
		}
	});

	justep.Component.register(url, GridSelect);
	return GridSelect;
});