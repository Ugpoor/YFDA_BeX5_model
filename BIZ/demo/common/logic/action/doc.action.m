<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model"><action name="queryDEMO_DocKindAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_DocKind"/>
<private name="select" type="String" value="DEMO_DocKind.*"/>
<private name="from" type="String" value="DEMO_DocKind DEMO_DocKind"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_DocKind"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_DocKindAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_DocKind"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_DocKindAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_DocKind"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryDEMO_ExigenceLevelAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_ExigenceLevel"/>
<private name="select" type="String" value="DEMO_ExigenceLevel.*"/>
<private name="from" type="String" value="DEMO_ExigenceLevel DEMO_ExigenceLevel"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_ExigenceLevel"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_ExigenceLevelAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_ExigenceLevel"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_ExigenceLevelAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_ExigenceLevel"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryDEMO_SecretLevelAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_SecretLevel"/>
<private name="select" type="String" value="DEMO_SecretLevel.*"/>
<private name="from" type="String" value="DEMO_SecretLevel DEMO_SecretLevel"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_SecretLevel"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_SecretLevelAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_SecretLevel"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_SecretLevelAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_SecretLevel"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryDEMO_SendDirectAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_SendDirect"/>
<private name="select" type="String" value="DEMO_SendDirect.*"/>
<private name="from" type="String" value="DEMO_SendDirect DEMO_SendDirect"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_SendDirect"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_SendDirectAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_SendDirect"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_SendDirectAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_SendDirect"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryDEMO_DocAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_Doc"/>
<private name="select" type="String" value="DEMO_Doc.*"/>
<private name="from" type="String" value="DEMO_Doc DEMO_Doc"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_Doc"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_DocAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_Doc"/>
<private name="dataModel" type="String" value="/demo/common/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_DocAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_Doc"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>