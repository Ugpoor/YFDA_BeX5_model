<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">  
  <process name="sendDocProcess" end="end1" start="start1"> 
    <label language="zh_CN">发文流程</label>  
    <has-action action="querySendDocAction"/>  
    <has-action action="createSendDocAction"/>  
    <has-action action="saveSendDocAction"/>  
    <has-action action="queryDocKindAction"/>  
    <has-action action="querySendDirectAction"/>  
    <has-action action="querySecretLevelAction"/>  
    <has-action action="queryExigenceLevelAction"/>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">mainActivity</label> 
    </static-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <place name="xor4"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="meetingActivity" condition="true"> 
      <label language="zh_CN">部门会签</label>       
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <input name="x" unit="xor1"></input>
      <output name="x" unit="xor3"></output>
    </business-activity>  
    <business-activity name="drafterActivity" condition="true"> 
      <label language="zh_CN">主办人处理</label>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="draftActivity"/> 
      </back-rule>  
      <output name="x" unit="xor1"></output>
      <input name="x" unit="xor3"></input>
    </business-activity>  
    <business-activity name="signActivity" condition="true"> 
      <label language="zh_CN">领导签发</label>   
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <input name="x" unit="xor2"></input>
      <output name="x" unit="xor4"></output>
    </business-activity>  
    <business-activity name="printActivity" condition="true"> 
      <label language="zh_CN">打印</label>      
      <output name="x" unit="stampActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <input name="x" unit="proofActivity"></input>
    </business-activity>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="deptActivity" condition="true"> 
      <label language="zh_CN">本部门审核</label>   
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <input name="x" unit="xor1"></input>
      <output name="x" unit="xor3"></output>
    </business-activity>  
    <token name="t1270693822578"/>  
    <business-activity name="stampActivity" condition="true"> 
      <label language="zh_CN">用印</label>  
      <output name="x" unit="publishActivity"/>  
      <input name="x" unit="printActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
    </business-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="t1270693822578"/> 
    </place>  
    <business-activity name="publishActivity" condition="true"> 
      <label language="zh_CN">发布</label>  
      <input name="x" unit="stampActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
    </business-activity>  
    <business-activity name="leaderActivity" condition="true"> 
      <label language="zh_CN">领导阅签</label>    
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <input name="x" unit="xor2"></input>
      <output name="x" unit="xor4"></output>
    </business-activity>  
    <place name="xor3"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="draftActivity" condition="true"> 
      <label language="zh_CN">拟稿</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="xor1"/> 
    </business-activity>  
    <place name="xor2"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="checkActivity" condition="true"> 
      <label language="zh_CN">核稿</label>  
      <output name="x" unit="xor2"/>  
      <input name="x" unit="xor1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findActivityExecutor('draftActivity')" default-expr="findActivityExecutor('draftActivity')">
          <kind>PSM</kind>
        </executor-range>
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>
          <item relation="sExecuteMode">'temPreempt'</item>
          <item relation="sName">'核稿:发文流程'</item>
        </task-relation-value>
      </execute-rule>
    </business-activity>  
    <business-activity name="checkerActivity" condition="true"> 
      <label language="zh_CN">办公室处理</label>      
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findActivityExecutor('draftActivity')" default-expr="findActivityExecutor('draftActivity')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">'办公室处理:发文流程:执行规则'</item> 
        </task-relation-value> 
      </execute-rule> 
      <input name="x" unit="xor4"></input>
      <output name="x" unit="xor2"></output>
    </business-activity>  
    <business-activity name="proofActivity" condition="true"> 
      <label language="zh_CN">校对</label>  
      <input name="x" unit="xor2"/>  
      <output name="x" unit="printActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="draftActivity"/> 
      </back-rule> 
    </business-activity> 
  </process> 
</model>