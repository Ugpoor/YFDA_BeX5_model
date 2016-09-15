<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">

	<process name="workTaskProcess" >
		<label language="zh_CN">工作任务</label>
		
		
		
		
		
		
		
		<!--  
		<has-action action="queryWPPlanAction"/>
		-->
		<static-activity name="mainActivity"/>
		<static-activity name="useActivity"/>
	<has-action action="queryWorkTaskAction" access-permission="public"></has-action>
<has-action action="createWorkTaskAction" access-permission="public"></has-action>
<has-action action="saveWorkTaskAction" access-permission="public"></has-action>
<has-action action="queryImportanceAction" access-permission="public"></has-action>
<has-action action="queryEmergencyAction" access-permission="public"></has-action>
<has-action action="queryStatusAction" access-permission="public"></has-action>
</process>
</model>