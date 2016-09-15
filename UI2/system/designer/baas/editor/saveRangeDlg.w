<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dataTable" limit="-1" idColumn="name" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="dataTableCustomRefresh"> 
      <column label="表" name="name" type="String" xid="xid2"/>  
      <column label="选中" name="checked" type="Boolean" xid="xid5"/>  
      <extendType>
        <col name="checked" type="sys.boolean"/>  
      </extendType>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataFiled" limit="-1" idColumn="name" onLoadSlave="dataFiledLoadSlave">
      <column label="字段" name="name" type="String" xid="xid1"/>  
      <column label="说明" name="info" type="String" xid="xid3"/>  
      <column label="表" name="tableName" type="String" xid="xid4"/>  
      <master data="dataTable" relation="tableName" xid="default1"/>  
      <column label="选中" name="checked" type="Boolean" xid="xid6"/>
      <extendType>
        <col name="checked" type="sys.boolean"/>  
      </extendType>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="bottom: 0px;"> 
      <div class="x-control-group x-flex1" style="overflow-y: auto;"> 
        <div xid="div1" class="container-fluid ">
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col2">
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                xid="dataTables1" data="dataTable" multiSelect="false" ordering="false"> 
                <columns xid="columns1">
                  <column name="checked" xid="column4" width="60px"/>
                  <column name="name" xid="column1"/> 
                </columns>
              </div>
            </div>  
            <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8 col-spliter-left"
              xid="col3">
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                xid="dataTables2" data="dataFiled" ordering="false" multiSelect="false"> 
                <columns xid="columns2">
                  <column name="checked" xid="column5" width="60px"/>
                  <column name="name" xid="column2"/>  
                  <column name="info" xid="column3"/> 
                </columns>
              </div>
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
          label="确定" style="float: right;margin-left: 16px;" onClick="button1Click"> 
          <i xid="i1"/>  
          <span xid="span1">确定</span> 
        </a> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/extendType/commonExtendTypes"
    xid="commonExtendTypes1" style="left:658px;top:145px;"/>
</div>
