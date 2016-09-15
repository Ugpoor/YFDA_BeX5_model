define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var convter = require("$UI/system/components/justep/processDesigner/js/convter");
	
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event){
	
		this.comp('conditionBranch').clear();
		this.comp('outputLink').clear();
		
		var figures = event.data[1];
		var node = event.data[0].xmlNode.childNodes;
		
		
		//输出环节
		var outputLinkArr = convter.findAfterConditionLink(figures,node);
		this.comp('outputLink').loadData({
			"@type" : "table",
			"rows" : outputLinkArr
		})
		this.comp('outputLink').first();
		
		var conditionBranch = convter.toJsonConditionBranch(event.data[0]);
		this.comp('conditionBranch').loadData({
			"@type" : "table",
			"rows" : conditionBranch
		})
		this.comp('conditionBranch').first();
		
	};

	//点击确定
	Model.prototype.okbtnClick = function(event){
		var arr = [];
		var conditionBranch = this.comp('conditionBranch');
		var conditionName = conditionBranch.val('conditionName');
		arr.push(conditionBranch);
		arr.push(conditionName);
		this.comp('windowReceiver1').windowEnsure(arr);
	};
	//点击取消
	Model.prototype.cancelClick = function(event){
		this.comp('windowReceiver1').windowCancel();
	};

	return Model;
});