/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var mapping = require("$UI/system/lib/bind/bind.mapping");
	var Org = require("../js/org");
	var OrgUtil = Org.Util;
	var OrgRow = Org.Row;

	var Model = function() {
		this.callParent();
		this.limit = 12;
		this.includeOrgKind = "";
		this.includeDisabled = false;
		this.showCommonGroup = true;
		this.commonGroupOrg = false;
		this.cascade = false;
		this.list = [];
		this.viewList = [];
		this.loadOrgOK = $.Deferred();
		this.loaded = justep.Bind.observable(-1);
		this.filterText = justep.Bind.observable("").extend({
			rateLimit : 1000
		});
		this.filterListSize = justep.Bind.observable(this.limit);
		this.multiSelection = justep.Bind.observable(true);
		this.currentRow = justep.Bind.observable();
		this.showFilter = "";
		this.selectFilter = "";
		this.keys = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y',
				'Z' ];
		this.offset = justep.Bind.observable({
			start : 0,
			end : this.limit
		});

		// 挂接scrollView的下拉和上划事件
		this.on("onPullDown", function(evt) {
			if (this.filterText.get()) {
				evt.noMoreLoad = true;
				return;
			}
			var offset = this.offset.get(), v = offset.start - this.limit;
			this.offset.set({
				start : v > 0 ? v : 0,
				end : offset.end
			});
			evt.noMoreLoad = !this.hasMore();
		}, this);

		this.on("onPullUp", function(evt) {
			if (!this.filterText.get()) {
				var offset = this.offset.get(), v = offset.end + this.limit, size = this.list.length;
				this.offset.set({
					start : offset.start,
					end : v < size ? v : size
				});
			} else {
				this.filterListSize.set(this.limit + this.filterListSize.get());
			}
			evt.noMoreLoad = !this.hasMore();
		}, this);
	};

	Model.prototype.getOwnerModel = function() {
		return 'function'==typeof(this.owner.getModel)?this.owner.getModel():this;
	};
	
	Model.prototype.clsfilterText = function() {
		var me = this;
		setTimeout(function() {
			me.filterText.set('');
			me.filterListSize.set(me.limit);
		}, 50);
	};

	Model.prototype.load = function() {
		var me = this;
		this.loadOrgOK.done(function() {
			me.loaded.set(1 + me.loaded.get());
		});
	};

	// 设置参数limit:integer multiSelection:true/false cascade:true/false
	// selected:{kind:'sName',value:[]} title:...
	Model.prototype.setParam = function(param) {
		if (param) {
			if (param['title'])
				this.comp('titleBar').set({
					title : param['title']
				});
			if (param['limit'])
				this.limit = param['limit'];
			if (param.hasOwnProperty('selectFilter'))
				this.selectFilter = param['selectFilter'];
			if (param.hasOwnProperty('multiSelection'))
				this.multiSelection.set(!!param['multiSelection']);
			if (param.hasOwnProperty('cascade'))
				this.cascade = !!param['cascade'];
			if (param['selected'])
				this.setSelected(param['selected'].value, param['selected'].kind);
			if (param.hasOwnProperty('showCommonGroup')){
				this.showCommonGroup = param.showCommonGroup;
			}
			
			var b = this.showCommonGroup && Org.CommonGroup.hasCommonGroup(this.getContext());
			$('.x-types',this.getRootNode())[b?'show':'hide']();
				
			//下面3个属性需要重新加载组织数据
			var reload = false;
			if (param.hasOwnProperty('showFilter')){
				reload = this.showFilter !== param['showFilter'];
				this.showFilter = param['showFilter'];
			}
			if (param['includeOrgKind']){
				reload = reload || this.includeOrgKind !== param['includeOrgKind'];
				this.includeOrgKind = param['includeOrgKind'];
			}
			if (param['includeDisabled']){
				reload = reload || this.includeDisabled !== param['includeDisabled'];
				this.includeDisabled = param['includeDisabled'];
			}
			if(reload && this.loaded.peek()>0){
				this.loadOrgOK = $.Deferred();
				this.processOrgData();
			}
		}
	};

	// 获取组织机构的数据，来自缓存，返回数据按拼音首字母排序处理
	Model.prototype.getOrgData = function() {
		return OrgUtil.getOrgData(this.getOwnerModel(), this.includeOrgKind, this.showFilter, this.includeDisabled, this.commonGroupOrg);
	};

	// 处理组织机构数据增加key数据
	Model.prototype.processOrgData = function() {
		var me = this;
		this.getOrgData().done(function(orgs) {
			var list = orgs.slice(0), len = list.length, keyLen = me.keys.length;
			for ( var i = 0, j = 0; i < len && j < keyLen;) {
				var k = list[i].sChineseFirstPY.charAt(0).toUpperCase();
				if (me.keys[j] == k) {
					list.splice(i, 0, {
						sName : me.keys[j],
						isTitle : true
					});
					len++;
					j++;
				} else if (me.keys[j] < k) {
					j++;
					continue;
				}
				i++;
			}
			me.list = list;
			me.loadOrgOK.resolve();
		});
	};

	Model.prototype.getFilterList = function(filterText) {
		var ret = [];
		if (!filterText)
			return ret;
		filterText = filterText.toUpperCase();
		var len = this.list.length, count = 0, size = this.filterListSize.get();
		for ( var i = 0; i < len; i++) {
			var row = this.list[i], v = this.getRowValue(row, 'sName'), v1 = this.getRowValue(row, 'sChineseFirstPY'), isTitle = this.getRowValue(
					row, 'isTitle');
			if (!isTitle && (v.indexOf(filterText) > -1 || v1.indexOf(filterText) > -1)) {
				if (!mapping.isMapped(row)) {
					row['selected'] = false;
					row = mapping.fromJS(row);
					this.list[i] = row;
				}
				ret.push(row);
				count++;
				if (count >= size)
					break;
			}
		}

		this.oldList1 = this.oldList2;
		this.oldList2 = ret;
		return ret;
	};

	// foreach提供数据的方法
	Model.prototype.getList = function() {
		// this.b = new Date();
		if (this.loaded.get() < 0)
			return [];
		var filterText = this.filterText.get();
		if (filterText)
			return this.getFilterList(filterText);
		var offset = this.offset.get();
		var max = offset.end, min = offset.start, size = max - min + 1, len = this.list.length;
		var ret = [];
		for ( var i = min, j = 0; j < size && i < len; i++) {
			var row = this.list[i];
			if (!mapping.isMapped(row)) {
				row['selected'] = false;
				row = mapping.fromJS(row);
				this.list[i] = row;
			}
			ret.push(row);
			j++;
		}
		this.viewList = ret;
		this.oldList1 = this.oldList2;
		this.oldList2 = ret;
		return ret;
	};

	Model.prototype.hasMore = function() {
		return !($.isArray(this.oldList1) && $.isArray(this.oldList2) && this.oldList1.length === this.oldList2.length);
	};

	Model.prototype.indexOf = function(value, name, array) {
		array = array || this.list;
		var len = array.length;
		for ( var i = 0; i < len; i++) {
			var v = this.getRowValue(array[i], name);
			if (value == v)
				return i;
		}
		return -1;
	};

	Model.prototype.showKey = function(key) {
		if (this._hideHandel)
			window.clearTimeout(this._hideHandel);
		$('div.x-key').text(key).show();
		var me = this;
		this._hideHandel = window.setTimeout(function() {
			$('div.x-key').hide();
			me._hideHandel = null;
		}, 1000);
	};

	// 获取key在列表中的index
	Model.prototype.getKeyIndex = function(key, array) {
		this.showKey(key);
		return this.indexOf(key, 'sName', array);
	};

	Model.prototype.getRowValue = function(row, name) {
		return OrgUtil.getRowValue(row, name);
	};

	Model.prototype.setRowValue = function(row, name, value) {
		OrgUtil.setRowValue(row, name, value);
	};

	// foreach渲染后通知scrollView重新计算高度
	Model.prototype.afterRender = function() {
		// var e = new Date();
		// $('.info').text(e.getTime()-this.b.getTime());
		var me = this;
		setTimeout(function() {
			me.comp('scrollView').refresh();
		}, 50);
	};

	// 快捷key切换
	Model.prototype.to = function(evt) {
		if (this.filterText.get())
			return;// 输入过滤模式
		var bindContext = justep.Bind.contextFor(evt.target || evt.srcElement), $object = bindContext.$object;
		var i = this.getKeyIndex($object, this.viewList);
		if (i > -1) {
			var $to = $('div[flag=' + $object + ']');
			if ($to.length > 0)
				this.comp('scrollView').scroller.scrollToElement($to[0], 100);
		} else {
			i = this.getKeyIndex($object);
			if (i > -1) {
				this.offset.set({
					start : i,
					end : i + this.limit
				});
				var me = this;
				setTimeout(function() {
					var $to = $('div[flag=' + $object + ']');
					if ($to.length > 0)
						me.comp('scrollView').scroller.scrollToElement($to[0], 100);
				}, 50);
			}
		}
	};

/*	
	Model.prototype.doShowFilter = function(row) {
		var isTitle = this.getRowValue(row, 'isTitle');
		if (!isTitle && this.showFilter) {
			if ('string' == typeof (this.showFilter))
				this.showFilter = new justep.Express(this.showFilter);
			if (this.showFilter instanceof justep.Express) {
				var orgRow = new OrgRow(row);
				var ctx = {
					$model : this,
					$row : orgRow
				};
				return justep.Express.eval(this.showFilter, ctx.$row, ctx);
			}
		}
		return true;
	};
*/

	Model.prototype.doSelectFilter = function(row) {
		if (this.selectFilter) {
			if ('string' == typeof (this.selectFilter))
				this.selectFilter = new justep.Express(this.selectFilter);
			if (this.selectFilter instanceof justep.Express) {
				var orgRow = new OrgRow(row);
				var ctx = {
					$model : this,
					$row : orgRow
				};
				return justep.Express.eval(this.selectFilter, ctx.$row, ctx);
			}
		}
		return true;
	};

	Model.prototype.doRowClick = function($object, evt) {
		var isTitle = this.getRowValue($object, 'isTitle');
		if (isTitle)
			return;
		if (this.multiSelection.get()) {
			var b = !$object.selected.get();
			$object.selected.set(b && this.doSelectFilter($object));
			if (this.cascade) {
				var len = this.list.length;
				var csid = this.getRowValue($object, 'sFID');
				for ( var i = 0; i < len; i++) {
					var row = this.list[i];
					isTitle = this.getRowValue(row, 'isTitle');
					if (!isTitle) {
						var sid = this.getRowValue(row, 'sFID');
						if (0 === sid.indexOf(csid))
							this.setRowValue(row, 'selected', b && this.doSelectFilter(row));
					}
				}
			}
		} else {
			if (this.doSelectFilter($object))
				this.currentRow.set($object);
		}
	};

	Model.prototype.getSelected = function() {
		var ret = [];
		if (this.multiSelection.get()) {
			var len = this.list.length;
			for ( var i = 0; i < len; i++) {
				var row = this.list[i];
				if (this.getRowValue(row, 'selected'))
					ret.push(new OrgRow(row));
			}
		} else
			ret.push(new OrgRow(this.currentRow.get()));
		return ret;
	};

	Model.prototype.setSelected = function(selected, kind) {
		if (this.multiSelection.get()) {
			selected = !$.isArray(selected) ? [ selected ] : selected;
			var len = this.list.length;
			for ( var i = 0; i < len; i++) {
				var r = this.list[i], v = this.getRowValue(r, kind);
				this.setRowValue(r, 'selected', selected.indexOf(v) > -1);
			}
		} else {
			var index = this.indexOf(($.isArray(selected) && selected.length > 0) ? selected[0] : selected, kind);
			this.currentRow.get(index > -1 ? this.list[index] : null);
		}
	};

	// 接管url生成，主要赋值blobLastModified，使用缓存
	Model.prototype.orgImage1CreateURL = function(event) {
		event.blobLastModified = this.getRowValue(event.bindingContext.$object, 'sPhotoLastModified');
	};

	Model.prototype.btnOKClick = function(event) {
		this.comp('windowReceiver').windowEnsure(this.getSelected());
	};

	Model.prototype.btnCancelClick = function(event) {
		this.comp('windowReceiver').windowCancel();
	};

	Model.prototype.modelLoad = function(event) {
		$('div.x-key-index').on('click', 'li.x-key-item', $.proxy(this.to, this)).on('touchmove', function(evt) {
			evt.stopPropagation();
		});
		if(justep.Browser.isPCFromUserAgent){
			$('div.x-key-index').addClass('x-key-index-pc');
		}
	};

	Model.prototype.windowReceiverReceive = function(event) {
		if (event.data)
			this.setParam(event.data);
	};

	Model.prototype.btnRefreshClick = function(event) {
		this.loadOrgOK = $.Deferred();
		OrgUtil.reload(this.getOwnerModel());
		this.processOrgData();
		this.load();
	};

	Model.prototype.orgListContentTouchstart = function(event) {
		$('.x-query-input input').blur();
	};

	Model.prototype.btnAllClick = function(event){
		if(this.commonGroupOrg){
			this.commonGroupOrg = false;
			this.loadOrgOK = $.Deferred();
			this.processOrgData();
			this.load();
		}
	};

	Model.prototype.btnCommonGroupClick = function(event){
		if(!this.commonGroupOrg){
			this.commonGroupOrg = true;
			this.loadOrgOK = $.Deferred();
			this.processOrgData();
			this.load();
		}
	};

	return Model;
});