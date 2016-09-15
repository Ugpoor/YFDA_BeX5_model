<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="referSendDocProcess">   
    <label language="zh_CN">发文查询</label>
    <has-action action="querySendDocAction"/>
    <has-action action="createSendDocAction"/>   
    <has-action action="saveSendDocAction"/>
    <has-action action="querySendDirectAction"/>
    <has-action action="querySecretLevelAction"/>
    <has-action action="queryExigenceLevelAction"/>
    <static-activity name="mainActivity">
      <label language="zh_CN">mainActivity</label>
    </static-activity>
  </process>
</model>
