<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="portalProfilesProcess" kind="SYSTEM"> 
    <label language="zh_CN">portalProfiles</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">mainActivity</label> 
    </static-activity>  
    <has-action action="savePortalProfilesAction" access-permission="public"/>  
    <has-action action="selectPortalProfilesAction" access-permission="public"/>  
    <has-action action="removePortalProfilesAction" access-permission="public"/> 
  </process> 
</model>
