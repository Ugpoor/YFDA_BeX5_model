define(function(require){
	var $ = require("jquery");

	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
    var WxCpUtils = require("$UI/SA/weixin/WxCpUtils");
	var isLoad = "0";
	var MenuisLoad = "0";
	var erroeMsg = "";
	var corpLoaded = false;  //微信企业号配置是否加载成功
	var wxConfigisChange = false;
	
	var Model = function(){
	    this.initOK = justep.Bind.observable(false);
	    
	    this.canOK = justep.Bind.computed(function(){
			if(!this.initOK.get()) return false;
			else
			   return true;
		},this);
		
		this.callParent();
		
	};

	Model.prototype.modelModelConstructDone = function(event){
		var dwxset = this.comp("wxset");
		dwxset.refreshData();
		isLoad = "0";
		

		if(!corpLoaded){
			this.comp("wxset").newData({
				index : 0,
				defaultValues : [ {
					"id" : justep.UUID.createUUID()
				
				} ]
			});

		}else{
		   
		     var data = this.comp("treedata"); 
			 MenuisLoad = "0";
			 if (!data.isLoaded()) {
				 data.refreshData();
			 }
			  
			 this.setcallbackURL(); 
            	 
		}
		
		
		 this.IndexMenu();	
	};


    Model.prototype.setcallbackURL = function(){
        var dwxset = this.comp("wxset");
        var wxsetrow = dwxset.getCurrentRow(); 
		if(wxsetrow.val("callbackDomain") != "" && wxsetrow.val("callbackDomain") != undefined
                  && wxsetrow.val("corpId") != "" && wxsetrow.val("corpId") != undefined
                  && wxsetrow.val("agentId") != "" && wxsetrow.val("agentId") != undefined ){
            	 var hrefPathname = window.location.pathname;
            	 var arrPath = hrefPathname.split("/");
            	 var callbackURL = this.StringTrim(wxsetrow.val("callbackDomain"))+"/"+arrPath[1] + "/UI2/SA/weixin/weixinCallback.j?configKey="
            	                   +wxsetrow.val("corpId") + wxsetrow.val("agentId");
            	 var callbackData = this.comp("callbackData");
            	 callbackData.setValue("callbackURL",callbackURL);
        }
        
	};

	
    Model.prototype.StringTrim = function(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	};

    
     Model.prototype.savewxConfig = function(){ 
    	 //保存微信配置数据
    	
        var dwxset = this.comp("wxset");
        var xmlStr = "";
        var corpId = this.comp("wxset").getValue("corpId");
        if(corpId == "" || corpId == undefined){
        	alert("请维护CorpID信息！");
        	return false;
        }
        corpId = this.StringTrim(corpId);
    
			var row = dwxset.getCurrentRow();	
		    var accessToken = row.val("accessToken"); 
		    if(accessToken == undefined)
		        accessToken = "";
			var expiresIn = row.val("expiresIn");
			if(expiresIn == undefined)
		        expiresIn = "";
			var departmentId = row.val("departmentId"); 
			if(departmentId == undefined)
		        departmentId = "";
			var tagId = row.val("tagId");
			if(tagId == undefined)
		        tagId = "";
			        
			corpsStr = "<corps>"
			        +"<corpId>"+corpId+"</corpId>" 
			        +"<corpSecret>"+row.val("corpSecret")+"</corpSecret>" 
			        +"<agentId>"+row.val("agentId")+"</agentId>" 
			        +"<token>"+row.val("token")+"</token>" 
			        +"<aesKey>"+row.val("aesKey")+"</aesKey>" 
			        +"<accessToken>"+accessToken+"</accessToken>" 
			        +"<expiresIn>"+expiresIn+"</expiresIn>" 
			        +"<userId>"+row.val("userId")+"</userId>" 
			        +"<departmentId>"+departmentId+"</departmentId>" 
			        +"<tagId>"+tagId+"</tagId>" 
			        +"<callbackDomain>"+row.val("callbackDomain")+"</callbackDomain>"
			        +"</corps>" ;
	          
		if(corpsStr != "")
			xmlStr = "<xml>" +corpsStr +"</xml>";
		var wxdata = this.comp("WeixinCp");
		var count = wxdata.getCount();
		if(count == 0){
		 
			wxdata.newData({
				index : 0,
				defaultValues : [ {
					"SA_WeixinCp" : "weixinCp.cropsConfig",
					"sName":"微信企业号配置",
					"sCode":'WxCpConfig',
					"version":0,
					"sType":"weixinCp"
					
			} ]
           });
		}
		wxdata.saveData();
		//此处重新生成缓存
	
		var configKey = this.StringTrim(row.val("corpId")) + row.val("agentId");
		this.reLoadWxCache(xmlStr,configKey);
	/*
		if(orginCorpID != corpId){
		
		//修改部门的swxDeptID为空
			biz.Request.sendBizRequest({
				"context": this.getContext(),                    
             	
				"action": "modifyOrgwxDeptIDAction",
			
				"callback": function(result) {
					
				}
			});
		}
  */
		return true;
    };
    
    Model.prototype.reLoadWxCache = function(sText,configKey) {
      
         var params = new biz.Request.ActionParam();                                
	   
			params.setString("sText", sText);
		
			biz.Request.sendBizRequest({
				"context": this.getContext(),                     
		  
				"action": "reLoadWxCacheAction",
				"parameters": params,
				"callback": function(result) {
					
				}
			});          
    
	};
	
    
	Model.prototype.btnOrgSynchClick = function(event){
	    //判断是否保存了企业号及应用配置，怎样判断？
	
	    
	    var dwxset = this.comp("wxset");
	    if(dwxset.isChanged()){
	    	if(!this.savewxConfig())
	    		return;
	    }
	       
	    
	    
	//	var corpRow = dcorp.getCurrentRow();
		var row = dwxset.getCurrentRow();
	    if(!row){
	    	alert("请维护应用信息");
	    	return;
	    }
	    

		var actionName = "orgSynchToWeixinAction";
		var configKey = this.StringTrim(row.val("corpId")) + row.val("agentId");
		var AccountType = "人员编码";    
		        
		var SynchToWxUrl = require.toUrl('$UI/SA/weixin/Synchweixin.j?actionName='+actionName+"&AccountType="+AccountType+"&configKey="+configKey);
		alert("同步操作已在后台执行，执行结果请进入功能“\协同办公\系统工具\操作日志”，以“微信”进行模糊搜索");

	    var result = $.ajax({
	            type: "POST",
	            processData: false,
	            url:  SynchToWxUrl,
	            success: function(data){
                      //同步机构完成后，同步人员
                
                      var psnactionName = "psnSynchToWeixinAction";
                       var psnSynchToWxUrl = require.toUrl('$UI/SA/weixin/Synchweixin.j?actionName='+psnactionName+"&AccountType="+AccountType+"&configKey="+configKey);
                       $.ajax({
                    	   type: "POST",
                    	   processData: false,
                    	   url:  psnSynchToWxUrl,
                    	   success: function(data){
                    		   alert("同步完成！");
                    	   },
                    	   cache:false,
                    	   async: true
                       });
                       
                    },
	            cache:false,
	            async: true
	        });
	      
	};
 
 
	Model.prototype.wxsetCustomRefresh = function(event){
		if(isLoad == "0"){
		
			var jsonstr = "";
		    
			biz.Request.sendBizRequest({
				"context": this.getContext(),                    
             	
				"action": "getweixinSetAction",
			
				"callback": function(result) {
					if (result.state) {
				       
						jsonstr = result.response;
		                if(jsonstr == "")
		                	return;
						event.source.loadData($.parseJSON(jsonstr));
						//企业号数据集加载数据
						corpLoaded = true;
						
					} else {
						throw new Error("加载数据失败！|" + result.response.message);
					}
				}
			});
			
						
        	isLoad = "1";
       }
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
		if(MenuisLoad == "0"){
		    var angentID = this.comp("wxset").getValue("agentId");
			var params = new biz.Request.ActionParam();                                
	   
			params.setString("sCode", angentID);
			params.setString("isSingle", "是");
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
		  MenuisLoad = "1";
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
	   params.setString("oldAngentID", "");
	   params.setString("isSingle", "是");
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
		/*if(row.val("userId") == "" || row.val("userId") == undefined)
			msg = msg + "微信账号不能为空"+"/n";
        */
		if(row.val("corpSecret") == "" || row.val("corpSecret") == undefined)
			msg = msg + "管理组密钥不能为空"+"/n";
		if(row.val("token") == "" || row.val("token") == undefined)
			msg = msg + "token 不能为空"+"/n";
		if(row.val("aesKey") == "" || row.val("aesKey") == undefined)
			msg = msg + "加密密钥不能为空"+"/n";
		return msg;
	};
	
	Model.prototype.SynchMenu = function(row){
		erroeMsg = "";
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
     
		this.saveMenuData(row.val("agentId"),"");
		var actionName="menuSynchToWxAction";
		var errInfo = "";
	
        var AppID = row.val("agentId");//"1";
         var configKey =row.val("corpId") + AppID;// "wx415777370afff229";
           
        //单独应用，传入应用ID为空
        AppID = "";
        var SynchToWxUrl = require.toUrl('$UI/SA/weixin/Synchweixin.j?actionName='+actionName+"&agentId="+AppID+"&isSingle=是"+"&configKey="+configKey);

	     $.ajax({
	            type: "POST",
	            processData: false,
	            url:  SynchToWxUrl,
	            cache:false,
	            async: false,
	            success : function(result) {  returnresult = true ;},
				error : function(xhr, status, err) {
		          
					erroeMsg = "同步菜单出错：" + [ status, xhr.status, err ];
					returnresult = false;
				}
			
					
	        });
	   
	     return returnresult;
	};
	
	//增加首页菜单
	Model.prototype.IndexMenu = function(event){
	   //判断是否有首页
	
	   var data = this.comp("treedata");
	   var rows = data.find(['path'],["首页"]);
	   if(rows.length > 0)
		   return;
		data.newData({
				index : 0,
				defaultValues : [ {
					"id" : justep.UUID.createUUID(),
					"parent":"",
					"Name" : "首页",
					"level":"一级菜单",
					"funcURL" : "../../portal/mobile/index.w?process=/SA/OPM/system/systemProcess&activity=mainActivity",
					"path" : "首页"
				} ]
			});
	}
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
	    //首页：var url = "../../portal/index.w?process=/SA/OPM/system/systemProcess&activity=mainActivity";
	    //"../../OA/personalOffice/process/leaveApply/listActivity.a?process=/OA/personalOffice/process/leaveApply/leaveApplyProcess&activity=listActivity"
		 data.each(function(options) {
	      
			var row = options.row;
			var path = row.val("path");
			if(path == undefined)
			   path = "";	
			path = row.val("path").replace(/(^\s*)|(\s*$)/g, "");
			//此处需加入判断是否是根节点
			if(row.val("funcURL") == ""){
			   
			    if(path != "" && path.indexOf("http://") == -1)
        	        path = "http://"+path;
			    row.val("URL",path);
				
			}else{  
			  
				var wxURL = WxCpUtils.createMenuUrl(httpURL,row.val("funcURL"),corpId,configKey); 
				row.val("URL",wxURL);
			}
			row.val("configKey",configKey);
		});
	
	};
	
	Model.prototype.btnDeleteMenuClick = function(event){
		var data = this.comp('treedata');
		if(data.getCurrentRow().val("path") == "首页"){
			alert("首页菜单不能删除");
			return;
		}
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
	
	Model.prototype.wxsetValueChanged = function(event){
		 
        if(event.col == "callbackDomain"){
        	 //判断当前填写的数据是否有http
 
             var callDomain = event.value.toLowerCase();
        	 if(callDomain.indexOf("http") == -1 && callDomain != ""){
        		 // alert("可信域名必须是http的方式");
        		  this.comp("wxset").setValue("callbackDomain","http://"+callDomain);
        	 }
         }
         if(event.col == "callbackDomain" || event.col == "corpId" || event.col == "agentId"){
          
             this.setcallbackURL(); 
	         
         }
         
         if(event.col == "callbackDomain"){
             debugger;
	         if(event.value != event.row.row.callbackDomain.originalValue && event.row.row.callbackDomain.originalValue != null)
	            wxConfigisChange = true;
         }
         
         if(event.col == "corpId"){
             debugger;
	         if(event.value != event.row.row.corpId.originalValue && event.row.row.corpId.originalValue != null)
	            wxConfigisChange = true;
         }
         
         if(event.col == "agentId"){
             debugger;
	         if(event.value != event.row.row.agentId.originalValue && event.row.row.agentId.originalValue != null)
	            wxConfigisChange = true;
         }
         
         this.initOK.set(true);
	};
	
	Model.prototype.btnMenuSynchClick = function(event){
	     var dwxset = this.comp("wxset");
	     if(dwxset.isChanged()){
	    	 if(!this.savewxConfig())
	    		return;
	     }
		 var row = this.comp("wxset").getCurrentRow();
		 if(!this.SynchMenu(row))
			 alert(erroeMsg);
	     else
	         alert("同步菜单成功！");
	};
	

   //拷贝回调地址
    Model.prototype.copyCallBack = function(){
      
        var contents = this.comp("callbackData").getValue("callbackURL");
         var params = new biz.Request.ActionParam();                                
	   
			params.setString("contents", contents);
		
			biz.Request.sendBizRequest({
				"context": this.getContext(),                     
		  
				"action": "setClipbordContentsAction",
				"parameters": params,
				"callback": function(result) {
					
				}
			});   
    	
    };
	
	Model.prototype.randomString = function(len,sField) {
	    len = len || 32;

        var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';   
        var maxPos = $chars.length;
        var pwd = '';
        for (i = 0; i < len; i++) {
        	pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
        }
        var dwxset = this.comp("wxset");
         dwxset.setValue(sField,pwd);
         
	};

	Model.prototype.button1Click = function(event){
		this.copyCallBack();
	};

	Model.prototype.button2Click = function(event){
		this.randomString(43,'aesKey');
	};

	Model.prototype.button3Click = function(event){
		this.randomString(4,'token');
	};

	Model.prototype.btnSaveClick = function(event){
	    debugger;
		var dwxset = this.comp("wxset");
		dwxset.saveData;
		 
		 if(this.savewxConfig()){
			//保存配置信息后，如果有菜单信息，则系统自动更新菜单信息
			 var menucount = this.comp("treedata").getCount();
			 if(menucount > 0 && wxConfigisChange){
				
					  var row = this.comp("wxset").getCurrentRow();
					  if(!this.SynchMenu(row))
						  alert(erroeMsg);
				
			 }
			
		 }
		 this.initOK.set(false);
		 wxConfigisChange = false;
	};
    
   
	
	Model.prototype.button4Click = function(event){
		 //选择功能
       //如果是首页，则不打开功能菜单
        var row = this.comp("treedata").getCurrentRow();
        if(row.val("path") == "首页")
        	return;
		this.comp("functionDialog").open({
				"data" : {
					"roots" : "UI2",
					"files" : ".function.xml", 
					"identity" : true
				}	
			});
	};
    
   
	
	return Model;
});
	
	

