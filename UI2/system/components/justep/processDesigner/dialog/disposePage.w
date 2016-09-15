<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:33px;top:553px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="pageData" idColumn="disposePage"><column label="环节处理页面" name="disposePage" type="String" xid="xid1"></column>
  <column label="环节名称" name="name" type="String" xid="xid2"></column></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-content" xid="content1"><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel3">
   
   <div class="panel-body" xid="body2"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="pageData">
   <columns xid="columns1"><column name="disposePage" xid="column1"></column>
  <column name="name" xid="column2"></column></columns></div></div>
   </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>