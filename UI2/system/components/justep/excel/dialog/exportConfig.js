define(function(require){
	var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.data = null;
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
		return this.comp('main');
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};

	Model.prototype.wReceiverReceive = function(event){
		var obj = event.data;
	    if(obj.data!=this.data){
		    var mainData = this.comp('main');
		    if (mainData.getCount() > 0) return;
		    this.exportExcel = obj;
		    this.data = obj.data;
		    var grid = this.comp('grid');
		    mainData.refreshData({async:true,onSuccess:function(){
		    	mainData.each(function(p){
		    		var rID = p.row.getID();
		    		grid.setRowChecked(rID,true,false);
		    	});
		    }});
		}
	};

	Model.prototype.mainCustomRefresh = function(event){
		var mainData = event.source;
		var data = this.exportExcel.getData();
		var exportCalculate = this.exportExcel.isExportCalculate();
		var ids = this.exportExcel.getRelations();
		var rows = [];

		if (ids.length<=0) {
			ids = data.getColumnIDs();
			ids = ids.split(data.delim);
		}
		for (var i = 0; i<ids.length; i++) {
			var colInfo = data.defCols[ids[i]];
			var isIDColumn = data.idColumn==ids[i];
			if ((data.versionRelation!=ids[i]) 
					&& (this.exportExcel.exportKey || !isIDColumn)
					&& (exportCalculate || !data.isUICalculateCol(ids[i]))) {
				var l = this.exportExcel.getRelationLabel(ids[i]);	
				var o = {id:ids[i],
						label:(l?l:(!isIDColumn?colInfo.label:'主键')),
						width:this.exportExcel.getRelationWidth(ids[i]),
						type:!isIDColumn?colInfo.type:'key',
						ch:'1',
						NO:i+""};
				rows.push(o);	
			}
		}
		mainData.loadData({rows:rows});
	};

	Model.prototype.gridRowChecked = function(event){
		event.row.val('ch',event.checked?'1':'0');
	};

	Model.prototype.gridCellRender = function(event){
		if('NO'===event.colName)
			event.html = '<a class="up btn btn-link icon-chevron-up"></a>'
					   + '<a class="down btn btn-link icon-chevron-down"></a>';
	};

	Model.prototype.gridRowClick = function(event){
		var $dom = $(event.domEvent.target);
		var up = $dom.hasClass('up'), down = $dom.hasClass('down');
		if(up || down){
			var data = this.comp('main');
			var index = data.getRowIndex(event.row);
			index += (up?-1:1);
			if(index<0 || index>=data.getCount()) return;
			var datas = data.datas.peek();
			var row2 = datas[index];
			data.exchangeRow(event.row,row2);
		}
	};

	return Model;
});