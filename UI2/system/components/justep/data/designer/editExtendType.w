<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window container-fluid">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:107px;top:110px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="name"> 
      <column label="名称" name="name" type="String" xid="column1"></column>
  <column label="数据类型" name="type" type="String" xid="column2"></column>
  <column label="显示名称" name="displayName" type="String" xid="column3"></column>
  <column label="扩展类型" name="extendType" type="String" xid="column4"></column></div> 
  </div>  
  <div component="$UI/system/components/bootstrap/row/row" 
    class="row"> 
    <div class="col col-xs-12" style="overflow: auto;height:490px;"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
        data="data" onCellRender="dataTables1CellRender"> 
        <columns xid="columns1"> 
          <column name="name" xid="column10" orderable="false"/>  
          <column name="displayName" xid="column11" orderable="false"/>  
          <column name="type" xid="column6" orderable="false"></column><column name="extendType" xid="column5" orderable="false"/> 
        </columns> 
      </div> 
    </div> 
  </div> 
</div>
