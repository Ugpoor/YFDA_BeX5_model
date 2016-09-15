<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:821px;top:19px;"
    onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataActions" idColumn="name" onBeforeNew="dataActionsBeforeNew" onValueChanged="dataActionsValueChanged"
      onDataChange="dataActionsDataChange" onCustomRefresh="dataActionsCustomRefresh"
      confirmRefresh="false" confirmDeleteText="确定删除当前Action?" onIndexChanged="dataActionsIndexChanged"> 
      <column label="名称(*)" name="name" type="String" xid="xid1"/>  
      <column label="实现(*)" name="impl" type="String" xid="xid2"/>  
      <column label="private" name="private" type="Boolean" xid="xid11"/>  
      <column label="参数" name="params" type="String" xid="xid11"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataParams" idColumn="name" onBeforeNew="dataParamsBeforeNew" onCustomRefresh="dataParamsCustomRefresh"
      onDataChange="dataParamsDataChange" confirmRefresh="false" confirmDeleteText="确定删除当前参数？"> 
      <column label="名称(*)" name="name" type="String" xid="xid3"/>  
      <column label="类型(*)" name="type" type="String" xid="xid4"/>  
      <column label="默认值" name="value" type="String" xid="xid5"/>  
      <column label="范围(*)" name="kind" type="String" xid="xid8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataType" idColumn="value"> 
      <column label="value" name="value" type="String" xid="xid6"/>  
      <column label="label" name="label" type="String" xid="xid7"/>  
      <data xid="default1">[{"value":"String","label":"String"},{"value":"Integer","label":"Integer"},{"value":"Long","label":"Long"},{"value":"Float","label":"Float"},{"value":"Double","label":"Double"},{"value":"Decimal","label":"Decimal"},{"value":"Boolean","label":"Boolean"},{"value":"Date","label":"Date"},{"value":"Time","label":"Time"},{"value":"DateTime","label":"DateTime"},{"value":"Object","label":"Object"},{"value":"List","label":"List"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataKind" idColumn="value"> 
      <column label="value" name="value" type="String" xid="xid9"/>  
      <column label="label" name="label" type="String" xid="xid10"/>  
      <data xid="default2">[{"value":"public","label":"public"},{"value":"private","label":"private"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="implPopMenu" anchor="btnImpl" opacity="0"> 
    <div class="x-popMenu-overlay" xid="div2"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1" bind-click="menu1Click"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          data-value="com.justep.baas.action.CRUD.query" label="com.justep.baas.action.CRUD.query--查询"> 
          <i/>  
          <span>com.justep.baas.action.CRUD.query--查询</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          data-value="com.justep.baas.action.CRUD.save" label="com.justep.baas.action.CRUD.save--保存"> 
          <i/>  
          <span>com.justep.baas.action.CRUD.save--保存</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button6" label="新建数据表Action" icon="icon-plus" onClick="{operation:'newTableActionDlg.open'}"> 
      <i xid="i7" class="icon-plus" />  
      <span xid="span9">新建数据表Action</span>
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dataActions.new'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dataActions.delete'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/> 
    </a>  
  </div>  
  <div xid="div1" class="container-fluid"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-3 col-sm-2 col-md-2 col-lg-2" xid="col1"> 
        <div component="$UI/system/components/fragment/list/listTable" data="dataActions"
          masterData="" masterCol="" xid="listTable2"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            data="dataActions" xid="list3"> 
            <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
              xid="table2"> 
              <thead xid="thead2"> 
                <tr xid="tr3"> 
                  <th xid="col5"> 
                    <label xid="label2"><![CDATA[Action]]></label> 
                  </th> 
                </tr> 
              </thead>  
              <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                xid="tbody2"> 
                <tr xid="tr4" bind-css="{success:$object==$model.dataActions.getCurrentRow()}"> 
                  <td xid="td2"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" bind-ref="ref('name')" xid="output2"/> 
                  </td> 
                </tr> 
              </tbody> 
            </table> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-9 col-sm-10 col-md-10 col-lg-10 col-spliter-left" style="padding-left:0;padding-right:0;"
        xid="col2"> 
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="基本信息" xid="controlGroup1"> 
          <div class="x-control-group-title" xid="controlGroupTitle1"> 
            <span xid="span3"><![CDATA[基本信息]]></span> 
          </div>  
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form1"> 
            <div class="form-group" xid="formGroup1" style="margin-bottom: 0;"> 
              <div class="col-sm-1" style="padding-left:0;padding-right:0;"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="output3" bind-ref="dataActions.label('name')"/> 
              </div>  
              <div class="col-sm-4"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="dataActions.ref('name')"/> 
              </div>  
              <div class="col-sm-1" style="padding-left:0;padding-right:0;"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="output4" bind-ref="dataActions.label('impl')"/> 
              </div>  
              <div class="col-sm-4"> 
                <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                  xid="inputGroup1"> 
                  <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                    xid="input2" bind-ref="dataActions.ref('impl')"/>  
                  <div class="input-group-btn" xid="layoutWizard1"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" xid="btnImpl" label="..." onClick="{operation:'actionDialog.open'}"> 
                      <i xid="i6"/>  
                      <span xid="span8">...</span> 
                    </a> 
                  </div> 
                </div> 
              </div>  
              <div class="col-sm-2"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" xid="checkbox1" bind-ref="dataActions.ref('private')"
                  label="private"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="参数列表" xid="controlGroup2"> 
          <div class="x-control-group-title" xid="controlGroupTitle2"> 
            <span xid="span4"><![CDATA[参数列表]]></span> 
          </div>  
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
            xid="toolBar2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              onClick="{'operation':'dataParams.new'}" xid="button3"> 
              <i xid="i3"/>  
              <span xid="span5"/> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              onClick="{'operation':'dataParams.delete'}" xid="button4"> 
              <i xid="i4"/>  
              <span xid="span6"/> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="清除全部" xid="button5" icon="icon-close" onClick="doDeleteParams"> 
              <i xid="i5" class="icon-close"/>  
              <span xid="span7">清除全部</span> 
            </a> 
          </div>  
          <div component="$UI/system/components/fragment/list/listTable" data="dataParams"
            masterData="" masterCol="" xid="listTable4"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              data="dataParams" xid="list5"> 
              <table class="table table-condensed table-hover table-striped"
                component="$UI/system/components/bootstrap/table/table" xid="table4"> 
                <thead xid="thead4"> 
                  <tr xid="tr7"> 
                    <th> 
                      <label bind-text="$model.dataParams.label('kind')"/> 
                    </th>  
                    <th xid="col8"> 
                      <label bind-text="$model.dataParams.label('name')" xid="label6"/> 
                    </th>  
                    <th xid="col9"> 
                      <label bind-text="$model.dataParams.label('type')" xid="label7"/> 
                    </th>  
                    <th xid="col10"> 
                      <label bind-text="$model.dataParams.label('value')" xid="label8"/> 
                    </th> 
                  </tr> 
                </thead>  
                <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                  xid="tbody4"> 
                  <tr xid="tr8" bind-css="{active:$object==$model.dataParams.getCurrentRow()}"> 
                    <td style="width:25%;"> 
                      <select component="$UI/system/components/justep/select/select"
                        class="form-control" bind-ref="ref('kind')" bind-options="$model.dataKind"
                        bind-optionsCaption="请选择参数作用范围" bind-optionsValue="value"
                        bind-optionsLabel="label"/> 
                    </td>  
                    <td style="width:25%;"> 
                      <input component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('name')" xid="input5"/> 
                    </td>  
                    <td style="width:25%;"> 
                      <select component="$UI/system/components/justep/select/select"
                        class="form-control" bind-ref="ref('type')" xid="select1"
                        bind-options="$model.dataType" bind-optionsCaption="请选择参数类型"
                        bind-optionsValue="value" bind-optionsLabel="label"/> 
                    </td>  
                    <td style="width:25%;"> 
                      <div bind-if="'db'==$object.val('name')"> 
                        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"> 
                          <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                            bind-ref="ref('value')"/>  
                          <div class="input-group-btn"> 
                            <a component="$UI/system/components/justep/button/button"
                              class="btn btn-default" label="..." xid="DbBtn" onClick="DbBtnClick"> 
                              <i/>  
                              <span>...</span> 
                            </a> 
                          </div> 
                        </div> 
                      </div>  
                      <div bind-if="'tableName'==$object.val('name')"> 
                        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"> 
                          <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                            bind-ref="ref('value')"/>  
                          <div class="input-group-btn"> 
                            <a component="$UI/system/components/justep/button/button"
                              class="btn btn-default" label="..." xid="tableBtn" onClick="tableBtnClick"> 
                              <i/>  
                              <span>...</span> 
                            </a> 
                          </div> 
                        </div> 
                      </div>  
                      <div bind-if="'permissions'==$object.val('name')"> 
                        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"> 
                          <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                            bind-ref="ref('value')"/>  
                          <div class="input-group-btn"> 
                            <a component="$UI/system/components/justep/button/button"
                              class="btn btn-default" label="..." xid="rangeBtn" onClick="rangeBtnClick"> 
                              <i/>  
                              <span>...</span> 
                            </a> 
                          </div> 
                        </div> 
                      </div>  
                      <div bind-if="'sql'==$object.val('name') || 'countSql'==$object.val('name')"> 
						<textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" style="height:96px"
						         bind-ref="ref('value')" _placeHolder="请输入......"/>
                      </div>  
                      <div bind-if="$model.isDefaultValueEditor($object)"> 
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control" bind-ref="ref('value')" xid="input6"/> 
                      </div> 
                    </td> 
                  </tr> 
                </tbody> 
              </table> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="actionDialog"
    style="left:184px;top:14px;" src="$UI/system/designer/baas/editor/actionDlg.w"
    title="选择Action" status="normal" showTitle="true" width="70%" height="95%" resizable="true"
    onReceive="actionDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="saveRangeDialog"
    style="left:184px;top:44px;" src="$UI/system/designer/baas/editor/saveRangeDlg.w"
    title="设置保存的范围" status="normal" showTitle="true" width="80%" height="95%" resizable="true"/> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newTableActionDlg" style="left:184px;top:75px;" title="创建Table Action" src="$UI/system/designer/baas/editor/newTableActionDlg.w" width="50%" status="normal" showTitle="true" height="360px" onReceive="newTableActionDlgReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectTableDlg" style="left:185px;top:108px;" status="normal" showTitle="true" src="$UI/system/designer/baas/editor/selectTableDlg.w" title="选择数据表" width="50%"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectDbDlg" style="left:184px;top:141px;" showTitle="true" status="normal" width="50%" title="选择DB" src="$UI/system/designer/baas/editor/selectDBDlg.w"></span></div>
