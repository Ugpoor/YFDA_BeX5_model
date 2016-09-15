<?xml version="1.0" encoding="utf-8" standalone="no"?><model xmlns="http://www.justep.com/model">  
  <action name="queryOA_TasksAssignedAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="select" type="String" value="OA_TasksAssigned.*"/>  
    <private name="from" type="String" value="OA_TasksAssigned OA_TasksAssigned"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_TasksAssigned"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_TasksAssigned.fLastModifyTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询工作交办</label> 
  </action>  
  <action name="saveOA_TasksAssignedAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_TasksAssignedAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_TasksAssignedDateAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssignedDate"/>  
    <private name="select" type="String" value="OA_TasksAssignedDate.*"/>  
    <private name="from" type="String" value="OA_TasksAssignedDate OA_TasksAssignedDate"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_TasksAssignedDate"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_TasksAssignedDateAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssignedDate"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_TasksAssignedDateAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_TasksAssignedDate"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_TasksAssignedOpAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="select" type="String" value="OA_TasksAssigned.*,SA_Social.sGroupID as sGroupID,SA_Social.sMessageNumber as sMessageNumber,SA_Social_att.sActive as sActive"/>  
    <private name="from" type="String" value="OA_TasksAssigned OA_TasksAssigned  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_TasksAssigned = SA_SocialOne.sData1 join SA_Social SA_Social on  OA_TasksAssigned = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID  optional  join SA_Social SA_Social_att on  OA_TasksAssigned = SA_Social_att.sData1 AND SA_Social_att.sPersonID = :currentPersonID() AND SA_Social_att.sTypeID = 'Focus' AND SA_Social_att.sValidState = 1"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="OA_TasksAssigned.fStatus = '未关闭'"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_TasksAssigned"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_TasksAssigned.fLastModifyTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">未关闭</label> 
  </action>  
  <action name="queryOA_TasksAssignedClAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="select" type="String" value="OA_TasksAssigned.*,SA_Social.sGroupID as sGroupID,SA_Social.sMessageNumber as sMessageNumber,SA_Social_att.sActive as sActive"/>  
    <private name="from" type="String" value="OA_TasksAssigned OA_TasksAssigned  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_TasksAssigned = SA_SocialOne.sData1 join SA_Social SA_Social on  OA_TasksAssigned = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID  optional  join SA_Social SA_Social_att on  OA_TasksAssigned = SA_Social_att.sData1 AND SA_Social_att.sPersonID = :currentPersonID() AND SA_Social_att.sTypeID = 'Focus' AND SA_Social_att.sValidState = 1"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="OA_TasksAssigned.fStatus = '已关闭'"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_TasksAssigned"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_TasksAssigned.fLastModifyTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">已关闭</label> 
  </action>  
  <action name="queryOA_TasksAssignedAllAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_TasksAssigned"/>  
    <private name="select" type="String" value="OA_TasksAssigned.*,SA_Social.sGroupID as sGroupID,SA_Social.sMessageNumber as sMessageNumber,SA_Social_att.sActive as sActive"/>  
    <private name="from" type="String" value="OA_TasksAssigned OA_TasksAssigned  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_TasksAssigned = SA_SocialOne.sData1 join SA_Social SA_Social on  OA_TasksAssigned = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID  optional  join SA_Social SA_Social_att on  OA_TasksAssigned = SA_Social_att.sData1 AND SA_Social_att.sPersonID = :currentPersonID() AND SA_Social_att.sTypeID = 'Focus' AND SA_Social_att.sValidState = 1"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/personalOffice/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_TasksAssigned"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_TasksAssigned.fLastModifyTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">全部数据查询</label> 
  </action> 
</model>