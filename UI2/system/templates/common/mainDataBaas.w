<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;"> 
    </div>  
  <div class="form-horizontal container-fluid  data-form scroll" component="$UI/system/components/bootstrap/form/form" xid="form1"><div component="$UI/system/components/justep/panel/panel" xid="panel1" class="x-panel x-full"> 
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="bottom: 0px;">
      <div class="x-control-group" style="height:254px;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit1"> 
          <label class="x-label" xid="label11"><![CDATA[服务URL]]></label>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="..." xid="button1" onClick="selectUrl">
   <i xid="i1"></i>
   <span xid="span1">...</span></a><input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="serviceURL" bind-disable="$model.type!=='service'" /> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit5"> 
          <label class="x-label" xid="label19"><![CDATA[表]]></label>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="..." xid="button2" onClick="selectTable">
   <i xid="i2"></i>
   <span xid="span2">...</span></a><input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input6" bind-ref="table" bind-disable="$model.type!=='service'" />
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit2"> 
          <label class="x-label" xid="label12"><![CDATA[QueryAction]]></label>
          <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="..." xid="button3" onClick="selectQueryAction">
   <i xid="i1"></i>
   <span xid="span1">...</span></a>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="queryAction" bind-disable="$model.type!=='service'" /> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit3"> 
          <label class="x-label" xid="label13"><![CDATA[SaveAction]]></label>
          <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="..." xid="button4" onClick="selectSaveAction">
   <i xid="i1"></i>
   <span xid="span1">...</span></a>
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input4" bind-ref="saveAction" />
        </div> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit7">
   <label class="x-label" xid="label3"><![CDATA[baasDataXid]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="xidIinput" bind-ref="baasDataXid"></input></div></div>  
    </div> 
  </div></div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectBaasDialog" src="$UI/system/templates/common/selectBaas.w" status="normal" title="选择baas"></span></div>
