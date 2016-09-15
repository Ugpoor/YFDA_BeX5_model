<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:58px;top:365px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fID"> 
      <column label="fID" name="fID" type="String" xid="xid1"/>  
      <column label="全名称" name="fName" type="String" xid="xid2"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>  
  <div component="$UI/system/components/justep/list/list" class="x-list x-list-template list-group"
    xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true" style="margin-bottom: 0px;"> 
    <a href="#" class="list-group-item" style="cursor: pointer;" bind-click="runClick"> 
      <span class="badge">运行</span>  
      <span bind-text="val('fName')"/> 
    </a> 
  </div> 
</div>
