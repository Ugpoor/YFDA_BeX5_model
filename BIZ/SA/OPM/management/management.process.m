<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="managementProcess"> 
    <label language="zh_CN">业务管理权限</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">业务管理权限</label> 
    </static-activity>  
      
      
      
      
     
  <static-activity name="gradeActivity"><label language="zh_CN">业务管理权限-分级</label>
</static-activity>
<has-action action="queryOPManagementAction" access-permission="public"></has-action>
<has-action action="queryOPManageTypeAction" access-permission="public"></has-action>
<has-action action="queryOPOrgAction" access-permission="public"></has-action>
<has-action action="appendManagementsAction" access-permission="public"></has-action>
<has-action action="deleteManagementsAction" access-permission="public"></has-action>
<has-action action="saveOPManageTypeAction" access-permission="public"></has-action>
<has-action action="createOPManageTypeAction" access-permission="public"></has-action>
<static-activity name="manageTypeSetting"><label language="zh_CN">业务管理类型设置</label>
</static-activity>
</process> 
</model>
