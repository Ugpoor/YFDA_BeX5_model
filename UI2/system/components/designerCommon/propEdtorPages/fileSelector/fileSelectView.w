<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;top:12px;left:20px;"> 
    <div component="$UI/system/components/justep/data/data" xid="fileSelectData"
      idColumn="colValue"> 
      <column name="colValue" type="String" label="查询结果"/> 
    </div> 
  </div>  
  <div> 
    <div class="row file-select-navbar"> 
      <div class="col-xs-4"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          id="queryInput" placeholder="请输入要选择的文件关键字" bind-keydown="input1Keydown"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        xid="queryButton" bind-click="queryButtonClick">查询</a> 
    </div>  
    <div xid="grids"> 
      <div component="$UI/system/components/designerCommon/grid/grid" data="fileSelectData"
        editable="false" xid="grid" style="margin:12px 0px 12px 0px;display:none;"> 
        <column ref="colValue" label="查询结果"/> 
      </div> 
    </div>  
    <div class="box TreeFile" style="overflow:auto;margin:12px 0px 12px 0px;" xid="jqxTreeFile"/> 
  </div>
  <div>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'window.close'}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick" bind-enable="selectedFile"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
  </div> 
</div>
