define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OrgDialog = require("$UI/system/components/justep/org/orgDialogPC");
	var OrgUtils = require("$UI/system/service/process/dialog/orgUtils");
	var OrgKinds = require("./orgKinds");
	var cacheKind = null;//"ORG_ALL_CACHE"; //"", "ORG_CACHE", "ORG_ALL_CACHE"
	
	require("$UI/system/resources/system.res");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.createExecutorDialog = function(){
		return new OrgDialog({
			cacheKind: cacheKind,		
			title: new justep.Message(justep.Message.JUSTEP230055).getMessage(),
			showTitle: true,
			multiSelection: true,
			parentNode: this.getElementByXid("dialogs")
			});
	};
	
	Model.prototype.isParent = function(fid, list){
		var result = false;
		if (list.length === 0){
			result = true;
		}else{
			
		}
		
		return result;
	};
	
	Model.prototype.createExecutorDialogParam = function(item){
		/*
		var filter = "";
		if (cacheKind){
			var values = [];
			var range = item.getExecutorRange() || [];
			if (range.length > 0){
				var rangeFilter = "";
				var fids = [];
				//只保留最上层的fid
				for (var i=0; i<range.length; i++){
					if (range[i] && range[i].fid){
						var flag = true;
						for (var j=0; j<fids.length; j++){
							if ((fids[j]!==range[i].fid) && (fids[j].indexOf(range[i].fid)===0)){
								flag = false;
							}else if ((fids[j]!==range[i].fid) && (range[i].fid.indexOf(fids[j])===0)){
								fids[j] = "";
							}
						}
						if (flag){
							fids[fids.length] = range[i].fid;
						}
					}
				}
				
				for (var i=0; i<fids.length; i++){
					if (fids[i]){
						values.push(fids[i]);
					}
				}
				
				filter = {col: "sFID", value: values};
			}			
		}else{
			filter = " SA_OPOrg.sValidState=1 ";
			
			var range = item.getExecutorRange() || [];
			if (range.length > 0){
				var rangeFilter = "";
				var fids = [];
				//只保留最上层的fid
				for (var i=0; i<range.length; i++){
					if (range[i] && range[i].fid){
						var flag = true;
						for (var j=0; j<fids.length; j++){
							if ((fids[j]!==range[i].fid) && (fids[j].indexOf(range[i].fid)===0)){
								flag = false;
							}else if ((fids[j]!==range[i].fid) && (range[i].fid.indexOf(fids[j])===0)){
								fids[j] = "";
							}
						}
						if (flag){
							fids[fids.length] = range[i].fid;
						}
					}
				}
				
				for (var i=0; i<fids.length; i++){
					if (fids[i]){
						if (rangeFilter) rangeFilter += " OR ";
						rangeFilter += " SA_OPOrg.sFID = '" + fids[i] + "' ";
					}
				}
				if (rangeFilter){
					filter += " AND (" + rangeFilter + ")"; 
				}
			}else{
				filter = "1>1";
			}
		}
		*/
		
		//TODO 还不支持传当前选中的节点, 因为接口不支持fid/fname, 需要传Row
		
		var filter = item.getExecutorRange() || [];
		return {
			reload: true,
			rootFilter: filter,
			data : {
				selected : {
					kind : 'sName',
					value : []
				}
			}
		};
		
		
	};
	
	Model.prototype.setTitle = function(title){};
	
	return Model;
});