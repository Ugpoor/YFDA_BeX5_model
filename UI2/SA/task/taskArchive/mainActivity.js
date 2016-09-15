define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.bakBtnClick = function(event){
		var self = this;
		justep.Util.confirm("确认执行任务备份？", function(){
			biz.Request.sendBizRequest({
				context: self.getContext(),
				action: "backupTaskAction"
			});
			justep.Util.hint("任务备份成功！");		
		});
	};

	Model.prototype.resetBtnClick = function(event){
		var self = this;
		justep.Util.confirm("确认使用备份表中的数据还原任务？", function(){
			biz.Request.sendBizRequest({
				context: self.getContext(),
				action: "resetTaskAction"
			});		
			justep.Util.hint("任务还原成功！");		
		});
	};

	Model.prototype.archiveBtnClick = function(event){
		var self = this;
		var text = "确认将";
		var data = this.comp("filterData");
		var begin = data.val("begin");
		var end = data.val("end");
		text += "<b>"
		if (begin && end){
			if (begin >= end){
				justep.Util.hint("结束时间必须大于开始时间！");
				return;
			}
			text += " “" + begin + "” 至 “" + end +"” 期间 ";
		}else if (begin && !end){
			text += " “" + begin + "” 以后 ";
		}else if (!begin && end){
			text += " “" + end + "” 以前 ";
		}else {
			text += " 所有 "
		}
		text += "</b>"
		text += "已结束的任务归档？";
		
		justep.Util.confirm(text, function(){
			var params = new biz.Request.ActionParam();
			if (begin){
				params.setDate("begin", begin);
			}
			if (end){
				params.setDate("end", end);
			}
			biz.Request.sendBizRequest({
				context: self.getContext(),
				action: "archiveProcessAction",
				parameters: params
			});		
			justep.Util.hint("任务归档成功！");		
		});
	};

	return Model;
});