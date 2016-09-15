define(function(require) {
	var $ = require("jquery");
	var convter = require("$UI/system/components/justep/processDesigner/js/convter");
	var justep = require("$UI/system/lib/justep");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");

	var Model = function() {
		this.callParent();
		this.forkTemp = 1;
		this.joinTemp = 1;
		this.id = 1;
		
		this.optionalInputDialog;
		this.optionalOutputDialog;
	};

	Model.prototype.windowReceiver1Receive = function(event) {
		var xmlNode = event.data[0].xmlNode;
		var xmlNodes = xmlNode.childNodes;
		var figures = event.data[1];
		
		this.comp('joinRulesData').clear();
		this.comp('forkRulesData').clear();
		this.comp('joinInputActivity').clear();
		this.comp('forkOutputActivity').clear();
		
		this.forkTemp = 1;
		this.joinTemp = 1;

		var joinRuleArr = [];
		var forkRuleArr = [];
		var inputLinkArr = [];
		var outputLinkArr = [];
		var optionalInputArr = [];
		var optionalOutputArr = [];
		
		var forkLinkArr = convter.findAllLink(figures);
		this.comp('forkLink').loadData({
			"@type" : "table",
			"rows" : forkLinkArr
		})
		this.comp('forkLink').first();
		
		

		//名称
		this.lable = event.data[0].LABEL;
		this.comp('andName').val(this.lable);

	

		for (var i = 0; i < xmlNodes.length; i++) {
		

			// 输入环节
			if (xmlNodes[i].tagName == 'input') {
				inputLinkArr.push(convter.findInputLink(figures,xmlNodes[i]));

			}

			// 输出环节
			if (xmlNodes[i].tagName == 'output') {
				outputLinkArr.push(convter.findOutputLink(figures,xmlNodes[i]))
				
			}

			// 合并规则
			if (xmlNodes[i].tagName == 'join-rule') {
				var name = "合并规则" + this.joinTemp;
				var id = this.id;
				var array = convter.toJsonJoinRule(name,xmlNodes[i],id,figures);
				if(array[1].length != 0){
					optionalInputArr = optionalInputArr.concat(array[1]);
				}
				
				joinRuleArr.push(array[0]);
				this.id++;
				this.joinTemp++;
				
			}
			
			// 分支规则
			if (xmlNodes[i].tagName == 'fork-rule') {
				var name = "分支规则" + this.forkTemp;
				var id = this.id;
				var array = convter.toJsonJoinRule(name,xmlNodes[i],id,figures);
				if(array[1].length != 0){
					optionalOutputArr = optionalOutputArr.concat(array[1]);
				}
				
				forkRuleArr.push(array[0]);
				
				this.id++;
				this.forkTemp++;
			}
		}
		if(optionalInputArr.length !=0){
			this.comp('joinInputActivity').loadData({
				"@type" : "table",
				"rows" : optionalInputArr
			})
			this.comp('joinInputActivity').first();
		}
		if(optionalOutputArr.length !=0){
			this.comp('forkOutputActivity').loadData({
				"@type" : "table",
				"rows" : optionalOutputArr
			})
			this.comp('forkOutputActivity').first();
		}
		this.comp('inputActivity').loadData({
			"@type" : "table",
			"rows" : inputLinkArr
		})
		this.comp('inputActivity').first();
		this.comp('outputActivity').loadData({
			"@type" : "table",
			"rows" : outputLinkArr
		})
		this.comp('outputActivity').first();
		this.comp('forkRulesData').loadData({
			"@type" : "table",
			"rows" : forkRuleArr
		})
		this.comp('forkRulesData').first();
		this.comp('dataTables2').reload();
		
		this.comp('joinRulesData').loadData({
			"@type" : "table",
			"rows" : joinRuleArr
		})
		this.comp('joinRulesData').first();
		this.comp('dataTables1').reload();
		
		
	};

	// 删除分支规则
	Model.prototype.deleteClick = function(event) {
		var row = this.comp('forkRulesData').getCurrentRow();
		this.comp('forkRulesData').deleteData(row);
	};
	// 新增分支规则
	Model.prototype.addClick = function(event) {
		var name = "分支规则" + this.forkTemp;
		var id = this.id;
		this.comp('forkRulesData').newData({
			defaultValues:[{
				name:name,
				id:id,
				condition:"true"
			}]
		})
		 this.forkTemp++;
		 this.id++;
	};

	// 新增合并规则
	Model.prototype.button1Click = function(event) {
		var name = "合并规则" + this.joinTemp;
		var id = this.id;
		this.comp('joinRulesData').newData({
			defaultValues:[{
				name:name,
				id:id,
				condition:"true",
				joinMode:"join",
				forkActivity:""
			}]
		})
		 this.joinTemp++;
		 this.id++;
	};

	// 删除合并规则
	Model.prototype.button2Click = function(event) {
		var row = this.comp('joinRulesData').getCurrentRow();
		this.comp('joinRulesData').deleteData(row);
	};
	
	//可选输入新增
	Model.prototype.button3Click = function(event){
		var dialog = this.getOptionalInputDialog();
		var inputActivity = this.comp('inputActivity');
		dialog.open({data:inputActivity});
		
	};
	//可选输入删除
	Model.prototype.button4Click = function(event){
		var row = this.comp('joinInputActivity').getCurrentRow();
		this.comp('joinInputActivity').deleteData(row);
	};
	
	//可选输出新增
	Model.prototype.button5Click = function(event){
		var dialog = this.getOptionalOutputDialog();
		var outputActivity = this.comp('outputActivity');
		dialog.open({data:outputActivity});
		
	};
	
	//可选输出删除
	Model.prototype.button6Click = function(event){
		var row = this.comp('forkOutputActivity').getCurrentRow();
		this.comp('forkOutputActivity').deleteData(row);
	};
	
	
	//点击确定按钮
	Model.prototype.okbtnClick = function(event) {
		var arr = [];
		var joinRulesData = this.comp('joinRulesData');
		var forkRulesData = this.comp('forkRulesData');
		var joinInputActivity =  this.comp('joinInputActivity');
		var forkOutputActivity =  this.comp('forkOutputActivity');
		
		var andName = this.comp('andName').val();
		
		arr.push(joinRulesData);
		arr.push(forkRulesData);
		arr.push(joinInputActivity);
		arr.push(forkOutputActivity);
		arr.push(andName);
		this.comp('windowReceiver1').windowEnsure(arr);
	};
	//点击取消按钮
	Model.prototype.cancelClick = function(event) {
		this.comp('windowReceiver1').windowCancel();
	};
	
	//刷新可选输入dataTables
	Model.prototype.joinRulesDataIndexChanged = function(event){
		if(this.comp('dataTables3')){
			this.comp('dataTables3').reload();
		}
	};
	//刷新可选输出dataTables
	Model.prototype.forkRulesDataIndexChanged = function(event){
		if(this.comp('dataTables4')){
			this.comp('dataTables4').reload();
		}
	};
	//新建可选输入windowDialog
	Model.prototype.getOptionalInputDialog = function(){
		if(this.optionalInputDialog == null){
			
			
			var self = this;
			var cfg = {
					title:"选择输入环节",
					showTitle : true,
					src : require.toUrl("./optionalInput.w"),
					status : 'normal',
					forceRefreshOnOpen : true,
					routable : false,
					height : 400,
					width:500,
					parentNode : this.getRootNode()
			}
			this.optionalInputDialog = new WindowDialog(cfg);
			
			this.optionalInputDialog.on("onReceive", function(evt){
				var arr = evt.data;
				var id = self.comp('joinRulesData').getCurrentRow().val("id");
				
				for(var i =  0; i< arr.length; i++){
					var joinInputActivity = self.comp('joinInputActivity');
					var linkNameArr = [];
					joinInputActivity.each(function(option){
						if(option.row.val("id") == id){
							linkNameArr.push(option.row.val("name"));
						}
					})
					
					var a = linkNameArr.indexOf(arr[i].val("linkName"));
					if(a == -1){
						joinInputActivity.newData({
							defaultValues:[{
								id:id,
								name:arr[i].val("linkName")
							}]
						})
					}
					
				}
			})
		}
		return this.optionalInputDialog;
	};
	//新建可选输出windowDialog
	Model.prototype.getOptionalOutputDialog = function(){
		if(this.optionalOutputDialog == null){
			
			var self = this;
			var cfg = {
					title:"选择输出环节",
					showTitle : true,
					src : require.toUrl("./optionalOutput.w"),
					status : 'normal',
					forceRefreshOnOpen : true,
					routable : false,
					height : 400,
					width:500,
					parentNode : this.getRootNode()
			}
			this.optionalOutputDialog = new WindowDialog(cfg);
			
			this.optionalOutputDialog.on("onReceive", function(evt){
				var arr = evt.data;
				var id = self.comp('forkRulesData').getCurrentRow().val("id");
				
				for(var i =  0; i< arr.length; i++){
					var forkOutputActivity = self.comp('forkOutputActivity');
					var linkNameArr = [];
					forkOutputActivity.each(function(option){
						if(option.row.val("id") == id){
							linkNameArr.push(option.row.val("name"));
						}
					})
					
					var a = linkNameArr.indexOf(arr[i].val("linkName"));
					if(a == -1){
						forkOutputActivity.newData({
							defaultValues:[{
								id:id,
								name:arr[i].val("linkName")
							}]
						})
					}
					
				}
			})
		}
		return this.optionalOutputDialog;
	};
	

	return Model;
});