<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:196px;top:220px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="tempData" idColumn="id" autoNew="true"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="manageTypeID" name="manageTypeID" type="String" xid="default2"/>  
      <column label="manageTypeName" name="manageTypeName" type="String" xid="default3"/> 
    <rule xid="rule1">
   <col name="manageTypeID" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default5">true</expr>
     <message xid="default6">请选择业务管理类型</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="manageTypeData"
      concept="SA_OPManageType" limit="-1" autoLoad="true"> 
      <reader xid="default4" action="/SA/OPM/logic/action/queryOPManageTypeAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:131px;top:377px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top form-inline" xid="top1"><span xid="span1">业务管理类型：</span>
  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="tempData.ref('manageTypeID')" bind-labelRef="tempData.ref('manageTypeName')" optionHeight="300">
   <option xid="option1" data="manageTypeData" value="SA_OPManageType" label="sName"></option></div></div><div class="x-panel-content x-bordered" xid="content1"> 
      <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1"><div component="$UI/system/components/justep/org/orgTreePC" xid="orgTreePC1">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="orgTreeData">
    <filter name="filter0" xid="filter1">SA_OPOrg.sValidState = 1</filter></div> 
   <div component="$UI/system/components/justep/grid/grid" appearance="tree" expandColumn="sName" useVirtualRoot="false" virtualRootLabel="组织机构" xid="orgTreeGrid" height="auto" multiselect="true" class="x-grid-no-bordered">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </div> </div></div></div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取消" onClick='{"operation":"windowReceiver.windowCancel"}' xid="cancelBtn">
   <i xid="i1"></i>
   <span xid="span3">取消</span></a>
  <a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="确定" onClick="okBtnClick" xid="okBtn" xui:update-mode="merge">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div> 
  </div> 
</div>
