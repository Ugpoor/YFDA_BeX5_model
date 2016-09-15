<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:349px;top:135px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="SA_ProcessTemplate" confirmRefresh="false" limit="1"> 
      <reader xid="default1" action="/system/logic/action/queryProcessTemplateAction"/>  
      <writer xid="default2" action="/system/logic/action/saveProcessTemplate3Action"/>  
      <creator xid="default3" action="/system/logic/action/createProcessTemplateAction"/>  
      <filter name="templateFilter" xid="filter1"><![CDATA[SA_ProcessTemplate.sTypeID='PROCESS_TEMPLATE']]></filter>  
		
      <rule xid="rule2">
   <col name="sName" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default6">$model.mustHasName.get()</expr>
     <message xid="default7">请填写模板名称</message></required> </col> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline"
        xid="bar" style="padding-top:0px;"> 
        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
          xid="inputGroup4"> 
          <span class="input-group-addon" xid="span5"><![CDATA[模板名称：]]></span>  
          <input type="text" class="form-control x-control" component="$UI/system/components/justep/input/input"
            xid="input5" bind-ref="mainData.ref('sName')"/> 
        </div>  
        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
          xid="inputGroup5"> 
          <span class="input-group-addon" xid="span6"><![CDATA[流程名称：]]></span>  
          <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
            xid="input6" readonly="true" bind-ref="mainData.ref('sProcessName')"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content"> 
      <div component="$UI/system/components/justep/processDesigner/processDesigner"/> 
    </div>  
    <div class="x-panel-bottom" xid="bottom"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" label="确定"
        xid="okBtn" class="btn btn-primary btn-only-label x-dialog-button" onClick="okBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
</div>
