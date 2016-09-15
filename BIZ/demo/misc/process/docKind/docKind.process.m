<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="docKindProcess">
    <label language="zh_CN">文种设置</label>
    <has-action action="queryDocKindAction"/>
    <has-action action="createDocKindAction"/>
    <has-action action="saveDocKindAction"/>
    <static-activity name="DocKindActivity">
      <label language="zh_CN">DocKindActivity</label>
    </static-activity>
  </process>
</model>
