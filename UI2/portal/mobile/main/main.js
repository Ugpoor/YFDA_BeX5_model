define(function(require){
	var $ = require("jquery");
	require("$UI/system/lib/biz");
	var justep = require("$UI/system/lib/justep");
	var PopPicker = require("$UI/system/components/justep/picker/popPicker");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.getAgentList = function(){
		return window.__justep.__portalContext.data.agentList;
	};
	
	Model.prototype.createAgent = function(){
		var agentList = this.getAgentList();
		if(agentList && agentList.value && agentList.value.length > 0){
			var agents = agentList.value;
			$('.x-portal-agent',this.getRootNode()).removeClass('hide');
			var agentData = [];
			for(var i=0; i<agents.length; i++){
				var agent = agents[i];
				agentData.push({executor:agent.id,name:agent.name});
			}
			this.comp('agentData').loadData(agentData);
			var self = this;
			this.agentPicker = new PopPicker({parentNode:this.getRootNode(),onOK:function(evt){
				var row = self.innerPicker.getSelectedItem();
				justep.Shell.fireEvent('onCallPortal',{fn:'openAgent',param:row.val('executor')});
			}});
			this.innerPicker = this.agentPicker.addPicker({data:'$model.agentData','bind-itemText':'val("name")'});
		}else $('.x-portal-agent',this.getRootNode()).addClass('hide');		
	};
	
	Model.prototype.menuBtnClick = function(event){
		justep.Shell.fireEvent('onCallPortal',{fn:'toggleMenu'});
	};

	Model.prototype.moreBtnClick = function(event){
		this.comp("menu").show();
	};

	Model.prototype.mainDataCustomRefresh = function(event){
		var data = event.source;
		var messageAction = "$UI/portal/mobile/main/main.j";
		var url = new justep.URL(require.toUrl(messageAction));
		url.setParam('bsessionid', justep.URL.getBSessionID());
		
        var result = $.ajax({
            type: "GET",
            url: url.toString(),
            async: false,
            cache:false
        });
        
        if(result.responseJSON.flag){
        	var table = result.responseJSON.data.value;
        	data.loadData(table);
        }
        
	};

	Model.prototype.soreBtnClick = function(event){
		this.comp("mainData").refreshData({async:true});
	};

	Model.prototype.agentBtnClick = function(event){
		if(this.agentPicker) this.agentPicker.show();
	};
	
	Model.prototype.reloadBtnClick = function(){
		justep.Shell.fireEvent('onCallPortal',{fn:'reload'});
	};
	
	Model.prototype.li4Click = function(event){
		var data = event.bindingContext.$object;
		var process = data.val("fProcess");
		var activity = data.val("fActivity");
		var url = data.val("fUrl");
		var options = {url: url, process: process, activity: activity}
		
		justep.Shell.showPage(options);
	};

	Model.prototype.modelLoad = function(event){
		//延迟创建不影响显示
		setTimeout(justep.Util.bindModelFn(this,function(){this.createAgent();},this),0);
		if(this.getContext().isDebug()){
			$(".debug-mode",this.getRootNode()).removeClass('hide');
			$(".x-portal-reload",this.getRootNode()).removeClass('hide');
		}
	};

	return Model;
});