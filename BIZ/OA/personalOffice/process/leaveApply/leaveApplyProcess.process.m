<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="leaveApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">请假申请</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">请假申请</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="businessActivity1" condition="true">
      <label language="zh_CN">请假申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="businessActivity2"/> 
    </business-activity>  
    <business-activity name="businessActivity2" condition="true">
      <label language="zh_CN">部门审批</label>  
      <input name="x" unit="businessActivity1"/>  
      <output name="x" unit="conditionBranch1"/> 
    </business-activity>  
    <static-activity name="listActivity"/>  
    <if-else-activity name="conditionBranch1" condition="relationValue('OA_LeaveApply',getProcessData1(),null,null,'fLeaveTime','/OA/personalOffice/data') &gt; 1">
      <label language="zh_CN">一日以上</label>  
      <input name="x" unit="businessActivity2"/>  
      <true-output name="x" unit="businessActivity3"/>  
      <false-output name="x" unit="businessActivity5"/> 
    </if-else-activity>  
    <business-activity name="businessActivity3" condition="true">
      <label language="zh_CN">总经理审批</label>  
      <input name="x" unit="conditionBranch1"/>  
      <output name="x" unit="conditionBranch2"/> 
    </business-activity>  
    <if-else-activity name="conditionBranch2" condition="relationValue('OA_LeaveApply',getProcessData1(),null,null,'fLeaveTime','/OA/personalOffice/data') &gt; 3">
      <label language="zh_CN">三日以上</label>  
      <input name="x" unit="businessActivity3"/>  
      <true-output name="x" unit="businessActivity4"/>  
      <false-output name="x" unit="businessActivity5"/> 
    </if-else-activity>  
    <business-activity name="businessActivity4" condition="true">
      <label language="zh_CN">董事长审批</label>  
      <input name="x" unit="conditionBranch2"/>  
      <output name="x" unit="businessActivity5"/> 
    </business-activity>  
    <business-activity name="businessActivity5" condition="true">
      <label language="zh_CN">综合办公室审批</label>  
      <input name="x" unit="businessActivity4"/>  
      <output name="x" unit="end1"/>  
      <input name="x" unit="conditionBranch1">
        <label language="zh_CN">小于等于一天</label> 
      </input>  
      <input name="x" unit="conditionBranch2">
        <label language="zh_CN">小于等于3天</label> 
      </input> 
    </business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
    <listener action="advanceProcessAction" event="after" handler="leaveApplyProcessAfterAdvanceProcedure"/>  
    <listener action="abortProcessAction" event="after" handler="leaveApplyProcessAfterAbortProcedure"/>  
    <listener action="finishProcessAction" event="after" handler="leaveApplyProcessAfterFinishProcedure"/>  
    <listener action="startProcessAction" event="after" handler="leaveApplyProcessAfterStartProcedure"/>  
      
      
      
      
      
      
     
  























<has-action action="queryOA_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="saveOA_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="createOA_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="calcLeaveDaysAction" access-permission="public"></has-action>
<has-action action="queryOA_LeaveApplyExAction" access-permission="public"></has-action>
<has-action action="queryOA_LeaveApplyCrAction" access-permission="public"></has-action>
<has-action action="queryOA_LeaveApplyClAction" access-permission="public"></has-action>
<has-action action="queryOA_LeaveApply1AllAction" access-permission="public"></has-action>
<has-action action="queryOA_LeaveApply1PaAction" access-permission="public"></has-action>





<start-rule condition="true"><task-relation-value><item relation="sName">concat(relationValue('OA_LeaveApply',getProcessData1(),null,null,'fCreator','/OA/personalOffice/data'),'请',
relationValue('OA_LeaveApply',getProcessData1(),null,null,'fLeaveType','/OA/personalOffice/data'),
toString(monthOf(relationValue('OA_LeaveApply',getProcessData1(),null,null,'fStartTime','/OA/personalOffice/data'))),'-',
toString(dayOf(relationValue('OA_LeaveApply',getProcessData1(),null,null,'fStartTime','/OA/personalOffice/data'))),'至',
toString(monthOf(relationValue('OA_LeaveApply',getProcessData1(),null,null,'fEndTime','/OA/personalOffice/data'))),'-',
toString(dayOf(relationValue('OA_LeaveApply',getProcessData1(),null,null,'fEndTime','/OA/personalOffice/data'))))</item>
</task-relation-value>
</start-rule>
<notice-rule condition="true" dialog-enabled="true" save-enabled="true" task-assign-mode="singleness"><occasion>finishProcess</occasion>
<executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')"></executor-range>
<task-relation-value><item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sEURL">'/OA/personalOffice/process/leaveApply/businessActivity1.a'</item>
<item relation="sName">'通知:请假申请'</item>
</task-relation-value>
</notice-rule>
<listener action="backProcessAction" event="after" handler="leaveApplyProcessAfterBackProcedure"></listener>
</process> 
</model>
