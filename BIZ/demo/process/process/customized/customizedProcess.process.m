<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="customizedProcess" start="start1" end="end1"> 
    <label language="zh_CN">定制模板</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">定制模板</label> 
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true"> 
      <label language="zh_CN">活动环节1</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="conditionBranch1"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="true" ignore-execute-mode="false" task-wait="false" task-join="false"
        customized-type="graph2"/> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true"> 
      <label language="zh_CN">活动环节2</label>  
      <output name="x" unit="conditionActivity1"/>  
      <input name="x" unit="conditionBranch1"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr="">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sESField05">'abc'</item>  
          <item relation="sExecuteMode">'temSimultaneous'</item> 
        </task-relation-value> 
      </execute-rule> 
    
<advance-rule condition="true" dialog-enabled="true" save-enabled="true" jump-enabled="false" customized-enabled="true" ignore-execute-mode="false" task-wait="false" task-join="false" customized-type="graph2"></advance-rule>
</business-activity>  
    <business-activity name="bizActivity3" condition="true"> 
      <label language="zh_CN">活动环节3</label>  
      <input name="x" unit="conditionBranch1"/>  
      <input name="x" unit="conditionActivity1"/>  
      <output name="x" unit="end1"/> 
    
<advance-rule condition="true" dialog-enabled="true" save-enabled="true" jump-enabled="false" customized-enabled="true" ignore-execute-mode="false" task-wait="false" task-join="false" customized-type="graph2"></advance-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="queryOrderAction" access-permission="public"/>  
    <has-action action="createOrderAction" access-permission="public"/>  
    <has-action action="saveOrderAction" access-permission="public"/>  
    <if-else-activity name="conditionBranch1" condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &gt; 100"> 
      <label language="zh_CN">条件分支1</label>  
      <input name="x" unit="bizActivity1"/>  
      <true-output name="x" unit="bizActivity2"/>  
      <false-output name="x" unit="bizActivity3"/> 
    </if-else-activity>  
    <condition-activity condition="true" name="conditionActivity1"> 
      <label language="zh_CN">条件环节1</label>  
      <input name="x" unit="bizActivity2"/>  
      <output name="x" unit="bizActivity3"/> 
    </condition-activity> 
  
<start-rule condition="true"><task-relation-value><item relation="sProcessTemplateID2">findTemplateByCurrentPerson()</item>
<item relation="sName">'定制模板'</item>
</task-relation-value>
</start-rule>
</process> 
</model>
