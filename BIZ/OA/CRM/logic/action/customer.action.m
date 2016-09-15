<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryOA_CustomerAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Customer"/>
<private name="select" type="String" value="OA_Customer.*"/>
<private name="from" type="String" value="OA_Customer OA_Customer"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Customer"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_CustomerAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_Customer"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_CustomerAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_Customer"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_CustomrMoreAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_CustomrMore"/>
<private name="select" type="String" value="OA_CustomrMore.*"/>
<private name="from" type="String" value="OA_CustomrMore OA_CustomrMore"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_CustomrMore"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_CustomrMoreAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_CustomrMore"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_CustomrMoreAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_CustomrMore"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="false" name="queryOA_CustomerLetterAction" procedure="queryOA_CustomerLetterProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Customer"/>
<private name="select" type="String" value="OA_Customer.*"/>
<private name="from" type="String" value="OA_Customer OA_Customer"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_Customer in (select  SA_Social.sData1 from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sProcess = '/OA/CRM/process/customer/customerProcess' )"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Customer"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_Customer.fAbbr asc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">客户列表</label>
</action>
<action global="true" name="queryOA_CustomerSelectAction" procedure="queryOA_CustomerSelectProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Customer"/>
<private name="select" type="String" value="OA_Customer.*"/>
<private name="from" type="String" value="OA_Customer OA_Customer"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/CRM/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_Customer in (select  SA_Social.sData1 from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sProcess = '/OA/CRM/process/customer/customerProcess'  AND SA_Social.sGroupID &lt;&gt; 'P')"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Customer"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_Customer.fAbbr asc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">选择客户</label>
</action>
</model>