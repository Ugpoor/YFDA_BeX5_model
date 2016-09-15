<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action global="true" name="querySA_CodeAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="SA_Code"/>
<private name="select" type="String" value="SA_Code.*"/>
<private name="from" type="String" value="SA_Code SA_Code"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="SA_Code"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="SA_Code.sType asc, SA_Code.sCode asc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveSA_CodeAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="SA_Code"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createSA_CodeAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="SA_Code"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>

<action name="querySA_CodeTypeAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="SA_Code"/>
<private name="select" type="String" value="SA_Code.sType as sType"/>
<private name="from" type="String" value="SA_Code SA_Code"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="true"/>
<public name="idColumn" type="String" value="sType"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="SA_Code.sType asc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
</model>