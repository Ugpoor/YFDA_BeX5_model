<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window justep-opm-orgdetail" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:255px;top:569px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPOrg" limit="1" autoLoad="false" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPOrgAction"/>  
      <writer xid="default2" action="/SA/OPM/logic/action/saveOPOrgAction"/>  
      <creator xid="default3" action="/SA/OPM/logic/action/createOPOrgAction"/>  
      <calculateRelation relation="orgKindLabel" xid="calculateRelation1"/>  
      <rule xid="rule6"> 
        <readonly xid="readonly12"> 
          <expr xid="default24">js:$model.openMode.get() == 'view'</expr> 
        </readonly>  
        <col name="sName" xid="ruleCol13"> 
          <required xid="required2"> 
            <expr xid="default25">js:true</expr>  
            <message xid="default26">组织名称不能为空</message> 
          </required> 
        </col>  
        <col name="sCode" xid="ruleCol14"> 
          <required xid="required3"> 
            <expr xid="default27">js:true</expr>  
            <message xid="default28">组织编码不能为空</message> 
          </required> 
        </col>  
        <col name="orgKindLabel" xid="ruleCol15"> 
          <calculate xid="calculate6"> 
            <expr xid="default29">js:$model.orgKinds.getLabel($row.val('sOrgKindID'))</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="parentData"
      concept="SA_OPOrg" limit="1"> 
      <reader xid="default4" action="/SA/OPM/logic/action/queryOPOrgAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orgLevelData"
      concept="SA_OrgLevel" limit="-1" autoLoad="true"> 
      <reader xid="default5" action="/SA/OPM/logic/action/queryOrgLevelAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:126px;top:430px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content container-fluid" xid="content1"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div class="form-group" xid="formGroup2">
   <div class="col-xs-2" xid="col15">
   <label class="control-label" xid="controlLabel1"><![CDATA[上级组织]]></label></div><div class="col-xs-10" xid="col16"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input1" bind-ref="parentData.ref('sFName')" readonly="true"></input></div>
   </div>
  <div class="form-group" xid="formGroup4">
   <div class="col-xs-2" xid="col21"><label class="control-label" xid="controlLabel2"><![CDATA[名称]]></label></div>
   <div class="col-xs-4" xid="col22"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input2" bind-ref="orgData.ref('sName')"></input></div>
   <div class="col-xs-2" xid="col23"><label class="control-label" xid="controlLabel3"><![CDATA[编码]]></label></div>
   <div class="col-xs-4" xid="col24"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input3" bind-ref="orgData.ref('sCode')"></input></div></div>
  <div class="form-group" xid="formGroup5">
   <div class="col-xs-2" xid="col28"><label class="control-label" xid="controlLabel4"><![CDATA[类型]]></label></div>
   <div class="col-xs-4" xid="col26"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input6" bind-ref="orgData.ref('orgKindLabel')" readonly="true"></input></div>
   <div class="col-xs-2" xid="col25"><label class="control-label" xid="controlLabel5"><![CDATA[级别]]></label></div>
   <div class="col-xs-4" xid="col27"><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="orgData.ref('sLevel')" bind-labelRef="orgData.ref('levelName')">
   <option xid="option1" data="orgLevelData" value="sCode" label="sName"></option></div></div></div>
  <div class="form-group" xid="formGroup6">
   <div class="col-xs-2" xid="col32"><label class="control-label" xid="controlLabel6"><![CDATA[电话]]></label></div>
   <div class="col-xs-4" xid="col30"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input4" bind-ref="orgData.ref('sPhone')"></input></div>
   <div class="col-xs-2" xid="col29"><label class="control-label" xid="controlLabel7"><![CDATA[传真]]></label></div>
   <div class="col-xs-4" xid="col31"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input7" bind-ref="orgData.ref('sFax')"></input></div></div>
  <div class="form-group" xid="formGroup7">
   <div class="col-xs-2" xid="col36"><label class="control-label" xid="controlLabel8"><![CDATA[全称]]></label></div>
   <div class="col-xs-4" xid="col34"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input8" bind-ref="orgData.ref('sLongName')"></input></div>
   <div class="col-xs-2" xid="col33"><label class="control-label" xid="controlLabel9"><![CDATA[邮编]]></label></div>
   <div class="col-xs-4" xid="col35"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input9" bind-ref="orgData.ref('sZip')"></input></div></div>
  <div class="form-group" xid="formGroup8">
   <div class="col-xs-2" xid="col40"><label class="control-label" xid="controlLabel10"><![CDATA[地址]]></label></div>
   <div class="col-xs-10" xid="col38"><input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input5" bind-ref="orgData.ref('sAddress')"></input></div>
   </div></div></div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div> 
  </div> 
</div>
