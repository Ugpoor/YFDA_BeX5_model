<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="authorizationByRoleProcess"> 
    <label language="zh_CN">按角色授权</label>  
    <static-activity name="mainActivity"><label language="zh_CN">按角色授权</label>
</static-activity>  
      
      
      
      
      
     
  <static-activity name="gradeActivity"><label language="zh_CN">按角色授权-分级</label>
</static-activity>

















<has-action action="queryOPOrgAction" access-permission="public"></has-action>
<has-action action="appendAuthorizesAction" access-permission="public"></has-action>
<has-action action="deleteAuthorizesAction" access-permission="public"></has-action>
<has-action action="queryOPRoleAction" access-permission="public"></has-action>
<has-action action="queryOPAuthorizeByRoleAction" access-permission="public"></has-action>
<has-action action="queryDistinctOPAuthorizeOrgByRoleAction" access-permission="public"></has-action>
</process> 
</model>
