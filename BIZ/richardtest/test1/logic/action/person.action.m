<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryRI_RYAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="RI_RY"/>
<private name="select" type="String" value="RI_RY.*"/>
<private name="from" type="String" value="RI_RY RI_RY"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/richardtest/test1/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="RI_RY"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveRI_RYAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="RI_RY"/>
<private name="dataModel" type="String" value="/richardtest/test1/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createRI_RYAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="RI_RY"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>