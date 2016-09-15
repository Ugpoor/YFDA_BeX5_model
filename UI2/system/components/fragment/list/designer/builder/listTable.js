define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//var bizService = require("$UI/system/components/designerCommon/js/bizModelService");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	
	var templateMap = {
	};

	var layoutData;
	var componentName = "$UI/system/components/fragment/list/listTable";
	
	var dataRelationloaded = {};
	
	var Model = function(){
		this.callParent();
		this.update = justep.Bind.observable(false);
		this.inited = justep.Bind.observable(false);
		this.extendIcon = justep.Bind.observable("");
	};
	
	Model.prototype.getRelations = function(dataid){
		var update = this.update.get();
		if(update){
			var ret = [];
			var data = this.comp('relationList');
			data.each(function(param){
				if(param.row.val('data')===dataid)
					ret.push(param.row);
			});
			return ret;
		}else return [];
	};
	
	Model.prototype.getRows = function(){
		var inited = this.inited.get();
		if(!inited) return [];
		var data = this.comp('setting');
		var row = data.getCurrentRow();
		var ret = row?row.children():null;
		return ret?ret:[];
	};
	
	var labelHtml = function(data,col,clz){
		return "<th "+(clz?("class='"+clz+"'"):"")+"><label bind-text=\"$model."+data+".label('"+col+"')\"></label></th>";
	};
	
	var compHtml = function(compType,col){
        return "<td>"+getCompTemplate(compType,' bind-ref="ref(\''+col+'\')"')+"</td>";
	};

	/**获取组件模板***/
	var getCompTemplate = function(compName,appendAttrs){
	   var templateContent = templateMap[compName];
	   if(!templateContent){
	     templateContent =  xuiDoc.getTemplate(compName);
	     templateMap[compName] = templateContent;
	   }
	   if(templateContent){
		   var idx = templateContent.indexOf(">");
		   var idx1 = templateContent.indexOf("/>");
		   if(idx1>0 && idx1<idx){
		      idx = idx1;
		   }
		   if(idx>0){
		      templateContent = templateContent.substring(0,idx)+appendAttrs+templateContent.substring(idx);
		   }
	   }
	   return templateContent;
	};

	var processTemplate = function(extendIcon, row, datas, parantDataID){
	   if(!row) return "";	
	   var data = row.val('data');
	   if(!data) return "";
	   var masterCol = row.val('masterCol');
	   var relations = datas[data];
	   if(!relations) return "";
	   var colSize = relations.length;	
	   var t = '<div component="$UI/system/components/fragment/list/listTable" data="{0}" masterData="{1}" masterCol="{2}">' 
		         +'<div component="$UI/system/components/justep/list/list" class="x-list" data="{3}">'
                   +'<table class="table table-bordered table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table">' 
                  +'<thead>' 
                    +'<tr class="{4}">{5}</tr>' 
                  +'</thead>'  
                  +'<tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null">' 
                    +'<tr class="{6}" {7}>{8}</tr>'
 					+'{9}'	
                  +'</tbody>' 
                +'</table>'
              +'</div>'
            +'</div>';
        var head='',comps='',children='',trBindClick='',isExpand = row.val("expand");

        if(row.hasChildren()){
        	var rows = row.children();
        	$.each(rows,function(i,row){
        		children += processTemplate(extendIcon,row,datas,data);
        	});
        }
        if(row.val("useIndex")){
        	head += "<th width='60px'><label></label></th>";
        	comps += "<td class='text-center' style='vertical-align:middle;'><i class='x-expand-i "+(isExpand||!children?"":extendIcon)+"' style='color:#808080;padding-right:6px;'/><label bind-text='$index()+1'></label></td>";
        	colSize++;
        }
        
        $.each(relations,function(i,v){
        	head += labelHtml(data,v.val('name'));
        	comps += compHtml(v.val('compType'),v.val('name'),parantDataID?data:"");
        });
        
        if(children){
        	var hideClass = isExpand?"":"class='hide'";
        	children = '<tr '+hideClass+'><td colspan="'+colSize+'">'+children+'</td></tr>';
        	trBindClick = 'bind-click="function(){var $e = $($element);$(\'>td>i.x-expand-i\',$e).toggleClass(\''+extendIcon+'\');$e.next().toggleClass(\'hide\');}"';
        }else children = "";
                
	    return justep.String.format(t,
	    		data,
	    		(parantDataID?parantDataID:''),
	    		(masterCol?masterCol:''),
	    		data,
	    		(parantDataID?"danger":"success"),
	    		head,
	    		(parantDataID?"warning":"info"),
	    		trBindClick,
	    		comps,
	    		children);
	};
	
	/**点确定前调用的处理，做校验**/
	Model.prototype.beforeOkAction = function(){
	   var settingData = this.comp("setting");
	   var row = settingData.getCurrentRow();
	   var dataXid = row.val("data");
	   if(!dataXid){
	       return "请选择主data";
	   }
	   
	   var errorDatas = [];
	   var datas = {};   
	   settingData.each(function(param){
		   var data = param.row.val('data');
		   if(data){
			   datas[data]=[];
			   if(row!==param.row && !param.row.val('masterCol'))
				   errorDatas.push(data);
		   }
	   });   
	      
	   if(errorDatas.length > 0){
	       return "从Data["+errorDatas.join(',')+"]请选择关联主数据列";
	   }

	   var relationListData = this.comp("relationList");
		relationListData.each(function(param){
			var data = param.row.val('data');
		    var selected = param.row.val("selected");
		    if(selected){
		      if(undefined!==datas[data])
		    	  datas[data].push(param.row);
		    }
		});

		errorDatas = [];
		$.each(datas, function(n,v){
			if(v.length<=0) errorDatas.push(n); 
		});
		
	   if(errorDatas.length > 0){
	       return "Data["+errorDatas.join(',')+"]请选择关系";
	   }
	
	   layoutData = processTemplate(this.extendIcon.get(), row, datas);
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
		
		var setingData = this.comp("setting");
		setingData.add({"id":"2","parent":"1","useIndex":true},setingData.getCurrentRow(true),true);
		this.inited.set(true);
	};

    /** 选择数据 **/
	Model.prototype.select2Change = function(event){
		this.update.set(false);
		 var value = event.value;  
		 if(value && !dataRelationloaded[value]){
		   var datasource =  xuiDoc.getEditorDataSource("RuleRelationDatasource.getDatasource","xid",value);
		   for(var i = 0;i<datasource.length;i+=1){
		      datasource[i].compType = "$UI/system/components/justep/input/input";
		   }
		   var rows = this.comp("relationList").loadData({rows:datasource}, true);
		   for(i=0; i<rows.length; i++){
			   rows[i].val('data',value);
		   }
		   
		   dataRelationloaded[value] = true;
		 }
		this.update.set(true);
	};

	Model.prototype.checkAllChange = function(event){
		var dataid;
	   if(this===event.bindingContext.$object) dataid = this.setting.val('data');
	   else dataid = event.bindingContext.$object.val('data');
	   if(dataid){
		   var relationList = this.getRelations(dataid);
		   $.each(relationList,function(i,row){
			   row.val("selected",event.checked);
		   });
	   }
	};

	return Model;
});