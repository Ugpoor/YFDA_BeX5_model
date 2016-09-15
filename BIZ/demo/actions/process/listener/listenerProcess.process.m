<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="listenerProcess"> 
    <static-activity name="mainActivity"> 
      <label language="zh_CN">动作事件</label> 
    </static-activity>  
    <label language="zh_CN">动作事件</label>
      
      
     
  










<has-action action="queryDEMO_OrdersAction" access-permission="public"></has-action>
<listener action="queryDEMO_OrdersAction" event="before" handler="listenerProcessBeforeQueryDEMO_OrdersActionProcedure"></listener>
<listener action="queryDEMO_OrdersAction" event="after" handler="listenerProcessAfterQueryDEMO_OrdersActionProcedure"></listener>
</process> 
</model>
