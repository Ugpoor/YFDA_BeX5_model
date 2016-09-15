<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window justep-opm-roledetail" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:462px;top:252px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="roleData"
      concept="SA_OPRole" limit="1" onSaveCreateParam="roleDataSaveCreateParam" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPRoleAction"/>  
      <creator xid="default2" action="/SA/OPM/logic/action/createOPRoleAction"/>  
      <calculateRelation relation="roleKindLabel" xid="calculateRelation1"/>  
      <writer xid="default6" action="/SA/OPM/logic/action/saveOPRoleAction"/>  
      <rule xid="rule2">
   <readonly xid="readonly1">
    <expr xid="default5">$model.openMode.get() == 'view'</expr></readonly> 
   <col name="sName" xid="ruleCol3">
    <required xid="required2">
     <expr xid="default10">js:true</expr>
     <message xid="default11">名称不能为空</message></required> </col> 
   <col name="sCode" xid="ruleCol4">
    <required xid="required3">
     <expr xid="default12">js:true</expr>
     <message xid="default13">编码不能为空</message></required> </col> 
   <col name="roleKindLabel" xid="ruleCol5">
    <readonly xid="readonly2">
     <expr xid="default14">js:true</expr></readonly> 
    <calculate xid="calculate2">
     <expr xid="default15">js:$model.OpmUtils.getRoleKindLabel(val('sRoleKind'))</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="roleParentsData"
      concept="SA_OPParentRole" limit="-1" confirmRefresh="false" confirmDelete="false"> 
      <reader xid="default3" action="/SA/OPM/logic/action/queryOPParentRoleAction"/>  
      <creator xid="default4" action="/SA/OPM/logic/action/createOPParentRoleAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:215px;top:343px;" onReceive="windowReceiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectRolesDialog"
    style="left:281px;top:344px;" src="$UI/SA/OPM/dialogs/selectRole/selectMultiRoles.w"
    showTitle="true" title="选择父角色" width="50%"  status="normal" onReceive="selectRolesDialogReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-top container-fluid" xid="top1" height="155"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1">
   <div class="form-group" xid="formGroup1">
    <div class="col-xs-2" xid="col1">
     <label class="control-label" xid="controlLabel1">名称</label></div> 
    <div class="col-xs-4" xid="col2">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input2" bind-ref="roleData.ref('sName')"></input></div> 
    <div class="col-xs-2" xid="col3">
     <label class="control-label" xid="controlLabel2">编码</label></div> 
    <div class="col-xs-4" xid="col6">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input1" bind-ref="roleData.ref('sCode')"></input></div> </div> 
   <div class="form-group" xid="formGroup2">
    <div class="col-xs-2" xid="col11">
     <label class="control-label" xid="controlLabel4">类型</label></div> 
    <div class="col-xs-4" xid="col13">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input3" bind-ref="roleData.ref('roleKindLabel')"></input></div> 
    <div class="col-xs-2" xid="col12">
     <label class="control-label" xid="controlLabel3">分类</label></div> 
    <div class="col-xs-4" xid="col9">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input4" bind-ref="roleData.ref('sCatalog')"></input></div> </div> 
   <div class="form-group" xid="formGroup3">
    <div class="col-xs-2" xid="col15">
     <label class="control-label" xid="controlLabel5">描述</label></div> 
    <div class="col-xs-10" xid="col17">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input5" bind-ref="roleData.ref('sDescription')"></input></div> </div> </div></div>  
    <div class="x-panel-content x-bordered" xid="content1"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover" xid="roleParentsDataTables"
        data="roleParentsData" multiSelect="true"> 
        <columns xid="columns2"> 
          <column name="parentName" xid="column2" label="继承于父角色" className="x-dt-title-center"/> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left x-dialog-button"
        label="添加父角色" xid="addParentsBtn" icon="icon-android-add" onClick="addParentsBtnClick"
        style="float: left;" bind-disable="$model.openMode.get() == 'view'"> 
        <i xid="i3" class="icon-android-add"/>  
        <span xid="span3">添加父角色</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left x-dialog-button"
        label="删除父角色" xid="deleteParentBtn" icon="icon-android-close" onClick="deleteParentBtnClick"
        style="float: left;" bind-disable="$model.openMode.get() == 'view'"> 
        <i xid="i4" class="icon-android-close"/>  
        <span xid="span4">删除父角色</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;windowReceiver.windowCancel&quot;}"> 
        <i xid="i1"/>  
        <span xid="span1">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick" bind-disable="$model.openMode.get() == 'view'"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
