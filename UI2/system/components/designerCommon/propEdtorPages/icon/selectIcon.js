define(function(require) {
	var $ = require("jquery");
	var bind = require("bind");
	var xuiService = require("../../js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	 
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	/**
	 * =========================== 与java端交互必须定义工具类以及接口
	 * end========================*
	 */

	var Model = function() {
		this.callParent();

		this.isImgIcon = bind.observable(false);
		this.icon = '';
		this.imgIcon = bind.observable('');
		this.disimgIcon = bind.observable('');
		this.style = 'block';

	};

	function S4() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
	}

	// Generate a pseudo-GUID by concatenating random hexadecimal.
	function guid() {
		return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
	}

	Model.prototype.getIcon = function() {
		this.icon = this.getValue();
		if(!this.isImgIcon.get()){
			return this.icon;
		}else{
			return ("img:" + this.imgIcon.get() + '|' + this.disimgIcon.get());
		}
	};

	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function() {
		return this.getIcon(); // 用于同时返回多个属性值
	};

	Model.prototype.modelLoad = function(event) {
		var initData = xuiService.getPageParams();// 获取初始化数据
		this.uiPath = initData.uiPath;
		this.bizPath = initData.bizPath;
		this.propName = initData.propName;
		this.propValue = initData.propValue;
		this._setIcon(this.propValue);
		this.paths = initData.editorParameter.paths.split(',');
		this.names = initData.editorParameter.names.split(',');
		this.icons = initData.editorParameter.icons.split(';');
		for(var i =0; i<this.icons.length; i++){
			this.icons[i] = this.icons[i].split(',');
		}
		this.loadCSS();
		this.render();
		if (!this.isImgIcon.get())
			this.onSelect(this.icon);
		
		var data = [];	
		for(var i=0;i<this.names.length;i++){
			data.push({
				name: this.names[i],
				filePath: this.paths[i]
			})
		}
		this.comp("files").loadData({rows: data});
		this.comp("selectFile").val(this.paths[0]);
		setTimeout(function(){$(".block").eq(0).show()}, 0);
		
		var initData = xuiService.getPageParams();
		xuiDoc.get(initData["d_id"],"data");
		
	};
	
	Model.prototype.loadCSS = function() {
		var cssPaths = [];
		for(var i=0;i<this.paths.length;i++)
			cssPaths[i] = ("css!" + this.paths[i]).replace(/\.css$/, '');
		require(cssPaths, function(){
			for(var i=0;i<arguments.length;i++)
				arguments[i].load();
		});
	};

	Model.prototype.render = function() {
		var s = [], iconsGroup, container = $('.container'), id, had = {};

		if (!this.icons)
			return;
		iconsGroup = this.icons;
		var j, icon, value;
		if (this.style == 'block') {
			for(var i=0; i<iconsGroup.length; i++){
				var icons = iconsGroup[i];
				var name = this.names[i];
				s.push('<ul class="block" name="' + this.paths[i] + '">');
				for (j in icons) {
					id = guid();
					icon = icons[j];
					value = icon;
					if(name != "icon")//系统自带
						value = name + ' ' + value; 
					if (had[icon])
						continue;
					had[icon] = true;
					s.push('<li id="'
							+ id + '" icon="' + icon + '" title="' + icon + '"><label for="' + id + '-radio"><i class="icon36 ' + value
							+ '"></i></label><br><input id="' + id + '-radio" type="radio" name="value" value="' + value + '"/></li>');
				}
				s.push('</ul>');
			}
		} else {
			//TODO:
			s.push('<ul class="list">');
			for (j in icons) {
				id = guid();
				icon = icons[j];
				if (had[icon])
					continue;
				had[icon] = true;
				s.push('<li id="'
						+ id + '" icon="' + icon + '"><input id="' + id + '-radio" type="radio" name="value" value="' + icon + '"/><label for="' + id
						+ '-radio"><i class="' + icon + '"></i><span>&nbsp;' + icon + '</span></label></li>');
			}
			s.push('</ul>');
		}

		container.append(s.join(''));
		var me = this;
		container.on('click', 'li', function() {
			var icon = $(this).attr('icon');
			me.onSelect(icon);
		});
	};

	Model.prototype.getValue = function(icons) {
		return $("input[name='value']:checked").val();
	};

	Model.prototype.onSelect = function(name) {
		if (!name)
			return;
		this.icon = name;
		var icon = name.split(" ").pop();
		var current = $('li[icon="' + icon + '"] input[type=radio]').get(0);
		if (current)
			current.checked = true;
		$('.container li').removeClass('active');
		$('li[icon=' + icon + ']').addClass('active');
	};

	Model.prototype._setIcon = function(icon) {// "icon-refresh"/"img:xxx.png|xxx.png"
		if (typeof (icon) == 'string' && 0 === icon.indexOf('img:')) {
			this.isImgIcon.set(true);
			var ipos = icon.indexOf('|');
			if (ipos < 0)
				ipos = icon.length;
			this.imgIcon.set(icon.slice(4, ipos));
			this.disimgIcon.set(icon.slice(ipos + 1, icon.length));
		} else {
			this.isImgIcon.set(false);
			this.icon = icon;
		}
		this.comp('image').val(this.isImgIcon.get());
		this.comp('facefont').val(!this.isImgIcon.get());
	};

	Model.prototype.facefontChanged = function(event) {
		this.isImgIcon.set(!event.checked);
	};

	Model.prototype.imageChanged = function(event) {
		this.isImgIcon.set(event.checked);
	};

	Model.prototype.selectFileChange = function(event){
		$('.block').hide();
		$('[name="' + event.value + '"]').show();
	};

	return Model;
});