<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="docCenterDialogPerModel" style="height:auto;left:417px;top:279px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="docAuthList" concept="SA_DocAuth"><reader xid="default1" action="/system/logic/action/querySA_DocAuthAction"></reader>
  <writer xid="default2" action="/system/logic/action/saveSA_DocAuthAction"></writer>
  <creator xid="default3" action="/system/logic/action/createSA_DocAuthAction"></creator>
  <calculateRelation relation="sAccessName" xid="calculateRelation1" label="权限名称" type="String"></calculateRelation>
  </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="permissionData" idColumn="col0" confirmDelete="false"><column label="col0" name="col0" type="String" xid="xid1"></column>
  <column label="col1" name="col1" type="String" xid="xid2"></column>
  <column label="col2" name="col2" type="String" xid="xid3"></column>
  <data xid="default4">[{&quot;col0&quot;:&quot;不可见&quot;,&quot;col1&quot;:&quot;0&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;列表&quot;,&quot;col1&quot;:&quot;1&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;读取&quot;,&quot;col1&quot;:&quot;3&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;下载&quot;,&quot;col1&quot;:&quot;7&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;下载 修改&quot;,&quot;col1&quot;:&quot;519&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;下载 修改 删除&quot;,&quot;col1&quot;:&quot;1543&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;上传&quot;,&quot;col1&quot;:&quot;257&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;下载 上传&quot;,&quot;col1&quot;:&quot;263&quot;,&quot;col2&quot;:&quot;false&quot;},{&quot;col0&quot;:&quot;下载 上传 修改&quot;,&quot;col1&quot;:&quot;775&quot;,&quot;col2&quot;:&quot;false&quot;},{&quot;col0&quot;:&quot;下载 上传 修改 删除&quot;,&quot;col1&quot;:&quot;1799&quot;,&quot;col2&quot;:&quot;false&quot;},{&quot;col0&quot;:&quot;管理&quot;,&quot;col1&quot;:&quot;16384&quot;,&quot;col2&quot;:&quot;true&quot;},{&quot;col0&quot;:&quot;完成控制&quot;,&quot;col1&quot;:&quot;32767&quot;,&quot;col2&quot;:&quot;true&quot;}]</data></div></div> 
<span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="perDialogForDep" style="left:294px;top:234px;" multiSelection="true" onReceive="perDialogForDepReceive" includeOrgKind="ogn,dpt"></span>
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="perDialogForPerson" style="left:326px;top:231px;" title="选择组织人员" includeOrgKind="ogn,dpt,pos,psm" multiSelection="true" onReceive="perDialogForPersonReceive"></span>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" style="left:46px;top:427px;" onReceive="windowReceiver1Receive"></span>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver2"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown" xid="dropdown1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle" label="新建" icon="icon-android-add" xid="btn_per_new">
    <i class="icon-android-add" xid="i1"></i>
    <span xid="span1">新建</span></a> 
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu" xid="menu1">
    <li class="x-menu-item" xid="item1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="部门权限" xid="btn_per_new_dep" icon="icon-android-contacts" onClick="btn_per_new_depClick">
      <i xid="i2" class="icon-android-contacts"></i>
      <span xid="span2">部门权限</span></a> </li> 
    <li class="x-menu-item" xid="item2">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="人员权限" xid="btn_per_new_person" icon="icon-android-contact" onClick="btn_per_new_personClick">
      <i xid="i3" class="icon-android-contact"></i>
      <span xid="span3">人员权限</span></a> </li> </ul> </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="保存" xid="btn_per_save" icon="icon-android-checkmark" onClick="{operation:'docAuthList.save'}">
   <i xid="i4" class="icon-android-checkmark"></i>
   <span xid="span4">保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="删除" xid="btn_per_del" icon="icon-android-close" onClick="{operation:'docAuthList.delete'}">
   <i xid="i5" class="icon-android-close"></i>
   <span xid="span5">删除</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="刷新" xid="btn_per_refresh" icon="icon-refresh" onClick="{operation:'docAuthList.refresh'}">
   <i xid="i6" class="icon-refresh"></i>
   <span xid="span6">刷新</span></a></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid2" data="docAuthList" width="100%" height="100%">
   <columns xid="columns4">
    <column name="sAuthorizeeDeptName" xid="column8" label="部门"></column>
    <column name="sAuthorizeeName" xid="column7" label="人员"></column>
    <column name="sGrantTime" xid="column9" label="授权时间"></column>
    <column name="sAccessName" multiRowEditor="false" disableEditorDisplay="false" editable="true" editor="component" xid="column11" label="权限范围">
   <editor xid="editor1">
    <select component="$UI/system/components/justep/select/select" bind-ref="ref('sAccess')" bind-optionsCaption="请选择" class="form-control x-edit-focusin" xid="select1" bind-labelRef="ref('sAccessName')" bind-options="$model.permissionData" bind-optionsValue="col1" bind-optionsLabel="col0"></select></editor> </column></columns> </div></div>
   <div class="x-panel-bottom pull-right" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-default clearfix" label="关闭" xid="btn_per_close" onClick="btn_per_closeClick" style="margin-right:5px;float:right;">
   <i xid="i7"></i>
   <span xid="span7">关闭</span></a></div></div></div>