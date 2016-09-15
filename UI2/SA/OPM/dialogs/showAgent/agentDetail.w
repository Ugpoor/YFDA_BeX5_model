<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:209px;top:204px;">
    <div component="$UI/system/components/justep/data/bizData" xid="agentData"
      concept="SA_OPAgent" limit="1" confirmDelete="false" confirmRefresh="false">
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPAgentAction"/>  
      <writer xid="default2" action="/SA/OPM/logic/action/saveOPAgentAction"/>  
      <creator xid="default3" action="/SA/OPM/logic/action/createOPAgentAction"/>  
      <rule xid="rule2"> 
        <readonly xid="readonly1"> 
          <expr xid="default4">$model.openMode.get() == 'view'</expr>
        </readonly>  
        <col name="sOrgFName" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default8">true</expr>  
            <message xid="default9">委托人不能为空</message>
          </required> 
        </col>  
        <col name="agentPersonName" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default10">true</expr>  
            <message xid="default11">代理人不能为空</message>
          </required> 
        </col> 
      </rule>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:248px;top:284px;" onReceive="windowReceiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="agentProcessDialog"
    style="left:349px;top:408px;" src="$UI/SA/OPM/dialogs/showAgentProcess/agentProcessDetail.w"
    title="委托权限" showTitle="true" status="normal"   onReceive="agentProcessDialogReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1">
        <div class="form-group" xid="formGroup1"> 
          <div class="col-xs-2" xid="col1">
            <label class="control-label" xid="controlLabel1"><![CDATA[委托人]]></label>
          </div>  
          <div class="col-xs-7" xid="col2">
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="agentData.ref('sOrgFName')" readonly="true"/>
          </div>  
          <div xid="col3" class="col-xs-3">
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
              label="选择委托人" xid="btnSelectPsm" icon="icon-android-contact" style="width:100%;"
              onClick="btnSelectPsmClick" bind-disable="$model.openMode.get() == 'view'"> 
              <i xid="i3" class="icon-android-contact"/>  
              <span xid="span3">选择委托人</span>
            </a>
          </div> 
        </div>  
        <div class="form-group" xid="formGroup3"> 
          <div class="col-xs-2" xid="col7"> 
            <label class="control-label" xid="controlLabel3"><![CDATA[代理人]]></label>
          </div>  
          <div class="col-xs-7" xid="col9"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="agentData.ref('agentPersonName')" readonly="true"/>
          </div>  
          <div xid="col8" class="col-xs-3"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
              label="选择代理人" xid="btnSelectAgentPerson" icon="icon-android-social-user"
              style="width:100%;" onClick="btnSelectAgentPersonClick" bind-disable="$model.openMode.get() == 'view'"> 
              <i xid="i5" class="icon-android-social-user"/>  
              <span xid="span5">选择代理人</span>
            </a> 
          </div> 
        </div>
        <div class="form-group" xid="formGroup2"> 
          <div class="col-xs-2" xid="col4"> 
            <label class="control-label" xid="controlLabel2"><![CDATA[委托权限]]></label>
          </div>  
          <div class="col-xs-7" xid="col6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="agentData.ref('processLabel')" readonly="true"/>
          </div>  
          <div xid="col5" class="col-xs-3"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
              label="选择委托权限" xid="btnSelectProcess" icon="icon-android-sort" style="width:100%;"
              onClick="btnSelectProcessClick"> 
              <i xid="i4" class="icon-android-sort"/>  
              <span xid="span4" bind-text="$model.openMode.get() == 'view' ? '显示委托权限' : '选择委托权限'">选择委托权限</span>
            </a> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup4"> 
          <div class="col-xs-2" xid="col10"> 
            <label class="control-label" xid="controlLabel4"><![CDATA[开始时间]]></label>
          </div>  
          <div class="col-xs-4" xid="col12"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input4" bind-ref="agentData.ref('sStartTime')"/>
          </div>  
          <div xid="col11" class="col-xs-2"> 
            <label class="control-label" xid="controlLabel5"><![CDATA[结束时间]]></label>
          </div>  
          <div class="col-xs-4" xid="col13">
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input5" bind-ref="agentData.ref('sFinishTime')"/>
          </div>
        </div>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
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
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="selectPsmDialog" style="left:184px;top:407px;" title="选择委托岗位" width="50%"
     selectFilter="$row.val('sOrgKindID') == 'psm'" status="normal" onReceive="selectPsmDialogReceive"/>
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="selectAgentPersonDialog" style="left:269px;top:407px;" title="选择代理人" status="normal"
    width="50%"  selectFilter="$row.val('sOrgKindID') == 'psm'" onReceive="selectAgentPersonDialogReceive"/>
</div>
