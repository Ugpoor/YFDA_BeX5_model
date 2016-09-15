<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">



<action name="queryDEMO_BorrowBookAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_BorrowBook"/>
<private name="select" type="String" value="DEMO_BorrowBook.*"/>
<private name="from" type="String" value="DEMO_BorrowBook DEMO_BorrowBook"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/actions/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_BorrowBook"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveDEMO_BorrowBookAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_BorrowBook"/>
<private name="dataModel" type="String" value="/demo/actions/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createDEMO_BorrowBookAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_BorrowBook"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="startBorrowBook" global="false" procedure="startBorrowBookProcedure"><label language="zh_CN">发起借书申请</label>
<public type="String" name="bookName"></public>
<public type="Date" name="startDate"></public>
<public type="Date" name="endDate"></public>
<public type="String" name="borrower"></public>
</action>
<action name="invokeTestWebService" global="false" procedure="invokeTestWebServiceProcedure"><label language="zh_CN">调用TestWebService</label>
<public type="Integer" name="a"></public>
<public type="Integer" name="b"></public>


</action>
<action name="getUserNameAndPassword" global="false" procedure="getUserNameAndPasswordProcedure"><label language="zh_CN">获取用户名和密码</label>
</action>
</model>