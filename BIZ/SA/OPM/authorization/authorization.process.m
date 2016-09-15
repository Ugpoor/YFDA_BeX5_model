<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="authorizationProcess"> 
    <label language="zh_CN">授权管理</label>  
    <static-activity name="mainActivity"><label language="zh_CN">授权管理</label>
</static-activity>  
    <has-action action="queryOPAuthorizeAction" access-permission="public"/>  
    <has-action action="queryOPAuthorizePermissionByOrgAction" access-permission="public"/>  
    <has-action action="queryOPOrgAction" access-permission="public"/>  
    <has-action action="appendAuthorizesAction" access-permission="public"/>  
    <has-action action="deleteAuthorizesAction" access-permission="public"/>  
    <has-action action="queryOPRoleAction" access-permission="public"/> 
  <static-activity name="gradeActivity"><label language="zh_CN">授权管理-分级</label>
</static-activity>
</process> 
</model>
