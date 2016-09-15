<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="workTaskProcess">
    <label language="zh_CN">工作任务</label>
    <has-action action="queryWorkTaskAction"/>
    <has-action action="createWorkTaskAction"/>
    <has-action action="saveWorkTaskAction"/>
    <has-action action="queryImportanceAction"/>
    <has-action action="queryEmergencyAction"/>
    <has-action action="queryStatusAction"/>
    <static-activity name="mainActivity">
      <label language="zh_CN">工作任务活动</label>
    </static-activity>
    <static-activity name="useActivity"/>
    <static-activity name="pubActivity"/>
  </process>
</model>
