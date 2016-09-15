<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:244px;top:246px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="paramData" idColumn="id" onCustomRefresh="paramDataCustomRefresh" confirmDelete="false"
      confirmRefresh="false">
      <column name="id" type="String" xid="default1"/>  
      <column name="action" type="String" xid="default2"/>  
      <column name="actionLabel" type="String" xid="default3"/>  
      <column name="param" type="String" xid="default4"/>  
      <column name="paramLabel" type="String" xid="default5"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:176px;top:330px;" onReceive="windowReceiverReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-bordered table-hover" xid="paramTables"
        data="paramData"> 
        <columns xid="columns1">
          <column name="actionLabel" xid="column1" label="动作" orderable="false"/>  
          <column name="paramLabel" xid="column2" label="参数" orderable="false"/>
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
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span>
      </a>
    </div>
  </div>
</div>
