<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="codeManagerProcess"> 
    <label language="zh_CN">通用编码管理</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">通用编码管理</label> 
    </static-activity>  
    <has-action action="saveSA_CodeAction" access-permission="public"/>  
    <has-action action="createSA_CodeAction" access-permission="public"/>  
    <has-action action="querySA_CodeAction" access-permission="public"/>  
    <has-action action="querySA_CodeTypeAction" access-permission="public"/> 
  </process> 
</model>
