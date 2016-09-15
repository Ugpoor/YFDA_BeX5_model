<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="paramAccessProcess"> 
    <label language="zh_CN">参数访问权限</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">参数访问权限</label> 
    </static-activity>  
    <has-action action="queryDEMO_OrdersAction" access-permission="public">
      <protected name="condition" type="String" value="DEMO_Orders.fStatus = 'checked'"/> 
    </has-action>  
    <has-action action="paramAccessCreateDataPermission" access-permission="public"/>  
    <has-action action="paramAccessAuthorize" access-permission="public"/> 
  </process> 
</model>
