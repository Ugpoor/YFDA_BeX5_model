<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryOA_LeaveApplyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_LeaveApplyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_LeaveApplyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_LeaveApply"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_LeaveApplyExAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*,SA_Task.sCreateTime as sCreateTime,SA_Task,SA_Task.sEURL as sEURL,SA_Task.sProcess as sProcess,SA_Task.sActivity as sActivity"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply  optional  join SA_Task SA_Task on SA_Task.sData1 = OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="SA_Task.sStatusID = 'tesReady' AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sExecutorPersonID = :currentPersonID() AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess'"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_LeaveApply.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">我审批</label>
</action>
<action global="false" name="calcLeaveDaysAction" procedure="calcLeaveDaysProcedure"><public name="startTime" type="String"/>
<public name="endTime" type="String"/>
<label language="zh_CN">计算请假天数</label>
</action>
<action name="queryOA_LeaveApplyCrAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_LeaveApply.fCreatorID = :currentPersonID() AND OA_LeaveApply.fStatus &lt;&gt; '已审批' AND OA_LeaveApply.fStatus &lt;&gt; '已终止' AND  not ((((((((((( OA_LeaveApply in (select  SA_Task.sData1 from SA_Task SA_Task  where  SA_Task.sExecutorPersonID = :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sStatusID = 'tesReady' AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess' ) )))))))))))"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_LeaveApply.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">我发起</label>
</action>
<action name="queryOA_LeaveApplyClAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*,SA_Task_One.sCreateTime as sCreateTime"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply  join (select  SA_Task.sData1, max(SA_Task.sCreateTime) as sCreateTime from SA_Task SA_Task  where  SA_Task.sExecutorPersonID = :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess'   group by SA_Task.sData1) SA_Task_One on SA_Task_One.sData1 = OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="( OA_LeaveApply.fStatus = '已审批' OR OA_LeaveApply.fStatus = '已终止' )"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_LeaveApply.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">已审批</label>
</action>
<action name="queryOA_LeaveApply1AllAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*,SA_Task_One.sCreateTime as sCreateTime"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply  join (select  SA_Task.sData1, max(SA_Task.sCreateTime) as sCreateTime from SA_Task SA_Task  where  SA_Task.sExecutorPersonID = :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess'   group by SA_Task.sData1) SA_Task_One on SA_Task_One.sData1 = OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_LeaveApply.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">全部请假申请</label>
</action>
<action name="queryOA_LeaveApply1PaAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LeaveApply"/>
<private name="select" type="String" value="OA_LeaveApply.*,SA_Task_One.sCreateTime as sCreateTime"/>
<private name="from" type="String" value="OA_LeaveApply OA_LeaveApply  join (select  SA_Task.sData1, max(SA_Task.sCreateTime) as sCreateTime from SA_Task SA_Task  where  SA_Task.sExecutorPersonID = :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sStatusID &lt;&gt; 'tesReady' AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess'   group by SA_Task.sData1) SA_Task_One on SA_Task_One.sData1 = OA_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_LeaveApply.fStatus &lt;&gt; '已审批' AND OA_LeaveApply.fStatus &lt;&gt; '已终止' AND OA_LeaveApply.fCreatorID &lt;&gt; :currentPersonID() AND  not (((((( OA_LeaveApply in (select  SA_Task.sData1 from SA_Task SA_Task  where  SA_Task.sExecutorPersonID = :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sStatusID = 'tesReady' AND SA_Task.sProcess = '/OA/personalOffice/process/leaveApply/leaveApplyProcess' ) ))))))"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_LeaveApply.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">我相关</label>
</action>
</model>