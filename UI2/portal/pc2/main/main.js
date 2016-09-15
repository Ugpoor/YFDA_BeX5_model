define(function(require){
	var biz = require("$UI/system/lib/biz");
	
	var defaultLayout = {
		column1 : {
			cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6',
			widgets: ["TaskWaiting"]
			
		},
		column2 : {
			cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6',
			widgets: ["TaskSubmit"]
		}
	};
	var layouts = {
		layout1: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			}
		},
		layout2: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			}
		},
		layout3: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-12 col-lg-12'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
		},
		layout4: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-12 col-lg-12'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column4 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			}
		}
	};
	
	var Model = function(){
		this.callParent();
		this._activeCount = 0;
	};

	Model.prototype.modelLoad = function(event){
		if(this.getContext().isDebug())
			$(".debug-mode",this.getRootNode()).removeClass('hide');
		var me = this;
		this.layoutID = 'layout1';
		var widgetList = this.getContext().data.widgetList || 
			(window.__justep.__portalContext && window.__justep.__portalContext.data.widgetList)
		if(!widgetList)
			throw '系统没有获得widget列表';
		this.widgetList = widgetList.menu.$children;
		this.widgetsComp = this.comp('widgets');
		var customCfg = this.getCustomLayout();
		if(customCfg && customCfg.layoutID)
			this.layoutID = customCfg.layoutID;
		var widgetConfig = this.getWidgetConfigs(customCfg || justep.Util.clone(defaultLayout));
		this.widgetsComp.load(widgetConfig);
		this.widgetsComp.on('change', function(event){
			me.saveCustomLayout();
		});
	};
	
	Model.prototype.getCustomLayout = function(){
		//获取个人布局信息
		var result;
		var params = new biz.Request.ActionParam();
		var pID = this.getContext().getCurrentPersonID();
		params.setString("personID", pID);
		var options = {};
		options.context = this.getContext();
		options.action = "selectPortal3ProfilesAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.process = "/portal2/process/portal/portalProcess";
		options.activity = "index";
		options.callback = function(options) {
			if (options.state) {
				if(options.response.sPortal){
					eval('result = ' + options.response.sPortal);
				}
			}
		};
		biz.Request.sendBizRequest(options);
		return result;
	};
	
	Model.prototype.saveCustomLayout = function(){
		//获取个人布局信息
		var params = new biz.Request.ActionParam();
		var pID = this.getContext().getCurrentPersonID();
		params.setString("personID", pID);
		var config = this.widgetsComp.getWidgetConfig();
		config.layoutID = this.layoutID; 
		params.setString('portal', JSON.stringify(config));
		var options = {};
		options.context = this.getContext();
		options.action = "savePortal3ProfilesAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.process = "/portal2/process/portal/portalProcess";
		options.activity = "index";
		options.callback = function(options) {
			if (options.state) {
			}
		};
		biz.Request.sendBizRequest(options);
	};
	
	Model.prototype._getLayoutConfig = function(){
		var config = this.widgetsComp.getWidgetConfig();
		config.layoutID = this.layoutID;
		return config; 
	};
	
	Model.prototype.getWidgetConfigs = function(layout){
		for(var col in layout){
			if(layout.hasOwnProperty(col)){
				var widgets = layout[col].widgets;
				if(widgets)
					for(var i=0; i<widgets.length; i++){
						var widget = widgets[i];
						if(typeof widget == 'string')
							widget = {id: widget};
						widget = this.getWidgetConfig(widget);
						widgets[i] = widget;
					}
			}
		}
		return layout;
	};
	
	Model.prototype.getWidgetConfig = function(widget){
		if(typeof widget == 'string')
			widget = {id: widget};
		var config = this.getWidget(widget.id);
		if(config){
			widget.title = config.title;
			widget.refreshable = config.refresh;
			widget.url = config.url;
			widget.activity = config.activity;
			widget.process = config.process;
			widget.height = config.height;
			widget.psmCount = config.psmCount;
			if(config.$children && config.$children.length > 0){
				for(var j=0; j<config.$children.length; j++){
					var childCfg = config.$children[j];
					if(childCfg.$name == 'more'){
						widget.more = childCfg; 
					}
				}
			}
		}else{
			widget.illegal = true;
		}
		return widget;
	};
	
	Model.prototype.getWidget = function(id){
		function walk(list){
			var item;
			for(var i=0; i<list.length; i++){
				item = list[i];
				if(item.id === id)
					return item;
				if(item.$children){
					item = walk(item.$children);
					if(item)
						return item;
				}
			}
		}
		return this.widgetList? walk(this.widgetList) : null;
	};

	Model.prototype.configBtnClick = function(event){
		this.comp("configDialog").open({data: {id: this.layoutID}});
	};

	Model.prototype.configDialogReceive = function(event){
		var widgets = this.comp('widgets');
		if(this.layoutID !== event.data.layoutID){
			var config = layouts[event.data.layoutID];
			if(config){
				this.layoutID = event.data.layoutID;
				widgets.setLayout(config);
				this.saveCustomLayout();
			}
		}
		var opened = event.data.opened;
		if(opened){
			for(var id in opened){
				if(opened.hasOwnProperty(id)){
					if(opened[id] === false && widgets.hasWidget(id))
						widgets.removeWidget(id);
				}
			}
			for(var id in opened){
				if(opened.hasOwnProperty(id)){
					if(opened[id] === true && !widgets.hasWidget(id)){
						var config = this.getWidgetConfig(id);
						widgets.openWidget(config);
					}
				}
			}
		}
	};

	return Model;
});