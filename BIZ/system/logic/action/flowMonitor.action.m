<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="queryTaskCenterAction1" global="true" procedure="bizQueryProcedure"><private name="concept" type="String" value="SA_Task" />
<public name="idColumn" type="String" value="SA_Task"></public>
<private name="select" type="String" value="SA_Task.*" />
<private name="from" type="String" value="SA_Task SA_Task" />
<protected name="condition" type="String" />
<permission name="range" type="List" />
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String"></public>
<private name="aggregate" type="String" />
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/system/data" />
<private name="fnModel" type="String" />
</action>
<action name="saveTaskCenterAction1" global="true" procedure="bizSaveProcedure"><public name="table" type="Table"></public>
<private name="concept" type="String" value="SA_Task" />
<permission name="insertRange" type="List" />
<permission name="deleteRange" type="List" />
<permission name="updateRange" type="List" />
<protected name="readOnly" type="String" />
<protected name="notNull" type="String" />
<private name="dataModel" type="String" value="/system/data" />
<private name="fnModel" type="String" value="/system/logic/fn" />
</action>
</model>