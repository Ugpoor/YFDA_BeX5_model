<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:120px;top:178px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dialogData"
      directDelete="true" autoLoad="true" concept="SA_WorkTask"
      limit="1"> 
      <reader action="/SA/task/logic/action/queryWorkTaskAction"/>  
      <writer action="/SA/task/logic/action/saveWorkTaskAction"/>  
      <creator action="/SA/task/logic/action/createWorkTaskAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form">
    <div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col1"><label class="control-label" xid="controlLabel1" bind-text='dialogData.label("sName")'>label</label></div>
   <div class="col-sm-4" xid="col2"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dialogData.ref('sName')"></input></div>
   <div class="col-sm-2" xid="col3"><label class="control-label" xid="controlLabel2" bind-text='dialogData.label("sTypeName")'>label</label></div>
   <div class="col-sm-4" xid="col4"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="dialogData.ref('sTypeName')"></input></div></div><div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col5"><label class="control-label" xid="controlLabel3" bind-text='dialogData.label("sContent")'>label</label></div>
   <div class="col-sm-4" xid="col6"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="dialogData.ref('sContent')"></input></div>
   <div class="col-sm-2" xid="col7"><label class="control-label" xid="controlLabel4" bind-text='dialogData.label("sLastModifyTime")'>label</label></div>
   <div class="col-sm-4" xid="col8"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="dialogData.ref('sLastModifyTime')"></input></div></div><div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;"
        xid="cancelBtn"> 
        <i xid="i4_1"/>  
        <span xid="span4_1">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/> 
</div>
