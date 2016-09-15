/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 

/**
 * 
 * 初始化报表数据
 * @param requestParam   '<root><mode>new/edit</mode><report-id></report-id></root>'
 * @param initBizDoc
 */
function initReportData(requestParam,initBizDoc){
	
	var modelE = justep.XML.eval(requestParam, '//mode', null, '')[0];
	var model = justep.XML.getNodeText(modelE);
	
	var mainDataRowIdE = justep.XML.eval(requestParam, '//report-id', null, '')[0];
	var mainDataRowId = justep.XML.getNodeText(mainDataRowIdE);
	
	//
	//var model = requestParam.selectSingleNode('//mode').text;
	//var mainDataRowId = requestParam.selectSingleNode('//report-id').text;
	
	
	if(model == 'new'){ //new edit
		addBizData(mainDataRowId , initBizDoc);
	}
	
	//数据过滤
	var masterDataId = '';
	var datas = justep.XML.eval(initBizDoc, "//data");
	for (var i = 0; i < datas.length; i++) {
		var data = datas[i];
		var dataId = data.getAttribute("id");
		var isMaster = data.getAttribute("isMaster");
		if(isMaster == 'true'){
			masterDataId = dataId;
			break;
		}
	}
	
	if(masterDataId != ''){
		var filterStr = masterDataId+"=\'"+mainDataRowId+"\'"; //fZHB.fID=""
		var dataObj = justep.xbl(masterDataId);
		
		//debugger;
		//var rowId = dataObj.createUUID();
		
		dataObj.filters.setFilter('_report_filter_',filterStr);
		dataObj.refreshData();
	}else{
		alert('报表缺少主Data !');
	}
	
}

/**
 * 新增数据 - BIZ
 * @parma mainDataRowId
 * @param initBizDoc
 */
function addBizData(mainDataRowId , initBizDoc){
	var datas = justep.XML.eval(initBizDoc, "//data");
	for (var i = 0; i < datas.length; i++) {
		var data = datas[i];
		var dataId = data.getAttribute("id");
		var dataFields = data.getAttribute("fields");
		var frv = data.getAttribute("reportVersion");
		var isMaster = data.getAttribute("isMaster");
		
		var dataObj = justep.xbl(dataId);
		dataObj.refreshData();
		
		var dataFieldArray = dataFields.split(',');
		
		var rows = justep.XML.eval(data, "rows//row");
		
		for(var r = 0; r < rows.length; r++){
			var row = rows[r];
			var cells = justep.XML.eval(row, "cell");
			
			var rowId = mainDataRowId
			if(isMaster != 'true'){
				rowId = dataObj.createUUID();
			}
			
			dataObj.insert(rowId,0);
			var store = dataObj.getStore();
			store.setUserData(rowId, store.recordStateUserDataName, 'new');
			
			//业务表 报表版本字段
			//dataObj.setValue('fReportVersion',frv, rowId);	
			
			for( var c = 0; c < cells.length; c++){
				var cell = cells[c];
				var cellText = cell.text;
				if(cellText != '' ){								
					store.setValueById(rowId , dataFieldArray[c],cellText);
				}else{
					store.setValueById(rowId ,dataFieldArray[c],'');
				}
			}		
			
			//从表 关联字段
			if(isMaster == 'false'){
				dataObj.setValue('fREFID',mainDataRowId, rowId);	
			}
			
			store.setValueById(rowId, 'version', '0');
		
			dataObj.saveData();
			dataObj.refreshData();
		}     			
		
	}	
}


/**
 * 
 * 初始化报表编辑元数据 - 映射报表编辑二维数据模型
 */
function initMetaData(){
	var len = document.all.length;
	for(var i=0; i< len; i++){
		var obj = document.all[i];
		if(typeof(obj) == 'object'){
			var objType = obj.type;
			if(objType == 'text'){
				justep.xbl('edit').getReportEditor().loadData(obj);
			}
		}
	}
	
	//allInputDisabled();
	
}


/**
 * 
 * input 失效
 */
function allInputDisabled(){
	var len = document.all.length;
	for(var i=0; i< len; i++){
		var obj = document.all[i];
		if(typeof(obj) == 'object'){
			var objType = obj.type;
			if(objType == 'text'){
				obj.disabled = true;
			}
		}
	}
}


function save(callbackFun, caller){
	var info = justep.xbl('edit').getReportEditor().check();
	if(info != ''){
		justep.xbl('check-confirm-dialog').showModel({btns:['yes','no'],msg:"报表数据存在问题，是否保存？", html:'', 
				title:'信息提示',autosize:'false', width:'800', height:250
				},[function(){justep.xbl('edit').getReportEditor().save();clearRender(); callbackFun.call(caller,true);},function(){clearRender(); callbackFun.call(caller,false);}]);	
		justep.xbl('check-confirm-dialog').setHtml(info);
	}else{
		justep.xbl('edit').getReportEditor().save();
	}
	
}

function check(){
	var info = justep.xbl('edit').getReportEditor().check();
	if(info != ''){
		justep.xbl('check-confirm-dialog').showModel({btns:['ok'],msg:"报表效验: 数据存在问题!", html:'', 
				title:'信息提示',autosize:'false', width:'800', height:250
				},[function(){clearRender();},function(){clearRender();}]);	
		justep.xbl('check-confirm-dialog').setHtml(info);
	}else{
		alert('数据无误!');
	}
}


/**
 * 
 * 单元格数据修改
 * @param obj
 */
function cellChange(obj){
	justep.xbl('edit').getReportEditor().cellChange(obj);
}	
			
/**
 * 
 * 效验错误信息渲染
 * @param leftStr
 * @param rightStr
 */
function cellRender(leftStr,rightStr){
	var leftC = leftStr.split(',');
	var rightC = rightStr.split(',');
	
	clearRender();
	
	for(var i=0; i<leftC.length; i++){
		var cell = document.getElementById(leftC[i]);
		cell.style.backgroundColor= 'red';
		cell.parentNode.style.backgroundColor= 'red';
	}
	for(var i=0; i<rightC.length; i++){
		var cell = document.getElementById(rightC[i]);
		cell.style.backgroundColor= 'green';
		cell.parentNode.style.backgroundColor= 'green';
	}		

}
			
/**
 * 
 * 清空错误渲染
 */
function clearRender(){
	var len = document.all.length;
	for(var i=0; i<len; i++){
		var obj = document.all[i];
		if(typeof(obj) == 'object'){
			var objType = obj.type;
			if(objType == 'text'){
				obj.style.backgroundColor= '';
				obj.parentNode.style.backgroundColor= '';
				obj.style.borderColor= '';
				obj.parentNode.style.borderColor= '';
			}
		}
	}
}
		
/**
 * 
 * 数据集范围渲染
 * @param rangeTopStr
 * @param rangeBottomStr
 * @param rangeLeftStr
 * @param rangeRightStr
 */
function rangeRender(rangeTopStr,rangeBottomStr,rangeLeftStr,rangeRightStr){
	clearRender();
	
	var rangeTops = rangeTopStr.split(',');
	for(var i=0; i < rangeTops.length; i++){
		var cell = document.getElementById(rangeTops[i]);
		cell.style.borderTopColor='red';
		cell.parentNode.style.borderTopColor= 'red';
	}
	
	if(rangeBottomStr != ""){
		var rangeBottoms = rangeBottomStr.split(',');
		for(var i=0; i < rangeBottoms.length; i++){
			var cell = document.getElementById(rangeBottoms[i]);
			cell.style.borderBottomColor='red';
			cell.parentNode.style.borderBottomColor= 'red';
		}
	}
	
	var rangeLefts = rangeLeftStr.split(',');
	for(var i=0; i < rangeLefts.length; i++){
		var cell = document.getElementById(rangeLefts[i]);
		cell.style.borderLeftColor='red';
		cell.parentNode.style.borderLeftColor= 'red';
	}
	
	var rangeRights = rangeRightStr.split(',');
	for(var i=0; i < rangeRights.length; i++){
		var cell = document.getElementById(rangeRights[i]);
		cell.style.borderRightColor='red';
		cell.parentNode.style.borderRightColor= 'red';
	}
}


function pageSetup(){
	justep.xbl('edit').pageSetup();
}

function preview(){
	justep.xbl('edit').preview();
}

function print(){
	justep.xbl('edit').print();
}

function exportPDF(){
	justep.xbl('edit').exportPDF();
}

function exportWord(){
	justep.xbl('edit').exportWord();
}

function exportExcel(){
	justep.xbl('edit').exportExcel();
}



