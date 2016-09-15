define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};

	Model.prototype.addAllBtnClick = function(event){
	this.addAll(this.comp('chooseData'));
	this.comp('chooseData').clear();
	};
	Model.prototype.addAll = function(treeData){
		treeData.each(function(p){
			this.add(p.row);
		},this);
	};
	Model.prototype.add = function(row){
		if(row instanceof Data.Row){
			var data = this.comp('selectedData');
			var me=this;
			if(data.isExist(row.getID())) return;
			var defaultValue = {};
			$.each(data.defCols, function(col,v){
				defaultValue[col] = row.val(col);
				
			});
			data.newData({defaultValues:[defaultValue]});
		}
	};
	Model.prototype.removeAllBtnClick = function(event){
		this.comp("chooseData").refreshData();
		this.clear();
	};
	Model.prototype.clear = function(){
		var data = this.comp('selectedData');
		data.clear();
	};
	
	Model.prototype.removeClick = function(event){
		var selecteDdataTables = this.comp("selecteDdataTables");
		var rowid = selecteDdataTables.getSelection();
		var data = this.comp("selectedData");
		if(rowid){
		data.deleteData(data.getRowByID(rowid),{async:true});
		}
		this.addTo(rowid);
		if(rowid instanceof Data.Row){
			rowid.data.next();
		}
	};
	Model.prototype.chooseDataTablesRowDblClick = function(event){
		this.add(event.row);
		this.removeChoose(event.row);
	};
	
	Model.prototype.addBtnClick = function(event){
		var chooseDataTables = this.comp("chooseDataTables");
		var row = chooseDataTables.getSelection();
		debugger;
		if(row!=null){
			this.add(row);
			if(row instanceof Data.Row){
				row.data.next();
			}
			this.removeChoose(row);
		}
	};
	Model.prototype.getSelected = function(){
		var ret = [];
		var data = this.comp('selectedData');
		data.each(function(p){
			ret.push(p.row);
		});
		return ret;
	};
	Model.prototype.setSelected = function(selected) {
		this.clear();
		if ($.isArray(selected) && selected.length > 0) {
			for(var i=0;i<selected.length;i++){
				this.add(selected[i]);
			}
		}
	};
	
	Model.prototype.selecteDdataTablesRowDblClick = function(event){
		this.removeTo(event.row);
		this.addTo(event.row);
	};
		Model.prototype.addTo = function(row){
	  if(row instanceof Data.Row){
	   var data = this.comp("chooseData");
	   if(data.isExist(row.getID())) return;
	   var defaultValue = {};
	   $.each(data.defCols, function(col,v){
	    defaultValue[col] = row.val(col);
	   });
	   data.newData({defaultValues:[defaultValue]});
	  }
	 };
	 Model.prototype.removeTo = function(row){
	  var data = this.comp('selectedData');
	  data.deleteData(row);
		}
	 Model.prototype.removeChoose = function(row){
		 var data = this.comp('chooseData');
		 data.deleteData(row);
	 }
	Model.prototype.valueBtnClick = function(event){
	var value=""	;
		var data = this.comp("selectedData");
		data.each(function(event){
		
		 value +=event.row.val("name")+" ";
		})
		justep.Util.hint(value);
	};
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/chooser.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/chooser.w&xid=contents"
		}, true);
	};
	return Model;
});