<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <action name="queryOA_CustomerVisitAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_CustomerVisit"/>  
    <private name="select" type="String" value="OA_CustomerVisit.*,OA_Customer.fVisitNum as fVisitNum"/>  
    <private name="from" type="String" value="OA_CustomerVisit OA_CustomerVisit  optional  join OA_Customer OA_Customer on OA_CustomerVisit.fCustomerID = OA_Customer"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/CRM/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CustomerVisit"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_CustomerVisitAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_CustomerVisit"/>  
    <private name="dataModel" type="String" value="/OA/CRM/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_CustomerVisitAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_CustomerVisit"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_CustomerVisitRecentAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_CustomerVisit"/>  
    <private name="select" type="String" value="OA_CustomerVisit.*,OA_Customer.fVisitNum as fVisitNum"/>  
    <private name="from" type="String" value="OA_CustomerVisit OA_CustomerVisit  optional  join OA_Customer OA_Customer on OA_CustomerVisit.fCustomerID = OA_Customer"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/CRM/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="( OA_CustomerVisit.fCreatorID = :currentPersonID() OR  fCustomerID in (select  SA_Social.sData1 from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = 'E' AND SA_Social.sProcess = '/OA/CRM/process/customer/customerProcess' )  ) AND OA_CustomerVisit.fVisitTime &gt;= :addDays( :currentDate() ,  -1)"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CustomerVisit"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_CustomerVisit.fVisitTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询最近两天的记录</label> 
  </action>  
  <action name="queryOA_CustomerVisitAgoAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_CustomerVisit"/>  
    <private name="select" type="String" value="OA_CustomerVisit.*,OA_Customer.fVisitNum as fVisitNum"/>  
    <private name="from" type="String" value="OA_CustomerVisit OA_CustomerVisit  optional  join OA_Customer OA_Customer on OA_CustomerVisit.fCustomerID = OA_Customer"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/CRM/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="( OA_CustomerVisit.fCreatorID = :currentPersonID() OR  fCustomerID in (select  SA_Social.sData1 from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = 'E' AND SA_Social.sProcess = '/OA/CRM/process/customer/customerProcess' )  ) AND OA_CustomerVisit.fVisitTime &lt; :addDays( :currentDate() , -1)"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CustomerVisit"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_CustomerVisit.fVisitTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询以前的记录</label> 
  </action> 
</model>
