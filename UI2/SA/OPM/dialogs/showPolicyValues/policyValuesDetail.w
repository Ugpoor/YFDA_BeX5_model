<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:202px;top:136px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="valuesData" idColumn="id" onCustomRefresh="valuesDataCustomRefresh" confirmRefresh="false"
      confirmDelete="false">
      <column name="id" type="String" xid="default1"/>  
      <column name="value" type="String" xid="default2"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly1"> 
          <expr xid="default3">$model.openMode.get() == 'view'</expr>
        </readonly> 
      </rule>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:166px;top:279px;" onReceive="windowReceiverReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline" xid="toolBar1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新建" xid="newBtn" icon="icon-android-add" onClick="newBtnClick" bind-disable="$model.openMode.get() == 'view'">
    <i xid="i3" class="icon-android-add"></i>
    <span xid="span3">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="删除" xid="deleleBtn" icon="icon-android-remove" bind-disable="$model.openMode.get() == 'view'" onClick="deleleBtnClick">
    <i xid="i4" class="icon-android-remove"></i>
    <span xid="span4">删除</span></a> </div></div><div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" xid="valuesGrid" data="valuesData" width="100%" height="100%"
        multiselect="true" multiboxonly="true" class="x-grid-title-center"> 
        <columns xid="columns1">
          <column name="value" xid="column1" label="策略值" editable="true">
            <editor xid="editor1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="ref('value')"/>
            </editor>
          </column>
        </columns>
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
</div>
