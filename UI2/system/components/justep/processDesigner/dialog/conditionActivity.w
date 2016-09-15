<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:53px;top:470px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="conditionBranch" idColumn="conditionName"><column label="显示名称" name="conditionName" type="String" xid="xid1"></column>
  <column label="条件为真输出" name="trueOutput" type="String" xid="xid2"></column>
  <column label="条件为假输出" name="falseOutput" type="String" xid="xid3"></column>
  <column label="条件" name="condition" type="String" xid="xid6"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="outputLink" idColumn="value"><column label="值" name="value" type="String" xid="xid4"></column>
  <column label="显示值" name="oValue" type="String" xid="xid5"></column></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1">
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   
   <div class="panel-body" xid="body1"><div xid="div1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1"><![CDATA[显示名称]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="conditionName" bind-ref="conditionBranch.ref('conditionName')"></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
   <label class="x-label" xid="label5"><![CDATA[条件]]></label>
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="textarea1" bind-ref="conditionBranch.ref('condition')" style="height:80px;"></textarea></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3"><![CDATA[条件为真的输出]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-ref="conditionBranch.ref('trueOutput')" bind-options="outputLink" bind-optionsValue="value" bind-optionsLabel="oValue"></select></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label4"><![CDATA[条件为假的输出]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select2" bind-ref="conditionBranch.ref('falseOutput')" bind-options="outputLink" bind-optionsValue="value" bind-optionsLabel="oValue"></select></div></div>
  </div>
   </div></div>
   <div class="x-panel-bottom" xid="bottom1" style="text-align:right;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>