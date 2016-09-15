<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:247px;top:587px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="main" onCustomRefresh="mainCustomRefresh" idColumn="id">
      <column label="列名" name="id" type="String" xid="default10"></column>
  <column label="类型" name="type" type="String" xid="default11"></column>
  <column label="显示名" name="label" type="String" xid="default12"></column>
  <column label="列宽" name="width" type="String" xid="default13"></column>
  <column label="NO" name="NO" type="String" xid="default14"></column>
  <column label="选中" name="ch" type="String" xid="default15"></column></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid" data="main" multiselect="true" multiboxonly="true" width="100%" height="100%" onRowChecked="gridRowChecked" multiselectWidth="30" onCellRender="gridCellRender" onRowClick="gridRowClick">
   <columns xid="columns1"><column name="id" xid="column1"></column>
  <column name="type" xid="column2"></column>
  <column name="label" xid="column3" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('label')"></input></editor></column>
  <column name="width" xid="column4" editable="true"><editor xid="editor2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('width')"></input></editor></column>
  <column width="100" name="NO" xid="column5" label="调整顺序" resizable="false" sortable="false"></column></columns></div></div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
</div>
