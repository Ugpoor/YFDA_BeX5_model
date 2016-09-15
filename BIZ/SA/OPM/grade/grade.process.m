<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="gradeProcess"> 
    <label language="zh_CN">分级管理</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">分级管理</label> 
    </static-activity>  
      
      
      
      
      
      
      
     
  <has-action action="queryOPManagementAction" access-permission="public"></has-action>
<has-action action="queryOPManageTypeAction" access-permission="public"></has-action>
<has-action action="queryOPOrgAction" access-permission="public"></has-action>
<has-action action="appendManagementsAction" access-permission="public"></has-action>
<has-action action="deleteManagementsAction" access-permission="public"></has-action>
<has-action action="queryOPRoleManagementAction" access-permission="public"></has-action>
<has-action action="appendRoleManagementsAction" access-permission="public"></has-action>
<has-action action="deleteRoleManagementsAction" access-permission="public"></has-action>
<has-action action="queryOPRoleAction" access-permission="public"></has-action>
<static-activity name="gradeActivity"><label language="zh_CN">分级管理-分级</label>
</static-activity>
</process> 
</model>
