<?xml version="1.0" encoding="utf-8" standalone="no"?><model xmlns="http://www.justep.com/model">  
  <action name="queryOA_ScheduleAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_Schedule"/>  
    <private name="select" type="String" value="OA_Schedule,OA_Schedule.version as version,OA_Schedule.fName as fName,OA_Schedule.fContent as fContent,OA_Schedule.fPlace as fPlace,OA_Schedule.fStartTime as fStartTime,OA_Schedule.fEndTime as fEndTime,OA_Schedule.fRepeat as fRepeat,OA_Schedule.fRepeatFrequency as fRepeatFrequency,OA_Schedule.fWeekRepeat as fWeekRepeat,OA_Schedule.fRepeatCount as fRepeatCount,OA_Schedule.fUpToDate as fUpToDate,OA_Schedule.fOwn as fOwn,OA_Schedule.fCreatorID as fCreatorID,OA_Schedule.fCreator as fCreator,OA_Schedule.fAttachment as fAttachment,OA_Schedule.fLastModifyTime as fLastModifyTime"/>  
    <private name="from" type="String" value="OA_Schedule OA_Schedule"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_Schedule"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_ScheduleAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_Schedule"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_ScheduleAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_Schedule"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
<action name="queryOA_ScheduleMonthAction" procedure="queryOA_ScheduleMonthProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Schedule"/>
<private name="select" type="String" value="OA_Schedule.*"/>
<private name="from" type="String" value="OA_Schedule OA_Schedule"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Schedule"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">查询某月的日程</label>
<public name="scheMonth" type="String"/>
<public name="schePerson" required="false" type="String"/>
</action>
<action name="queryOA_ScheduleNotSureAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Schedule"/>
<private name="select" type="String" value="OA_Schedule,OA_Schedule.fName as fName,OA_Schedule.fStartTime as fStartTime,OA_Schedule.fEndTime as fEndTime,OA_Schedule.fCreatorID as fCreatorID,OA_Schedule.fCreator as fCreator1,SA_Social.sGroupID as sGroupID"/>
<private name="from" type="String" value="OA_Schedule OA_Schedule  join SA_Social SA_Social on  OA_Schedule = SA_Social.sData1 AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = 'E' AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sESField01 is null"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Schedule"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">未确认日程查询</label>
</action>
<action global="false" name="refuseScheAction" procedure="refuseScheProcedure"><label language="zh_CN">拒绝参加日程</label>
<public name="scheID" type="String"/>
</action>
<action global="false" name="confirmScheAction" procedure="confirmScheProcedure"><label language="zh_CN">确认参加</label>
<public name="scheID" type="String"/>
</action>
</model>