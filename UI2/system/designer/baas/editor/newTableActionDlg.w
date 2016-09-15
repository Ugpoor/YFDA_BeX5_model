<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataMain" limit="-1" idColumn="id" confirmRefresh="false" confirmDelete="false"
      onValueChanged="dataMainValueChanged"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="数据库" name="db" type="String" xid="xid2"/>  
      <column label="表" name="table" type="String" xid="xid5"/>  
      <column label="queryAction" name="queryAction" type="String" xid="xid3"/>  
      <column label="saveAction" name="saveAction" type="String" xid="xid4"/>  
      <column label="创建queryAction" name="needQueryAction" type="Boolean" xid="xid6"/>  
      <column label="创建saveAction" name="needSaveAction" type="Boolean" xid="xid7"/>  
      <data xid="default1">[{"id":"0001","needQueryAction":true,"needSaveAction":true}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataDBs" idColumn="db" limit="-1" onCustomRefresh="dataDBsCustomRefresh"> 
      <column label="db" name="db" type="String" xid="xid8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dataTables" idColumn="table" limit="-1" onCustomRefresh="dataTablesCustomRefresh"> 
      <column label="table" name="table" type="String" xid="xid9"/>  
      <column label="db" name="db" type="String" xid="xid10"/>  
      <master xid="default2" relation="db"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="bottom: 0px;"> 
      <div class="x-control-group x-flex1" style="overflow-y: auto;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit3"> 
          <label class="x-label" xid="label3" bind-text="dataMain.label('db')"/>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="dataMain.ref('db')" bind-options="dataDBs" bind-optionsCaption="请选择DB"
            bind-optionsValue="db"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit4"> 
          <label class="x-label" xid="label4" bind-text="dataMain.label('table')"/>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select2" bind-ref="dataMain.ref('table')" bind-options="dataTables"
            bind-optionsCaption="请选择Table" bind-optionsValue="table"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1" bind-text="dataMain.label('queryAction')"/>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label-right x-label10"> 
              <div class="x-label"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" xid="checkbox1" bind-ref="dataMain.ref('needQueryAction')"/> 
              </div>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit  x-left"
                xid="input1" bind-ref="dataMain.ref('queryAction')" style="text-align: left;"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2" bind-text="dataMain.label('saveAction')"/>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label-right x-label10"> 
              <div class="x-label"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" xid="checkbox2" bind-ref="dataMain.ref('needSaveAction')"/> 
              </div>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-left"
                xid="input2" bind-ref="dataMain.ref('saveAction')" style="text-align: left;"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="x-control-group" style="height:48px;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="取消" style="float: right;margin-left: 16px;" onClick="{operation:'window.close'}"> 
          <i xid="i2"/>  
          <span xid="span2">取消</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
          label="确定" style="float: right;margin-left: 16px;" onClick="btnOKClick" bind-enable="canOK" xid="btnOK"> 
          <i xid="i1"/>  
          <span xid="span1">确定</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
