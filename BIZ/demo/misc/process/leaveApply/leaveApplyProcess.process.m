<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="leaveApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">请假申请</label>  
    <static-activity name="mainActivity"/>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true">
      <label language="zh_CN">请假申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity2"/>  
        
       
    </business-activity>  
    <business-activity name="bizActivity2" condition="true">
      <label language="zh_CN">经理审批</label>  
      <input name="x" unit="bizActivity1"/>  
      <output name="x" unit="conditionFork1"/>  
       
    


</business-activity>  
    <if-else-activity name="conditionFork1" condition="dateDiff('day', relationValue('DEMO_LeaveApply',:sData1,null,null,'fStartTime','/demo/misc/data'), relationValue('DEMO_LeaveApply',:sData1,null,null,'fEndTime','/demo/misc/data')) &gt; 5">
      <label language="zh_CN">请假天数大于5天</label>  
      <input name="x" unit="bizActivity2"/>  
      <true-output name="x" unit="bizActivity3"/>  
      <false-output name="x" unit="end1"/> 
    </if-else-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="queryLeaveApplyAction" access-permission="public"/>  
    <has-action action="createLeaveApplyAction" access-permission="public"/>  
    <has-action action="saveLeaveApplyAction" access-permission="public"/>  
    <business-activity name="bizActivity3" condition="true">
      <label language="zh_CN">总经理审批</label>  
      <input name="x" unit="conditionFork1"/>  
      <output name="x" unit="end1"/> 
    </business-activity> 
  </process> 
</model>
