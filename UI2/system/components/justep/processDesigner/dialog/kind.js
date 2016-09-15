define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	
	

	Model.prototype.okbtnClick = function(event){
		
		var result = [];
		var arr = this.comp('dataTables1').getCheckeds();
		var kind = "";
		var kindName = "";
		for(var i = 0; i<arr.length; i++){
			kind += arr[i].val("kind");
			kindName += arr[i].val("kindName");
			if(i != arr.length-1){
				kind += ",";
				kindName += ",";
			}
		}
		result.push(kind);
		result.push(kindName);
		
		
		this.comp('windowReceiver').windowEnsure(result);
	};

	Model.prototype.cancelClick = function(event){
		this.comp('windowReceiver').windowCancel();
	};

	return Model;
});