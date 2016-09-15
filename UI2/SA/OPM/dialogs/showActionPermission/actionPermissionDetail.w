<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:241px;top:199px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="actionData" idColumn="name" confirmDelete="false" confirmRefresh="false"><column name="name" type="String" xid="default1"></column>
  <column name="label" type="String" xid="default2"></column></div>
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" style="left:186px;top:293px;" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content x-bordered" xid="content1"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table  table-hover x-dt-title-center" xid="actionTables" data="actionData" multiSelect="true">
   <columns xid="columns1"><column name="label" xid="column2" label="动作权限" orderable="false"></column></columns></div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>