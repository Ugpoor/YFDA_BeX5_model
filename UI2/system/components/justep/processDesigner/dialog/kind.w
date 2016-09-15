<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:281px;top:541px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="kindData" idColumn="kind"><column label="编码" name="kind" type="String" xid="xid1"></column>
  <column label="名称" name="kindName" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;kind&quot;:&quot;ogn&quot;,&quot;kindName&quot;:&quot;机构&quot;},{&quot;kind&quot;:&quot;dpt&quot;,&quot;kindName&quot;:&quot;部门&quot;},{&quot;kind&quot;:&quot;pos&quot;,&quot;kindName&quot;:&quot;岗位&quot;},{&quot;kind&quot;:&quot;psm&quot;,&quot;kindName&quot;:&quot;人员&quot;}]</data></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-content" xid="content1">
    <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel3">
     <div class="panel-body" xid="body2">
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="kindData" multiSelect="true">
       <columns xid="columns1">
        <column name="kind" xid="column1"></column>
  <column name="kindName" xid="column2"></column></columns> </div> </div> </div> </div> 
   <div class="x-panel-bottom" xid="bottom1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
     <i xid="i1"></i>
     <span xid="span1">取消</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
     <i xid="i2"></i>
     <span xid="span2">确定</span></a> </div> </div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver"></span></div>