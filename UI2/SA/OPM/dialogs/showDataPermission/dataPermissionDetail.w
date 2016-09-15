<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:271px;top:269px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="permissionData" idColumn="id" confirmDelete="false" confirmRefresh="false"> 
      <rule xid="rule2"> 
        <readonly xid="readonly2"> 
          <expr xid="default30">$model.openMode.get() == 'view'</expr> 
        </readonly> 
      </rule>  
      <column name="id" type="String" xid="default1"/>  
      <column name="version" type="Integer" xid="default2"/>  
      <column name="process" type="String" xid="default2"/>  
      <column name="activity" type="String" xid="default3"/>  
      <column name="activityFName" type="String" xid="default4"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="policyData" idColumn="id" limit="-1" confirmRefresh="false" confirmDelete="false"
      onValueChanged="policyDataValueChanged"> 
      <column name="id" type="String" xid="default5"/>  
      <column name="action" type="String" xid="default6"/>  
      <column name="actionLabel" type="String" xid="default7"/>  
      <column name="typeOrParam" type="String" xid="default8"/>  
      <column name="typeOrParamLabel" type="String" xid="default13"/>  
      <column name="kind" type="String" xid="default9"/>  
      <column name="kindLabel" type="String" xid="default10"/>  
      <column name="values" type="String" xid="default11"/>  
      <column name="valuesLabel" type="String" xid="default12"/>  
      <column name="policyType" type="String" xid="default14"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly3"> 
          <expr xid="default31">$model.openMode.get() == 'view'</expr>
        </readonly>  
        <col name="typeOrParam" xid="ruleCol2"> 
          <readonly xid="readonly1"> 
            <expr xid="default21">$row.val("action") != '*'</expr>
          </readonly>  
          <required xid="required1"> 
            <expr xid="default25">$row.val("action") == '*'</expr>  
            <message xid="default26">业务策略的业务标识不能为空</message>
          </required> 
        </col>  
        <col name="policyType" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default15">$row.val("action") == '*' ? '业务策略' : '参数策略'</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="valueTypeData" idColumn="code"> 
      <column name="code" type="String" xid="default22"/>  
      <column name="name" type="String" xid="default23"/>  
      <data xid="default24">[{"code":"expr","name":"表达式"},{"code":"custom","name":"自定义"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectFunDialog"
    style="left:278px;top:383px;" src="$UI/SA/OPM/dialogs/selectFunction/selectSingleFunction.w"
    title="选择功能" showTitle="true" width="60%" status="normal" onReceive="selectFunDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectParamDialog"
    style="left:330px;top:383px;" src="$UI/SA/OPM/dialogs/selectPermissionParam/selectPermissionParam.w"
    title="选择权限参数" showTitle="true" status="normal" width="60%" onReceive="selectParamDialogReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="150"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-1" xid="col1"> 
            <label class="control-label" xid="controlLabel1">功能</label> 
          </div>  
          <div class="col-sm-9" xid="col2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="permissionData.ref('activityFName')"/> 
          </div>  
          <div class="col-sm-2" xid="col9"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-info btn-icon-left btn-block"
              label="选择功能" xid="selectFunBtn" icon="icon-android-search" onClick="selectFunBtnClick"
              bind-disable="$model.openMode.get() == 'view'"> 
              <i xid="i3" class="icon-android-search"/>  
              <span xid="span3">选择功能</span> 
            </a> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup2"> 
          <div class="col-sm-1" xid="col5"> 
            <label class="control-label" xid="controlLabel2">Process</label> 
          </div>  
          <div class="col-sm-6" xid="col6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="permissionData.ref('process')"/> 
          </div>  
          <div class="col-sm-1" xid="col7"> 
            <label class="control-label" xid="controlLabel3">Activity</label> 
          </div>  
          <div class="col-sm-2" xid="col8"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="permissionData.ref('activity')"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline"
        xid="toolBar1"> 
        <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
            label="新建" icon="icon-android-add" xid="button4" bind-disable="$model.openMode.get() == 'view'"> 
            <i class="icon-android-add" xid="i4"/>  
            <span xid="span4">新建</span> 
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
            xid="menu1"> 
            <li class="x-menu-item" xid="item1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="新建参数策略" xid="newParamPolicy" onClick="newParamPolicyClick"
                bind-enable=" $model.permissionData.val(&quot;process&quot;) &amp;&amp;  $model.permissionData.val(&quot;activity&quot;)"> 
                <i xid="i5"/>  
                <span xid="span5">新建参数策略</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item2"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="新建业务策略" xid="newBizPolicy" onClick="newBizPolicyClick"> 
                <i xid="i6"/>  
                <span xid="span6">新建业务策略</span> 
              </a> 
            </li> 
          </ul> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="删除" xid="delPolicyBtn" icon="icon-android-remove" onClick="delPolicyBtnClick"
          bind-disable="$model.openMode.get() == 'view'"> 
          <i xid="i7" class="icon-android-remove"/>  
          <span xid="span7">删除</span> 
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" xid="policyGrid" data="policyData" onCellRender="policyGridCellRender"
        onRowClick="policyGridRowClick" multiselect="true" multiboxonly="true" class="x-grid-title-center"
        height="100%" width="100%"> 
        <columns xid="columns1"> 
          <column width="100" name="policyType" xid="column5" label="策略类型" sortable="false"/>  
          <column width="200" name="actionLabel" xid="column1" label="动作" sortable="false"/>  
          <column width="150" name="typeOrParam" xid="column2" label="权限参数/业务标识"
            sortable="false" editable="true"> 
            <editor xid="editor1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input5" bind-ref="ref('typeOrParam')"/> 
            </editor> 
          </column>  
          <column width="100" name="kindLabel" xid="column3" label="类型" sortable="false"
            editable="true"> 
            <editor xid="editor2"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="gridSelect1" bind-ref="ref('kind')" bind-labelRef="ref('kindLabel')"> 
                <option xid="option1" data="valueTypeData" value="code" label="name"/> 
              </div> 
            </editor> 
          </column>  
          <column name="valuesLabel" xid="column4" label="值" sortable="false"/> 
        </columns>  
        <groupHeaders xid="default16"> 
          <groupHeader xid="default17"> 
            <item columnCount="2" startColumn="actionLabel" titleText="作用域"
              xid="default18"/>
          </groupHeader>  
          <groupHeader xid="default19"> 
            <item columnCount="2" startColumn="kindLabel" titleText="策略" xid="default20"/>
          </groupHeader> 
        </groupHeaders>
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="valuesDialog"
    style="left:382px;top:384px;" src="$UI/SA/OPM/dialogs/showPolicyValues/policyValuesDetail.w"
    title="策略值" showTitle="true" status="normal" width="60%" onReceive="valuesDialogReceive"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:224px;top:384px;" onReceive="windowReceiverReceive"/> 
</div>
