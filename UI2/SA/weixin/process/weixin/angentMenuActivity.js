define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var WxCpUtils = require("$UI/SA/weixin/WxCpUtils");
	
	var corpID = "";
	var operator = "";
	var angentRow = null;
	var AngentArr = null;   //已有应用数组
	var isLoad = "0";	
				
	var Model = function(){
		this.callParent();
	};
   
     Model.prototype.checkURL = function() {
		 var data = this.comp('treedata');
		 var info = "";
		 data.each(function(options) {
			var row = options.row;	
			if(row.val("level")!= "应用"  && !row.hasChildren() &&  row.val("path")=="" ){
				info = info + row.val("Name") +"\n"
			}
			
		});
		return info;
		
	 };
	 
	 Model.prototype.checkName = function(){
		 var data = this.comp('treedata');
		 var info = "";
		 
		 data.each(function(options) {
			var row = options.row;	
			if(row.val("Name")==null || row.val("Name")== ""){
				info = "名称不能为空，请补充完整！";
				return ;
			}
			
		});
		
		return info;
		
	 };
    
	
	
	Model.prototype.treedataCreate = function(event){
		event.source.defTreeOption.isTree = true;
		event.source.defTreeOption.prarentRelation = "parent";
		event.source.defTreeOption.nodeKindRelation = "Name";
		event.source.directDeleteMode = true;
	};
    
	
	
	Model.prototype.treedataCustomRefresh = function(event){
		//加载菜单数据
		if(isLoad == "0"){
			var angentID = angentRow.val("agentId");
			var params = new biz.Request.ActionParam();                                
	         
			params.setString("sCode", angentID);
			params.setString("isSingle", "否");
			biz.Request.sendBizRequest({
				"context": this.getContext(),                     
		  
				"action": "getMenuConfigAction",
				"parameters": params,
				"callback": function(result) {
					if (result.state) {
						var configstr = result.response;
						if(configstr != null && configstr!= "" && configstr != "invalid"){
							configstr = "{\"@type\" : \"table\",\"rows\" :"+configstr+"}" ;
			    	
							event.source.loadData($.parseJSON(configstr));			    	
			      
						}
				  
					} else {
						throw new Error("加载数据失败！|" + result.response.message);
					}
				}
			});
		  isLoad = "1";
		}
	};
    
	


	
	Model.prototype.saveMenuData = function(angentID,oldAngentID) {

       var data = this.comp("treedata");
       var json = data.toJson();
       var sjson = JSON.stringify(json);       
       delete  json.userdata;   
       var jsonStr =JSON.stringify(json);
       var params = new biz.Request.ActionParam();                                
	   params.setString("strJson", jsonStr);
	   params.setString("angentID", angentID);
	   params.setString("oldAngentID", oldAngentID);
	   params.setString("isSingle", "否");
       biz.Request.sendBizRequest({
            "context": this.getContext(),                    
             	
			"action": "saveMenuConfigAction",
			"parameters": params,
		
			"callback": function(result) {
				if (result.state) {
			    
				} else {
					throw new Error("保存失败！|" + result.response.message);
				}
			}
       });
	};
	//检查企业号信息是否填写完整
	
	Model.prototype.checkAngent = function(row){
		var msg = "";
		
		if(row.val("agentId") == "" || row.val("agentId") == undefined)
			msg = "应用ID不能为空"+"/n";
		if(row.val("callbackDomain") == "" || row.val("callbackDomain") == undefined)
			msg = msg + "可信站点不能为空"+"/n";
		if(row.val("userId") == "" || row.val("userId") == undefined)
			msg = msg + "微信账号不能为空"+"/n";
		if(row.val("corpSecret") == "" || row.val("corpSecret") == undefined)
			msg = msg + "管理组密钥不能为空"+"/n";
		if(row.val("token") == "" || row.val("token") == undefined)
			msg = msg + "token 不能为空"+"/n";
		if(row.val("aesKey") == "" || row.val("aesKey") == undefined)
			msg = msg + "加密密钥不能为空"+"/n";
		return msg;
	};
	
	Model.prototype.SynchMenu = function(row){
		
	//检查应用数据是否完整
        var returnresult = false;
		var msg = this.checkAngent(row);
		if(msg != ""){
			alert(msg);
			return false;
		}
     //检查是否有名称为空的数据
		var info = this.checkName();
		if(info != ""){
			alert(info);
			return false;
		}
	
	 //检查最末级数据是否有功能URL，如果没有，则提示添加
		info = this.checkURL();
		if(info != ""){
			alert("以下菜单节点需要设置功能路径："+info);
			return false;
		}
		this.fullMenuData();
       
		this.saveMenuData(row.val("agentId"),row.val("oldagentId"));
		var actionName="menuSynchToWxAction";
		var errInfo = "";
	
        var AppID = row.val("agentId");//"1";
         var configKey =row.val("corpId") + AppID;// "wx415777370afff229";
           
     
        var SynchToWxUrl = require.toUrl('$UI/SA/weixin/Synchweixin.j?actionName='+actionName+"&agentId="+AppID+"&isSingle=否"+"&configKey="+configKey);

	     $.ajax({
	            type: "POST",
	            processData: false,
	            url:  SynchToWxUrl,
	            cache:false,
	            async: false,
	            success : function(result) {  returnresult = true ;},
				error : function(xhr, status, err) {
		
					var erroeMsg = "同步菜单出错：" + [ status, xhr.status, err ];
				}
			
					
	        });
	   
	     return returnresult;
	};
	
	
	Model.prototype.okBtnClick = function(event){
 
      //回传应用数据及原应用ID，保存菜单配置
      var row = this.comp("wxset").getCurrentRow();
       //判断是否设置了菜单
       var menucount = this.comp("treedata").getCount();
      

       if(menucount == 0 ){
    	   if(!confirm("当前应用没有设置菜单，是否继续？"))
    		   return;
    	   else
    		   this.comp('windowReceiver').windowEnsure(row);
       }else{
    	   if(!this.SynchMenu(row)){
    		   if(confirm("同步菜单失败，是否继续？")){
    			   this.comp('windowReceiver').windowEnsure(row);
    		   }
    	   }else
    		   this.comp('windowReceiver').windowEnsure(row);
       } 
     
    	   
	};
    
	
	
	Model.prototype.windowReceiverReceive = function(event){
		 corpID = event.data.corpID;
		 operator = event.data.operator;
		 angentRow = event.data.row;
		 AngentArr = event.data.AngentArr;
		 if(operator == "new"){ //新增应用
			 this.comp("wxset").newData({
				 index : 0,
				 defaultValues : [ {
					 "id" : justep.UUID.createUUID(),
					 "corpId" :corpID
				 } ]
			 });
		 }else{  //编辑应用及菜单
		   //加载数据
			 this.comp("wxset").newData({
				 index : 0,
				 defaultValues : [ {
					 "id" : justep.UUID.createUUID(),
					 "corpId" :corpID,
					 "agentId" : angentRow.val("agentId"),
					 "callbackDomain" : angentRow.val("callbackDomain"),
					 "userId" : angentRow.val("userId"),
					 "corpSecret" : angentRow.val("corpSecret"),
					 "token" : angentRow.val("token"),
					 "aesKey" : angentRow.val("aesKey"),
					 "oldagentId":angentRow.val("agentId")
				 } ]
			 });
			 //加载菜单
			 var data = this.comp("treedata"); 
			 isLoad = "0";
			 if (!data.isLoaded()) {
				 data.refreshData();
			 }
		 }
	};
    
	
	
	Model.prototype.btnNewMenuClick = function(event){
	
		var data = this.comp("treedata");
		var ParentRow = data.getCurrentRow();
		
		var parent = "";
		var defaultlevel = "";  
		if(!ParentRow){   //如果是虚根 
		    defaultlevel = "一级菜单";
		    //一级菜单最多为3个
		    var rows = this.comp('treedata').find(['parent'],[parent]);
		    if(rows.length == 3){
		    	alert("一级菜单最多3个");
		    	return;
		    }
		}
	    else if(ParentRow.val("level") == "一级菜单"){
		    defaultlevel = "二级菜单";
		    parent = ParentRow.val("id");
		    var rows = this.comp('treedata').find(['parent'],[parent]);
		    if(rows.length == 5){
		    	alert("二级菜单最多5个");
		    	return;
		    }
		}
		else{
			  alert("菜单树最多三级");
			 return;
		 }
		if(!ParentRow){ 
			data.newData({
				index : 0,
				defaultValues : [ {
					"id" : justep.UUID.createUUID(),
					"parent":parent,
					"level":defaultlevel,
					"funcURL" : "",
					"path" : ""
				} ]
			});
		}else{
		 data.newData({
		    parent : ParentRow,
			index : 0,
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"parent":parent,
				"level":defaultlevel,
				"funcURL" : "",
				"path" : ""
			} ]
		});
		}
	};
    
	
	
	Model.prototype.span14Click = function(event){
       //选择功能
		this.comp("functionDialog").open({
				"data" : {
					"roots" : "UI2",
					"files" : ".function.xml", 
					"identity" : true
				}	
			});
	};
    
	
	
	Model.prototype.functionDialogReceive = function(event){

		//只存储 path ,funcURL,name
	     var data = event.data;
	     var treedata = this.comp("treedata");

         treedata.setValue("path",data.row.path.value.latestValue );  
	     var URL =  data.row.url.value.latestValue+"?process="+data.row.process.value.latestValue+"&activity="+data.row.activity.value.latestValue;
	     URL = URL.replace("$UI","../..");
		 treedata.setValue("funcURL",URL);
	};
    
	//补充完整数据,填充URL
	Model.prototype.fullMenuData = function(){

	    var hrefPathname = window.location.pathname;
	    var arrPath = hrefPathname.split("/");
	    
		var data = this.comp('treedata');	
		var wxsetrow = this.comp("wxset").getCurrentRow();
		var corpId = this.StringTrim(wxsetrow.val("corpId"));
	    var configKey = this.StringTrim(wxsetrow.val("corpId"))+this.StringTrim(wxsetrow.val("agentId"));
	    var httpURL = this.StringTrim(wxsetrow.val("callbackDomain"))+"/"+arrPath[1];	
	    
		 data.each(function(options) {
	
			var row = options.row;	
			var path = row.val("path").replace(/(^\s*)|(\s*$)/g, "");
			//此处需加入判断是否是根节点
			if(row.val("funcURL") == ""){
			   
			    if(path != "" && path.indexOf("http://") == -1)
        	        path = "http://"+path;
			    row.val("URL",path);
				
			}else{  
				var wxURL = WxCpUtils.createMenuUrl(httpURL,row.val("funcURL"),corpId,configKey); 
				row.val("URL",wxURL);
			}
			
		});
	
	};
	
	Model.prototype.btnDeleteMenuClick = function(event){
		 var data = this.comp('treedata');
	     var parent = data.getCurrentRowID();
		 var rows = data.find(['parent'],[parent]);
		 if(rows.length > 0){
			 alert("当前数据有子节点，请先删除下级节点！");
			 return;
		 }
		 data.deleteData(data.getCurrentRow());
	};
	

	
	Model.prototype.treedataValueChanged = function(event){
		if(event.col == "Name"){
	        var row = event.row.row;
	        if(row.level.value.latestValue == "一级菜单" && event.value != "" && event.value.length>=16){
	            alert("一级菜单标题不能超过16个字节！");
	        	event.value = "";	
	        	this.comp('treedata').setValue("Name",event.value,row.id.latestValue);	        	
	        }
	        
	        if(row.level.value.latestValue == "二级菜单" && event.value != "" && event.value.length>=40){
	            alert("二级菜单标题不能超过40个字节！");
	        	event.value = row.Name.originalValue;	        
	        	this.comp('treedata').setValue("Name",event.value,row.id.latestValue); 	
	        }   	    
	    }
       if(event.col == "path" ){
    	 
    	   var path = event.value.replace(/(^\s*)|(\s*$)/g, "");
	       if(path == ""){
	    	   var row = this.comp("treedata").getCurrentRow();
	    	   row.val("URL","");
	    	   row.val("funcURL","");
	       }
    	 
       } 
	};
	
	Model.prototype.StringTrim = function(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	};
	Model.prototype.wxsetValueChanged = function(event){
         //判断当前修改的企业号是否已经存在，如果存在则改回原值
         if(event.col == "agentId" ){
        	 var row = event.row.row;
        	 if(!angentRow){
        		 if(AngentArr.indexOf(event.value)!= -1){		    
        				 alert("当前应用已经存在！请定位应用进行编辑操作");
        				 this.comp("wxset").setValue("agentId","");
        	      }
        	 }else{
        		 if(event.value != angentRow.val("agentId")){
        		 //企业号发生变化，判断当前企业号是否在
        			 if(AngentArr.indexOf(event.value)!= -1){		    
        				 alert("当前应用已经存在！请定位应用进行编辑操作");
        				 this.comp("wxset").setValue("agentId",angentRow.val("agentId"));
        			 }
        		 }
        	 }
         }
         
        if(event.col == "callbackDomain"){
        	 //判断当前填写的数据是否有http
 
             var callDomain = event.value.toLowerCase();
        	 if(callDomain.indexOf("http") == -1 && callDomain != ""){
        		  alert("可信域名必须是http的方式");
        		  this.comp("wxset").setValue("callbackDomain","");
        	 }
         }
	};
	
	return Model;
});