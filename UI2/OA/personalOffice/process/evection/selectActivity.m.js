define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 显示出差详情
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_Evection = '" + event.data + "'");
		detailData.refreshData();
	};

	Model.prototype.backButClick = function(event){
		this.comp('windowReceiver').windowEnsure('');
	};

	// 返回列表，如果审批人指定了新的审批人\相关人，需要保存，新的审批人姓名需要返回
	Model.prototype.saveButClick = function(event){
		var nextExecutor = "";
		var socialDataE = this.comp("nextExecutor").getSocialDataComponent();
		if (socialDataE.isChanged()) {
			nextExecutor = this.comp("nextExecutor").getRows()[0].val('sPersonName')
			socialDataE.saveData();
		}
		var socialDataP = this.comp("selectParticipants").getSocialDataComponent();
		if (socialDataP.isChanged()) {
			socialDataP.saveData();
		}
		this.comp('windowReceiver').windowEnsure(nextExecutor);
	};

	Model.prototype.nextExecutorChange = function(event){

	};

	return Model;
});

