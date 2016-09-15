<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:282px;top:171px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="agentProcessData" idColumn="id" onCustomRefresh="agentProcessDataCustomRefresh" limit="-1" confirmRefresh="false" confirmDelete="false"><column name="id" type="String" xid="default7"></column>
  <column name="type" type="String" xid="default8"></column>
  <column name="typeLabel" type="String" xid="default9"></column>
  <column name="content" type="String" xid="default10"></column>
  <column name="label" type="String" xid="default11"></column>
  <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default1">$model.openMode.get() == 'view'</expr></readonly> </rule></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" style="left:155px;top:263px;" onReceive="windowReceiverReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectRoleDialog" style="left:208px;top:264px;" src="$UI/SA/OPM/dialogs/selectRole/selectMultiRoles.w" title="选择角色" showTitle="true" status="normal" width="50%" onReceive="selectRoleDialogReceive" ></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectFuncDialog" style="left:261px;top:265px;" src="$UI/SA/OPM/dialogs/selectAuthorizePermission/selectAuthorizePermissions.w" title="选择功能权限" showTitle="true" status="normal" width="60%" onReceive="selectFuncDialogReceive" ></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="选择角色" xid="selectRoleBtn" icon="icon-android-add" onClick="selectRoleBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i3" class="icon-android-add"></i>
   <span xid="span3">选择角色</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="选择功能" xid="selectFuncBtn" icon="icon-android-add" onClick="selectFuncBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i4" class="icon-android-add"></i>
   <span xid="span4">选择功能</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="删除" xid="deleteBtn" icon="icon-android-remove" onClick="deleteBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i5" class="icon-android-remove"></i>
   <span xid="span5">删除</span></a></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover " xid="agentProcessTable" data="agentProcessData" multiSelect="true">
   <columns xid="columns1"><column name="typeLabel" xid="column2" label="类型" width="60px"></column>
  <column name="label" xid="column4" label="委托权限"></column></columns></div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>