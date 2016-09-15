<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dataTable" limit="-1" idColumn="name" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="dataTableCustomRefresh" onValueChanged="dataTableValueChanged"> 
      <column label="表" name="name" type="String" xid="xid2"></column>
  <column label="选中" name="checked" type="Boolean" xid="xid5"></column>
  <extendType xid="extendType1">
   <col name="checked" type="sys.boolean" xid="extendTypeCol1"></col></extendType>
  <column label="类型" name="type" type="String" xid="xid3"></column></div>  
    </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="bottom: 0px;"> 
      <div class="x-control-group x-flex1" style="overflow-y: auto;"> 
        <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dataTable" multiSelect="false" ordering="false" onRowClick="dataTables1RowClick"> 
                <columns xid="columns1">
                  <column name="checked" xid="column4" width="60px" />
                  <column name="name" xid="column1" /> 
                <column name="type" xid="column3"></column></columns>
              </div></div>  
      <div class="x-control-group" style="height:48px;" xid="div2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="取消" style="float: right;margin-left: 16px;" onClick="{operation:'window.close'}" xid="button1">
    <i xid="i2"></i>
    <span xid="span2">取消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="确定" style="float: right;margin-left: 16px;" onClick="button1Click" xid="button2">
    <i xid="i1"></i>
    <span xid="span1">确定</span></a> </div></div> 
  </div>  
  <span component="$UI/system/components/justep/extendType/commonExtendTypes"
    xid="commonExtendTypes1" style="left:658px;top:145px;"/>
</div>
