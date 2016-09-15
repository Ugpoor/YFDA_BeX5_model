<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="docSettingProcess">
    <label language="zh_CN">分布式文档设置</label>    
      <has-action action="queryNameSpaceAction"/>
      <has-action action="createNameSpaceAction"/>
      <has-action action="saveNameSpaceAction"/>
      <has-action action="queryDocNodeAction"/>
      <has-action action="createDocNodeAction"/>
      <has-action action="saveDocNodeAction"/>
      <static-activity name="mainActivity"/>
  </process>
</model>
