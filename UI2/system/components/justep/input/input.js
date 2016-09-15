/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	//require("$UI/system/components/justep/datePicker/datePicker");//不能去除打包时要分析使用
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	require("./js/datePicker");

	var DecimalFormat = require("./js/decimalFormat");

	var url = require.normalizeName("./input");
	var ComponentConfig = require("./input.config");


	var TypeRegExp = {
		Integer : /(^-?$)|(^-?[0-9]*$)/,
		Long : /(^-?$)|(^-?[0-9]*$)/,
		Decimal : /(^-?$)|(^-?[0-9]*([.]?[0-9]*)?$)/,
		Float : /(^-?$)|(^-?[0-9]*([.]?[0-9]*)?$)/,
		Double : /(^-?$)|(^-?[0-9]*([.]?[0-9]*)?$)/
	};

	var getAfterPressText = function(input, text) {
		var src = input, srcText, selTxt, srcRange, beforeTxt;

		if (justep.Browser.IE && !justep.Browser.IE11) {
			var selRange = document.selection.createRange();
			selTxt = selRange.text;// 选中的文本
			srcRange = src.createTextRange();
			srcText = srcRange.text;
			selRange.setEndPoint("StartToStart", srcRange);
			beforeTxt = selRange.text;// 插入字符前的文本
		} else {
			selTxt = window.getSelection().toString();// 选中的文本
			if('number'!=$(src).attr('type'))  
				srcRange = src.selectionEnd;
			else srcRange = src.value.length;
			srcText = src.value;
			beforeTxt = src.value.substring(0, srcRange);
		}

		var insertTxt = text;// 插入字符 String.fromCharCode(e.keyCode)
		var afterTxt = srcText.substr(beforeTxt.length);// 插入字符后的文本
		// alert(beforeTxt+"__"+insertTxt+"__"+afterTxt);
		var txt = beforeTxt.substr(0, beforeTxt.length - selTxt.length) + insertTxt + afterTxt;
		return txt;
	};

	var Input = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this.readonly = false;
			this.placeHolder = "";
			this.value = "";
			this.format = "";
			this.pattern = "";
			this.autoFocus = false;
			this.autoComplete = false;
			this.min = null;
			this.max = null;
			this.minLength = 1;
			this.maxLength = null;
			this.dataType = "String";
			this.valueUpdateMode = null;
		},

		dispose : function() {
			this.$domNode.off('change focus blur keypress paste touchstart');
			if (this.$domNode.datePicker){
				this.$domNode.datePicker("destroy");
			}
			this.callParent();
		},

		// 动态创建组件
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'form-control';
			return "<input class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url + "' " + " ></input>";
		},

		_doDataTypeChange : function() {
			if (justep.Bind.isObservable(this.ref) && this.ref['define']) {
				var def = this.ref['define'].defCol;
				var t = def.type;
				var size = def.size;
				var value = {};
				var needSet = false;
				if (t !== this.dataType) {
					value.dataType = t;
					needSet = true;
				}
				if (size){
					value.maxLength = size;
					needSet = true;
				}
				if(needSet) this.set(value);
			}
		},
		_showMobileDatePicker: function(){
			var self = this;
			if (self.dataType == 'DateTime' || self.dataType == 'Date' || self.dataType == 'Time'){
				self._datePickerPromise.done(function(datePicker){
					datePicker._input = self;
					var attr = {'type':self.dataType.toLowerCase()};
					if (self.min)
						attr.min = self._doCalcDateExpr(self.min);
					if (self.max)
						attr.max = self._doCalcDateExpr(self.max);
					datePicker.set(attr);
					datePicker.show();
					var v = self.val();
					if(v){
						v = self.dataType == 'DateTime'?justep.Date.fromString(v,justep.Date.STANDART_FORMAT):(self.dataType == 'Date'?justep.Date.fromString(v,justep.Date.STANDART_FORMAT_SHOT):justep.Date.fromString(v,justep.Date.STANDART_TIME_FORMAT));
					}else v = new Date();
					if(v instanceof Date){
						if(attr.min instanceof Date && v.getTime()<attr.min.getTime()) v = attr.min;
						else if(attr.max instanceof Date && v.getTime()>attr.max.getTime()) v = attr.max;
					}
					datePicker.setValue(v);
				});
			}
		},
		_createMobileDatePicker: function(){
			var self = this;
			if (self.dataType == 'DateTime' || self.dataType == 'Date' || self.dataType == 'Time'){
				if('mobiscroll'!==Input.mobileDatePickerType){//新时间选择使用"$UI/system/components/justep/datePicker/datePicker"组件
					var model = this.getModel();
					if (!model['__justep__'])
						model['__justep__'] = {};
					var datePicker = model.__justep__._input_g_datepicker_;
					var deferred = $.Deferred();
					this._datePickerPromise = deferred.promise();
					if(!datePicker){
						require([ "$UI/system/components/justep/datePicker/datePicker" ], function(DatePicker) {
							if (!model.isDestroyed && (self.dataType == 'DateTime' || self.dataType == 'Date' || self.dataType == 'Time')){
								datePicker = new DatePicker({
									parentNode:model.getRootNode(),
									onOK:function(evt){
										var input = evt.source._input;
										if(input instanceof Input){
											var v = evt.source.getValue();
											v = self.dataType == 'DateTime'?justep.Date.toString(v,justep.Date.STANDART_FORMAT):(self.dataType == 'Date'?justep.Date.toString(v,justep.Date.STANDART_FORMAT_SHOT):justep.Date.toString(v,justep.Date.STANDART_TIME_FORMAT));
											input.val(v);
										}
										evt.source._input = null;
									}});
								var btnClear = $('<button class="btn btn-link x-btn-clear">'+justep.Message.getMessage(justep.Message.JUSTEP231508)+' </button>');
								btnClear.on('click',function(){
									var input = datePicker._input;
									if(input instanceof Input){
										input.clear();
										datePicker.hide();
									}
								});
								datePicker.getHeader$().prepend(btnClear);
								model.__justep__._input_g_datepicker_ = datePicker;
								//datePicker.setValue(new Date());//刺激datePicker组件渲染，加快后期显示
								deferred.resolve(datePicker);
							}							
						});
					}else{
						deferred.resolve(datePicker);
					}
					self.$domNode.on('click.datapicker', function() {
						self._showMobileDatePicker();
					});
				}
			}
		},
		_bindDataType : function() {
			if (this.dataType == 'DateTime' || this.dataType == 'Date' || this.dataType == 'Time') {
				if (!this.format) {
					if ('DateTime' == this.dataType)
						this.format = "yyyy-MM-dd hh:mm:ss";
					else if ('Date' == this.dataType)
						this.format = "yyyy-MM-dd";
					else if ('Time' == this.dataType)
						this.format = "hh:mm:ss";
				}
				var that = this;
				var type = this.dataType.toLowerCase(), format = justep.Date.STANDART_FORMAT;
				if (type == 'date')
					format = justep.Date.STANDART_FORMAT_SHOT;
				else if (type == 'time')
					format = "hh:mm:ss";
				this.$domNode.addClass(type).attr('readonly', justep.Browser.isMobile);
				if (justep.Browser.isMobile) {
					if('mobiscroll'!==Input.mobileDatePickerType){//新时间选择使用"$UI/system/components/justep/datePicker/datePicker"组件
						this._createMobileDatePicker();
					}else{//原旧模式
						this.$domNode.datePicker({
							preset : type,
							seconds : true,
							ampm : false,
							format : format,
							dispalyFormat : this.format,
							beforeShow : function(input, picker) {
								if (that.min)
									picker.settings['startDate'] = that._doCalcDateExpr(that.min);
								if (that.max)
									picker.settings['endDate'] = that._doCalcDateExpr(that.max);
							}
						});
					}
				} else {
					var self = this;
					this.$domNode.on('click.datapicker', function() {
						require([ "./js/datePickerPC" ], function(DatePicker) {
							if (self.dataType == 'DateTime' || self.dataType == 'Date' || self.dataType == 'Time')
								DatePicker.show(self, type === 'date' ? 0 : (type === 'time' ? 4 : 3), true);
						});
					});
				}
			} else if (this.dataType){
				this.$domNode.addClass(this.dataType.toLowerCase());
			}
		},
		_updateType : function(){
			var inputType = this.$domNode.attr('type');
			if(inputType!='email' && inputType!='url' && inputType!='password' && inputType!='range' && inputType!='search' && inputType!='color'){
				if(this.dataType == 'Integer' || this.dataType == 'Long' || this.dataType == 'Decimal' || this.dataType == 'Float' || this.dataType == 'Double'){
					this.$domNode.attr('type',justep.Browser.isMobile?'number':'tel');
				}else this.$domNode.attr('type','text');
			}
			this._isRestoreType = false;
		},
		_restoreType : function(){//解决手机上number不能显示非数字的val
			var inputType = this.$domNode.attr('type');
			if(inputType=='number' || inputType=='tel') this.$domNode.attr('type','text');
			this._isRestoreType = true;
		},
		_unbindDataType : function(dataType) {
			if (this.$domNode) {
				this.$domNode.removeClass((''+dataType).toLowerCase());
				if (dataType == 'DateTime' || dataType == 'Date' || dataType == 'Time'){
					this.$domNode.attr('readonly', this.readonly).off('click.datapicker').datePicker('destroy');
				}
			}
		},
		_doCalcDateExpr : function(expr) {
			var v = this._doCalcExpr(expr);
			if (justep.Bind.isObservable(v))
				v = v.get();
			if (v instanceof Date)
				return v;
			else if ('string' == typeof (v))
				return justep.Date.fromString(v, justep.Date.STANDART_FORMAT_SHOT);
			else {
				var msg = new justep.Message(justep.Message.JUSTEP231090);
				throw justep.Error.create(msg);
			}
		},
		_doCalcExpr : function(expr) {
			this._expr = this._expr || {};
			if (!this._expr[expr])
				this._expr[expr] = new justep.Express(expr);
			var ctx = justep.Bind.contextFor(this.domNode);
			return justep.Express.eval(this._expr[expr], ctx.$object, ctx);
		},
		// 初始化
		doInit : function(value, bindingContext, allBindings) {
			var self = this;
			var dofocus = function(){
				self._updateType();
				if (!self.$domNode.prop('readonly') && self.value != self.$domNode.val()) {
					if ('DateTime' === self.dataType) {
						var val = self.value;
						var d = val instanceof Date ? val : justep.Date.fromString(val, justep.Date.STANDART_FORMAT);
						if(d instanceof Date) self.$domNode.val(justep.Date.toString(d, "yyyy-MM-dd hh:mm:ss"));
					} else
						self.$domNode.val(self.value);
				}
			};
			var valueUpdateHandle = $.proxy(this.doChange, this);
			this.$domNode.on('change', valueUpdateHandle).on('touchstart', function() {
				//已经活动状态不再处理
				if(self._focusin) return;
				dofocus();
				if(self._restoreHandle) clearTimeout(self._restoreHandle);
				self._restoreHandle = setTimeout(justep.Util.bindModelFn(self.getModel(),function(){
					if(self.$domNode && !self._focusin){
						self._restoreType();
						self.render();
					}
				}), 1000);
			}).on('focus',function(){
				self.fireEvent('onFocus', {
					source : this
				});
				self._focusin = true;
				if(self._isRestoreType) dofocus();
			}).on('blur', function() {
				self._focusin = false;
				//IE特殊逻辑,切换功能时IE不触发change事件
				if(justep.Browser.IE) self.doChange();
				self._restoreType();
				self.render();
				self.fireEvent('onBlur', {
					source : this
				});
			}).on('keypress paste', function(evt) {
				return self._doKeypress(evt);
			});// .on('keyup',function(){console.log('up:'+self.$domNode.val());});
			
			//增加值更新模式
			if(typeof(this.valueUpdateMode)=='string')
				this.valueUpdateMode = this.valueUpdateMode.split(",");
			if($.isArray(this.valueUpdateMode)){
				$.each(this.valueUpdateMode,function(i,name){
					if(name)self.$domNode.on(name, valueUpdateHandle);
				});
			}
			this._bindDataType();
		},
		isDisabled: function(){
			return this.readonly || this.callParent();
		},
		_doKeypress : function(evt) {
			//console.log('Keypress:'+this.$domNode.val());
			if(13===evt.keyCode){
				if(justep.Browser.IE>=9&&!this.isDisabled()&&!this.$domNode.prop('readonly')&&!this.$domNode.prop('disabled'))//增加ie11处理，原因回车后不触发change事件
					this.doChange(evt);
				return;
			}
			var regExp = TypeRegExp[this.dataType], ok, keyCode, afterPressText;

			if (justep.Browser.FF && (evt.key !== 'MozPrintableKey' || (evt.key === 'MozPrintableKey' && evt.ctrlKey)))
				return;
			// 获取剪切板----处理粘贴后文字的正则校验
			var cbd = window.clipboardData || evt.clipboardData || evt.originalEvent.clipboardData;
			if (evt.type === "paste" && cbd)
				keyCode = cbd.getData('text');
			else
				keyCode = String.fromCharCode(!justep.Browser.FF ? evt.keyCode : evt.which);

			if (regExp || this.pattern)
				afterPressText = getAfterPressText(this.domNode, keyCode);

			if (regExp) {
				ok = regExp.test(afterPressText);
			}
			if ((ok || ok===undefined) && this.pattern) {
				// 用户自定义正则
				try {
					regExp = eval('/' + this.pattern + '/');
					if (regExp)
						ok = regExp.test(afterPressText);
				} catch (e) {
				}
			}
			evt.returnValue = ok;
			if (!justep.Browser.FF && !evt.returnValue)
				evt.keyCode = 0;
			return evt.returnValue;
		},
		doUpdate : function(value, bindingContext, allBindings) {
			this._doDataTypeChange();
			this.callParent(value, bindingContext, allBindings);
		},
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "format":
				if (!this.format) {
					if ('DateTime' == this.dataType)
						this.format = "yyyy-MM-dd hh:mm:ss";
					else if ('Date' == this.dataType)
						this.format = "yyyy-MM-dd";
					else if ('Time' == this.dataType)
						this.format = "hh:mm:ss";
				}
				if (oldVal != value)
					this.needRender = this._inited;
				break;
			case "value":
				if (oldVal != value) {
					if (this._inited) {
						this.fireEvent('onChange', {
							source : this,
							originalValue : oldVal,
							value : value
						});
						this.val2ref();
					}
				}
				this.needRender = this._inited && !this._focusin;//焦点在当前组件不刺激渲染
				break;
			case "dataType":
				if (oldVal != value) {
					this.needRender = this._inited;
					this._dataTypeChanged = true;
					this._unbindDataType(oldVal);
				}
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		},
		render : function() {
			this.callParent();
			if (this._dataTypeChanged) {
				this._bindDataType();
				this._dataTypeChanged = false;
			}
			var val = this.value;
			var d;
			if (val) {
				if ('DateTime' == this.dataType) {
					d = val instanceof Date ? val : justep.Date.fromString(val, justep.Date.STANDART_FORMAT);
					val = d instanceof Date ? justep.Date.toString(d, this.format):val;
				} else if ('Date' == this.dataType) {
					d = val instanceof Date ? val : justep.Date.fromString(val, justep.Date.STANDART_FORMAT_SHOT);
					val = d instanceof Date ? justep.Date.toString(d, this.format):val;
				} else if ('Time' == this.dataType) {
					d = val instanceof Date ? val : justep.Date.fromString(val, "hh:mm:ss");
					val = d instanceof Date ? justep.Date.toString(d, this.format):val;
				} else if(this.format && ('Integer' == this.dataType 
						|| 'Long' == this.dataType
						|| 'Float' == this.dataType
						|| 'Double' == this.dataType
						|| 'Decimal' == this.dataType)){
					val = (new DecimalFormat(this.format)).format(val);
				}
			}
			if (val === undefined || val === null)
				val = '';
			var eData = {
				source : this,
				value : this.value,
				text : val
			};
			this.fireEvent('onRender', eData);
			this.$domNode.val(eData.text);
		},
		val : function(v) {
			if (arguments.length === 0)
				return this.value;
			this.set({
				value : v
			});
		},
		doChange : function(evt) {
			//console.log('changed:'+this.$domNode.val());
			var value = this.$domNode.val();
			if (value && 'DateTime' == this.dataType){
				var dt = justep.Date.fromString(value, justep.Date.STANDART_FORMAT);
				if(!dt){
					dt = justep.Date.fromString(value, "yyyy-MM-dd hh:mm:ss");
					if(!dt) dt = justep.Date.fromString(value, this.format);
					if(!dt)	dt = justep.Date.fromString(value, justep.Date.STANDART_FORMAT_SHOT);
					if(!dt){
						justep.Util.hint({text:justep.Message.getMessage(justep.Message.JUSTEP231516),type:"danger",delay:8000});
						return;//无效的时间类型
					}
					value = justep.Date.toString(dt, justep.Date.STANDART_FORMAT);
				}
			}
			this.set({
				value : value
			});
		},

		clear : function() {
			this.set({
				value : null
			});
			this.$domNode.val('');
		}
	});

	justep.Component.register(url, Input);
	return Input;
});