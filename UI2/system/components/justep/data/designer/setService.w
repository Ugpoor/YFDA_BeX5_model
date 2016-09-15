<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataService" limit="-1" idColumn="path" onCustomRefresh="dataServiceCustomRefresh"
      onValueChanged="dataServiceValueChanged" confirmRefresh="false" confirmDelete="false"> 
      <column label="选择" name="checked" type="Boolean" xid="xid1"/>  
      <column label="BAAS服务" name="path" type="String" xid="xid2"/>  
      <column label="Action" name="action" type="String" xid="xid3"/>  
      <column label="表" name="table" type="String" xid="xid4"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dataActionType" idColumn="value"><column isCalculate="false" label="value" name="value" type="String" xid="xid5"></column>
  <column isCalculate="false" label="label" name="label" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;value&quot;:&quot;all&quot;,&quot;label&quot;:&quot;全部&quot;},{&quot;value&quot;:&quot;query&quot;,&quot;label&quot;:&quot;查询&quot;},{&quot;value&quot;:&quot;save&quot;,&quot;label&quot;:&quot;保存&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="bottom: 0px;">
      <div class="x-control-group x-flex" style="height:54px;" xid="controlGroup1">
      <div class="x-flex1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit4">
   <label class="x-center x-label" xid="label1"><![CDATA[action类型]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-options="dataActionType" bind-optionsValue="value" bind-optionsLabel="label" bind-ref="actionType" onChange="select1Change"></select></div></div> 
      <div class="x-flex1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit6">
   <label class="x-label x-center" xid="label2"><![CDATA[查询]]></label>
   <div class="x-edit" xid="controlGroupForm1"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="filter"></input></div></div></div> 
      </div>
      <div class="x-control-group x-flex1  x-scroll-view"> 
        <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
          xid="scrollView2"> 
          <div class="x-content-center x-pull-down container" xid="controlGroupForm4"> 
            <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i4"/>  
            <span class="x-pull-down-label" xid="span4">下拉刷新...</span>
          </div>  
          <div class="x-scroll-content" xid="controlGroupForm5">
            <div component="$UI/system/components/fragment/list/listTable"
              data="dataService" masterData="" masterCol="" xid="listTable4"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                data="dataService" xid="list4"> 
                <table class="table table-condensed table-hover table-striped"
                  component="$UI/system/components/bootstrap/table/table" xid="table4"> 
                  <thead xid="thead4"> 
                    <tr xid="tr7"> 
                      <th xid="col10" style="width:80px;text-align:center;"> 
                        <label bind-text="$model.dataService.label('checked')"
                          xid="label15"/>
                      </th>  
                      <th xid="col11"> 
                        <label bind-text="$model.dataService.label('path')" xid="label16"/>
                      </th>  
                      <th xid="col12"> 
                        <label bind-text="$model.dataService.label('action')"
                          xid="label17"/>
                      </th>  
                      <th xid="col13"> 
                        <label bind-text="$model.dataService.label('table')"
                          xid="label18"/>
                      </th> 
                    </tr> 
                  </thead>  
                  <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                    xid="tbody4"> 
                    <tr xid="tr8"> 
                      <td xid="td10" style="text-align:center;"> 
                        <span component="$UI/system/components/justep/button/radio"
                          class="x-radio" bind-ref="ref('checked')" xid="radio4" name="checked"/>
                      </td>  
                      <td xid="td11"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" bind-ref="ref('path')" xid="output6"/>
                      </td>  
                      <td xid="td12"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" bind-ref="ref('action')" xid="output7"/>
                      </td>  
                      <td xid="td13"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" bind-ref="ref('table')" xid="output8"/>
                      </td> 
                    </tr> 
                  </tbody> 
                </table> 
              </div> 
            </div>
          </div>  
          <div class="x-content-center x-pull-up" xid="controlGroupForm6"> 
            <span class="x-pull-up-label" xid="span5">加载更多...</span>
          </div> 
        </div>
      </div>  
      <div class="x-control-group" style="height:254px;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25"
          xid="labelEdit1"> 
          <label class="x-label" xid="label11"><![CDATA[服务URL]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="serviceURL" bind-disable="$model.type!=='service'"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25"
          xid="labelEdit5"> 
          <label class="x-label" xid="label19"><![CDATA[表]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input6" bind-ref="table" bind-disable="$model.type!=='service'"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25"
          xid="labelEdit2"> 
          <label class="x-label" xid="label12"><![CDATA[QueryAction]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input3" bind-ref="queryAction" bind-disable="$model.type!=='service'"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25"
          xid="labelEdit3"> 
          <label class="x-label" xid="label13"><![CDATA[SaveAction]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input4" bind-ref="saveAction"/>
        </div> 
      </div>  
    </div> 
  </div> 
</div>
