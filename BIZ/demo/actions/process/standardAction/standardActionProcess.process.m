<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="standardActionProcess"> 
    <label language="zh_CN">标准动作</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">标准动作</label> 
    </static-activity>  
    <has-action action="queryDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="saveDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="createDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="queryDEMO_OrderDetailsAction" access-permission="public"/>  
    <has-action action="saveDEMO_OrderDetailsAction" access-permission="public"/>  
    <listener action="saveDEMO_OrderDetailsAction" event="before" handler="standardActionProcessBeforeSaveDEMO_OrderDetailsActionProcedure"/>  
    <has-action action="createDEMO_OrderDetailsAction" access-permission="public"/>  
    <has-action action="queryDEMO_ProductsAction" access-permission="public"/>  
    <has-action action="queryDistinctShipCityAction" access-permission="public"/> 
  </process> 
</model>
