define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//var bizService = require("$UI/system/components/designerCommon/js/bizModelService");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	
	var layoutData;
	var componentName = "$UI/system/components/fragment/list/scrollviewList";
	
	var Model = function(){
		this.callParent();
		this.listType = justep.Bind.observable('UL');
		this.dataXID = justep.Bind.observable();
	};
	
	var getListTemplate = function(dataXID, listType){
       var listTemplates 
       		= {'DIV' : '<div class="x-list" component="$UI/system/components/justep/list/list" data="{0}" limit="-1">' 
       					+' <div class="x-list-template">' 
       					+'   <div></div>' 
       					+' </div>' 
       					+'</div>',
       			'UL' : '<ul class="x-list x-list-template" component="$UI/system/components/justep/list/list" data="{0}" limit="-1">' 
       					+'   <li></li>' 
       					+'</ul>',
       			'TABLE' : '<table class="x-list" component="$UI/system/components/justep/list/list" data="{0}" limit="-1">' 
       					+' <tbody class="x-list-template">' 
       					+'   <tr><td/></tr>' 
       					+' </tbody>' 
       					+'</table>'
       			};
       return justep.String.format(listTemplates[listType], dataXID);			
	};
	
	var processTemplate = function(dataXID, listType){
	   var t = '<div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView">' 
            	+' <div class="x-content-center x-pull-down container">' 
            	+'   <i class="x-pull-down-img glyphicon x-icon-pull-down"/>'  
            	+'   <span class="x-pull-down-label">下拉刷新...</span>' 
            	+' </div>'  
            	+' <div class="x-scroll-content">{0}</div>'  
            	+' <div class="x-content-center x-pull-up">' 
            	+'   <span class="x-pull-up-label">加载更多...</span>' 
            	+' </div>' 
            	+'</div>';

	    return justep.String.format(t, getListTemplate(dataXID, listType));
	};
	
	/**点确定前调用的处理，做校验**/
	Model.prototype.beforeOkAction = function(){
	   var listType = this.listType.get();
	   var dataXID = this.dataXID.get();
	   if(!listType){
	       return "请选择List组件模板";
	   }	
	   layoutData = processTemplate(dataXID, listType);
	};
	
	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function(){
		return {templateContent:layoutData,componentName:componentName}; 
	};

	Model.prototype.modelLoad = function(event){
	    //获取上下文参数
		this.context = xuiService.getPageParams();
		var data = this.comp("dataList");
	    data.add({col0:""});
		var sNodes = xuiDoc.selectNodes("//*[@component='$UI/system/components/justep/data/bizData' or @component='$UI/system/components/justep/data/data' or @component='$UI/system/components/justep/data/baasData']");
		$(sNodes).each(function(idx){
		   var $this = $(this);  
		   data.add({col0:$this.attr("xid")});
		});
	};

	return Model;
});