<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="noticeRuleProcess" start="start1" end="end1"> 
    <label language="zh_CN">通知规则</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">通知规则</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true">
      <label language="zh_CN">活动环节1</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="conditionFork1"/>  
        
       
    







<notice-rule condition="true" dialog-enabled="true" save-enabled="false" when-to-unit="bizActivity2" task-assign-mode="singleness"><occasion>advanceProcess</occasion>
<executor-range range-expr="findOrgUnitsHasActivity('bizActivity2',null,true)" default-expr="findOrgUnitsHasActivity('bizActivity2',null,true)"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/demo/process/process/noticeRule/toActivity2NoticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:流转到环节2'</item>
</task-relation-value>
</notice-rule>
<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>advanceProcess</occasion>
<executor-range range-expr="findOrgUnitsHasActivity('bizActivity3',null,true)" default-expr="findOrgUnitsHasActivity('bizActivity3',null,true)"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/demo/process/process/noticeRule/toActivity3NoticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:流转到环节3'</item>
</task-relation-value>
</notice-rule>
</business-activity>  
    <business-activity name="bizActivity2" condition="true">
      <label language="zh_CN">活动环节2</label>  
      <output name="x" unit="bizActivity3"/>  
      <input name="x" unit="conditionFork1">
        <label language="zh_CN">大于100</label> 
      </input>  
       
    



<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>backProcess</occasion>
<executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/demo/process/process/noticeRule/backNoticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:回退'</item>
</task-relation-value>
</notice-rule>
</business-activity>  
    <business-activity name="bizActivity3" condition="true">
      <label language="zh_CN">活动环节3</label>  
      <input name="x" unit="bizActivity2"/>  
      <output name="x" unit="end1"/>  
      <input name="x" unit="conditionFork1">
        <label language="zh_CN">小于等于100</label> 
      </input>  
       
    


<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>backProcess</occasion>
<executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/demo/process/process/noticeRule/backNoticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:回退'</item>
</task-relation-value>
</notice-rule>
</business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="endNoticeActivity">
      <label language="zh_CN">通知：结束</label> 
    </static-activity>  
      
    <static-activity name="toActivity2NoticeActivity">
      <label language="zh_CN">通知：流转到环节2</label> 
    </static-activity>  
    <static-activity name="toActivity3NoticeActivity">
      <label language="zh_CN">通知：流转到环节3</label> 
    </static-activity>  
    <if-else-activity name="conditionFork1" condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &gt; 100">
      <label language="zh_CN">条件分支1</label>  
      <input name="x" unit="bizActivity1"/>  
      <true-output name="x" unit="bizActivity2"/>  
      <false-output name="x" unit="bizActivity3"/> 
    </if-else-activity>  
    <static-activity name="backNoticeActivity">
      <label language="zh_CN">通知：回退</label> 
    </static-activity>  
    <has-action action="queryOrderAction" access-permission="public"/>  
    <has-action action="createOrderAction" access-permission="public"/>  
    <has-action action="saveOrderAction" access-permission="public"/> 
  

<notice-rule condition="true" dialog-enabled="true" save-enabled="true" task-assign-mode="singleness"><occasion>finishProcess</occasion>
<executor-range range-expr="findActivityExecutor('ALL')" default-expr="findActivityExecutor('ALL')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/demo/process/process/noticeRule/endNoticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:结束'</item>
</task-relation-value>
</notice-rule>
</process> 
</model>
