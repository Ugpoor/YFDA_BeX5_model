<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="organizationProcess"> 
    <label language="zh_CN">组织管理</label>  
    <static-activity name="mainActivity">
      <label language="zh_CN">组织管理</label> 
    </static-activity>  
    <static-activity name="gradeActivity">
      <label language="zh_CN">组织管理-分级</label> 
    </static-activity>  
    <static-activity name="orgLevelSetting">
      <label language="zh_CN">组织级别设置</label> 
    </static-activity>  
    <has-action action="queryOPOrgAction" access-permission="public"/>  
    <has-action action="saveOPOrgAction" access-permission="public"/>  
    <has-action action="createOPOrgAction" access-permission="public"/>  
    <has-action action="queryOPPersonAction" access-permission="public"/>  
    <has-action action="saveOPPersonAction" access-permission="public"/>  
    <has-action action="createOPPersonAction" access-permission="public"/>  
    <has-action action="disableOrgAction" access-permission="public"/>  
    <has-action action="enableOrgAction" access-permission="public"/>  
    <has-action action="logicDeleteOrgAction" access-permission="public"/>  
    <has-action action="sortOrgsAction" access-permission="public"/>  
    <has-action action="moveOrgAction" access-permission="public"/>  
    <has-action action="assignPersonAction" access-permission="public"/>  
    <has-action action="resetPasswordAction" access-permission="public"/>  
    <has-action action="changePersonMainOrgAction" access-permission="public"/>  
    <has-action action="enableSlavePsmAction" access-permission="public"/>  
    <has-action action="synchronizeMessengerOrgAction" access-permission="public"/>  
    <has-action action="queryOrgLevelAction" access-permission="public"/>  
    <has-action action="saveOrgLevelAction" access-permission="public"/>  
    <has-action action="createOrgLevelAction" access-permission="public"/>  
    <has-action action="getCurrentPersonMainFID" access-permission="public"/>  
    <has-action action="queryOPAuthorizeAction" access-permission="public"/>  
    <has-action action="appendAuthorizesAction" access-permission="public"/>  
    <has-action action="deleteAuthorizesAction" access-permission="public"/>  
    <has-action action="queryOPRoleAction" access-permission="public"/> 
  </process> 
</model>
