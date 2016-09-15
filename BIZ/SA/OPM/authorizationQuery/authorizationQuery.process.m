<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="authorizationQueryProcess"> 
    <label language="zh_CN">权限查询</label>  
    <static-activity name="mainActivity">
      <label language="zh_CN">权限查询</label> 
    </static-activity>  
    <static-activity name="gradeActivity">
      <label language="zh_CN">权限查询-分级</label> 
    </static-activity>  
      
      
  



<has-action action="queryOPOrgAction" access-permission="public"></has-action>
<has-action action="queryOPRoleAction" access-permission="public"></has-action>
<has-action action="queryOrgByPermissionAction" access-permission="public"></has-action>
<has-action action="queryOPAuthorizePermissionByOrgAction" access-permission="public"></has-action>
</process> 
</model>
