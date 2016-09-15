<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="systemProcess" kind="SYSTEM">
    <label language="zh_CN">系统窗体</label>
    <static-activity name="mainActivity">
      <label language="zh_CN">附件调用</label>
    



<has-action action="uploadFile" access-permission="public"></has-action>
<has-action action="queryDocFileIDs" access-permission="public"></has-action>
</static-activity>
    <static-activity name="dirSelectActivity">
      <label language="zh_CN">文件夹选择</label>
    </static-activity>
    <static-activity name="docSelectActivity">
      <label language="zh_CN">文件选择</label>
    </static-activity>
  <has-action action="ksqlQueryAction" access-permission="public"></has-action>
</process>
</model>
